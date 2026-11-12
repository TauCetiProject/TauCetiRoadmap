# Symplectic geometry and Hamiltonian mechanics

Build the geometry of cotangent phase spaces, Lagrangian submanifolds, symmetry and reduction,
moment-map convexity, completely integrable systems and contact geometry. The result is a reusable geometric library:
canonical transformations, reduced spaces and torus fibrations carry smooth structures and symplectic
forms, with transport, uniqueness, examples and computational formulas as well as existence theorems.

## The roadmaps

- [Cotangent bundles and Lagrangian geometry](CotangentLagrangian/README.md): Liouville forms,
  cotangent lifts, conormals, generating functions, correspondences, relative neighborhood theorems.
- [Hamiltonian actions and symplectic reduction](HamiltonianReduction/README.md): group-level moment
  maps, global flux and Hamiltonian kernels, coadjoint orbits, free and locally free reduction, cotangent reduction and gauge geometry.
- [Convexity, Duistermaat–Heckman and symplectic toric manifolds](ConvexityToric/README.md): fixed-point
  normal forms, Morse–Bott theory, convexity, measure/class variation, Delzant classification and orbifold examples.
- [Integrable systems and classical mechanics](IntegrableSystems/README.md): involutive integrals,
  regular Lagrangian fibers, Liouville–Arnold, action-angle variables, Legendre transform and central forces.
- [Contact geometry and contact dynamics](ContactGeometry/README.md): contact lines and forms,
  Reeb dynamics, Darboux and Gray stability, symplectization and Legendrian neighborhoods.

Each subroadmap is independently definitive. Every milestone is wanted. The root file supplies common
conventions and ownership; each subdirectory's `Suggested.lean` illustrates genuine interfaces but is
neither exhaustive nor prescriptive about implementation.

## Shared floor and conventions

Work with real finite-dimensional smooth Hausdorff second-countable manifolds without boundary,
unless a result explicitly treats a local model, an orbifold or the smooth connection space of gauge
theory. Use Mathlib's `ModelWithCorners`, `IsManifold`, `TangentSpace`, `mfderiv`, `Diffeomorph`,
`Bundle.TotalSpace`, and the continuous dual for cotangent fibers. A form is the existing
`TauCeti.SmoothTwoForm I M`, symplectic when `SmoothTwoForm.IsSymplectic` holds. Follow
[DifferentialGeometry](../DifferentialGeometry/README.md)'s generic-form migration: every evaluation,
pullback and closedness theorem is an adapter of that single differential-form calculus.

The linear compatibility layer [C2.1](CotangentLagrangian/README.md#c21-compact-intersections-and-group-applications) owns the displayed matrix-compatibility identities and the direct GL(n,ℂ) and Sp(2n,ℝ) maximal-compact theorems by trace growth. Identify the three pairwise intersections of the real symplectic, complex-linear and orthogonal groups with realified U(n). [C2.0](CotangentLagrangian/README.md#c20-elementary-matrix-polar-package) owns the ambient real and complex polar-coordinate floor. C2.1 proves connectedness of these two groups and Sp-specific polar preservation; its required semisimple/finite-center/Killing and adjoint-model comparison is separate from those primary direct proofs. Finally instantiate LieGroups Layer9's matrix-model theorem with H=C_R or Sp_R and π=id. The consuming LieGroups layers own the generic subgroup theorems; these final comparisons are not premises of C2.1's direct maximality proofs.

The canonical cotangent form is **ω = −dλ**, with λ_(q,p)(v)=p(dπ(v)) and ω=Σ dqᵢ∧dpᵢ.
The Hamiltonian convention is **ι_(X_f)ω=df**, the bracket is **{f,g}=df(X_g)**, and
X_{ {f,g} }=−[X_f,X_g]. Fundamental vector fields for a left group action satisfy
([ξ,η])_M=−[ξ_M,η_M]. Moment maps satisfy d⟨μ,ξ⟩=ι_(ξ_M)ω and coadjoint equivariance
μ(gx)=Ad*_(g)μ(x), where (Ad*_(g)ν)(ξ)=ν(Ad_(g⁻¹)ξ).
The default circle period is 2π, so integral weights pair integrally with Λ_Z=(2π)⁻¹ker(exp), and into 2πZ with the period lattice. S0 uses two period-1 time circles; R1a.3 also uses period-1 torus coordinates; [IntegrableSystems I2.0](IntegrableSystems/README.md#i20-positive-period-circles-and-families) supplies the single positive-period AddCircle atlas, oriented time form and normalization conversions. Its varying-period total form is specified separately from the closed fixed-period forms consumed by S0. Normalize Lebesgue measure on t* so the weight lattice Λ* dual to Λ_Z=(2π)⁻¹ker(exp) has covolume 1. Every measure comparison must retain these factors.

## Dependencies and single ownership

- [MorseTheory](../MorseTheory/README.md), M1–M5, owns ordinary Morse and abstract
  Morse–Bott normal forms, compact-band deformation and negative-disc attachment.
  ConvexityToric T2 owns the Hamiltonian specialization and equivariant perfection.
- [HamiltonianSystems](https://github.com/TauCetiProject/TauCetiRoadmap/pull/480) owns
  `SmoothTwoForm.IsHamiltonianVectorField`, `IsHamiltonian`, `hamiltonianVectorField`,
  `poissonBracket`, `IsSymplecticMap`, infinitesimal actions and moment maps, conservation and
  symplectic flows. Consume that API and build missing specializations in Tau Ceti
  in that shape. HF F2.1 supplies the shared contraction inverse and generic-form
  transport prerequisite; consume that construction here.
- [HeegaardFloer](https://github.com/TauCetiProject/TauCetiRoadmap/pull/957), Lane F2.1, owns ordinary Darboux/Moser and the
  symplectic/almost-complex base. This family owns relative/equivariant refinements and applications,
  with precise compactness and complete-flow hypotheses. It does not duplicate linear symplectic
  groups, symplectic orthogonals or compatible structures already in Tau Ceti.
- [DifferentialGeometry](../DifferentialGeometry/README.md) owns forms, Cartan and homotopy formulas,
  de Rham theory, integration, smooth flows and Frobenius. Generic tubular neighborhoods belong to
  [GeometricTopology](../GeometricTopology/README.md). HF F2.1 builds smooth-family primitive selection and time-dependent pullback; C4
  builds their relative Poincaré refinements on DifferentialGeometry’s homotopy floor.
- [SmoothBundlesConnections](https://github.com/TauCetiProject/TauCetiRoadmap/pull/887) owns bundle operations,
  principal and associated bundles, connections, curvature, Chern classes, holonomy and smooth affine gauge
  infrastructure. R5 here owns Sobolev gauge spaces and analytic Coulomb slices. Cotangent forms and symplectic reduction remain here.
- [RepresentationTheory/LieGroups](../RepresentationTheory/LieGroups/README.md) owns Lie groups, exponentials, Ad, compact maximal-torus existence/conjugacy/exhaustion, the geometric Weyl group and its compact REAL root/character/coroot/rank-one comparison with RootSystems. RootSystems owns the abstract signed inversion/dual positivity and closed-wall chamber theorem. HamiltonianReduction R2 applies these to compact connected coadjoint chambers/centralizers, separately from its arbitrary-group homogeneous coadjoint manifolds. ConvexityToric T1 adds only integral period/character/isogeny normalization, using those real data; T3 consumes the R2 chamber quotient. Use current Mathlib `GroupLieAlgebra` and Tau Ceti `Lie.adjointContinuousLinearMap`; transport to the derivation model through `leftInvariantDerivationLieEquivGroupLieAlgebra` of `TauCeti.Geometry.Lie.Tangent.LieEquiv` when the identity is interior, rather than identify these carriers definitionally.

Proper finite-isotropy action slices come from SmoothBundlesConnections B1. HamiltonianReduction R3 constructs its actual possibly ineffective Hamiltonian level presentation and symplectic form, together with singular reduction. [Orbifolds O1–O5](https://github.com/TauCetiProject/TauCetiRoadmap/pull/969) owns the generic proper étale, invariant-form/Morita, represented-bundle, classifying/coarse/de Rham, character-class and weighted-integration interfaces, including O4-T's thin/torus comparison. ConvexityToric T4 consumes them on R3's actual model and owns the full effective/ineffective reduced-class, volume and DH applications. Generic O1–O5 does not consume CT integration; O7 comparisons are later. R5 owns surface Sobolev/elliptic gauge theory, consuming [PDE](../PDE/README.md) scalar estimates, [ComplexKahlerGeometry K5](https://github.com/TauCetiProject/TauCetiRoadmap/pull/953) smooth BundleSobolev/localization and global bundle Laplace estimates, and SBC smooth gauge/holonomy. R5 owns the rough Sobolev-coefficient/slice extension and its surface quotient/stratum applications.

[ContactGeometry CG1](ContactGeometry/README.md#cg1--contact-distributions-contact-line-and-cooriented-forms)
owns the contact predicate and line-valued Levi form independently of cotangent applications.
[C2.2](CotangentLagrangian/README.md#c22-exact-lagrangians-and-basic-examples) consumes that predicate
for its two signed cosphere forms; [CG4](ContactGeometry/README.md#cg4--symplectization-and-contactization)
and [CG5](ContactGeometry/README.md#cg5--isotropic-and-legendrian-neighborhoods) consume the cosphere
application. Contact-specific Darboux, Gray and neighborhood refinements remain in CG3–CG5.
[CG6](ContactGeometry/README.md#cg6--contactjacobi-interface-floer-boundary) offers the geometric
boundary and sign adapters to HeegaardFloer and DGFloer; their analytic and invariant endpoints
remain with those owners.

The dependency order is cotangent/Lagrangian and Hamiltonian foundations, then reduction; ConvexityToric T1 consumes LG6’s compact REAL data for its integral refinement, while T3/T4 consume RootSystems and HamiltonianReduction R2/R3. IntegrableSystems I2.0 constructs positive-period circle quotients before I2 uses period2π angle charts. S0–S2 consumes the generic TauCeti smooth free/proper quotient theorem and I2.0's period1 circle, then HeegaardFloer F2.1's compatible-structure family, LieGroupoidsPoisson G0.1's kernel distribution, AlgebraicTopology5–6 and DifferentialGeometry8–9; it precedes TaubesGromov's mapping-torus application. Quantization consumes these developments without defining another moment map or Liouville measure. The explicit suspension quotient/translation flow does not require a flux theorem; HamiltonianSystems/DG time-dependent complete flows enter the Hamiltonian and common-support applications at their actual uses.

This S0–S2 family is the definitive general smooth suspension API: it constructs the mapping torus, its seam-compatible block almost-complex structure, periodic-orbit images and the compact horizontal-image theorem. It is general symplectic geometry, not a four-dimensional gauge/counting result; TaubesGromov consumes it for its separate application.

## S0. Smooth symplectic suspensions

Let (M,ω) be any Hausdorff second-countable finite-dimensional smooth symplectic manifold and let φ:M→M be a global symplectomorphism. Construct the smooth mapping torus

`Y_φ=(ℝ×M)/((t,x)∼(t+1,φ⁻¹x))`.

Put the product on a type synonym E_φ of ℝ×M, transporting its topology and smooth structure so no existing additive `zsmul` instance is changed. Define the smooth TOTAL carrier `Y_φ := MulAction.orbitRel.Quotient (Multiplicative ℤ) E_φ` for the action n·(t,x)=(t+n,φ^(−n)x). Prove its `MulAction`, `ContMDiffConstSMul`, `ContinuousConstSMul`, freeness/`IsCancelSMul` and proper-discontinuity instances from the integer translation coordinate and smooth iterates. Supply the product source’s `IsManifold`, T2 and local compactness to native `TauCeti.instIsManifoldQuotient` and `isLocalDiffeomorph_quotientMk`. Give Multiplicative ℤ the discrete topology; first countability supplies `CompactlyCoherentSpace (E_φ×E_φ)`, so `properlyDiscontinuousSMul_iff_properSMul` and the native ProperSMul quotient-T2 instance give Hausdorffness. Prove the open quotient is second countable from a countable source basis. Construct interval charts of width<1 and maximal-atlas compatibility, with integer-shift fiber transition φ^(−n). These are the particular action/atlas checks, not another generic quotient theorem; no compactness of M or properness of φ-orbits is needed. If the additive-action orbit quotient is used, prove its explicit homeomorphism with this defined multiplicative quotient and transport the structure through it. Identify the BASE translation quotient and the independent s-circle with [I2.0](IntegrableSystems/README.md#i20-positive-period-circles-and-families)’s actual smooth `AddCircle 1`, using its local-diffeomorphic covering and oriented form with integral1; each angular conversion is `dt=(1/(2π))dθ`. Keep both base circles distinct from the total mapping-torus carrier. Define p([t,x])=[t], prove the period-form normalization and identify a chosen-lift fiber by x↦[t,x] with change of lift φ^(−n).

Descend dt to a closed one-form on Y_φ and the fibre form to a smooth closed two-form ω_v with kernel the descended field T=∂_t. Translation in t gives its complete smooth flow, and time1 on a chosen fibre is φ. Prove the tangent/seam identifications and the splitting `TY_φ=ℝT⊕V`, where V is the vertical tangent bundle. On `X_φ=(ℝ/ℤ)_s×Y_φ` construct

`Ω=ds∧dt+ω_v`.

Prove closedness, nondegeneracy and the induced orientation ds∧dt followed by the fibre symplectic orientation. Both time circles use period1; their angular coordinates are 2πs and2πt. This convention fixes the area statements below.

## S1. Seam-compatible block structures and periodic images

Build the block structure upstairs on `R_s×R_t×M` before descent. Consume [HeegaardFloer F2.1](https://github.com/TauCetiProject/TauCetiRoadmap/pull/957)'s smooth family of compatible structures, choose J₀ and a collar-constant path from J₀ to φ*J₀, and extend it with the seam rule `J_(t+1,x)=dφ_x⁻¹ J_(t,φx) dφ_x`. On the product set `J̃∂_s=∂_t`, `J̃∂_t=−∂_s`, and let J̃ restrict to J_(t,x) on the vertical tangent. For `Ω̃=ds∧dt+ω`, verify J̃²=−1 and `Ω̃((a∂_s+b∂_t+v),J̃(a∂_s+b∂_t+v))=a²+b²+ω(v,J_(t,x)v)>0` for every nonzero vector. Check invariance under the s-translation generator and under `(t,x)↦(t+1,φ⁻¹x)` using the seam identity, including all seam jets. Only then descend to the quotient to obtain J on X_φ; prove smoothness and compatibility there by the quotient atlas. This gives the strict vertical inequality used in S2. For fixed φ and a compact finite-dimensional parameter space P, allow a prescribed jointly smooth family J₀,p with endpoint family φ*J₀,p and carry the path construction through these compatible data. Include relative prescriptions both on closed parameter faces and on closed spatial regions of the vertical symplectic bundle over Y_φ. Require the prescribed data on an open neighborhood, agreement on all overlaps and face intersections, compatibility with the fixed time-end collars, and the seam identities to every order. Pulling those spatial data to ℝ×M must give the corresponding deck-compatible neighborhoods and tensors. Instantiate HeegaardFloer F2.1's actual pointwise homotopies and smooth bundlewise assembly on this vertical bundle, retaining its finite-C^k estimates and compact-source C∞ continuity hypotheses. If φ varies, require a separately supplied smooth family of endpoint pullbacks and compatible face data before applying this construction. Verify all t-seam jets from the seam identity for each parameter; arbitrary face data are not assumed extendable. No φ-invariant J₀ is required.

For a periodic point x of least positive return period d, construct γ:R/(dℤ)→Y_φ by γ(t)=[t,x]. Prove it is a primitive embedded closed T-orbit and that its d intersections with one mapping-torus fibre are exactly the d points x,φx,…,φ^(d−1)x. Their starting-point choices determine the same oriented image. Construct the embedded block-holomorphic torus `(s,t)↦(s,[t,x])`, with Ω-area d and ω_v-area0. A degree-k parametrized cover has the same image, Ω-area kd and the corresponding multiplied integral class; prove this for the actual oriented covering map and distinguish it from a different primitive orbit. The construction and its change-of-fibre, conjugacy and integer-iterate laws are part of this API. Surface/four-dimensional SW/Gr counts, signs and zeta functions remain with TaubesGromov.

## S2. Compact horizontal-image theorem

Let C be a closed connected Riemann surface and u:C→X_φ a smooth embedding satisfying du∘j=J∘du, using the block structure of S1 or a supplied seam-compatible block structure preserving H=span(∂_s,T) and V_X, with J∂_s=T, JT=−∂_s and ω_v-tamed vertical restriction J_V. For p:Y_φ→AddCircle 1 define V_Y=ker(dp), consuming LieGroupoidsPoisson G0.1’s actual constant-rank kernel distribution, and put V_X=pr_Y*V_Y under the product tangent identification. All vertical projections and J_V below are on this pulled-back bundle. Suppose [u(C)] lies in the image of `[S¹_s]×H₁(Y_φ;ℤ)`. Prove ω_v has zero pairing with this cross summand, using its pullback from Y_φ, [AlgebraicTopology5–6](../AlgebraicTopology/README.md)'s integral cross product and [DifferentialGeometry8–9](../DifferentialGeometry/README.md)'s de Rham integration comparison. On a positive source frame e,je compute

`u*ω_v(e,je)=ω_v((du e)_V,J_V(du e)_V)≥0`,

with equality exactly when (du e)_V=0. Integration and continuity make this density identically zero. Thus the tangent image is the horizontal plane span(∂_s,T).

Prove the embedded image is exactly S¹_s×γ for one primitive closed T-orbit γ. The ambient s-circle action is tangent and preserves the compact image. Its projection to the s-circle is a submersion; construct the compact embedded one-dimensional fibre at s=0 using the generic regular-fibre theorem of [LieGroupoidsPoisson G0.1](../LieGroupoidsPoisson/README.md), and use s-translation to identify the image with its product with S¹. Connectedness makes that fibre a circle; T is nowhere zero and tangent there, so its flow has a least positive period d. Projection to the mapping-torus time circle makes d a positive integer, and S1 identifies γ with a primitive φ-orbit. Construct the actual image parametrization and orientation comparison. Its Ω-area is d, whereas its ω_v-area is0; a zero Ω-area conclusion is not part of this theorem.

The argument uses compactness of this individual closed source/image, including completeness of the restricted tangent flows. It assumes no compactness of M and proves no uniform compact-image or no-escape statement for a family of different curves. Constant maps, nonembedded maps, parametrized multiple covers and their counting weights have their explicitly different carriers; this theorem classifies embedded images. Generic factorization of arbitrary holomorphic maps remains with its curve-analysis owner.


## Design evidence and existing interfaces

Tau Ceti supplies linear cotangent `strongDualCotangentSymplecticForm`, `cotangentLiouvilleForm`
and `neg_extDeriv_cotangentLiouvilleForm`; `SymplecticForm.IsLagrangian`, orthogonals and products;
`SmoothTwoForm.IsSymplectic`; manifold maximal flows; and tangent-space Ad. These are consumed,
not recast as new definitions. The [cotangent-bundle Zulip discussion](https://leanprover.zulipchat.com/#narrow/channel/217875-Is.20there.20code.20for.20X.3F/topic/Cotangent.20Bundle.20as.20a.20Manifold/with/560999506)
shows that continuous-linear-map bundle operations infer the cotangent total-space manifold structure;
follow that construction. Use its product model rather than a private sigma space without charts.

## References

- Ana Cannas da Silva, [*Lectures on Symplectic Geometry*](https://people.math.ethz.ch/~acannas/Papers/lsg.pdf),
  §§2–8, 18, 22–30: cotangent forms, neighborhood theory, integrable systems, reduction and toric/DH geometry.
- Jerrold Marsden and Tudor Ratiu, *Introduction to Mechanics and Symmetry*, second edition:
  cotangent reduction, momentum maps, mechanics and semidirect product examples.
- Victor Guillemin and Shlomo Sternberg, *Symplectic Techniques in Physics*: convexity, reduction and mechanics.
- V. I. Arnold, *Mathematical Methods of Classical Mechanics*: Liouville–Arnold and central forces.
