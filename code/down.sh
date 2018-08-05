wget https://s3.amazonaws.com/hyrkas.iaai.2015.seaflow.data/thompson0.csv.gz &
wget https://s3.amazonaws.com/hyrkas.iaai.2015.seaflow.data/thompson1.csv.gz &
wget https://s3.amazonaws.com/hyrkas.iaai.2015.seaflow.data/thompson11.csv.gz
gunzip thompson0.csv.gz &
gunzip thompson1.csv.gz &
gunzip thompson11.csv.gz
python transform.py thompson0.csv &
python transform.py thompson1.csv &
python transform.py thompson11.csv
rm thompson0.csv  &
rm thompson1.csv &
rm  thompson11.csv