// TODO

const ProjectTile = ({ title, files, comments, users }) => {
    return (
        <header className='projectTile'>
            <div>
                <h1><a href='#'>{title}</a></h1>
            </div>
        </header>
    )
}

Header.defaultProps = {
    title: 'Project Manager'
}

export default Header