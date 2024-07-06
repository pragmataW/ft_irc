NAME = ircserv
CC = c++

FLAG = -std=c++98 -Wall -Wextra -Werror

SRC = srcs/main.cpp srcs/Server.cpp srcs/Channel.cpp \
      srcs/Utils.cpp srcs/UtilsServer.cpp srcs/commands/JOIN.cpp \
      srcs/commands/CAP.cpp srcs/commands/HELP.cpp srcs/commands/INFO.cpp srcs/commands/INVITE.cpp \
      srcs/commands/KICK.cpp srcs/commands/LIST.cpp srcs/commands/MODE.cpp srcs/commands/NOTICE.cpp \
      srcs/commands/NICK.cpp srcs/commands/OPER.cpp srcs/commands/PART.cpp \
      srcs/commands/PASS.cpp srcs/commands/PRIVMSG.cpp srcs/commands/QUIT.cpp srcs/commands/USER.cpp \
      srcs/commands/TOPIC.cpp srcs/commands/WHO.cpp srcs/commands/WHOIS.cpp


OBJDIR = obj

OBJS = $(SRC:%.cpp=$(OBJDIR)/%.o)

all: $(NAME)

$(NAME): $(OBJS)
	$(CC) $(FLAG) $(OBJS) -o $(NAME)


$(OBJDIR)/%.o: %.cpp
	mkdir -p $(dir $@)
	$(CC) $(FLAG) -c $< -o $@


clean:
	rm -rf $(OBJDIR)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
