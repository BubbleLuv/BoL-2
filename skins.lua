local version = "1.52"


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


assert(load(Base64Decode("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AsFAAAABgY0AQYFLAIGBNACkQAACCoCAAEQAAACBwI0A5QAAAAjAAAGBAI4A5UAAAAjAAAGBQI4A5YAAAAjAAAEfAIAAOgIAAAQHAAAAQWF0cm94AAQIAAAAQ2xhc3NpYwAECQAAAEp1c3RpY2FyAAQGAAAATWVjaGEABAUAAABBaHJpAAQIAAAARHluYXN0eQAECQAAAE1pZG5pZ2h0AAQIAAAARm94ZmlyZQAECAAAAFBvcHN0YXIABAYAAABBa2FsaQAECAAAAFN0aW5nZXIABAgAAABDcmltc29uAAQJAAAAQWxsLXN0YXIABAYAAABOdXJzZQAECwAAAEJsb29kIE1vb24ABAsAAABTaWx2ZXJmYW5nAAQIAAAAQWxpc3RhcgAEBgAAAEJsYWNrAAQHAAAAR29sZGVuAAQIAAAATWF0YWRvcgAECQAAAExvbmdob3JuAAQKAAAAVW5jaGFpbmVkAAQJAAAASW5mZXJuYWwABAgAAABTd2VlcGVyAAQGAAAAQW11bXUABAgAAABQaGFyYW9oAAQKAAAAVmFuY291dmVyAAQGAAAARW11bXUABAoAAABSZS1HaWZ0ZWQABBEAAABBbG1vc3QtUHJvbSBLaW5nAAQOAAAATGl0dGxlIEtuaWdodAAECgAAAFNhZCBSb2JvdAAEBwAAAEFuaXZpYQAEDAAAAFRlYW0gU3Bpcml0AAQNAAAAQmlyZCBvZiBQcmV5AAQNAAAATm94dXMgSHVudGVyAAQIAAAASGV4dGVjaAAECwAAAEJsYWNrZnJvc3QABAYAAABBbm5pZQAEBQAAAEdvdGgABAsAAABSZWQgUmlkaW5nAAQUAAAAQW5uaWUgaW4gV29uZGVybGFuZAAECwAAAFByb20gUXVlZW4ABAoAAABGcm9zdGZpcmUABAgAAABSZXZlcnNlAAQPAAAARnJhbmtlblRpYmJlcnMABAYAAABQYW5kYQAEBQAAAEFzaGUABAkAAABGcmVsam9yZAAEEAAAAFNoZXJ3b29kIEZvcmVzdAAEBQAAAFdvYWQABAYAAABRdWVlbgAECQAAAEFtZXRoeXN0AAQMAAAASGVhcnRzZWVrZXIABAUAAABBemlyAAQJAAAAR2FsYWN0aWMABAsAAABCbGl0emNyYW5rAAQGAAAAUnVzdHkABAsAAABHb2Fsa2VlcGVyAAQKAAAAQm9vbSBCb29tAAQRAAAAUGlsdG92ZXIgQ3VzdG9tcwAEDwAAAERlZmluaXRlbHkgTm90AAQMAAAAaUJsaXR6Y3JhbmsABAUAAABSaW90AAQGAAAAQnJhbmQABAwAAABBcG9jYWx5cHRpYwAEBwAAAFZhbmRhbAAECQAAAENyeW9jb3JlAAQHAAAAWm9tYmllAAQGAAAAQnJhdW0ABA0AAABEcmFnb25zbGF5ZXIABAgAAABDYWl0bHluAAQLAAAAUmVzaXN0YW5jZQAECAAAAFNoZXJpZmYABAcAAABTYWZhcmkABA8AAABBcmN0aWMgV2FyZmFyZQAECAAAAE9mZmljZXIABAsAAABIZWFkaHVudGVyAAQLAAAAQ2Fzc2lvcGVpYQAECgAAAERlc3BlcmFkYQAEBgAAAFNpcmVuAAQHAAAATXl0aGljAAQKAAAASmFkZSBGYW5nAAQIAAAAQ2hvZ2F0aAAECgAAAE5pZ2h0bWFyZQAECgAAAEdlbnRsZW1hbgAECgAAAExvY2ggTmVzcwAECQAAAEp1cmFzc2ljAAQRAAAAQmF0dGxlY2FzdCBQcmltZQAEBgAAAENvcmtpAAQEAAAAVUZPAAQNAAAASWNlIFRvYm9nZ2FuAAQKAAAAUmVkIEJhcm9uAAQIAAAASG90IFJvZAAECQAAAFVyZnJpZGVyAAQLAAAARHJhZ29ud2luZwAEBwAAAEZuYXRpYwAEBwAAAERhcml1cwAEBQAAAExvcmQABAkAAABCaW9mb3JnZQAECgAAAFdvYWQgS2luZwAECwAAAER1bmttYXN0ZXIABAYAAABEaWFuYQAEDgAAAERhcmsgVmFsa3lyaWUABA4AAABMdW5hciBHb2RkZXNzAAQIAAAARHJNdW5kbwAEBgAAAFRveGljAAQPAAAATXIuIE11bmRvdmVyc2UABBAAAABDb3Jwb3JhdGUgTXVuZG8ABAwAAABNdW5kbyBNdW5kbwAEEgAAAEV4ZWN1dGlvbmVyIE11bmRvAAQPAAAAUmFnZWJvcm4gTXVuZG8ABAoAAABUUEEgTXVuZG8ABAcAAABEcmF2ZW4ABAwAAABTb3VsIFJlYXZlcgAECgAAAEdsYWRpYXRvcgAECgAAAFByaW1ldGltZQAEBgAAAEVsaXNlAAQOAAAARGVhdGggQmxvc3NvbQAECwAAAFZpY3RvcmlvdXMABAgAAABFdmVseW5uAAQHAAAAU2hhZG93AAQLAAAATWFzcXVlcmFkZQAEBgAAAFRhbmdvAAQMAAAAU2FmZWNyYWNrZXIABAcAAABFenJlYWwABAsAAABOb3R0aW5naGFtAAQIAAAAU3RyaWtlcgAECAAAAEZyb3N0ZWQABAkAAABFeHBsb3JlcgAECgAAAFB1bHNlZmlyZQAEBAAAAFRQQQAECQAAAERlYm9uYWlyAAQNAAAARmlkZGxlU3RpY2tzAAQJAAAAU3BlY3RyYWwABAsAAABVbmlvbiBKYWNrAAQIAAAAQmFuZGl0bwAEDAAAAFB1bXBraW5oZWFkAAQSAAAARmlkZGxlIE1lIFRpbWJlcnMABA8AAABTdXJwcmlzZSBQYXJ0eQAECwAAAERhcmsgQ2FuZHkABAYAAABGaW9yYQAEDAAAAFJveWFsIEd1YXJkAAQLAAAATmlnaHRyYXZlbgAEDQAAAEhlYWRtaXN0cmVzcwAEBQAAAEZpenoABAoAAABBdGxhbnRlYW4ABAcAAABUdW5kcmEABAoAAABGaXNoZXJtYW4ABAUAAABWb2lkAAQGAAAAR2FsaW8ABAoAAABFbmNoYW50ZWQABAkAAABDb21tYW5kbwAECwAAAEdhdGVrZWVwZXIABAoAAABHYW5ncGxhbmsABAcAAABTcG9va3kABAoAAABNaW51dGVtYW4ABAcAAABTYWlsb3IABAwAAABUb3kgU29sZGllcgAEDwAAAFNwZWNpYWwgRm9yY2VzAAQHAAAAU3VsdGFuAAQGAAAAR2FyZW4ABAkAAABTYW5ndWluZQAEDwAAAERlc2VydCBUcm9vcGVyAAQMAAAARHJlYWRrbmlnaHQABAcAAABSdWdnZWQABA0AAABTdGVlbCBMZWdpb24ABAUAAABHbmFyAAQFAAAARGlubwAEBwAAAEdyYWdhcwAEBgAAAFNjdWJhAAQKAAAASGlsbGJpbGx5AAQGAAAAU2FudGEABA0AAABHcmFnYXMsIEVzcS4ABAwAAABPa3RvYmVyZmVzdAAECQAAAFN1cGVyZmFuAAQHAAAAR3JhdmVzAAQKAAAASGlyZWQgR3VuAAQKAAAASmFpbGJyZWFrAAQGAAAATWFmaWEABAsAAABQb29sIFBhcnR5AAQIAAAASGVjYXJpbQAEDQAAAEJsb29kIEtuaWdodAAEBwAAAFJlYXBlcgAECQAAAEhlYWRsZXNzAAQHAAAAQXJjYWRlAAQNAAAASGVpbWVyZGluZ2VyAAQOAAAAQWxpZW4gSW52YWRlcgAECwAAAEJsYXN0IFpvbmUABA4AAABTbm93bWVyZGluZ2VyAAQHAAAASGF6bWF0AAQHAAAASXJlbGlhAAQLAAAATmlnaHRibGFkZQAECAAAAEF2aWF0b3IABAwAAABJbmZpbHRyYXRvcgAECwAAAEZyb3N0YmxhZGUABAYAAABKYW5uYQAECAAAAFRlbXBlc3QABAwAAABGcm9zdCBRdWVlbgAECQAAAEZvcmVjYXN0AAQJAAAASmFydmFuSVYABAoAAABEYXJrZm9yZ2UABBEAAABXYXJyaW5nIEtpbmdkb21zAAQEAAAASmF4AAQLAAAAVGhlIE1pZ2h0eQAEBwAAAEFuZ2xlcgAEBAAAAFBBWAAECAAAAEpheGltdXMABAcAAABUZW1wbGUABAgAAABOZW1lc2lzAAQHAAAAU0tUIFQxAAQGAAAASmF5Y2UABAsAAABGdWxsIE1ldGFsAAQFAAAASmlueAAECAAAAEthbGlzdGEABAYAAABLYXJtYQAEDAAAAFN1biBHb2RkZXNzAAQHAAAAU2FrdXJhAAQMAAAAVHJhZGl0aW9uYWwABBMAAABPcmRlciBvZiB0aGUgTG90dXMABAgAAABLYXJ0aHVzAAQIAAAAUGhhbnRvbQAECgAAAFN0YXR1ZSBvZgAEDAAAAEdyaW0gUmVhcGVyAAQKAAAAUGVudGFraWxsAAQJAAAAS2Fzc2FkaW4ABAkAAABGZXN0aXZhbAAECQAAAERlZXAgT25lAAQJAAAAUHJlLVZvaWQABAoAAABIYXJiaW5nZXIABAkAAABLYXRhcmluYQAECgAAAE1lcmNlbmFyeQAECQAAAFJlZCBDYXJkAAQLAAAAQmlsZ2V3YXRlcgAECgAAAEtpdHR5IENhdAAEDQAAAEhpZ2ggQ29tbWFuZAAECgAAAFNhbmRzdG9ybQAECwAAAFNsYXkgQmVsbGUABAYAAABLYXlsZQAEBwAAAFNpbHZlcgAECQAAAFZpcmlkaWFuAAQJAAAAVW5tYXNrZWQABAsAAABCYXR0bGVib3JuAAQJAAAASnVkZ21lbnQABAwAAABBZXRoZXIgV2luZwAEBwAAAEtlbm5lbgAEBwAAAERlYWRseQAEDQAAAFN3YW1wIE1hc3RlcgAEBwAAAEthcmF0ZQAEDAAAAEtlbm5lbiBNLkQuAAQLAAAAQXJjdGljIE9wcwAEBwAAAEtoYXppeAAEFgAAAEd1YXJkaWFuIG9mIHRoZSBTYW5kcwAEBwAAAEtvZ01hdwAEDAAAAENhdGVycGlsbGFyAAQIAAAAU29ub3JhbgAECAAAAE1vbmFyY2gABAkAAABSZWluZGVlcgAECwAAAExpb24gRGFuY2UABAkAAABEZWVwIFNlYQAECwAAAEJhdHRsZWNhc3QABAgAAABMZWJsYW5jAAQHAAAAV2lja2VkAAQMAAAAUHJlc3RpZ2lvdXMABAoAAABNaXN0bGV0b2UABAoAAABSYXZlbmJvcm4ABAcAAABMZWVTaW4ABAgAAABBY29seXRlAAQMAAAARHJhZ29uIEZpc3QABAoAAABNdWF5IFRoYWkABAYAAABMZW9uYQAECQAAAFZhbGt5cmllAAQJAAAARGVmZW5kZXIABAwAAABJcm9uIFNvbGFyaQAECgAAAExpc3NhbmRyYQAECwAAAEJsb29kc3RvbmUABAwAAABCbGFkZSBRdWVlbgAEBwAAAEx1Y2lhbgAEBQAAAEx1bHUABAwAAABCaXR0ZXJzd2VldAAEDwAAAERyYWdvbiBUcmFpbmVyAAQOAAAAV2ludGVyIFdvbmRlcgAEBAAAAEx1eAAECgAAAFNvcmNlcmVzcwAECwAAAFNwZWxsdGhpZWYABAkAAABJbXBlcmlhbAAECQAAAE1hbHBoaXRlAAQJAAAAU2hhbXJvY2sABAsAAABDb3JhbCBSZWVmAAQHAAAATWFyYmxlAAQJAAAAT2JzaWRpYW4ABAgAAABHbGFjaWFsAAQJAAAATWFsemFoYXIABAcAAABWaXppZXIABA4AAABTaGFkb3cgUHJpbmNlAAQGAAAARGppbm4ABAkAAABPdmVybG9yZAAECQAAAFNub3cgRGF5AAQHAAAATWFva2FpAAQIAAAAQ2hhcnJlZAAECAAAAFRvdGVtaWMABAgAAABGZXN0aXZlAAQIAAAASGF1bnRlZAAECQAAAE1hc3RlcllpAAQJAAAAQXNzYXNzaW4ABAcAAABDaG9zZW4ABAYAAABJb25pYQAECwAAAFNhbXVyYWkgWWkABAwAAABNaXNzRm9ydHVuZQAECAAAAENvd2dpcmwABAkAAABXYXRlcmxvbwAEDQAAAFNlY3JldCBBZ2VudAAECwAAAENhbmR5IENhbmUABA0AAABSb2FkIFdhcnJpb3IABAwAAABNb3JkZWthaXNlcgAEDgAAAERyYWdvbiBLbmlnaHQABAgAAABNb3JnYW5hAAQHAAAARXhpbGVkAAQSAAAAU2luZnVsIFN1Y2N1bGVuY2UABA8AAABCbGFkZSBNaXN0cmVzcwAECwAAAEJsYWNrdGhvcm4ABAwAAABHaG9zdCBCcmlkZQAEBQAAAE5hbWkABAQAAABLb2kABA0AAABSaXZlciBTcGlyaXQABAYAAABOYXN1cwAECQAAAFJpb3QgSy05AAQJAAAATmF1dGlsdXMABAgAAABBYnlzc2FsAAQNAAAAU3VidGVycmFuZWFuAAQOAAAAQXN0cm9OYXV0aWx1cwAECAAAAE5pZGFsZWUABAsAAABTbm93IEJ1bm55AAQIAAAATGVvcGFyZAAEDAAAAEZyZW5jaCBNYWlkAAQLAAAAQmV3aXRjaGluZwAECQAAAE5vY3R1cm5lAAQOAAAARnJvemVuIFRlcnJvcgAECAAAAFJhdmFnZXIABAkAAABIYXVudGluZwAECAAAAEV0ZXJudW0ABAUAAABOdW51AAQKAAAAU2FzcXVhdGNoAAQJAAAAV29ya3Nob3AABAcAAABHcnVuZ3kABAkAAABOdW51IEJvdAAECwAAAERlbW9saXNoZXIABAUAAABPbGFmAAQJAAAARm9yc2FrZW4ABAcAAABCcm9sYWYABAgAAABPcmlhbm5hAAQHAAAAR290aGljAAQLAAAAU2V3biBDaGFvcwAECwAAAEJsYWRlY3JhZnQABAkAAABQYW50aGVvbgAECQAAAE15cm1pZG9uAAQJAAAAUnV0aGxlc3MABAgAAABQZXJzZXVzAAQPAAAAR2xhaXZlIFdhcnJpb3IABAYAAABQb3BweQAEBgAAAE5veHVzAAQLAAAATG9sbGlwb3BweQAECwAAAEJsYWNrc21pdGgABAgAAABSYWdkb2xsAAQPAAAAQmF0dGxlIFJlZ2FsaWEABA8AAABTY2FybGV0IEhhbW1lcgAEBgAAAFF1aW5uAAQIAAAAUGhvZW5peAAECwAAAFdvYWQgU2NvdXQABAcAAABSYW1tdXMABAUAAABLaW5nAAQHAAAAQ2hyb21lAAQHAAAATW9sdGVuAAQGAAAATmluamEABAcAAABSZWtzYWkABAkAAABSZW5la3RvbgAECAAAAE91dGJhY2sABAoAAABCbG9vZGZ1cnkABAoAAABSdW5lIFdhcnMABA8AAABTY29yY2hlZCBFYXJ0aAAEBwAAAFJlbmdhcgAEDQAAAE5pZ2h0IEh1bnRlcgAEBgAAAFJpdmVuAAQJAAAAUmVkZWVtZWQABA4AAABDcmltc29uIEVsaXRlAAQNAAAAQmF0dGxlIEJ1bm55AAQNAAAAQ2hhbXBpb25zaGlwAAQMAAAARHJhZ29uYmxhZGUABAcAAABSdW1ibGUABBUAAABSdW1ibGUgaW4gdGhlIEp1bmdsZQAECQAAAEJpbGdlcmF0AAQNAAAAU3VwZXIgR2FsYXh5AAQFAAAAUnl6ZQAEBgAAAEh1bWFuAAQHAAAAVHJpYmFsAAQGAAAAVW5jbGUABAsAAABUcml1bXBoYW50AAQKAAAAUHJvZmVzc29yAAQNAAAARGFyayBDcnlzdGFsAAQHAAAAUGlyYXRlAAQIAAAAU2VqdWFuaQAECgAAAFNhYnJldHVzawAECgAAAERhcmtyaWRlcgAEDQAAAEJlYXIgQ2F2YWxyeQAECwAAAFBvcm8gUmlkZXIABAYAAABTaGFjbwAECwAAAE1hZCBIYXR0ZXIABAYAAABSb3lhbAAECgAAAE51dGNyYWNrbwAEBwAAAEFzeWx1bQAEBwAAAE1hc2tlZAAEBQAAAFNoZW4ABAcAAABGcm96ZW4ABA4AAABZZWxsb3cgSmFja2V0AAQIAAAAU3VyZ2VvbgAECAAAAFdhcmxvcmQABAgAAABTaHl2YW5hAAQKAAAASXJvbnNjYWxlAAQJAAAAQm9uZWNsYXcABAoAAABEYXJrZmxhbWUABAoAAABJY2UgRHJha2UABAcAAABTaW5nZWQABAsAAABSaW90IFNxdWFkAAQHAAAAU3VyZmVyAAQOAAAATWFkIFNjaWVudGlzdAAECgAAAEF1Z21lbnRlZAAEBQAAAFNpb24ABAoAAABCYXJiYXJpYW4ABAsAAABMdW1iZXJqYWNrAAQKAAAAV2FybW9uZ2VyAAQGAAAAU2l2aXIABBEAAABXYXJyaW9yIFByaW5jZXNzAAQMAAAAU3BlY3RhY3VsYXIABAkAAABIdW50cmVzcwAEBwAAAEJhbmRpdAAECgAAAFNub3dzdG9ybQAECAAAAFNrYXJuZXIABAwAAABTYW5kc2NvdXJnZQAECgAAAEVhcnRocnVuZQAEEQAAAEJhdHRsZWNhc3QgQWxwaGEABAUAAABTb25hAAQFAAAATXVzZQAEDQAAAFNpbGVudCBOaWdodAAEBgAAAEd1cWluAAQHAAAAU29yYWthAAQGAAAARHJ5YWQABAcAAABEaXZpbmUABAoAAABDZWxlc3RpbmUABAYAAABTd2FpbgAEDwAAAE5vcnRoZXJuIEZyb250AAQHAAAAVHlyYW50AAQHAAAAU3luZHJhAAQGAAAAVGFsb24ABAkAAABSZW5lZ2FkZQAEBgAAAFRhcmljAAQIAAAARW1lcmFsZAAEFwAAAEFybW9yIG9mIHRoZSBGaWZ0aCBBZ2UABAYAAABUZWVtbwAECgAAAEhhcHB5IEVsZgAEBgAAAFJlY29uAAQHAAAAQmFkZ2VyAAQKAAAAQXN0cm9uYXV0AAQLAAAAQ290dG9udGFpbAAEBgAAAFN1cGVyAAQHAAAAVGhyZXNoAAQMAAAARGVlcCBUZXJyb3IABAkAAABUcmlzdGFuYQAECgAAAFJpb3QgR2lybAAEDAAAAEVhcm5lc3QgRWxmAAQMAAAARmlyZWZpZ2h0ZXIABAkAAABHdWVyaWxsYQAECgAAAEJ1Y2NhbmVlcgAEDAAAAFJvY2tldCBHaXJsAAQIAAAAVHJ1bmRsZQAEDQAAAExpbCcgU2x1Z2dlcgAECQAAAEp1bmt5YXJkAAQKAAAAQ29uc3RhYmxlAAQLAAAAVHJ5bmRhbWVyZQAECQAAAEhpZ2hsYW5kAAQHAAAAVmlraW5nAAQLAAAARGVtb25ibGFkZQAEDAAAAFR3aXN0ZWRGYXRlAAQPAAAASmFjayBvZiBIZWFydHMABBAAAABUaGUgTWFnbmlmaWNlbnQABAoAAABIaWdoIE5vb24ABAoAAABNdXNrZXRlZXIABAsAAABVbmRlcndvcmxkAAQHAAAAVHdpdGNoAAQIAAAAS2luZ3BpbgAEEQAAAFdoaXN0bGVyIFZpbGxhZ2UABAkAAABNZWRpZXZhbAAECQAAAEdhbmdzdGVyAAQLAAAAUGlja3BvY2tldAAEBQAAAFVkeXIABAsAAABCbGFjayBCZWx0AAQHAAAAUHJpbWFsAAQNAAAAU3Bpcml0IEd1YXJkAAQGAAAAVXJnb3QABBQAAABHaWFudCBFbmVteSBDcmFiZ290AAQIAAAAQnV0Y2hlcgAEBgAAAFZhcnVzAAQPAAAAQmxpZ2h0IENyeXN0YWwABAkAAABBcmNsaWdodAAEBgAAAFZheW5lAAQLAAAAVmluZGljYXRvcgAECwAAAEFyaXN0b2NyYXQABAcAAABWZWlnYXIABAsAAABXaGl0ZSBNYWdlAAQIAAAAQ3VybGluZwAEEQAAAFZlaWdhciBHcmV5YmVhcmQABAsAAABMZXByZWNoYXVuAAQKAAAAQmFyb24gVm9uAAQPAAAAU3VwZXJiIFZpbGxhaW4ABAoAAABCYWQgU2FudGEABAsAAABGaW5hbCBCb3NzAAQHAAAAVmVsa296AAQDAAAAVmkABAwAAABOZW9uIFN0cmlrZQAEBwAAAFZpa3RvcgAEDQAAAEZ1bGwgTWFjaGluZQAECgAAAFByb3RvdHlwZQAECAAAAENyZWF0b3IABAkAAABWbGFkaW1pcgAEBgAAAENvdW50AAQIAAAATWFycXVpcwAECgAAAE5vc2ZlcmF0dQAECwAAAEJsb29kIExvcmQABAwAAABTb3Vsc3RlYWxlcgAECQAAAFZvbGliZWFyAAQNAAAAVGh1bmRlciBMb3JkAAQPAAAATm9ydGhlcm4gU3Rvcm0ABAoAAABSdW5lZ3VhcmQABAgAAABDYXB0YWluAAQIAAAAV2Fyd2ljawAEBQAAAEdyZXkABBAAAABVcmYgdGhlIE1hbmF0ZWUABAgAAABCaWcgQmFkAAQOAAAAVHVuZHJhIEh1bnRlcgAEBgAAAEZlcmFsAAQJAAAARmlyZWZhbmcABAYAAABIeWVuYQAECwAAAE1vbmtleUtpbmcABAkAAABWb2xjYW5pYwAECAAAAEdlbmVyYWwABAwAAABKYWRlIERyYWdvbgAEBwAAAFhlcmF0aAAECQAAAFJ1bmVib3JuAAQIAAAAWGluWmhhbwAECAAAAFZpc2Nlcm8ABA4AAABXaW5nZWQgSHVzc2FyAAQGAAAAWWFzdW8ABAgAAABQcm9qZWN0AAQHAAAAWW9yaWNr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AAUAAAAFAAAABgAAAAYAAAAGAAAABgAAAAYAAAAGAAAABgAAAAYAAAAGAAAABgAAAAcAAAAHAAAABwAAAAcAAAAHAAAABwAAAAcAAAAHAAAABwAAAAcAAAAHAAAACAAAAAgAAAAIAAAACAAAAAgAAAAIAAAACAAAAAgAAAAIAAAACAAAAAgAAAAJAAAACQAAAAkAAAAJAAAACQAAAAkAAAAJAAAACQAAAAkAAAAKAAAACgAAAAoAAAAKAAAACgAAAAoAAAAKAAAACgAAAAoAAAAKAAAACgAAAAoAAAALAAAACwAAAAsAAAALAAAACwAAAAsAAAALAAAACwAAAAsAAAALAAAADAAAAAwAAAAMAAAADAAAAAwAAAAOAAAADgAAAA4AAAAOAAAADgAAAA4AAAAOAAAADgAAAA4AAAAOAAAADgAAAA8AAAAPAAAADwAAAA8AAAAPAAAADwAAAA8AAAAPAAAAEAAAABAAAAAQAAAAEAAAABAAAAASAAAAEgAAABIAAAASAAAAEgAAABIAAAASAAAAEgAAABIAAAASAAAAEwAAABMAAAATAAAAEwAAABMAAAATAAAAEwAAABMAAAAUAAAAFAAAABQAAAAUAAAAFAAAABQAAAAUAAAAFAAAABQAAAAVAAAAFQAAABUAAAAVAAAAFQAAABUAAAAVAAAAFQAAABUAAAAVAAAAFQAAABcAAAAXAAAAFwAAABcAAAAXAAAAFwAAABcAAAAXAAAAGAAAABgAAAAYAAAAGAAAABgAAAAYAAAAGQAAABkAAAAZAAAAGQAAABkAAAAZAAAAGQAAABkAAAAZAAAAGQAAABkAAAAaAAAAGgAAABoAAAAaAAAAGgAAABoAAAAaAAAAHAAAABwAAAAcAAAAHAAAABwAAAAcAAAAHAAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHgAAAB4AAAAeAAAAHgAAAB4AAAAeAAAAHgAAAB4AAAAeAAAAHgAAAB4AAAAgAAAAIAAAACAAAAAgAAAAIAAAACAAAAAgAAAAIAAAACAAAAAgAAAAIAAAACEAAAAhAAAAIQAAACEAAAAhAAAAIQAAACEAAAAiAAAAIgAAACIAAAAiAAAAIgAAACIAAAAiAAAAIgAAACQAAAAkAAAAJAAAACQAAAAkAAAAJAAAACQAAAAkAAAAJQAAACUAAAAlAAAAJQAAACUAAAAlAAAAJQAAACUAAAAlAAAAJQAAACYAAAAmAAAAJgAAACYAAAAmAAAAJgAAACYAAAAmAAAAJgAAACYAAAAnAAAAJwAAACcAAAAnAAAAJwAAACgAAAAoAAAAKAAAACgAAAAoAAAAKAAAACgAAAAoAAAAKAAAACgAAAAoAAAAKAAAACkAAAApAAAAKQAAACkAAAApAAAAKQAAACkAAAApAAAAKQAAACsAAAArAAAAKwAAACsAAAArAAAAKwAAACsAAAArAAAALAAAACwAAAAsAAAALAAAACwAAAAsAAAALAAAACwAAAAsAAAALgAAAC4AAAAuAAAALgAAAC4AAAAuAAAALgAAAC4AAAAwAAAAMAAAADAAAAAwAAAAMAAAADAAAAAwAAAAMAAAADAAAAAwAAAAMQAAADEAAAAxAAAAMQAAADEAAAAxAAAAMQAAADEAAAAxAAAAMQAAADIAAAAyAAAAMgAAADIAAAAyAAAAMgAAADIAAAAyAAAAMgAAADIAAAAyAAAAMgAAADMAAAAzAAAAMwAAADMAAAAzAAAAMwAAADQAAAA0AAAANAAAADQAAAA0AAAANgAAADYAAAA2AAAANgAAADYAAAA3AAAANwAAADcAAAA3AAAANwAAADcAAAA3AAAANwAAADgAAAA4AAAAOAAAADgAAAA4AAAAOAAAADgAAAA4AAAAOAAAADkAAAA5AAAAOQAAADkAAAA5AAAAOQAAADkAAAA5AAAAOgAAADoAAAA6AAAAOgAAADoAAAA6AAAAOgAAADoAAAA6AAAAOgAAADoAAAA7AAAAOwAAADsAAAA7AAAAOwAAADsAAAA7AAAAOwAAADsAAAA7AAAAOwAAADwAAAA8AAAAPAAAADwAAAA8AAAAPAAAADwAAAA8AAAAPAAAAD0AAAA9AAAAPQAAAD0AAAA9AAAAPQAAAD4AAAA+AAAAPgAAAD4AAAA+AAAAPgAAAD4AAAA+AAAAPgAAAD4AAAA+AAAAPgAAAEAAAABAAAAAQAAAAEAAAABAAAAAQAAAAEAAAABAAAAAQAAAAEEAAABBAAAAQQAAAEEAAABBAAAAQQAAAEEAAABBAAAAQQAAAEEAAABBAAAAQgAAAEIAAABCAAAAQgAAAEIAAABCAAAAQgAAAEIAAABCAAAAQwAAAEMAAABDAAAAQwAAAEMAAABDAAAAQwAAAEQAAABEAAAARAAAAEQAAABEAAAARAAAAEQAAABFAAAARQAAAEUAAABFAAAARQAAAEUAAABFAAAARQAAAEUAAABGAAAARgAAAEYAAABGAAAARgAAAEYAAABGAAAARgAAAEYAAABGAAAASAAAAEgAAABIAAAASAAAAEgAAABIAAAASAAAAEgAAABIAAAASAAAAEgAAABJAAAASQAAAEkAAABJAAAASQAAAEkAAABJAAAASQAAAEkAAABJAAAASgAAAEoAAABKAAAASgAAAEoAAABKAAAASgAAAEoAAABKAAAASgAAAEsAAABLAAAASwAAAEsAAABLAAAASwAAAEsAAABLAAAASwAAAEsAAABMAAAATAAAAEwAAABMAAAATAAAAEwAAABMAAAATAAAAEwAAABMAAAATAAAAEwAAABNAAAATQAAAE0AAABNAAAATQAAAE0AAABNAAAATQAAAE0AAABOAAAATgAAAE4AAABOAAAATgAAAE4AAABOAAAATgAAAE4AAABOAAAATgAAAFAAAABQAAAAUAAAAFAAAABQAAAAUAAAAFAAAABRAAAAUQAAAFEAAABRAAAAUQAAAFEAAABRAAAAUQAAAFEAAABRAAAAUgAAAFIAAABSAAAAUgAAAFIAAABSAAAAUgAAAFIAAABTAAAAUwAAAFMAAABTAAAAUwAAAFMAAABTAAAAUwAAAFMAAABTAAAAUwAAAFQAAABUAAAAVAAAAFQAAABUAAAAVAAAAFQAAABUAAAAVAAAAFQAAABVAAAAVQAAAFUAAABVAAAAVQAAAFUAAABVAAAAVQAAAFUAAABVAAAAVQAAAFcAAABXAAAAVwAAAFcAAABXAAAAVwAAAFcAAABXAAAAVwAAAFgAAABYAAAAWAAAAFgAAABYAAAAWAAAAFgAAABYAAAAWAAAAFgAAABaAAAAWgAAAFoAAABaAAAAWgAAAFoAAABaAAAAWgAAAFoAAABaAAAAWgAAAFsAAABbAAAAWwAAAFsAAABbAAAAWwAAAFsAAABbAAAAWwAAAFsAAABbAAAAXQAAAF0AAABdAAAAXQAAAF0AAABdAAAAXQAAAF8AAABfAAAAXwAAAF8AAABfAAAAXwAAAF8AAABfAAAAXwAAAF8AAABfAAAAYAAAAGAAAABgAAAAYAAAAGAAAABgAAAAYQAAAGEAAABhAAAAYQAAAGEAAABhAAAAYQAAAGEAAABhAAAAYQAAAGEAAABiAAAAYgAAAGIAAABiAAAAYgAAAGIAAABiAAAAYwAAAGMAAABjAAAAYwAAAGMAAABjAAAAYwAAAGMAAABjAAAAYwAAAGQAAABkAAAAZAAAAGQAAABkAAAAZAAAAGQAAABkAAAAZQAAAGUAAABlAAAAZQAAAGUAAABlAAAAZQAAAGUAAABlAAAAZQAAAGUAAABlAAAAZQAAAGcAAABnAAAAZwAAAGcAAABnAAAAZwAAAGcAAABnAAAAZwAAAGcAAABoAAAAaAAAAGgAAABoAAAAaAAAAGgAAABoAAAAaAAAAGgAAABoAAAAaAAAAGkAAABpAAAAaQAAAGkAAABpAAAAaQAAAGkAAABpAAAAaQAAAGkAAABpAAAAagAAAGoAAABqAAAAagAAAGoAAABqAAAAagAAAGoAAABqAAAAagAAAGsAAABrAAAAawAAAGsAAABrAAAAawAAAGsAAABrAAAAawAAAGsAAABrAAAAbAAAAGwAAABsAAAAbAAAAGwAAABsAAAAbAAAAGwAAABsAAAAbQAAAG0AAABtAAAAbQAAAG0AAABtAAAAbQAAAG0AAABtAAAAbQAAAG0AAABuAAAAbgAAAG4AAABuAAAAbgAAAG4AAABuAAAAbgAAAG8AAABvAAAAbwAAAG8AAABvAAAAbwAAAG8AAABvAAAAbwAAAG8AAABwAAAAcAAAAHAAAABwAAAAcAAAAHAAAABwAAAAcAAAAHAAAABxAAAAcQAAAHEAAABxAAAAcQAAAHEAAABxAAAAcQAAAHIAAAByAAAAcgAAAHIAAAByAAAAcgAAAHIAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHUAAAB1AAAAdQAAAHUAAAB1AAAAdQAAAHUAAAB1AAAAdgAAAHYAAAB2AAAAdgAAAHYAAAB2AAAAdgAAAHYAAAB2AAAAdgAAAHYAAAB2AAAAdwAAAHcAAAB3AAAAdwAAAHcAAAB3AAAAdwAAAHcAAAB4AAAAeAAAAHgAAAB4AAAAeAAAAHgAAAB4AAAAeAAAAHgAAAB4AAAAeAAAAHkAAAB5AAAAeQAAAHkAAAB5AAAAeQAAAHkAAAB5AAAAeQAAAHoAAAB6AAAAegAAAHoAAAB6AAAAegAAAHoAAAB6AAAAegAAAHoAAAB6AAAAewAAAHsAAAB7AAAAewAAAHsAAAB7AAAAewAAAHsAAAB7AAAAewAAAHsAAAB7AAAAewAAAHwAAAB8AAAAfAAAAHwAAAB8AAAAfAAAAHwAAAB8AAAAfAAAAHwAAAB8AAAAfgAAAH4AAAB+AAAAfgAAAH4AAAB+AAAAfgAAAH4AAAB/AAAAfwAAAH8AAAB/AAAAfwAAAH8AAAB/AAAAfwAAAIEAAACBAAAAgQAAAIEAAACBAAAAgQAAAIEAAACBAAAAggAAAIIAAACCAAAAggAAAIIAAACCAAAAggAAAIIAAACCAAAAggAAAIMAAACDAAAAgwAAAIMAAACDAAAAgwAAAIMAAACDAAAAgwAAAIMAAACDAAAAgwAAAIMAAACEAAAAhAAAAIQAAACEAAAAhAAAAIQAAACFAAAAhQAAAIUAAACFAAAAhQAAAIUAAACFAAAAhQAAAIYAAACGAAAAhgAAAIYAAACGAAAAhgAAAIYAAACGAAAAhwAAAIcAAACHAAAAhwAAAIcAAACHAAAAhwAAAIcAAACHAAAAhwAAAIcAAACIAAAAiAAAAIgAAACIAAAAiAAAAIgAAACIAAAAiAAAAIgAAACKAAAAigAAAIoAAACKAAAAigAAAIoAAACKAAAAigAAAIoAAACKAAAAigAAAIoAAACLAAAAiwAAAIsAAACLAAAAiwAAAIsAAACLAAAAiwAAAIsAAACNAAAAjQAAAI0AAACNAAAAjQAAAI0AAACNAAAAjQAAAI4AAACOAAAAjgAAAI4AAACOAAAAjgAAAI4AAACOAAAAjgAAAI4AAACQAAAAkAAAAJAAAACQAAAAkAAAAJAAAACQAAAAkQAAAJEAAACRAAAAkQAAAJEAAACRAAAAkQAAAJMAAACTAAAAkwAAAJMAAACTAAAAkwAAAJQAAACUAAAAlAAAAJQAAACUAAAAlAAAAJQAAACVAAAAlQAAAJUAAACVAAAAlQAAAJUAAACVAAAAlQAAAJUAAACWAAAAlgAAAJYAAACWAAAAlgAAAJYAAACWAAAAlgAAAJYAAACXAAAAlwAAAJcAAACXAAAAlwAAAJcAAACXAAAAlwAAAJsAAACdAAAApQAAAJ0AAACnAAAAsAAAAKcAAACyAAAAyAAAALIAAADIAAAAAgAAAA4AAABjaGFtcGlvblNraW5zAGMEAABuBAAACAAAAHNraW5OdW0AZAQAAG4EAAABAAAABQAAAF9FTlYA"), nil, "bt", _ENV))()