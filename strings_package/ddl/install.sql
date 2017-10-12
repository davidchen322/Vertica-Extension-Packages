select version();

\set libfile '\''`pwd`'/lib/StringsLib.so\'';
CREATE LIBRARY StringsLib AS :libfile;

CREATE FUNCTION EditDistance                   AS LANGUAGE 'C++' NAME 'EditDistanceFactory'         LIBRARY StringsLib NOT FENCED;
CREATE FUNCTION Stemmer                        AS LANGUAGE 'C++' NAME 'PorterStemmerFactory'        LIBRARY StringsLib NOT FENCED;
CREATE TRANSFORM FUNCTION StringTokenizer      AS LANGUAGE 'C++' NAME 'StringTokenizerFactory'      LIBRARY StringsLib NOT FENCED;
CREATE TRANSFORM FUNCTION StringTokenizerDelim AS LANGUAGE 'C++' NAME 'StringTokenizerDelimFactory' LIBRARY StringsLib NOT FENCED;
CREATE TRANSFORM FUNCTION TwoGrams             AS LANGUAGE 'C++' NAME 'TwoGramsFactory'             LIBRARY StringsLib NOT FENCED;
CREATE TRANSFORM FUNCTION ThreeGrams           AS LANGUAGE 'C++' NAME 'ThreeGramsFactory'           LIBRARY StringsLib NOT FENCED;
CREATE TRANSFORM FUNCTION FourGrams            AS LANGUAGE 'C++' NAME 'FourGramsFactory'            LIBRARY StringsLib NOT FENCED;
CREATE TRANSFORM FUNCTION FiveGrams            AS LANGUAGE 'C++' NAME 'FiveGramsFactory'            LIBRARY StringsLib NOT FENCED;
CREATE FUNCTION WordCount                      AS LANGUAGE 'C++' NAME 'WordCountFactory'            LIBRARY StringsLib NOT FENCED;
CREATE TRANSFORM FUNCTION gen_anagram          AS LANGUAGE 'C++' NAME 'AnagramFactory'              LIBRARY StringsLib NOT FENCED;
CREATE TRANSFORM FUNCTION group_concat         AS LANGUAGE 'C++' NAME 'GroupConcatFactory'          LIBRARY StringsLib NOT FENCED;

dbadmin=> select 'GRANT ALL ON TRANSFORM FUNCTION ' || schema_name || '.' || function_name || '(' || case when function_argument_type like 'Any%' then '' else function_argument_type end || ') TO public;' from user_functions where owner='dbadmin' and procedure_type='User Defined Transform';"
                                                          ?column?                                                           
-----------------------------------------------------------------------------------------------------------------------------
 GRANT ALL ON TRANSFORM FUNCTION public.connect_by_path(Integer, Integer, Varchar, Varchar) TO public;
 GRANT ALL ON TRANSFORM FUNCTION public.transpose(Varchar, Varchar, Varchar) TO public;
 GRANT ALL ON TRANSFORM FUNCTION public.group_generator_3(Varchar, Varchar, Varchar, Integer, Integer) TO public;
 GRANT ALL ON TRANSFORM FUNCTION public.group_generator_3(Float, Varchar, Float, Integer, Integer) TO public;
 GRANT ALL ON TRANSFORM FUNCTION public.group_generator_4(Varchar, Varchar, Varchar, Varchar, Integer, Integer) TO public;
 GRANT ALL ON TRANSFORM FUNCTION public.group_generator_4(Float, Varchar, Float, Varchar, Integer, Integer) TO public;
 GRANT ALL ON TRANSFORM FUNCTION public.KafkaOffsets() TO public;
 
 (...many more lines...)
 
 
