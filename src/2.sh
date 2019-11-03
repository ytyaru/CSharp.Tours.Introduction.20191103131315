# 1. ソースコード生成する
class_name=${1:-Hello}
code=$(cat << EOS
using System;

class $class_name
{
    static void Main()
    {
        Console.WriteLine("Hello, World");
    }
}
EOS
)
echo "$code" > "$class_name.cs"

# 2. ビルドする
csc $class_name.cs

# 3. 実行する
chmod 755 $class_name.exe
./$class_name.exe

