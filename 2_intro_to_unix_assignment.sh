# 1. Describe a Unix command not discussed in the class or the book. Try to find something that might be useful. When would you use that command?

# wslpath converts a windows path to a linux path, eg

cat $(wslpath 'C:\Users\dkr21\ai_powered_bioinformatics')

# it can be used to go from a directory (eg, the home directory) to a windows directory when combined with cd and "$()". "$()" captures the output of the command in the ellipses.
 
cd $(wslpath 'C:\Users\dkr21\ai_powered_bioinformatics')


# 2. Describe a customization for the command you chose above (describe the effect of a flag or parameter).

# -a	Outputs the absolute path.
# -u	Converts a Windows path to a Linux path. (This is the default behavior.)
# -w	Converts a Linux path to a Windows path.
# -m	Converts the path to Windows format using forward slashes (/).


# 3. What flags make the lscommand write out the files sizes in “human-friendly” mode?

# ls -lh

# 4. What flag will make the rm command ask for permission when removing a file?

# rm -i

# 5. Create a nested directory structure. Create files in various directories.

mkdir Test1 Test2
mkdir -p Test1/A Test2/A
echo Test1 > Test1/Test1.txt
echo Test2 > Test2/Test2.txt
echo Test1A > Test1/A/Test1A.txt
echo Test2A > Test2/A/Test2A.txt

# 6. List the absolute and relative path to a file you have created.

# Absolute
realpath Test1.txt

# Relative
realpath --relative-to=$(wslpath 'C:\Users\dkr21\ai_powered_bioinformatics') Text1.txt

# 7. Demonstrate path shortcuts using the home directory, current directory, and parent directory.

# home
ls ~

# current
ls .

# parent
cd Test1
ls ..


# Remove test directories and files
cd Test1
rm -i Test1.txt
cd A
rm -i Test1A.txt
cd ..
rmdir A
cd ..
rmdir Test1

cd Test2
rm -i Test2.txt
cd A
rm -i Test2A.txt
cd ..
rmdir A
cd ..
rmdir Test2

ls