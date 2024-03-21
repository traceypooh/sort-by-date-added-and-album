property my_title : "Tag with Date Added"

tell application "Music"
	set sel to selection

	repeat with outerTrack in sel
		tell outerTrack to set {da, tr, di, alb} to {date added, track number, disc number, album}
		set innerTrack to contents of outerTrack
		set yr to (do shell script "echo " & date string of da & " | grep -o '[0-9]\\{4\\}'")
		set da_sortable to (yr & "." & ((month of da) as integer) & "." & day of da & "." & alb & "." & (10 - di) & "." & (100 - tr))
# do shell script "logger -t " & "Music SORT: " & " " & quoted form of da_sortable
		set show of the innerTrack to the da_sortable
	end repeat

end tell
