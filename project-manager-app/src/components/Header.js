const Header = ({ title }) => {
    return (
        <header className='header'>
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