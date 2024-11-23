# create a list of users names
users=("Esraa" "Omnia" "Abdullah")

#create user passwords and assign them to IT_Admin group
for user in "${users[@]}"; do
    sudo useradd -m -G IT_Admins "$user"
    echo "$user:P@ssw0rd123" | sudo chpasswd  #change password in first login
done
