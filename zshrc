HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
unsetopt autocd beep
bindkey -e
zstyle :compinstall filename '/home/pauls/.zshrc'
autoload -Uz compinit; compinit
autoload -Uz add-zsh-hook

funny_mommy_issue_script () {
    local res=$?
    local clr='\e[38;5;217m'
    local clr_reset='\e[0m'    
    local user="girl"
    local pronoun="her"
    local role="Mommy"
    
    local NEGATIVE_RESPONSES="do you need MOMMYS_ROLE's help~? ❤️
Don't give up, my love~ ❤️
Don't worry, MOMMYS_ROLE is here to help you~ ❤️
I believe in you, my sweet AFFECTIONATE_TERM~ ❤️
It's okay to make mistakes, my dear~ ❤️
just a little further, sweetie~ ❤️
Let's try again together, okay~? ❤️
MOMMYS_ROLE believes in you, and knows you can overcome this~ ❤️
MOMMYS_ROLE believes in you~ ❤️
MOMMYS_ROLE is always here for you, no matter what~ ❤️
MOMMYS_ROLE is here to help you through it~ ❤️
MOMMYS_ROLE is proud of you for trying, no matter what the outcome~ ❤️
MOMMYS_ROLE knows it's tough, but you can do it~ ❤️
MOMMYS_ROLE knows MOMMYS_PRONOUN little AFFECTIONATE_TERM can do better~ ❤️
MOMMYS_ROLE knows you can do it, even if it's tough~ ❤️
MOMMYS_ROLE knows you're feeling down, but you'll get through it~ ❤️
MOMMYS_ROLE knows you're trying your best~ ❤️
MOMMYS_ROLE loves you, and is here to support you~ ❤️
MOMMYS_ROLE still loves you no matter what~ ❤️
You're doing your best, and that's all that matters to MOMMYS_ROLE~ ❤️
MOMMYS_ROLE is always here to encourage you~ ❤️"
    
    local POSITIVE_RESPONSES="*pets your head*
awe, what a good AFFECTIONATE_TERM~\nMOMMYS_ROLE knew you could do it~ ❤️
good AFFECTIONATE_TERM~\nMOMMYS_ROLE's so proud of you~ ❤️
Keep up the good work, my love~ ❤️
MOMMYS_ROLE is proud of the progress you've made~ ❤️
MOMMYS_ROLE is so grateful to have you as MOMMYS_PRONOUN little AFFECTIONATE_TERM~ ❤️
I'm so proud of you, my love~ ❤️
MOMMYS_ROLE is so proud of you~ ❤️
MOMMYS_ROLE loves seeing MOMMYS_PRONOUN little AFFECTIONATE_TERM succeed~ ❤️
MOMMYS_ROLE thinks MOMMYS_PRONOUN little AFFECTIONATE_TERM earned a big hug~ ❤️
that's a good AFFECTIONATE_TERM~ ❤️
you did an amazing job, my dear~ ❤️
you're such a smart cookie~ ❤️"
    
    pick_response() {
	if [ $1 -eq 0 ]
	then
	    echo $(echo "$POSITIVE_RESPONSES" | sort -R | sed 1q)
	else
	    echo $(echo "$NEGATIVE_RESPONSES" | sort -R | sed 1q)
	fi
    }
    
    printf "${clr}$(echo "$(pick_response $res)" | sed "s/AFFECTIONATE_TERM/$user/g" | sed "s/MOMMYS_PRONOUN/$pronoun/g" | sed "s/MOMMYS_ROLE/$role/g")${clr_reset}\n" >&2
    return $res
}

add-zsh-hook precmd funny_mommy_issue_script

export PATH=$PATH:/home/pauls/.spicetify

PROMPT='%F{cyan}%~ $ %F{reset}'
EDITOR="/bin/emacsclient -c"
