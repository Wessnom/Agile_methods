for p in $(cat pokemons_list.txt)
do
    if test $(curl -sLIw "%{http_code}" https://pokeapi.co/api/v2/pokemon-species/${p} -o /dev/null) -eq 200
    then
        if test -f data/pokemons${p}.json
        then
            echo "Pokemon ${p} already downloaded"
        fi
        echo "GET ${p}..."
        curl -sL https://pokeapi.co/api/v2/pokemon-species/${p} > data/pokemons${p}.json
    else
        echo "Pokemon ${p} not found"
    fi
done



# comments start with #, and the script is executed with bash download_pokemons.bash
# the script reads the file pokemons_list.txt, which contains a list of pokemons


# a few other helpful functions:

for ((i = 0 ; i < max ; i++)); do echo "$i"; done
# prints numbers from 0 to max

for i in {1..10}; do ... ; done
# prints numbers from 1 to 10

for n in $(seq 1 10); do ... ; done
# shell builtin command that prints numbers from 1 to 10
