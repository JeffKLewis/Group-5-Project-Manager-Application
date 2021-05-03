import {
    Container,
    Drawer as MUIDrawer,
    List,
    ListItem,
    ListItemIcon,
    ListItemText
} from "@material-ui/core"

const Drawer = () => {
    return (
        <div className="drawerWrapper">
            <MUIDrawer
            variant="permanent"
            open="true"
            PaperProps={{
                style: { 
                    position: 'relative',
                    top: 'unset',
                    left: 'unset',
                    right: 'unset',
                    color: 'rgba(15, 15, 168, 0.966)',
                    backgroundColor: 'aliceblue',
                }             
            }}>
                <List>
                    {["All Projects", "My Projects", "Search", "Create New", "Admin"].map((text, index) => (
                    <ListItem button key={text}>
                        <ListItemText primary={text}/>
                    </ListItem>
                    ))}
                </List>
            </MUIDrawer>
        </div>
    )
}

export default Drawer