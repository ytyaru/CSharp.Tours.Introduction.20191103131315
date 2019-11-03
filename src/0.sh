# 1. ソースコード生成する
code=$(cat << 'EOS'
using System;

class Hello
{
    static void Main()
    {
        Console.WriteLine("Hello, World");
    }
}
EOS
)
echo "$code" > Hello.cs

# 2. ビルドする
csc Hello.cs

# 3. 実行する
chmod 755 Hello.exe
./Hello.exe

