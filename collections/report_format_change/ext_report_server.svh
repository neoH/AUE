// ******************************************************************************************
// File         : ext_report_server.svh
// Author       : RyanHunter
// Creating Date: Thu Apr 16 09:28:39 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef ext_report_server__svh
`define ext_report_server__svh


class ext_report_server extends uvm_report_server; // {

	function new();  endfunction


	virtual function string compose_message(
		uvm_severity severity,
		string name,
		string id,
		string message,
		string filename,
		int line
	); // {

		uvm_severity_type sv;
		string time_str;
		string line_str;

		sv = uvm_severity_type'(severity);
		$swrite(time_str, "%0t", $realtime);

		case(1) // {
			(name == "" && filename == ""):
				return {"SPECIFIC::",sv.name(), " @ ", time_str, " [", id, "] ", message};
			(name != "" && filename == ""):
				return {"SPECIFIC::",sv.name(), " @ ", time_str, ": ", name, " [", id, "] ", message};
			(name == "" && filename != ""): begin // {
				$swrite(line_str, "%0d", line);
				return {"SPECIFIC::",sv.name(), " ",filename, "(", line_str, ")", " @ ", time_str, " [", id, "] ", message};
			end // }
			(name != "" && filename != ""): begin // {
				$swrite(line_str, "%0d", line);
				return {"SPECIFIC::",sv.name(), " ", filename, "(", line_str, ")", " @ ", time_str, ": ", name, " [", id, "] ", message};
			end // }
		endcase // }

	endfunction // }



endclass // }



`endif
