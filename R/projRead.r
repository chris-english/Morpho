projRead<-function(lm,mesh,readnormals=TRUE,clean=TRUE,smooth=TRUE,ignore.stdout=FALSE)
{	if (is.character(mesh))
		{projBack(lm,mesh,ignore.stdout=ignore.stdout)
		}
	
	else 
		{mesh2ply(mesh,"dump0")
		projBack(lm,"dump0.ply",smooth=smooth,ignore.stdout=ignore.stdout)
		unlink("dump0.ply")
		}
	
	data<-ply2mesh("out_cloud.ply",readnormals=readnormals)
	if (clean)
	{	
	unlink("out_cloud.ply")
	}
	return(data)
}