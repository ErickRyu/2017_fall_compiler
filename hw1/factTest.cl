class Main Inherits IO{
    input : Int;
    expected : Int;
    fact : Fact <- (new Fact);

    main() : Object{
        {
            input <- 1;
            expected <- 1;
            out_string(assertEqual(expected, fact.factorial(input)));

            input <- 0;
            expected <- 1;
            out_string(assertEqual(expected, fact.factorial(input)));

            input <- 5;
            expected <- 120;
            out_string(assertEqual(expected, fact.factorial(input)));

            input <- 12;
            expected <- 479001600;
            out_string(assertEqual(expected, fact.factorial(input)));

            out_int(fact.factorial(input));
            out_string("\n");
        }
    };
    assertEqual(expected : Int, test : Int) : String { 
        if(test = expected)
            then
                "ok\n"
            else
                "fail\n"
        fi
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
