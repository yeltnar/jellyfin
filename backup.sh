source ./backup.env

if [ -z "$WORKDIR" ]; then
  echo "WORKDIR is undefined... exiting";
  exit;
fi
if [ -z "$SRC_DIR" ]; then
  echo "SRC_DIR is undefined... exiting";
  exit;
fi
if [ -z "$BORG_REPO" ]; then
  echo "BORG_REPO is undefined... exiting";
  exit;
fi
if [ -z "$BORG_PASSPHRASE" ]; then
  echo "BORG_PASSPHRASE is undefined... exiting";
  exit;
fi
if [ -z "$ENCRYPTION" ]; then
  echo "ENCRYPTION is undefined... exiting";
  exit;
fi


cd "$WORKDIR";

borg info $BORG_REPO >& /dev/null
info_exit_code=$?;

if [ $info_exit_code -gt 0 ]; then
  echo "repo does not exsist; creating now";
  borg init $BORG_REPO --encryption=$ENCRYPTION
fi

borg create --stats --progress --compression lz4 ::{user}-{now}  $SRC_DIR

borg prune -v --list --keep-daily=7 --keep-weekly="5" --keep-monthly="12" --keep-yearly="2"
