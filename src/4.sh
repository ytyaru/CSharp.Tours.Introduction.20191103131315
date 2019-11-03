# C# HelloWorld
#   1. ソースコードを生成する
#   2. ビルドする
#   3. 実行する
Define() {
	class_name=${1:-Hello}
	CreateSourceCodeFile() {
		code=$(cat <<- EOS
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
	}
	Build() { csc $class_name.cs; }
	Chmod() { chmod 755 $class_name.exe; }
	Execute() { ./$class_name.exe; }
}
Runable() {
	CreateSourceCodeFile 
	Build
	Chmod
	Execute
}
Run() {
	Define "$@"
	Runable
}
Run "$@"
