BEGIN { FS=":"
	printf "                   ***CAMPAIGN 1998 CONTRIBUTIONS***\n"
	printf "--------------------------------------------------------------------------------------\n"
	printf "%-22s %-16s %7s| %7s | %7s | %8s","NAME","PHONE", "Jan", "Feb","Mar","Total Donated\n"
	printf "--------------------------------------------------------------------------------------\n"
	total=0;sum=0;lc=0;highest=0;lowest
}
{
	total=$3+$4+$5;sum=sum+total;lc=lc+1
	highest=(highest > $3)? highest : $3
	highest=(highest > $4)? highest : $4
	highest=(highest > $5)? highest : $5
	lowest=(lowest==0 || lowest > $3)? $3 : lowest
	lowest=(lowest < $4)? lowest : $4
	lowest=(lowest < $5)? lowest : $5
	printf "%-22s %-16s %7.2f %7.2f %7.2f %8.2f\n",$1,$2,$3,$4,$5,total
}

END {
	 printf "----------------------------------------------------------------------------------\n"
	 printf "                                    SUMMARY\n" 
	 printf "----------------------------------------------------------------------------------\n"
	 printf "The campaign received a total of %7.2f for this quarter.\n",sum
	 printf "The average donation for the 12 contributors was $%.2f.\n",sum/lc
	 printf "The highest contribution was $%.2f.\n",highest
	 printf "The lowest contribution was $%.2f.\n",lowest
    }

			    
