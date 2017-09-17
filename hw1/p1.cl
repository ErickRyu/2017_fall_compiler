class Main inherits IO{
    input : Int;
    fact : Fact <- (new Fact);
    main() : Object {
        {
            out_string("Input : ");
            input <- in_int();
            if(input < 0)
                then
                    out_string("Please input >= 0 and < 13\n")
                else
                    {
                    if(12 < input)
                        then
                            out_string("Please input >= 0 and < 13\n")
                        else
                            {
                            out_int(fact.factorial(input));
                            out_string("\n");
                            }
                    fi;
                    }
            fi;
        }
    };
};

class Fact {
    factorial(fact : Int) : Int {
        if(fact = 0) then
            1
        else
            fact * factorial(fact-1)
        fi
    };
};
