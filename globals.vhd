--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package globals is

-- type <new_type> is
--  record
--    <type_name>        : std_logic_vector( 7 downto 0);
--    <type_name>        : std_logic;
-- end record;
--
-- Declare constants
	constant n : integer := 4; --the number of secret bits to embed per index
	constant N : integer := 128; -- the size of the codebock
	constant l : integer := 16;  -- the size of the list
	constant stream_size : integer := 640; -- the size of the code stream
	subtype int_small is integer range 0 to N; -- a subset of integers for to represent VQ indicies
	type index_list is array (0 to l) of int_small; -- an array type for the lists
	
--
-- constant <constant_name>		: time := <time_unit> ns;
-- constant <constant_name>		: integer := <value;
--
-- Declare functions and procedure
--	
	function is_member(xs : index_list; elem : int_small) return std_logic;
-- function <function_name>  (signal <signal_name> : in <type_declaration>) return <type_declaration>;
-- procedure <procedure_name> (<type_declaration> <constant_name>	: in <type_declaration>);
--

end globals;

package body globals is
	
	-- the function can be used to scan an index list and determine
	-- if it contains the integer specified
	function is_member(xs : index_list; elem : int_small)
	return std_logic is
	begin
		for index in 0 to l loop
			if xs(index) = elem then
				return '1';
			end if;
		end loop; 
		return '0';
	end;

---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;
 
end globals;
