/*

Copyright 2008-2011 Thomas Paviot (tpaviot@gmail.com)

This file is part of pythonOCC.

pythonOCC is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

pythonOCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

$Revision$
$Date$
$Author$
$HeaderURL$

*/
%{

// Headers necessary to define wrapped classes.

#include<Handle_XCAFPrs_AISObject.hxx>
#include<Handle_XCAFPrs_DataMapNodeOfDataMapOfShapeStyle.hxx>
#include<Handle_XCAFPrs_DataMapNodeOfDataMapOfStyleShape.hxx>
#include<Handle_XCAFPrs_DataMapNodeOfDataMapOfStyleTransient.hxx>
#include<Handle_XCAFPrs_Driver.hxx>
#include<XCAFPrs.hxx>
#include<XCAFPrs_AISObject.hxx>
#include<XCAFPrs_DataMapIteratorOfDataMapOfShapeStyle.hxx>
#include<XCAFPrs_DataMapIteratorOfDataMapOfStyleShape.hxx>
#include<XCAFPrs_DataMapIteratorOfDataMapOfStyleTransient.hxx>
#include<XCAFPrs_DataMapNodeOfDataMapOfShapeStyle.hxx>
#include<XCAFPrs_DataMapNodeOfDataMapOfStyleShape.hxx>
#include<XCAFPrs_DataMapNodeOfDataMapOfStyleTransient.hxx>
#include<XCAFPrs_DataMapOfShapeStyle.hxx>
#include<XCAFPrs_DataMapOfStyleShape.hxx>
#include<XCAFPrs_DataMapOfStyleTransient.hxx>
#include<XCAFPrs_Driver.hxx>
#include<XCAFPrs_Style.hxx>

// Additional headers necessary for compilation.

#include<Aspect.hxx>
#include<Aspect_Array1OfEdge.hxx>
#include<Aspect_AspectFillArea.hxx>
#include<Aspect_AspectFillAreaDefinitionError.hxx>
#include<Aspect_AspectLine.hxx>
#include<Aspect_AspectLineDefinitionError.hxx>
#include<Aspect_AspectMarker.hxx>
#include<Aspect_AspectMarkerDefinitionError.hxx>
#include<Aspect_Background.hxx>
#include<Aspect_BadAccess.hxx>
#include<Aspect_CLayer2d.hxx>
#include<Aspect_CardinalPoints.hxx>
#include<Aspect_CircularGrid.hxx>
#include<Aspect_ColorCubeColorMap.hxx>
#include<Aspect_ColorMap.hxx>
#include<Aspect_ColorMapDefinitionError.hxx>
#include<Aspect_ColorMapEntry.hxx>
#include<Aspect_ColorPixel.hxx>
#include<Aspect_ColorRampColorMap.hxx>
#include<Aspect_ColorScale.hxx>
#include<Aspect_Convert.hxx>
#include<Aspect_Display.hxx>
#include<Aspect_Drawable.hxx>
#include<Aspect_Driver.hxx>
#include<Aspect_DriverDefinitionError.hxx>
#include<Aspect_DriverError.hxx>
#include<Aspect_DriverPtr.hxx>
#include<Aspect_Edge.hxx>
#include<Aspect_EdgeDefinitionError.hxx>
#include<Aspect_FStream.hxx>
#include<Aspect_FillMethod.hxx>
#include<Aspect_FontMap.hxx>
#include<Aspect_FontMapDefinitionError.hxx>
#include<Aspect_FontMapEntry.hxx>
#include<Aspect_FontStyle.hxx>
#include<Aspect_FontStyleDefinitionError.hxx>
#include<Aspect_FormatOfSheetPaper.hxx>
#include<Aspect_GenId.hxx>
#include<Aspect_GenericColorMap.hxx>
#include<Aspect_GradientBackground.hxx>
#include<Aspect_GradientFillMethod.hxx>
#include<Aspect_GraphicCallbackProc.hxx>
#include<Aspect_GraphicDevice.hxx>
#include<Aspect_GraphicDeviceDefinitionError.hxx>
#include<Aspect_GraphicDriver.hxx>
#include<Aspect_Grid.hxx>
#include<Aspect_GridDrawMode.hxx>
#include<Aspect_GridType.hxx>
#include<Aspect_Handle.hxx>
#include<Aspect_HatchStyle.hxx>
#include<Aspect_IFStream.hxx>
#include<Aspect_IdentDefinitionError.hxx>
#include<Aspect_IndexPixel.hxx>
#include<Aspect_InteriorStyle.hxx>
#include<Aspect_LineStyle.hxx>
#include<Aspect_LineStyleDefinitionError.hxx>
#include<Aspect_LineWidthDefinitionError.hxx>
#include<Aspect_ListingType.hxx>
#include<Aspect_MarkMap.hxx>
#include<Aspect_MarkMapDefinitionError.hxx>
#include<Aspect_MarkMapEntry.hxx>
#include<Aspect_MarkerStyle.hxx>
#include<Aspect_MarkerStyleDefinitionError.hxx>
#include<Aspect_PixMap.hxx>
#include<Aspect_Pixel.hxx>
#include<Aspect_PixmapDefinitionError.hxx>
#include<Aspect_PixmapError.hxx>
#include<Aspect_PlotMode.hxx>
#include<Aspect_PlotterOrigin.hxx>
#include<Aspect_PolyStyleDefinitionError.hxx>
#include<Aspect_PolygonOffsetMode.hxx>
#include<Aspect_RGBPixel.hxx>
#include<Aspect_RectangularGrid.hxx>
#include<Aspect_RenderingContext.hxx>
#include<Aspect_SequenceNodeOfSequenceOfColor.hxx>
#include<Aspect_SequenceNodeOfSequenceOfColorMapEntry.hxx>
#include<Aspect_SequenceNodeOfSequenceOfFontMapEntry.hxx>
#include<Aspect_SequenceNodeOfSequenceOfMarkMapEntry.hxx>
#include<Aspect_SequenceNodeOfSequenceOfTypeMapEntry.hxx>
#include<Aspect_SequenceNodeOfSequenceOfWidthMapEntry.hxx>
#include<Aspect_SequenceOfColor.hxx>
#include<Aspect_SequenceOfColorMapEntry.hxx>
#include<Aspect_SequenceOfFontMapEntry.hxx>
#include<Aspect_SequenceOfMarkMapEntry.hxx>
#include<Aspect_SequenceOfTypeMapEntry.hxx>
#include<Aspect_SequenceOfWidthMapEntry.hxx>
#include<Aspect_TypeMap.hxx>
#include<Aspect_TypeMapDefinitionError.hxx>
#include<Aspect_TypeMapEntry.hxx>
#include<Aspect_TypeOfColorMap.hxx>
#include<Aspect_TypeOfColorScaleData.hxx>
#include<Aspect_TypeOfColorScaleOrientation.hxx>
#include<Aspect_TypeOfColorScalePosition.hxx>
#include<Aspect_TypeOfColorSpace.hxx>
#include<Aspect_TypeOfConstraint.hxx>
#include<Aspect_TypeOfDeflection.hxx>
#include<Aspect_TypeOfDegenerateModel.hxx>
#include<Aspect_TypeOfDisplayText.hxx>
#include<Aspect_TypeOfDrawMode.hxx>
#include<Aspect_TypeOfEdge.hxx>
#include<Aspect_TypeOfFacingModel.hxx>
#include<Aspect_TypeOfFont.hxx>
#include<Aspect_TypeOfHighlightMethod.hxx>
#include<Aspect_TypeOfLayer.hxx>
#include<Aspect_TypeOfLine.hxx>
#include<Aspect_TypeOfMarker.hxx>
#include<Aspect_TypeOfPrimitive.hxx>
#include<Aspect_TypeOfRenderingMode.hxx>
#include<Aspect_TypeOfResize.hxx>
#include<Aspect_TypeOfStyleText.hxx>
#include<Aspect_TypeOfText.hxx>
#include<Aspect_TypeOfTriedronEcho.hxx>
#include<Aspect_TypeOfTriedronPosition.hxx>
#include<Aspect_TypeOfUpdate.hxx>
#include<Aspect_UndefinedMap.hxx>
#include<Aspect_Units.hxx>
#include<Aspect_WidthMap.hxx>
#include<Aspect_WidthMapDefinitionError.hxx>
#include<Aspect_WidthMapEntry.hxx>
#include<Aspect_WidthOfLine.hxx>
#include<Aspect_Window.hxx>
#include<Aspect_WindowDefinitionError.hxx>
#include<Aspect_WindowDriver.hxx>
#include<Aspect_WindowDriverPtr.hxx>
#include<Aspect_WindowError.hxx>
#include<Graphic3d_Array1OfVector.hxx>
#include<Graphic3d_Array1OfVertex.hxx>
#include<Graphic3d_Array1OfVertexC.hxx>
#include<Graphic3d_Array1OfVertexN.hxx>
#include<Graphic3d_Array1OfVertexNC.hxx>
#include<Graphic3d_Array1OfVertexNT.hxx>
#include<Graphic3d_Array2OfVertex.hxx>
#include<Graphic3d_Array2OfVertexC.hxx>
#include<Graphic3d_Array2OfVertexN.hxx>
#include<Graphic3d_Array2OfVertexNC.hxx>
#include<Graphic3d_Array2OfVertexNT.hxx>
#include<Graphic3d_ArrayOfPoints.hxx>
#include<Graphic3d_ArrayOfPolygons.hxx>
#include<Graphic3d_ArrayOfPolylines.hxx>
#include<Graphic3d_ArrayOfPrimitives.hxx>
#include<Graphic3d_ArrayOfQuadrangleStrips.hxx>
#include<Graphic3d_ArrayOfQuadrangles.hxx>
#include<Graphic3d_ArrayOfSegments.hxx>
#include<Graphic3d_ArrayOfTriangleFans.hxx>
#include<Graphic3d_ArrayOfTriangleStrips.hxx>
#include<Graphic3d_ArrayOfTriangles.hxx>
#include<Graphic3d_AspectFillArea3d.hxx>
#include<Graphic3d_AspectLine3d.hxx>
#include<Graphic3d_AspectMarker3d.hxx>
#include<Graphic3d_AspectText3d.hxx>
#include<Graphic3d_AspectTextDefinitionError.hxx>
#include<Graphic3d_CBitFields16.hxx>
#include<Graphic3d_CBitFields20.hxx>
#include<Graphic3d_CBitFields4.hxx>
#include<Graphic3d_CBitFields8.hxx>
#include<Graphic3d_CBounds.hxx>
#include<Graphic3d_CGraduatedTrihedron.hxx>
#include<Graphic3d_CGroup.hxx>
#include<Graphic3d_CInitTexture.hxx>
#include<Graphic3d_CLight.hxx>
#include<Graphic3d_CPick.hxx>
#include<Graphic3d_CPlane.hxx>
#include<Graphic3d_CStructure.hxx>
#include<Graphic3d_CTexture.hxx>
#include<Graphic3d_CTransPersStruct.hxx>
#include<Graphic3d_CUserDraw.hxx>
#include<Graphic3d_CView.hxx>
#include<Graphic3d_CycleError.hxx>
#include<Graphic3d_DataStructureManager.hxx>
#include<Graphic3d_ExportFormat.hxx>
#include<Graphic3d_GraphicDevice.hxx>
#include<Graphic3d_GraphicDriver.hxx>
#include<Graphic3d_Group.hxx>
#include<Graphic3d_GroupAspect.hxx>
#include<Graphic3d_GroupDefinitionError.hxx>
#include<Graphic3d_HSequenceOfGroup.hxx>
#include<Graphic3d_HSequenceOfStructure.hxx>
#include<Graphic3d_HSetOfGroup.hxx>
#include<Graphic3d_HorizontalTextAlignment.hxx>
#include<Graphic3d_InitialisationError.hxx>
#include<Graphic3d_ListIteratorOfListOfPArray.hxx>
#include<Graphic3d_ListIteratorOfListOfShortReal.hxx>
#include<Graphic3d_ListIteratorOfSetListOfSetOfGroup.hxx>
#include<Graphic3d_ListNodeOfListOfPArray.hxx>
#include<Graphic3d_ListNodeOfListOfShortReal.hxx>
#include<Graphic3d_ListNodeOfSetListOfSetOfGroup.hxx>
#include<Graphic3d_ListOfPArray.hxx>
#include<Graphic3d_ListOfShortReal.hxx>
#include<Graphic3d_MapIteratorOfMapOfStructure.hxx>
#include<Graphic3d_MapOfStructure.hxx>
#include<Graphic3d_MaterialAspect.hxx>
#include<Graphic3d_MaterialDefinitionError.hxx>
#include<Graphic3d_NListOfHAsciiString.hxx>
#include<Graphic3d_NameOfFont.hxx>
#include<Graphic3d_NameOfMaterial.hxx>
#include<Graphic3d_NameOfTexture1D.hxx>
#include<Graphic3d_NameOfTexture2D.hxx>
#include<Graphic3d_NameOfTextureEnv.hxx>
#include<Graphic3d_NameOfTexturePlane.hxx>
#include<Graphic3d_PickIdDefinitionError.hxx>
#include<Graphic3d_Plotter.hxx>
#include<Graphic3d_PlotterDefinitionError.hxx>
#include<Graphic3d_PrimitiveArray.hxx>
#include<Graphic3d_PriorityDefinitionError.hxx>
#include<Graphic3d_PtrFrameBuffer.hxx>
#include<Graphic3d_SequenceNodeOfSequenceOfAddress.hxx>
#include<Graphic3d_SequenceNodeOfSequenceOfGroup.hxx>
#include<Graphic3d_SequenceNodeOfSequenceOfStructure.hxx>
#include<Graphic3d_SequenceOfAddress.hxx>
#include<Graphic3d_SequenceOfGroup.hxx>
#include<Graphic3d_SequenceOfStructure.hxx>
#include<Graphic3d_SetIteratorOfSetOfGroup.hxx>
#include<Graphic3d_SetListOfSetOfGroup.hxx>
#include<Graphic3d_SetOfGroup.hxx>
#include<Graphic3d_SortType.hxx>
#include<Graphic3d_StdMapNodeOfMapOfStructure.hxx>
#include<Graphic3d_Strips.hxx>
#include<Graphic3d_StructPtr.hxx>
#include<Graphic3d_Structure.hxx>
#include<Graphic3d_StructureDefinitionError.hxx>
#include<Graphic3d_StructureManager.hxx>
#include<Graphic3d_TextPath.hxx>
#include<Graphic3d_Texture1D.hxx>
#include<Graphic3d_Texture1Dmanual.hxx>
#include<Graphic3d_Texture1Dsegment.hxx>
#include<Graphic3d_Texture2D.hxx>
#include<Graphic3d_Texture2Dmanual.hxx>
#include<Graphic3d_Texture2Dplane.hxx>
#include<Graphic3d_TextureEnv.hxx>
#include<Graphic3d_TextureMap.hxx>
#include<Graphic3d_TextureRoot.hxx>
#include<Graphic3d_TransModeFlags.hxx>
#include<Graphic3d_TransformError.hxx>
#include<Graphic3d_TypeOfComposition.hxx>
#include<Graphic3d_TypeOfConnection.hxx>
#include<Graphic3d_TypeOfMaterial.hxx>
#include<Graphic3d_TypeOfPolygon.hxx>
#include<Graphic3d_TypeOfPrimitive.hxx>
#include<Graphic3d_TypeOfPrimitiveArray.hxx>
#include<Graphic3d_TypeOfReflection.hxx>
#include<Graphic3d_TypeOfStructure.hxx>
#include<Graphic3d_TypeOfTexture.hxx>
#include<Graphic3d_TypeOfTextureMode.hxx>
#include<Graphic3d_Vector.hxx>
#include<Graphic3d_VectorError.hxx>
#include<Graphic3d_Vertex.hxx>
#include<Graphic3d_VertexC.hxx>
#include<Graphic3d_VertexN.hxx>
#include<Graphic3d_VertexNC.hxx>
#include<Graphic3d_VertexNT.hxx>
#include<Graphic3d_VerticalTextAlignment.hxx>
#include<Image.hxx>
#include<ImageUtility.hxx>
#include<ImageUtility_X11Display.hxx>
#include<ImageUtility_X11Dump.hxx>
#include<ImageUtility_X11GC.hxx>
#include<ImageUtility_X11Window.hxx>
#include<ImageUtility_X11XImage.hxx>
#include<ImageUtility_XPR.hxx>
#include<ImageUtility_XWD.hxx>
#include<ImageUtility_XWUD.hxx>
#include<Image_AveragePixelInterpolation.hxx>
#include<Image_BalancedPixelInterpolation.hxx>
#include<Image_BilinearPixelInterpolation.hxx>
#include<Image_CRawBufferData.hxx>
#include<Image_ColorImage.hxx>
#include<Image_ColorPixelDataMap.hxx>
#include<Image_ColorPixelMapHasher.hxx>
#include<Image_Convertor.hxx>
#include<Image_DColorImage.hxx>
#include<Image_DIndexedImage.hxx>
#include<Image_DataMapIteratorOfColorPixelDataMap.hxx>
#include<Image_DataMapIteratorOfLookupTable.hxx>
#include<Image_DataMapNodeOfColorPixelDataMap.hxx>
#include<Image_DataMapNodeOfLookupTable.hxx>
#include<Image_DitheringMethod.hxx>
#include<Image_FlipType.hxx>
#include<Image_HPrivateImage.hxx>
#include<Image_Image.hxx>
#include<Image_IndexPixelMapHasher.hxx>
#include<Image_LookupTable.hxx>
#include<Image_PixMap.hxx>
#include<Image_PixelAddress.hxx>
#include<Image_PixelFieldOfDColorImage.hxx>
#include<Image_PixelInterpolation.hxx>
#include<Image_PixelRowOfDColorImage.hxx>
#include<Image_PixelRowOfDIndexedImage.hxx>
#include<Image_PlanarPixelInterpolation.hxx>
#include<Image_PseudoColorImage.hxx>
#include<Image_TypeOfImage.hxx>
#include<MFT.hxx>
#include<MFT_CommandDescriptor.hxx>
#include<MFT_FileHandle.hxx>
#include<MFT_FilePosition.hxx>
#include<MFT_FileRecord.hxx>
#include<MFT_FontManager.hxx>
#include<MFT_FontManagerDefinitionError.hxx>
#include<MFT_FontManagerError.hxx>
#include<MFT_ListOfFontHandle.hxx>
#include<MFT_ListOfFontName.hxx>
#include<MFT_ListOfFontReference.hxx>
#include<MFT_SequenceNodeOfListOfFontHandle.hxx>
#include<MFT_TextManager.hxx>
#include<MFT_TypeOfCommand.hxx>
#include<MFT_TypeOfValue.hxx>
#include<OSD.hxx>
#include<OSD_Chronometer.hxx>
#include<OSD_Directory.hxx>
#include<OSD_DirectoryIterator.hxx>
#include<OSD_Disk.hxx>
#include<OSD_Environment.hxx>
#include<OSD_EnvironmentIterator.hxx>
#include<OSD_Error.hxx>
#include<OSD_ErrorList.hxx>
#include<OSD_Exception.hxx>
#include<OSD_Exception_ACCESS_VIOLATION.hxx>
#include<OSD_Exception_ARRAY_BOUNDS_EXCEEDED.hxx>
#include<OSD_Exception_CTRL_BREAK.hxx>
#include<OSD_Exception_FLT_DENORMAL_OPERAND.hxx>
#include<OSD_Exception_FLT_DIVIDE_BY_ZERO.hxx>
#include<OSD_Exception_FLT_INEXACT_RESULT.hxx>
#include<OSD_Exception_FLT_INVALID_OPERATION.hxx>
#include<OSD_Exception_FLT_OVERFLOW.hxx>
#include<OSD_Exception_FLT_STACK_CHECK.hxx>
#include<OSD_Exception_FLT_UNDERFLOW.hxx>
#include<OSD_Exception_ILLEGAL_INSTRUCTION.hxx>
#include<OSD_Exception_INT_DIVIDE_BY_ZERO.hxx>
#include<OSD_Exception_INT_OVERFLOW.hxx>
#include<OSD_Exception_INVALID_DISPOSITION.hxx>
#include<OSD_Exception_IN_PAGE_ERROR.hxx>
#include<OSD_Exception_NONCONTINUABLE_EXCEPTION.hxx>
#include<OSD_Exception_PRIV_INSTRUCTION.hxx>
#include<OSD_Exception_STACK_OVERFLOW.hxx>
#include<OSD_Exception_STATUS_NO_MEMORY.hxx>
#include<OSD_File.hxx>
#include<OSD_FileIterator.hxx>
#include<OSD_FileNode.hxx>
#include<OSD_FontAspect.hxx>
#include<OSD_FontMgr.hxx>
#include<OSD_FromWhere.hxx>
#include<OSD_Function.hxx>
#include<OSD_Host.hxx>
#include<OSD_KindFile.hxx>
#include<OSD_LoadMode.hxx>
#include<OSD_Localizer.hxx>
#include<OSD_LockType.hxx>
#include<OSD_MAllocHook.hxx>
#include<OSD_MailBox.hxx>
#include<OSD_NListOfSystemFont.hxx>
#include<OSD_OEMType.hxx>
#include<OSD_OSDError.hxx>
#include<OSD_OpenMode.hxx>
#include<OSD_PThread.hxx>
#include<OSD_Path.hxx>
#include<OSD_PerfMeter.hxx>
#include<OSD_Printer.hxx>
#include<OSD_Process.hxx>
#include<OSD_Protection.hxx>
#include<OSD_Real2String.hxx>
#include<OSD_SIGBUS.hxx>
#include<OSD_SIGHUP.hxx>
#include<OSD_SIGILL.hxx>
#include<OSD_SIGINT.hxx>
#include<OSD_SIGKILL.hxx>
#include<OSD_SIGQUIT.hxx>
#include<OSD_SIGSEGV.hxx>
#include<OSD_SIGSYS.hxx>
#include<OSD_Semaphore.hxx>
#include<OSD_SharedLibrary.hxx>
#include<OSD_SharedMemory.hxx>
#include<OSD_Signal.hxx>
#include<OSD_Signals.hxx>
#include<OSD_SingleProtection.hxx>
#include<OSD_SysType.hxx>
#include<OSD_SystemFont.hxx>
#include<OSD_Thread.hxx>
#include<OSD_ThreadFunction.hxx>
#include<OSD_Timer.hxx>
#include<OSD_WhoAmI.hxx>
#include<Prs3d.hxx>
#include<Prs3d_AngleAspect.hxx>
#include<Prs3d_AnglePresentation.hxx>
#include<Prs3d_Arrow.hxx>
#include<Prs3d_ArrowAspect.hxx>
#include<Prs3d_BasicAspect.hxx>
#include<Prs3d_CompositeAspect.hxx>
#include<Prs3d_DatumAspect.hxx>
#include<Prs3d_Drawer.hxx>
#include<Prs3d_InvalidAngle.hxx>
#include<Prs3d_IsoAspect.hxx>
#include<Prs3d_LengthAspect.hxx>
#include<Prs3d_LengthPresentation.hxx>
#include<Prs3d_LineAspect.hxx>
#include<Prs3d_NListIteratorOfListOfSequenceOfPnt.hxx>
#include<Prs3d_NListOfSequenceOfPnt.hxx>
#include<Prs3d_PlaneAspect.hxx>
#include<Prs3d_PlaneSet.hxx>
#include<Prs3d_PointAspect.hxx>
#include<Prs3d_Presentation.hxx>
#include<Prs3d_Projector.hxx>
#include<Prs3d_RadiusAspect.hxx>
#include<Prs3d_Root.hxx>
#include<Prs3d_ShadingAspect.hxx>
#include<Prs3d_ShapeTool.hxx>
#include<Prs3d_Text.hxx>
#include<Prs3d_TextAspect.hxx>
#include<Prs3d_TypeOfLinePicking.hxx>
#include<PrsMgr_KindOfPrs.hxx>
#include<PrsMgr_ModedPresentation.hxx>
#include<PrsMgr_PresentableObject.hxx>
#include<PrsMgr_PresentableObjectPointer.hxx>
#include<PrsMgr_Presentation.hxx>
#include<PrsMgr_Presentation2d.hxx>
#include<PrsMgr_Presentation3d.hxx>
#include<PrsMgr_Presentation3dPointer.hxx>
#include<PrsMgr_PresentationManager.hxx>
#include<PrsMgr_PresentationManager2d.hxx>
#include<PrsMgr_PresentationManager3d.hxx>
#include<PrsMgr_Presentations.hxx>
#include<PrsMgr_Prs.hxx>
#include<PrsMgr_SequenceNodeOfPresentations.hxx>
#include<PrsMgr_TypeOfPresentation3d.hxx>
#include<Quantity_AbsorbedDose.hxx>
#include<Quantity_Acceleration.hxx>
#include<Quantity_AcousticIntensity.hxx>
#include<Quantity_Activity.hxx>
#include<Quantity_Admittance.hxx>
#include<Quantity_AmountOfSubstance.hxx>
#include<Quantity_AngularVelocity.hxx>
#include<Quantity_Area.hxx>
#include<Quantity_Array1OfCoefficient.hxx>
#include<Quantity_Array1OfColor.hxx>
#include<Quantity_Array2OfColor.hxx>
#include<Quantity_Capacitance.hxx>
#include<Quantity_Coefficient.hxx>
#include<Quantity_CoefficientOfExpansion.hxx>
#include<Quantity_Color.hxx>
#include<Quantity_ColorDefinitionError.hxx>
#include<Quantity_Color_1.hxx>
#include<Quantity_Concentration.hxx>
#include<Quantity_Conductivity.hxx>
#include<Quantity_Constant.hxx>
#include<Quantity_Consumption.hxx>
#include<Quantity_Content.hxx>
#include<Quantity_Convert.hxx>
#include<Quantity_Date.hxx>
#include<Quantity_DateDefinitionError.hxx>
#include<Quantity_Density.hxx>
#include<Quantity_DoseEquivalent.hxx>
#include<Quantity_ElectricCapacitance.hxx>
#include<Quantity_ElectricCharge.hxx>
#include<Quantity_ElectricCurrent.hxx>
#include<Quantity_ElectricFieldStrength.hxx>
#include<Quantity_ElectricPotential.hxx>
#include<Quantity_Energy.hxx>
#include<Quantity_Enthalpy.hxx>
#include<Quantity_Entropy.hxx>
#include<Quantity_Factor.hxx>
#include<Quantity_Force.hxx>
#include<Quantity_Frequency.hxx>
#include<Quantity_HArray1OfColor.hxx>
#include<Quantity_Illuminance.hxx>
#include<Quantity_Impedance.hxx>
#include<Quantity_Index.hxx>
#include<Quantity_Inductance.hxx>
#include<Quantity_KinematicViscosity.hxx>
#include<Quantity_KineticMoment.hxx>
#include<Quantity_Length.hxx>
#include<Quantity_Luminance.hxx>
#include<Quantity_LuminousEfficacity.hxx>
#include<Quantity_LuminousExposition.hxx>
#include<Quantity_LuminousFlux.hxx>
#include<Quantity_LuminousIntensity.hxx>
#include<Quantity_MagneticFieldStrength.hxx>
#include<Quantity_MagneticFlux.hxx>
#include<Quantity_MagneticFluxDensity.hxx>
#include<Quantity_Mass.hxx>
#include<Quantity_MassFlow.hxx>
#include<Quantity_MolarConcentration.hxx>
#include<Quantity_MolarMass.hxx>
#include<Quantity_MolarVolume.hxx>
#include<Quantity_Molarity.hxx>
#include<Quantity_MomentOfAForce.hxx>
#include<Quantity_MomentOfInertia.hxx>
#include<Quantity_Momentum.hxx>
#include<Quantity_NameOfColor.hxx>
#include<Quantity_Normality.hxx>
#include<Quantity_Parameter.hxx>
#include<Quantity_Period.hxx>
#include<Quantity_PeriodDefinitionError.hxx>
#include<Quantity_PhysicalQuantity.hxx>
#include<Quantity_PlaneAngle.hxx>
#include<Quantity_Power.hxx>
#include<Quantity_Pressure.hxx>
#include<Quantity_Quotient.hxx>
#include<Quantity_Rate.hxx>
#include<Quantity_Ratio.hxx>
#include<Quantity_Reluctance.hxx>
#include<Quantity_Resistance.hxx>
#include<Quantity_Resistivity.hxx>
#include<Quantity_Scalaire.hxx>
#include<Quantity_SolidAngle.hxx>
#include<Quantity_SoundIntensity.hxx>
#include<Quantity_SpecificHeatCapacity.hxx>
#include<Quantity_Speed.hxx>
#include<Quantity_SurfaceTension.hxx>
#include<Quantity_Temperature.hxx>
#include<Quantity_ThermalConductivity.hxx>
#include<Quantity_Torque.hxx>
#include<Quantity_TypeOfColor.hxx>
#include<Quantity_Velocity.hxx>
#include<Quantity_Viscosity.hxx>
#include<Quantity_Volume.hxx>
#include<Quantity_VolumeFlow.hxx>
#include<Quantity_Weight.hxx>
#include<Quantity_Work.hxx>
#include<SelectBasics.hxx>
#include<SelectBasics_BasicTool.hxx>
#include<SelectBasics_EntityOwner.hxx>
#include<SelectBasics_ListIteratorOfListOfBox2d.hxx>
#include<SelectBasics_ListIteratorOfListOfSensitive.hxx>
#include<SelectBasics_ListNodeOfListOfBox2d.hxx>
#include<SelectBasics_ListNodeOfListOfSensitive.hxx>
#include<SelectBasics_ListOfBox2d.hxx>
#include<SelectBasics_ListOfSensitive.hxx>
#include<SelectBasics_SensitiveEntity.hxx>
#include<SelectBasics_SequenceNodeOfSequenceOfOwner.hxx>
#include<SelectBasics_SequenceOfOwner.hxx>
#include<SelectBasics_SortAlgo.hxx>
#include<SelectMgr_AndFilter.hxx>
#include<SelectMgr_CompareResults.hxx>
#include<SelectMgr_CompositionFilter.hxx>
#include<SelectMgr_DataMapIteratorOfDataMapOfIntegerSensitive.hxx>
#include<SelectMgr_DataMapIteratorOfDataMapOfObjectSelectors.hxx>
#include<SelectMgr_DataMapIteratorOfDataMapOfSelectionActivation.hxx>
#include<SelectMgr_DataMapNodeOfDataMapOfIntegerSensitive.hxx>
#include<SelectMgr_DataMapNodeOfDataMapOfObjectSelectors.hxx>
#include<SelectMgr_DataMapNodeOfDataMapOfSelectionActivation.hxx>
#include<SelectMgr_DataMapOfIntegerSensitive.hxx>
#include<SelectMgr_DataMapOfObjectOwners.hxx>
#include<SelectMgr_DataMapOfObjectSelectors.hxx>
#include<SelectMgr_DataMapOfSelectionActivation.hxx>
#include<SelectMgr_EntityOwner.hxx>
#include<SelectMgr_Filter.hxx>
#include<SelectMgr_IndexedDataMapNodeOfIndexedDataMapOfOwnerCriterion.hxx>
#include<SelectMgr_IndexedDataMapOfOwnerCriterion.hxx>
#include<SelectMgr_IndexedMapNodeOfIndexedMapOfOwner.hxx>
#include<SelectMgr_IndexedMapOfOwner.hxx>
#include<SelectMgr_ListIteratorOfListOfFilter.hxx>
#include<SelectMgr_ListNodeOfListOfFilter.hxx>
#include<SelectMgr_ListOfFilter.hxx>
#include<SelectMgr_OrFilter.hxx>
#include<SelectMgr_SOPtr.hxx>
#include<SelectMgr_SelectableObject.hxx>
#include<SelectMgr_Selection.hxx>
#include<SelectMgr_SequenceNodeOfSequenceOfFilter.hxx>
#include<SelectMgr_SequenceNodeOfSequenceOfOwner.hxx>
#include<SelectMgr_SequenceNodeOfSequenceOfSelection.hxx>
#include<SelectMgr_SequenceNodeOfSequenceOfSelector.hxx>
#include<SelectMgr_SequenceOfFilter.hxx>
#include<SelectMgr_SequenceOfOwner.hxx>
#include<SelectMgr_SequenceOfSelection.hxx>
#include<SelectMgr_SequenceOfSelector.hxx>
#include<SelectMgr_SortCriterion.hxx>
#include<SelectMgr_StateOfSelection.hxx>
#include<SelectMgr_TypeOfUpdate.hxx>
#include<TDF.hxx>
#include<TDF_Attribute.hxx>
#include<TDF_AttributeArray1.hxx>
#include<TDF_AttributeDataMap.hxx>
#include<TDF_AttributeDelta.hxx>
#include<TDF_AttributeDeltaList.hxx>
#include<TDF_AttributeDoubleMap.hxx>
#include<TDF_AttributeIndexedMap.hxx>
#include<TDF_AttributeIterator.hxx>
#include<TDF_AttributeList.hxx>
#include<TDF_AttributeMap.hxx>
#include<TDF_AttributeSequence.hxx>
#include<TDF_ChildIDIterator.hxx>
#include<TDF_ChildIterator.hxx>
#include<TDF_ClosureMode.hxx>
#include<TDF_ClosureTool.hxx>
#include<TDF_ComparisonTool.hxx>
#include<TDF_CopyLabel.hxx>
#include<TDF_CopyTool.hxx>
#include<TDF_Data.hxx>
#include<TDF_DataMapIteratorOfAttributeDataMap.hxx>
#include<TDF_DataMapIteratorOfLabelDataMap.hxx>
#include<TDF_DataMapIteratorOfLabelIntegerMap.hxx>
#include<TDF_DataMapIteratorOfLabelLabelMap.hxx>
#include<TDF_DataMapNodeOfAttributeDataMap.hxx>
#include<TDF_DataMapNodeOfLabelDataMap.hxx>
#include<TDF_DataMapNodeOfLabelIntegerMap.hxx>
#include<TDF_DataMapNodeOfLabelLabelMap.hxx>
#include<TDF_DataSet.hxx>
#include<TDF_DefaultDeltaOnModification.hxx>
#include<TDF_DefaultDeltaOnRemoval.hxx>
#include<TDF_Delta.hxx>
#include<TDF_DeltaList.hxx>
#include<TDF_DeltaOnAddition.hxx>
#include<TDF_DeltaOnForget.hxx>
#include<TDF_DeltaOnModification.hxx>
#include<TDF_DeltaOnRemoval.hxx>
#include<TDF_DeltaOnResume.hxx>
#include<TDF_DoubleMapIteratorOfAttributeDoubleMap.hxx>
#include<TDF_DoubleMapIteratorOfGUIDProgIDMap.hxx>
#include<TDF_DoubleMapIteratorOfLabelDoubleMap.hxx>
#include<TDF_DoubleMapNodeOfAttributeDoubleMap.hxx>
#include<TDF_DoubleMapNodeOfGUIDProgIDMap.hxx>
#include<TDF_DoubleMapNodeOfLabelDoubleMap.hxx>
#include<TDF_GUIDProgIDMap.hxx>
#include<TDF_HAllocator.hxx>
#include<TDF_HAttributeArray1.hxx>
#include<TDF_IDFilter.hxx>
#include<TDF_IDList.hxx>
#include<TDF_IDMap.hxx>
#include<TDF_IndexedMapNodeOfAttributeIndexedMap.hxx>
#include<TDF_IndexedMapNodeOfLabelIndexedMap.hxx>
#include<TDF_Label.hxx>
#include<TDF_LabelDataMap.hxx>
#include<TDF_LabelDoubleMap.hxx>
#include<TDF_LabelIndexedMap.hxx>
#include<TDF_LabelIntegerMap.hxx>
#include<TDF_LabelLabelMap.hxx>
#include<TDF_LabelList.hxx>
#include<TDF_LabelMap.hxx>
#include<TDF_LabelMapHasher.hxx>
#include<TDF_LabelNode.hxx>
#include<TDF_LabelNodePtr.hxx>
#include<TDF_LabelSequence.hxx>
#include<TDF_ListIteratorOfAttributeDeltaList.hxx>
#include<TDF_ListIteratorOfAttributeList.hxx>
#include<TDF_ListIteratorOfDeltaList.hxx>
#include<TDF_ListIteratorOfIDList.hxx>
#include<TDF_ListIteratorOfLabelList.hxx>
#include<TDF_ListNodeOfAttributeDeltaList.hxx>
#include<TDF_ListNodeOfAttributeList.hxx>
#include<TDF_ListNodeOfDeltaList.hxx>
#include<TDF_ListNodeOfIDList.hxx>
#include<TDF_ListNodeOfLabelList.hxx>
#include<TDF_MapIteratorOfAttributeMap.hxx>
#include<TDF_MapIteratorOfIDMap.hxx>
#include<TDF_MapIteratorOfLabelMap.hxx>
#include<TDF_Reference.hxx>
#include<TDF_RelocationTable.hxx>
#include<TDF_SequenceNodeOfAttributeSequence.hxx>
#include<TDF_SequenceNodeOfLabelSequence.hxx>
#include<TDF_StdMapNodeOfAttributeMap.hxx>
#include<TDF_StdMapNodeOfIDMap.hxx>
#include<TDF_StdMapNodeOfLabelMap.hxx>
#include<TDF_TagSource.hxx>
#include<TDF_Tool.hxx>
#include<TDF_Transaction.hxx>
#include<Xw.hxx>
#include<Xw_ColorMap.hxx>
#include<Xw_Driver.hxx>
#include<Xw_FontMap.hxx>
#include<Xw_GraphicDevice.hxx>
#include<Xw_HListOfMFTFonts.hxx>
#include<Xw_IconBox.hxx>
#include<Xw_ListOfMFTFonts.hxx>
#include<Xw_MarkMap.hxx>
#include<Xw_PixMap.hxx>
#include<Xw_TextManager.hxx>
#include<Xw_TypeMap.hxx>
#include<Xw_TypeOfMapping.hxx>
#include<Xw_TypeOfVisual.hxx>
#include<Xw_WidthMap.hxx>
#include<Xw_Window.hxx>
#include<Xw_WindowQuality.hxx>

// Needed headers necessary for compilation.

#include<Handle_Standard_Transient.hxx>
#include<TopoDS_Shape.hxx>
#include<TDF_Label.hxx>
#include<XCAFPrs.hxx>
#include<TopLoc_Location.hxx>
#include<Handle_AIS_InteractiveObject.hxx>
#include<Quantity_Color.hxx>
%}
