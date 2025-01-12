cd $(wslpath "C:\Users\dkr21\ai_powered_bioinformatics")

# add assignment 3 folder and go to it
mkdir assignment_3
cd assignment_3

# add data folder and go to it
mkdir assignment_3_data
cd assignment_3_data

# Select an organism, download its corresponding GFF file 
URL="https://ftp.ensembl.org/pub/current_gff3/bison_bison_bison/Bison_bison_bison.Bison_UMD1.0.113.gff3.gz"
GZ_FILE="Bison_bison_bison.Bison_UMD1.0.113.gff3.gz"
GFF_FILE="Bison_bison_bison.Bison_UMD1.0.113.gff3"

if [ -f "$GFF_FILE" ]; then
  echo "File $GFF_FILE already exists. Skipping download and unzip."
else
  # If not, download the compressed file if it doesn't exist
  if [ ! -f "$GZ_FILE" ]; then
    echo "Downloading $GZ_FILE..."
    wget "$URL"
  else
    echo "Compressed file $GZ_FILE already exists. Skipping download."
  fi

  # Unzip the file
  echo "Unzipping $GZ_FILE..."
  gunzip "$GZ_FILE"
fi

# then investigate this file with Unix command line tools.

# Find answers to the following questions:

# 1. Tell us a bit about the organism.
cat <<PRINT
In zoology, Bison bison is the scientific name for the American bison, a large, iconic mammal of North America. The term “Bison bison bison” specifically refers to a subspecies of American bison known as the plains bison.

Scientific breakdown:
Genus: Bison
Species: bison (American bison)
Subspecies: bison (plains bison)
The full classification "Bison bison bison" refers to plains bison, while Bison bison athabascae refers to the wood bison.
PRINT

# 2. How many features does the file contain?
cat Bison_bison_bison.Bison_UMD1.0.113.gff3 | grep -v "##" | grep -v "#!" | wc -l
# 1376919

# How many sequence regions (chromosomes) does the file contain?
cat Bison_bison_bison.Bison_UMD1.0.113.gff3 | grep "sequence-region" | wc -l
# 450182

# How many genes are listed for this organism?
cat Bison_bison_bison.Bison_UMD1.0.113.gff3 | grep -v "#" | cut -f 3 | grep -w "gene" | wc -l
# 20241

# What are the top-ten most annotated feature types (column 3) across the genome?
cat Bison_bison_bison.Bison_UMD1.0.113.gff3 | grep -v "#" | cut -f 3 | sort-uniq-count-rank | head -n 10

# Having analyzed this GFF file, does it seem like a complete and well-annotated organism?
echo "Perhaps very fragmented since there are >450,000 regions but the haploid number of chromosomes in Bison bison bison is 30. Otherwise looks pretty good as far as I can tell."

# Share any other insights you might note.
# TBD

# Create a text file that shows both how you downloaded the data and how you generated each of your results.
# DONE!

# Commit the file to your GitHub repository that you created for this course.
gzip Bison_bison_bison.Bison_UMD1.0.113.gff3
# DONE!

# Note that future assignments may ask someone else to repeat your findings. Build your report with repeatability/reproducibility in mind.