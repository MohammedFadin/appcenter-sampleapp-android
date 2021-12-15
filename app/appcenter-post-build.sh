if [ "$AGENT_JOBSTATUS" == "Succeeded" ]; then
    npm version
    npm install -g firebase-tools
    echo $APPCENTER_OUTPUT_DIRECTORY
    # # Example: Upload main branch app binary to HockeyApp using the API
    if [ "$APPCENTER_BRANCH" == "main" ];
     then
        firebase appdistribution:distribute $APPCENTER_OUTPUT_DIRECTORY/app-release.apk  \
        --app $FIREBASE_APPID  \
        --token $FIREBASE_TOKEN \
        --release-notes "first release!" --testers "08_provers_visitor@icloud.com"
        echo "Pushing to Firebase was successful!"
    else
        echo "Can't push to Firebase, the current branch is $APPCENTER_BRANCH not a Main branch"
    fi
fi
