grammar Geo;

geo : file_header point_list? line_list? attribute_list?;

file_header : 'FileHeader' STRING ',' STRING 
    'begin' file_info* 'end' ;

file_info : 'FileInfo' STRING? ',' STRING? ;

point_list : 'PointList' ('begin' point* 'end')? ;

point : 'Point' name ',' north ',' east ',' height ',' ',' ',';

name : STRING ;
north : NUMBER ;
east : NUMBER ;
height : NUMBER ;

line_list : 'LineList' ;
attribute_list : 'AttributeList' ;

STRING : '"' ~["]* '"' ;
NUMBER : [0-9]+'.'[0-9]+ ;
WS : [ \t\r\n]+ -> skip ; // skip spaces, tabs, newlines
