
package strategy {
    @python.intrinsic("strategy.suspendable._Suspendable_Impl")
    def Suspendable(inner = Noise(),
                    predicate = true()) : ISingleAssetStrategy
        
    
    package account {
        @python.intrinsic("strategy.account._Account_Impl")
        def Real(inner = Noise()) : IAccount
            
    }
}
