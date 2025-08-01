use starknet::ContractAddress;

#[starknet::interface]
trait IERC20<ContractState> {
    fn mint(ref self: ContractState, recipient: ContractAddress, amount: u256) -> bool;
}


#[starknet::contract]
mod MockERC20 {
    use openzeppelin::token::erc20::{ERC20Component, ERC20HooksEmptyImpl};
    use starknet::ContractAddress;

    component!(path: ERC20Component, storage: erc20, event: ERC20Event);

    #[abi(embed_v0)]
    impl ERC20MixinImpl = ERC20Component::ERC20MixinImpl<ContractState>;
    impl ERC20InternalImpl = ERC20Component::InternalImpl<ContractState>;


   #[storage]
   struct Storage {
        #[substorage(v0)]
        pub erc20: ERC20Component::Storage,
   }

   #[event]
   #[derive(Drop, starknet::Event)]
   enum Event {
        #[flat]
        ERC20Event: ERC20Component::Event,
   }

   #[constructor]
   fn constructor(ref self: ContractState, name: ByteArray, symbol: ByteArray) {
        self.erc20.initializer(name, symbol);
    }

    #[abi(embed_v0)]
    impl MockERC20Impl of super::IERC20<ContractState> {

        fn mint(ref self: ContractState, recipient: ContractAddress, amount: u256) -> bool {
            self.erc20.mint(recipient, amount);
            true
        }
    }


}
