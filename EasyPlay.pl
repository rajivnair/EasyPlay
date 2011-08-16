#!/usr/bin/perl

#-----------------------------------------#
#                                         # 
# EasyPlay                                #
#                                         #
# Your friendly neighborhood minimslitic  #
# music player                            #
#                                         #
# Author : rajiv@rajivnair.in             #
# License : Do one act of random kindness #
# if you use this                         #
#-----------------------------------------#

use File::Find;

# Change to your liking
$library_root = '/home/rajiv/Music';

$search_key = `zenity --entry --text "Enter Song key"`;

# chomp chomp goes the stinking new line char
chomp($search_key);

# Coz everything needs a kill switch
if($search_key eq 'stop'){
    system('killall -9 mplayer');
    exit;
}

# Else do stuff
$playlist = '';


find(\&wanted, $library_root);

print $playlist;

`killall -9 mplayer`;
`mplayer$playlist`;

# call back for find
sub wanted{

    $song = $File::Find::name;

    if($song =~ m/($search_key)/i){
	$playlist .= ' "' . $song . '"';

    }

}


