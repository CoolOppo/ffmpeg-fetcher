import std.net.curl, std.file, std.stdio;
import std.path : buildPath;
import std.uuid;
import std.process;
void main()
{
	writeln("Making temp dir...");
	auto id = randomUUID.toString();
	auto tempDir = tempDir.buildPath(id);
	mkdir(tempDir);
	auto file = tempDir.buildPath("ffmpeg.zip");
	writeln("Downloading latest ffmpeg...");
	download("https://ffmpeg.zeranoe.com/builds/win64/shared/ffmpeg-latest-win64-shared.zip", file);
	writeln("Extracting...");
	wait(spawnProcess([`C:\Program Files\7-Zip\7zG.exe`, "x", file, "-spe", "-o"~tempDir]));
	auto installPath = `C:\opt\ffmpeg`;
	if (installPath.exists)
	{
		writeln("Deleting old ffmpeg...");
		rmdirRecurse(installPath);
	}
	writeln("Installing new ffmpeg...");
	wait(spawnProcess([`cmd.exe`, "/C", "move " ~ tempDir.buildPath("ffmpeg-latest-win64-shared") ~ " " ~ installPath]));
	writeln("Deleting temporary directory...");
	rmdirRecurse(tempDir);
	writeln("Update completed.");
}
