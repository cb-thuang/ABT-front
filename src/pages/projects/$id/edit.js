import { Component } from 'react'
import { connect } from 'dva'

import ProjectForm from '../_shared/_form'

@connect(({ loading }) => ({ loading }))

class Page extends Component {
  constructor(props) {
    super(props)

    this.initProject()
    this.fetchProject()
  }

  initProject(){
    let project = {}
    this.props.dispatch({
      type: 'project/init',
      project
    })
  }

  fetchProject(){
    let projectID = this.props.match.params.id
    this.props.dispatch({
      type: 'project/fetch',
      projectID,
    })
  }

  render(){
    return(
      <div style={{ padding: "20px 8px 8px 8px" }}>
        <ProjectForm />
      </div>
    )
  }
}


export default Page