Deploy "Deploy to $DevLocation" {
    By FileSystem  {
        FromSource '.'
        To $DevLocation
        Tagged Dev
        WithOptions @{
            Mirror = $true
        }
    }
}

Deploy "Deploy to $ProdLocation" {
    By FileSystem  {
        FromSource '.'
        To $ProdLocation
        Tagged Prod
        WithOptions @{
            Mirror = $true
        }
    }
}