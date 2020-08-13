map_gen=perl map_gen.pl
CC=gcc -Wall -Werror -Wextra
EXEC=bsq
SOURCES= main.c readers/ft_stdin.c readers/ft_filein.c func/ft_map.c func/ft_func.c list/ft_list.c str/ft_str.c
OBJECTS=$(SOURCES:.c=.o)
MAP=out_map*


#$< - deps $@ - target
all: $(SOURCES) $(EXEC)
	
$(EXEC): $(OBJECTS)
	$(CC) $(OBJECTS) -o $@
	
.o:
	$(CC) -c $<

fclean:
	make clean
	rm -f $(EXEC)

clean:
	rm -f $(OBJECTS) $(MAP)

re:
	make fclean
	make

map: map_gen.pl
	$(map_gen) 3 3 9 > out_map.100x100x5

.PHONY: all clean fclean re map

