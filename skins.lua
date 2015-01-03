local version = "1.61"


local autoupdateenabled = true
local UPDATE_SCRIPT_NAME = "skins"
local UPDATE_HOST = "raw.github.com"
local UPDATE_PATH = "/lucas224900/BoL/master/skins.lua"
local UPDATE_FILE_PATH = SCRIPT_PATH..GetCurrentEnv().FILE_NAME
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH

local ServerData
if autoupdateenabled then
	GetAsyncWebResult(UPDATE_HOST, UPDATE_PATH, function(d) ServerData = d end)
	function update()
		if ServerData ~= nil then
			local ServerVersion
			local send, tmp, sstart = nil, string.find(ServerData, "local version = \"")
			if sstart then
				send, tmp = string.find(ServerData, "\"", sstart+1)
			end
			if send then
				ServerVersion = tonumber(string.sub(ServerData, sstart+1, send-1))
			end

			if ServerVersion ~= nil and tonumber(ServerVersion) ~= nil and tonumber(ServerVersion) > tonumber(version) then
				DownloadFile(UPDATE_URL.."?nocache"..myHero.charName..os.clock(), UPDATE_FILE_PATH, function () print("<font color=\"#FF0000\"><b>"..UPDATE_SCRIPT_NAME..":</b> successfully updated. Reload (double F9) Please. ("..version.." => "..ServerVersion..")</font>") end)     
			elseif ServerVersion then
				print("<font color=\"#FF0000\"><b>"..UPDATE_SCRIPT_NAME..":</b> You have got the latest version: <u><b>"..ServerVersion.."</b></u></font>")
			end		
			ServerData = nil
		end
	end
	AddTickCallback(update)
end


assert(load(Base64Decode("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AgFBAgBBAWwAgcGNAMEBLwABQkwA5ECAAkrAAAGBAI4AywCAAgFBAgBBQY4AgYGOAMHBjgABAo8A5ECAAkrAAAGBQI8AywAAAgFBAgBBgY8AgYFNAMGBNgDkQAACSsAAAYQAAADBwI8AJQEAAAgAgQHBAJAAJUEAAAgAgQHBQJAAJYEAAAgAgQEfAIAAQgIAAAQMAAAAUURHRUNGRUhJRUoABAcAAABhc3NlcnQABAUAAABsb2FkAAQNAAAAQmFzZTY0RGVjb2RlAATtCgAARzB4MVlWSUFBUVFFQkFnQUdaTU5DaG9LQUFBQUFBQUFBQUFBQVFJS0FBQUFCZ0JBQUVGQUFBQWRRQUFCQmtCQUFHVUFBQUFLUUFDQkJrQkFBR1ZBQUFBS1FJQ0JId0NBQUFRQUFBQUVCZ0FBQUdOc1lYTnpBQVFKQUFBQVFtOXNRbTl2YzNRQUJBY0FBQUJmWDJsdWFYUUFCQWtBQUFCVFpXNWtVM2x1WXdBQ0FBQUFBZ0FBQUFvQUFBQURBQXMvQUFBQXhnQkFBQVpCUUFCQUFZQUFIWUVBQVZpQVFBSVhRQUdBQmtGQUFFQUJBQUVkZ1FBQldJQkFBaGNBQUlBRFFRQUFBd0dBQUVIQkFBRGRRSUFCQ29BQWdncEFnSUxHd0VFQUFZRUJBTjJBQUFFS3dBQ0R4Z0JBQUFlQlFRQUhBVUlDSFFHQUFOMkFBQUFLd0FDRXhvQkNBQWJCUWdCR0FVTUFSMEhEQW9HQkF3QmRnUUFCaGdGREFJZEJRd1BCd1FNQW5ZRUFBY1lCUXdESFFjTURBUUlFQU4yQkFBRUdBa01BQjBKREJFRkNCQUFkZ2dBQlJnSkRBRWRDd3dTQmdnUUFYWUlBQVZaQmdnSWRBUUFCM1lBQUFBckFnSVRNd0VRQVF3R0FBTjFBZ0FIR0FFVUFKUUVBQU4xQUFBSEdRRVVBSlVFQUFOMUFBQUVmQUlBQUZnQUFBQVFIQUFBQVlYTnpaWEowQUFRRkFBQUFkSGx3WlFBRUJ3QUFBSE4wY21sdVp3QUVId0FBQUVKdlRHSXdNSE4wT2lCWGNtOXVaeUJoY21kMWJXVnVkQ0IwZVhCbExnQUVDQUFBQUhabGNuTnBiMjRBQkFVQUFBQnlhMlY1QUFRSEFBQUFjMjlqYTJWMEFBUUlBQUFBY21WeGRXbHlaUUFFQkFBQUFIUmpjQUFFQlFBQUFHaDNhV1FBQkEwQUFBQkNZWE5sTmpSRmJtTnZaR1VBQkFrQUFBQjBiM04wY21sdVp3QUVBd0FBQUc5ekFBUUhBQUFBWjJWMFpXNTJBQVFWQUFBQVVGSlBRMFZUVTA5U1gwbEVSVTVVU1VaSlJWSUFCQWtBQUFCVlUwVlNUa0ZOUlFBRURRQUFBRU5QVFZCVlZFVlNUa0ZOUlFBRUVBQUFBRkJTVDBORlUxTlBVbDlNUlZaRlRBQUVFd0FBQUZCU1QwTkZVMU5QVWw5U1JWWkpVMGxQVGdBRUNRQUFBRk5sYm1SVGVXNWpBQVFVQUFBQVFXUmtRblZuYzNCc1lYUkRZV3hzWW1GamF3QUVFZ0FBQUVGa1pGVnViRzloWkVOaGJHeGlZV05yQUFJQUFBQUpBQUFBQ1FBQUFBQUFBd1VBQUFBRkFBQUFEQUJBQUlNQUFBQWRRSUFCSHdDQUFBRUFBQUFFQ1FBQUFGTmxibVJUZVc1akFBQUFBQUFCQUFBQUFRQVFBQUFBUUc5aVpuVnpZMkYwWldRdWJIVmhBQVVBQUFBSkFBQUFDUUFBQUFrQUFBQUpBQUFBQ1FBQUFBQUFBQUFCQUFBQUJRQUFBSE5sYkdZQUNnQUFBQW9BQUFBQUFBTUZBQUFBQlFBQUFBd0FRQUNEQUFBQUhVQ0FBUjhBZ0FBQkFBQUFCQWtBQUFCVFpXNWtVM2x1WXdBQUFBQUFBUUFBQUFFQUVBQUFBRUJ2WW1aMWMyTmhkR1ZrTG14MVlRQUZBQUFBQ2dBQUFBb0FBQUFLQUFBQUNnQUFBQW9BQUFBQUFBQUFBUUFBQUFVQUFBQnpaV3htQUFFQUFBQUFBQkFBQUFCQWIySm1kWE5qWVhSbFpDNXNkV0VBUHdBQUFBTUFBQUFEQUFBQUF3QUFBQU1BQUFBREFBQUFBd0FBQUFNQUFBQURBQUFBQXdBQUFBTUFBQUFEQUFBQUF3QUFBQU1BQUFBREFBQUFBd0FBQUFNQUFBQURBQUFBQXdBQUFBTUFBQUFEQUFBQUF3QUFBQVFBQUFBRUFBQUFCQUFBQUFRQUFBQUVBQUFBQkFBQUFBVUFBQUFGQUFBQUJRQUFBQVVBQUFBRkFBQUFCUUFBQUFZQUFBQUdBQUFBQmdBQUFBWUFBQUFIQUFBQUJ3QUFBQWNBQUFBSEFBQUFDQUFBQUFnQUFBQUlBQUFBQ0FBQUFBZ0FBQUFJQUFBQUNBQUFBQWdBQUFBSUFBQUFCUUFBQUFVQUFBQUlBQUFBQ0FBQUFBZ0FBQUFJQUFBQUNRQUFBQWtBQUFBSkFBQUFDZ0FBQUFvQUFBQUtBQUFBQ2dBQUFBTUFBQUFGQUFBQWMyVnNaZ0FBQUFBQVB3QUFBQUlBQUFCaEFBQUFBQUEvQUFBQUFnQUFBR0lBQUFBQUFEOEFBQUFCQUFBQUJRQUFBRjlGVGxZQUN3QUFBQklBQUFBQ0FBOGlBQUFBaHdCQUFJeEFRQUVCZ1FBQVFjRUFBSjFBQUFKYkFBQUFGMEFBZ0FwQVFZSVhBQUNBQ29CQmdvY0FRQUNNd0VFQkFRRUNBRWRCUWdDQmdRSUF4d0ZCQUFHQ0FnQkd3a0lBUndMREJJR0NBZ0RIUWtNQUFZTUNBRWVEUXdDQnd3TUFGb0VEQXAxQWdBR0hBRUFBakFCRUFRRkJCQUNkQUlFQlJ3RkFBRXlCeEFKZFFRQUJId0NBQUJNQUFBQUVCQUFBQUhSamNBQUVDQUFBQUdOdmJtNWxZM1FBQkEwQUFBQmliMnd1WWpBd2MzUXVaWFVBQXdBQUFBQUFBRlJBQkFjQUFBQnlaWEJ2Y25RQUJBSUFBQUF3QUFRQ0FBQUFNUUFFQlFBQUFITmxibVFBQkEwQUFBQkhSVlFnTDNWd1pHRjBaUzBBQkFVQUFBQnlhMlY1QUFRQ0FBQUFMUUFFQndBQUFHMTVTR1Z5YndBRUNRQUFBR05vWVhKT1lXMWxBQVFJQUFBQWRtVnljMmx2YmdBRUJRQUFBR2gzYVdRQUJDSUFBQUFnU0ZSVVVDOHhMakFOQ2todmMzUTZJR0p2YkM1aU1EQnpkQzVsZFEwS0RRb0FCQWdBQUFCeVpXTmxhWFpsQUFRREFBQUFLbUVBQkFZQUFBQmpiRzl6WlFBQUFBQUFBUUFBQUFBQUVBQUFBRUJ2WW1aMWMyTmhkR1ZrTG14MVlRQWlBQUFBQ3dBQUFBc0FBQUFMQUFBQUN3QUFBQXNBQUFBTEFBQUFDd0FBQUF3QUFBQU1BQUFBREFBQUFBMEFBQUFOQUFBQURRQUFBQTBBQUFBT0FBQUFEd0FBQUJBQUFBQVFBQUFBRUFBQUFCRUFBQUFSQUFBQUVRQUFBQklBQUFBU0FBQUFFZ0FBQUEwQUFBQVNBQUFBRWdBQUFCSUFBQUFTQUFBQUVnQUFBQklBQUFBU0FBQUFFZ0FBQUFVQUFBQUZBQUFBYzJWc1pnQUFBQUFBSWdBQUFBSUFBQUJoQUFBQUFBQWlBQUFBQWdBQUFHSUFIZ0FBQUNJQUFBQUNBQUFBWXdBZUFBQUFJZ0FBQUFJQUFBQmtBQjRBQUFBaUFBQUFBUUFBQUFVQUFBQmZSVTVXQUFFQUFBQUJBQkFBQUFCQWIySm1kWE5qWVhSbFpDNXNkV0VBQ2dBQUFBRUFBQUFCQUFBQUFRQUFBQUlBQUFBS0FBQUFBZ0FBQUFzQUFBQVNBQUFBQ3dBQUFCSUFBQUFBQUFBQUFRQUFBQVVBQUFCZlJVNVdBQT09AAQDAAAAYnQABAkAAABCb2xCb29zdAAEAQAAAAAEBwAAAEFhdHJveAAECAAAAENsYXNzaWMABAkAAABKdXN0aWNhcgAEBgAAAE1lY2hhAAQFAAAAQWhyaQAECAAAAER5bmFzdHkABAkAAABNaWRuaWdodAAECAAAAEZveGZpcmUABAgAAABQb3BzdGFyAAQGAAAAQWthbGkABAgAAABTdGluZ2VyAAQIAAAAQ3JpbXNvbgAECQAAAEFsbC1zdGFyAAQGAAAATnVyc2UABAsAAABCbG9vZCBNb29uAAQLAAAAU2lsdmVyZmFuZwAECAAAAEFsaXN0YXIABAYAAABCbGFjawAEBwAAAEdvbGRlbgAECAAAAE1hdGFkb3IABAkAAABMb25naG9ybgAECgAAAFVuY2hhaW5lZAAECQAAAEluZmVybmFsAAQIAAAAU3dlZXBlcgAEBgAAAEFtdW11AAQIAAAAUGhhcmFvaAAECgAAAFZhbmNvdXZlcgAEBgAAAEVtdW11AAQKAAAAUmUtR2lmdGVkAAQRAAAAQWxtb3N0LVByb20gS2luZwAEDgAAAExpdHRsZSBLbmlnaHQABAoAAABTYWQgUm9ib3QABAcAAABBbml2aWEABAwAAABUZWFtIFNwaXJpdAAEDQAAAEJpcmQgb2YgUHJleQAEDQAAAE5veHVzIEh1bnRlcgAECAAAAEhleHRlY2gABAsAAABCbGFja2Zyb3N0AAQGAAAAQW5uaWUABAUAAABHb3RoAAQLAAAAUmVkIFJpZGluZwAEFAAAAEFubmllIGluIFdvbmRlcmxhbmQABAsAAABQcm9tIFF1ZWVuAAQKAAAARnJvc3RmaXJlAAQIAAAAUmV2ZXJzZQAEDwAAAEZyYW5rZW5UaWJiZXJzAAQGAAAAUGFuZGEABAUAAABBc2hlAAQJAAAARnJlbGpvcmQABBAAAABTaGVyd29vZCBGb3Jlc3QABAUAAABXb2FkAAQGAAAAUXVlZW4ABAkAAABBbWV0aHlzdAAEDAAAAEhlYXJ0c2Vla2VyAAQFAAAAQXppcgAECQAAAEdhbGFjdGljAAQLAAAAQmxpdHpjcmFuawAEBgAAAFJ1c3R5AAQLAAAAR29hbGtlZXBlcgAECgAAAEJvb20gQm9vbQAEEQAAAFBpbHRvdmVyIEN1c3RvbXMABA8AAABEZWZpbml0ZWx5IE5vdAAEDAAAAGlCbGl0emNyYW5rAAQFAAAAUmlvdAAEBgAAAEJyYW5kAAQMAAAAQXBvY2FseXB0aWMABAcAAABWYW5kYWwABAkAAABDcnlvY29yZQAEBwAAAFpvbWJpZQAEBgAAAEJyYXVtAAQNAAAARHJhZ29uc2xheWVyAAQIAAAAQ2FpdGx5bgAECwAAAFJlc2lzdGFuY2UABAgAAABTaGVyaWZmAAQHAAAAU2FmYXJpAAQPAAAAQXJjdGljIFdhcmZhcmUABAgAAABPZmZpY2VyAAQLAAAASGVhZGh1bnRlcgAECwAAAENhc3Npb3BlaWEABAoAAABEZXNwZXJhZGEABAYAAABTaXJlbgAEBwAAAE15dGhpYwAECgAAAEphZGUgRmFuZwAECAAAAENob2dhdGgABAoAAABOaWdodG1hcmUABAoAAABHZW50bGVtYW4ABAoAAABMb2NoIE5lc3MABAkAAABKdXJhc3NpYwAEEQAAAEJhdHRsZWNhc3QgUHJpbWUABAYAAABDb3JraQAEBAAAAFVGTwAEDQAAAEljZSBUb2JvZ2dhbgAECgAAAFJlZCBCYXJvbgAECAAAAEhvdCBSb2QABAkAAABVcmZyaWRlcgAECwAAAERyYWdvbndpbmcABAcAAABGbmF0aWMABAcAAABEYXJpdXMABAUAAABMb3JkAAQJAAAAQmlvZm9yZ2UABAoAAABXb2FkIEtpbmcABAsAAABEdW5rbWFzdGVyAAQGAAAARGlhbmEABA4AAABEYXJrIFZhbGt5cmllAAQOAAAATHVuYXIgR29kZGVzcwAECAAAAERyTXVuZG8ABAYAAABUb3hpYwAEDwAAAE1yLiBNdW5kb3ZlcnNlAAQQAAAAQ29ycG9yYXRlIE11bmRvAAQMAAAATXVuZG8gTXVuZG8ABBIAAABFeGVjdXRpb25lciBNdW5kbwAEDwAAAFJhZ2Vib3JuIE11bmRvAAQKAAAAVFBBIE11bmRvAAQHAAAARHJhdmVuAAQMAAAAU291bCBSZWF2ZXIABAoAAABHbGFkaWF0b3IABAoAAABQcmltZXRpbWUABAYAAABFbGlzZQAEDgAAAERlYXRoIEJsb3Nzb20ABAsAAABWaWN0b3Jpb3VzAAQIAAAARXZlbHlubgAEBwAAAFNoYWRvdwAECwAAAE1hc3F1ZXJhZGUABAYAAABUYW5nbwAEDAAAAFNhZmVjcmFja2VyAAQHAAAARXpyZWFsAAQLAAAATm90dGluZ2hhbQAECAAAAFN0cmlrZXIABAgAAABGcm9zdGVkAAQJAAAARXhwbG9yZXIABAoAAABQdWxzZWZpcmUABAQAAABUUEEABAkAAABEZWJvbmFpcgAEDQAAAEZpZGRsZVN0aWNrcwAECQAAAFNwZWN0cmFsAAQLAAAAVW5pb24gSmFjawAECAAAAEJhbmRpdG8ABAwAAABQdW1wa2luaGVhZAAEEgAAAEZpZGRsZSBNZSBUaW1iZXJzAAQPAAAAU3VycHJpc2UgUGFydHkABAsAAABEYXJrIENhbmR5AAQGAAAARmlvcmEABAwAAABSb3lhbCBHdWFyZAAECwAAAE5pZ2h0cmF2ZW4ABA0AAABIZWFkbWlzdHJlc3MABAUAAABGaXp6AAQKAAAAQXRsYW50ZWFuAAQHAAAAVHVuZHJhAAQKAAAARmlzaGVybWFuAAQFAAAAVm9pZAAEBgAAAEdhbGlvAAQKAAAARW5jaGFudGVkAAQJAAAAQ29tbWFuZG8ABAsAAABHYXRla2VlcGVyAAQKAAAAR2FuZ3BsYW5rAAQHAAAAU3Bvb2t5AAQKAAAATWludXRlbWFuAAQHAAAAU2FpbG9yAAQMAAAAVG95IFNvbGRpZXIABA8AAABTcGVjaWFsIEZvcmNlcwAEBwAAAFN1bHRhbgAEBgAAAEdhcmVuAAQJAAAAU2FuZ3VpbmUABA8AAABEZXNlcnQgVHJvb3BlcgAEDAAAAERyZWFka25pZ2h0AAQHAAAAUnVnZ2VkAAQNAAAAU3RlZWwgTGVnaW9uAAQFAAAAR25hcgAEBQAAAERpbm8ABAcAAABHcmFnYXMABAYAAABTY3ViYQAECgAAAEhpbGxiaWxseQAEBgAAAFNhbnRhAAQNAAAAR3JhZ2FzLCBFc3EuAAQMAAAAT2t0b2JlcmZlc3QABAkAAABTdXBlcmZhbgAEBwAAAEdyYXZlcwAECgAAAEhpcmVkIEd1bgAECgAAAEphaWxicmVhawAEBgAAAE1hZmlhAAQLAAAAUG9vbCBQYXJ0eQAECAAAAEhlY2FyaW0ABA0AAABCbG9vZCBLbmlnaHQABAcAAABSZWFwZXIABAkAAABIZWFkbGVzcwAEBwAAAEFyY2FkZQAEDQAAAEhlaW1lcmRpbmdlcgAEDgAAAEFsaWVuIEludmFkZXIABAsAAABCbGFzdCBab25lAAQOAAAAU25vd21lcmRpbmdlcgAEBwAAAEhhem1hdAAEBwAAAElyZWxpYQAECwAAAE5pZ2h0YmxhZGUABAgAAABBdmlhdG9yAAQMAAAASW5maWx0cmF0b3IABAsAAABGcm9zdGJsYWRlAAQGAAAASmFubmEABAgAAABUZW1wZXN0AAQMAAAARnJvc3QgUXVlZW4ABAkAAABGb3JlY2FzdAAECQAAAEphcnZhbklWAAQKAAAARGFya2ZvcmdlAAQRAAAAV2FycmluZyBLaW5nZG9tcwAEBAAAAEpheAAECwAAAFRoZSBNaWdodHkABAcAAABBbmdsZXIABAQAAABQQVgABAgAAABKYXhpbXVzAAQHAAAAVGVtcGxlAAQIAAAATmVtZXNpcwAEBwAAAFNLVCBUMQAEBgAAAEpheWNlAAQLAAAARnVsbCBNZXRhbAAEBQAAAEppbngABAgAAABLYWxpc3RhAAQGAAAAS2FybWEABAwAAABTdW4gR29kZGVzcwAEBwAAAFNha3VyYQAEDAAAAFRyYWRpdGlvbmFsAAQTAAAAT3JkZXIgb2YgdGhlIExvdHVzAAQIAAAAS2FydGh1cwAECAAAAFBoYW50b20ABAoAAABTdGF0dWUgb2YABAwAAABHcmltIFJlYXBlcgAECgAAAFBlbnRha2lsbAAECQAAAEthc3NhZGluAAQJAAAARmVzdGl2YWwABAkAAABEZWVwIE9uZQAECQAAAFByZS1Wb2lkAAQKAAAASGFyYmluZ2VyAAQJAAAAS2F0YXJpbmEABAoAAABNZXJjZW5hcnkABAkAAABSZWQgQ2FyZAAECwAAAEJpbGdld2F0ZXIABAoAAABLaXR0eSBDYXQABA0AAABIaWdoIENvbW1hbmQABAoAAABTYW5kc3Rvcm0ABAsAAABTbGF5IEJlbGxlAAQGAAAAS2F5bGUABAcAAABTaWx2ZXIABAkAAABWaXJpZGlhbgAECQAAAFVubWFza2VkAAQLAAAAQmF0dGxlYm9ybgAECQAAAEp1ZGdtZW50AAQMAAAAQWV0aGVyIFdpbmcABAcAAABLZW5uZW4ABAcAAABEZWFkbHkABA0AAABTd2FtcCBNYXN0ZXIABAcAAABLYXJhdGUABAwAAABLZW5uZW4gTS5ELgAECwAAAEFyY3RpYyBPcHMABAcAAABLaGF6aXgABBYAAABHdWFyZGlhbiBvZiB0aGUgU2FuZHMABAcAAABLb2dNYXcABAwAAABDYXRlcnBpbGxhcgAECAAAAFNvbm9yYW4ABAgAAABNb25hcmNoAAQJAAAAUmVpbmRlZXIABAsAAABMaW9uIERhbmNlAAQJAAAARGVlcCBTZWEABAsAAABCYXR0bGVjYXN0AAQIAAAATGVibGFuYwAEBwAAAFdpY2tlZAAEDAAAAFByZXN0aWdpb3VzAAQKAAAATWlzdGxldG9lAAQKAAAAUmF2ZW5ib3JuAAQHAAAATGVlU2luAAQIAAAAQWNvbHl0ZQAEDAAAAERyYWdvbiBGaXN0AAQKAAAATXVheSBUaGFpAAQGAAAATGVvbmEABAkAAABWYWxreXJpZQAECQAAAERlZmVuZGVyAAQMAAAASXJvbiBTb2xhcmkABAoAAABMaXNzYW5kcmEABAsAAABCbG9vZHN0b25lAAQMAAAAQmxhZGUgUXVlZW4ABAcAAABMdWNpYW4ABAUAAABMdWx1AAQMAAAAQml0dGVyc3dlZXQABA8AAABEcmFnb24gVHJhaW5lcgAEDgAAAFdpbnRlciBXb25kZXIABAQAAABMdXgABAoAAABTb3JjZXJlc3MABAsAAABTcGVsbHRoaWVmAAQJAAAASW1wZXJpYWwABAkAAABNYWxwaGl0ZQAECQAAAFNoYW1yb2NrAAQLAAAAQ29yYWwgUmVlZgAEBwAAAE1hcmJsZQAECQAAAE9ic2lkaWFuAAQIAAAAR2xhY2lhbAAECQAAAE1hbHphaGFyAAQHAAAAVml6aWVyAAQOAAAAU2hhZG93IFByaW5jZQAEBgAAAERqaW5uAAQJAAAAT3ZlcmxvcmQABAkAAABTbm93IERheQAEBwAAAE1hb2thaQAECAAAAENoYXJyZWQABAgAAABUb3RlbWljAAQIAAAARmVzdGl2ZQAECAAAAEhhdW50ZWQABAkAAABNYXN0ZXJZaQAECQAAAEFzc2Fzc2luAAQHAAAAQ2hvc2VuAAQGAAAASW9uaWEABAsAAABTYW11cmFpIFlpAAQMAAAATWlzc0ZvcnR1bmUABAgAAABDb3dnaXJsAAQJAAAAV2F0ZXJsb28ABA0AAABTZWNyZXQgQWdlbnQABAsAAABDYW5keSBDYW5lAAQNAAAAUm9hZCBXYXJyaW9yAAQMAAAATW9yZGVrYWlzZXIABA4AAABEcmFnb24gS25pZ2h0AAQIAAAATW9yZ2FuYQAEBwAAAEV4aWxlZAAEEgAAAFNpbmZ1bCBTdWNjdWxlbmNlAAQPAAAAQmxhZGUgTWlzdHJlc3MABAsAAABCbGFja3Rob3JuAAQMAAAAR2hvc3QgQnJpZGUABAUAAABOYW1pAAQEAAAAS29pAAQNAAAAUml2ZXIgU3Bpcml0AAQGAAAATmFzdXMABAkAAABSaW90IEstOQAECQAAAE5hdXRpbHVzAAQIAAAAQWJ5c3NhbAAEDQAAAFN1YnRlcnJhbmVhbgAEDgAAAEFzdHJvTmF1dGlsdXMABAgAAABOaWRhbGVlAAQLAAAAU25vdyBCdW5ueQAECAAAAExlb3BhcmQABAwAAABGcmVuY2ggTWFpZAAECwAAAEJld2l0Y2hpbmcABAkAAABOb2N0dXJuZQAEDgAAAEZyb3plbiBUZXJyb3IABAgAAABSYXZhZ2VyAAQJAAAASGF1bnRpbmcABAgAAABFdGVybnVtAAQFAAAATnVudQAECgAAAFNhc3F1YXRjaAAECQAAAFdvcmtzaG9wAAQHAAAAR3J1bmd5AAQJAAAATnVudSBCb3QABAsAAABEZW1vbGlzaGVyAAQFAAAAT2xhZgAECQAAAEZvcnNha2VuAAQHAAAAQnJvbGFmAAQIAAAAT3JpYW5uYQAEBwAAAEdvdGhpYwAECwAAAFNld24gQ2hhb3MABAsAAABCbGFkZWNyYWZ0AAQJAAAAUGFudGhlb24ABAkAAABNeXJtaWRvbgAECQAAAFJ1dGhsZXNzAAQIAAAAUGVyc2V1cwAEDwAAAEdsYWl2ZSBXYXJyaW9yAAQGAAAAUG9wcHkABAYAAABOb3h1cwAECwAAAExvbGxpcG9wcHkABAsAAABCbGFja3NtaXRoAAQIAAAAUmFnZG9sbAAEDwAAAEJhdHRsZSBSZWdhbGlhAAQPAAAAU2NhcmxldCBIYW1tZXIABAYAAABRdWlubgAECAAAAFBob2VuaXgABAsAAABXb2FkIFNjb3V0AAQHAAAAUmFtbXVzAAQFAAAAS2luZwAEBwAAAENocm9tZQAEBwAAAE1vbHRlbgAEBgAAAE5pbmphAAQHAAAAUmVrc2FpAAQJAAAAUmVuZWt0b24ABAgAAABPdXRiYWNrAAQKAAAAQmxvb2RmdXJ5AAQKAAAAUnVuZSBXYXJzAAQPAAAAU2NvcmNoZWQgRWFydGgABAcAAABSZW5nYXIABA0AAABOaWdodCBIdW50ZXIABAYAAABSaXZlbgAECQAAAFJlZGVlbWVkAAQOAAAAQ3JpbXNvbiBFbGl0ZQAEDQAAAEJhdHRsZSBCdW5ueQAEDQAAAENoYW1waW9uc2hpcAAEDAAAAERyYWdvbmJsYWRlAAQHAAAAUnVtYmxlAAQVAAAAUnVtYmxlIGluIHRoZSBKdW5nbGUABAkAAABCaWxnZXJhdAAEDQAAAFN1cGVyIEdhbGF4eQAEBQAAAFJ5emUABAYAAABIdW1hbgAEBwAAAFRyaWJhbAAEBgAAAFVuY2xlAAQLAAAAVHJpdW1waGFudAAECgAAAFByb2Zlc3NvcgAEDQAAAERhcmsgQ3J5c3RhbAAEBwAAAFBpcmF0ZQAECAAAAFNlanVhbmkABAoAAABTYWJyZXR1c2sABAoAAABEYXJrcmlkZXIABA0AAABCZWFyIENhdmFscnkABAsAAABQb3JvIFJpZGVyAAQGAAAAU2hhY28ABAsAAABNYWQgSGF0dGVyAAQGAAAAUm95YWwABAoAAABOdXRjcmFja28ABAcAAABBc3lsdW0ABAcAAABNYXNrZWQABAUAAABTaGVuAAQHAAAARnJvemVuAAQOAAAAWWVsbG93IEphY2tldAAECAAAAFN1cmdlb24ABAgAAABXYXJsb3JkAAQIAAAAU2h5dmFuYQAECgAAAElyb25zY2FsZQAECQAAAEJvbmVjbGF3AAQKAAAARGFya2ZsYW1lAAQKAAAASWNlIERyYWtlAAQHAAAAU2luZ2VkAAQLAAAAUmlvdCBTcXVhZAAEBwAAAFN1cmZlcgAEDgAAAE1hZCBTY2llbnRpc3QABAoAAABBdWdtZW50ZWQABAUAAABTaW9uAAQKAAAAQmFyYmFyaWFuAAQLAAAATHVtYmVyamFjawAECgAAAFdhcm1vbmdlcgAEBgAAAFNpdmlyAAQRAAAAV2FycmlvciBQcmluY2VzcwAEDAAAAFNwZWN0YWN1bGFyAAQJAAAASHVudHJlc3MABAcAAABCYW5kaXQABAoAAABTbm93c3Rvcm0ABAgAAABTa2FybmVyAAQMAAAAU2FuZHNjb3VyZ2UABAoAAABFYXJ0aHJ1bmUABBEAAABCYXR0bGVjYXN0IEFscGhhAAQFAAAAU29uYQAEBQAAAE11c2UABA0AAABTaWxlbnQgTmlnaHQABAYAAABHdXFpbgAEBwAAAFNvcmFrYQAEBgAAAERyeWFkAAQHAAAARGl2aW5lAAQKAAAAQ2VsZXN0aW5lAAQGAAAAU3dhaW4ABA8AAABOb3J0aGVybiBGcm9udAAEBwAAAFR5cmFudAAEBwAAAFN5bmRyYQAEBgAAAFRhbG9uAAQJAAAAUmVuZWdhZGUABAYAAABUYXJpYwAECAAAAEVtZXJhbGQABBcAAABBcm1vciBvZiB0aGUgRmlmdGggQWdlAAQGAAAAVGVlbW8ABAoAAABIYXBweSBFbGYABAYAAABSZWNvbgAEBwAAAEJhZGdlcgAECgAAAEFzdHJvbmF1dAAECwAAAENvdHRvbnRhaWwABAYAAABTdXBlcgAEBwAAAFRocmVzaAAEDAAAAERlZXAgVGVycm9yAAQJAAAAVHJpc3RhbmEABAoAAABSaW90IEdpcmwABAwAAABFYXJuZXN0IEVsZgAEDAAAAEZpcmVmaWdodGVyAAQJAAAAR3VlcmlsbGEABAoAAABCdWNjYW5lZXIABAwAAABSb2NrZXQgR2lybAAECAAAAFRydW5kbGUABA0AAABMaWwnIFNsdWdnZXIABAkAAABKdW5reWFyZAAECgAAAENvbnN0YWJsZQAECwAAAFRyeW5kYW1lcmUABAkAAABIaWdobGFuZAAEBwAAAFZpa2luZwAECwAAAERlbW9uYmxhZGUABAwAAABUd2lzdGVkRmF0ZQAEDwAAAEphY2sgb2YgSGVhcnRzAAQQAAAAVGhlIE1hZ25pZmljZW50AAQKAAAASGlnaCBOb29uAAQKAAAATXVza2V0ZWVyAAQLAAAAVW5kZXJ3b3JsZAAEBwAAAFR3aXRjaAAECAAAAEtpbmdwaW4ABBEAAABXaGlzdGxlciBWaWxsYWdlAAQJAAAATWVkaWV2YWwABAkAAABHYW5nc3RlcgAECwAAAFBpY2twb2NrZXQABAUAAABVZHlyAAQLAAAAQmxhY2sgQmVsdAAEBwAAAFByaW1hbAAEDQAAAFNwaXJpdCBHdWFyZAAEBgAAAFVyZ290AAQUAAAAR2lhbnQgRW5lbXkgQ3JhYmdvdAAECAAAAEJ1dGNoZXIABAYAAABWYXJ1cwAEDwAAAEJsaWdodCBDcnlzdGFsAAQJAAAAQXJjbGlnaHQABAYAAABWYXluZQAECwAAAFZpbmRpY2F0b3IABAsAAABBcmlzdG9jcmF0AAQHAAAAVmVpZ2FyAAQLAAAAV2hpdGUgTWFnZQAECAAAAEN1cmxpbmcABBEAAABWZWlnYXIgR3JleWJlYXJkAAQLAAAATGVwcmVjaGF1bgAECgAAAEJhcm9uIFZvbgAEDwAAAFN1cGVyYiBWaWxsYWluAAQKAAAAQmFkIFNhbnRhAAQLAAAARmluYWwgQm9zcwAEBwAAAFZlbGtvegAEAwAAAFZpAAQMAAAATmVvbiBTdHJpa2UABAcAAABWaWt0b3IABA0AAABGdWxsIE1hY2hpbmUABAoAAABQcm90b3R5cGUABAgAAABDcmVhdG9yAAQJAAAAVmxhZGltaXIABAYAAABDb3VudAAECAAAAE1hcnF1aXMABAoAAABOb3NmZXJhdHUABAsAAABCbG9vZCBMb3JkAAQMAAAAU291bHN0ZWFsZXIABAkAAABWb2xpYmVhcgAEDQAAAFRodW5kZXIgTG9yZAAEDwAAAE5vcnRoZXJuIFN0b3JtAAQKAAAAUnVuZWd1YXJkAAQIAAAAQ2FwdGFpbgAECAAAAFdhcndpY2sABAUAAABH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"), nil, "bt", _ENV))()