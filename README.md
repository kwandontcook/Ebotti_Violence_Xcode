# Ebotti_Violence_Xcode

If you are using a macbook with m1 chip 

Please go to the application target -> Building Setting (All combined mode) -> Excluded Architectures -> Debug & Release -> Add "Any IOS Simulator SDK" -> value is arm64

If it does not work after this setting, please follow below of steps 
1. cd Ebotti_Violence_Xcode
2. pod deintegrate
3. pod install
4. Re-open the application
