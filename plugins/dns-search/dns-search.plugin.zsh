dns-search() {
	ZONES=(
		lhr4
		ams4
		server
		db
		cen-01
		cen-02
		wbe-01
		wbe-02
		wbe-03
		wbe-04
		dqs
	)

	if [[ $# -ne 1 ]]; then
		echo "Enter record to search for"
		return 1
	else
		for ZONE in $ZONES; do
			dig @ns-02 -t AXFR ${ZONE}.traveljigsaw.com |grep $1
		done
		return 0
	fi
}
