# anagotus.data

Label data for *Anagotus* spp. specimens located in museum collections.

*Anagotus* is a genus of large, flightless weevils (Coleoptera:
Curculionidae) endemic to New Zealand. This package provides a dataset
of label data for *Anagotus* specimens housed in museum collections in
New Zealand and overseas, including temporal and spatial information
where available.

             ..                                  ..
            .*...                              ..==.
              -=*.                            -=+.
               .**:   :.                :   .=++..
                .++:  ::      . ..     .+. .++-.
                  -=+..+.  .++*#++#:   .= :=+.
       ..        .=*. .+.   -#++==+.   -.  :+:
       ..        .=+   :- .*.=-+:**.:. +.  .=-
       ..        :+=   .---  +-==*:  =.=   .-+.
       ..        -+.    ..   :+++++   ..    ==.
       ..        :=        .@=-===%*.       .=:
      =:.        :++..    .+*---++#*-      =-+.
      +:.         -*-:--. :--+=:#*+*+: .+-=+*:
     .=:.          .=+=-+==#+=-=*++*-=++-=+:
       ..               :#==+.*#-:#++#*.
       ..                 :-+=*#-=+*::
       ..                 :++=**--+#:.
       ..                .-*+*+-=+*%=:
       ..        .----=+*=+==:+-*-#=++**+-==-:.
               .=+*+#%+.-+=--#+=+-=.*+==.+#++===
              .=-:     ----.=-+=+=-..==--    .--=.
             .--      :----.+-:-=:+--=*=*      .=+.
            .+*.      --=--.+:.-=-+-==*:+-      :-:
            :=:     .=+-=--.+-:-=-+-+==:++.     .=+.
           .-=.  :=*@#-:=:+.+::-=.*:-+=:*+@%==.  :=:
          .-+-: --+#..=-+--.+:----=:+=+=*+.-*==: -++.
        .=*+:  -+*:   -==:::=-:=-:+:*=+:*=. .=+*. .=*+=
      .+*=:    +*:    --=-=.=:-==-+:=++-*-.   =*-   .=+*=.
     .*...     -:     -==:=:*::==-=-+++=+.     -*.    ...*:
               ==     .++==.*==+=-+:=*+==.    .=+
               =+.     =-+==+=:=+=*-#*+=:     :-:
               -=:     .-+=+===-==#**+=+      :=.
               .-=      .=*++==-==*++*=.     .=+
                =+.       :*+==-++*+*:       :=-
                :*-.       .+*=++#*+.       :=*.
               .-+.           .::.           :+=
              .+*:                           .-+=.
             .+=-.                            :=+=.
             .=+:                              ==+.
            .+:  -:-.                            =-.
            ...                                  ..         

## Installation

You can install anagotus.data from
[GitHub](https://github.com/nbir012/anagotus.data):

``` r
# install.packages("remotes")
remotes::install_github("nbir012/anagotus.data")
```

## Usage

``` r
library(anagotus.data)

df_anagotus
```

The dataset contains 2,145 specimen records with 15 variables including
institution codes, collection dates, coordinates, locality descriptions,
and species identifications. See
[`?df_anagotus`](https://nbir012.github.io/anagotus.data/reference/df_anagotus.md)
for full documentation of all variables.

## Data sources

- Specimen label data digitised by Neil Birrell from museum collections
  in New Zealand and overseas.
- [Terrestrial and Freshwater Biodiversity Information System
  (TFBIS)](https://www.landcareresearch.co.nz/tools-and-resources/collections/new-zealand-arthropod-collection-nzac/tfbis-funded-specimen-information/large-weevils)
  managed by Manaaki Whenua – Landcare Research, New Zealand.

## License

MIT
