# Cotangent bundles and Lagrangian geometry

Develop the smooth geometry of canonical phase spaces and Lagrangian submanifolds. The cotangent
bundle should be usable intrinsically, in charts, under diffeomorphisms and products; generating
functions should produce actual local canonical transformations with domains and inverse formulas.
Neighborhood theorems identify precisely what data determine a symplectic germ along a submanifold.

## Conventions and prerequisites

Use the [family conventions](../README.md). Base manifolds are real finite-dimensional smooth,
boundaryless, Hausdorff and second countable. A submanifold is given by a smooth embedding with an
induced manifold structure, not just a subset. Compactness of the embedded submanifold is required
for the uniform neighborhood conclusions below. Symplectic germs/local transformations are maps
between specified open neighborhoods; no theorem asserts a globally defined map from a local implicit
function. The conormal of Q⊂M uses covectors in T*_qM annihilating the image of T_qQ.

Consume Tau Ceti's `SymplecticForm.IsIsotropic`, `IsCoisotropic`, `IsLagrangian`, linear cotangent
form and Liouville identity. Tau Ceti also proves the following, which this roadmap consumes by
name and does not restate: the Liouville and canonical symplectic forms of the cotangent bundle
and their chart formulas (C1.2); the cotangent lift of a diffeomorphism and of a smooth group
action, with its preservation of both forms (C1.3); the open-restriction, product,
fibre-translation and fibre-dilation identities (C1.4); the tangent-image predicates, Lagrangian
immersions and embeddings and their invariance under rescaling (C2); the realification of
complex matrices and the maximal-compactness and connectedness theorems for GL(n,ℂ) and Sp(2n,ℝ)
(C2.1); the exact-Lagrangian results for the zero section, graphs of one-forms and conormal
maps, Lagrangian graphs of diffeomorphisms, the Liouville field, the classification of
λ-preserving diffeomorphisms, the torus graphs and the contact forms and Reeb flow of the unit
cosphere bundle (C2.2); the transpose, product and diagonal of Lagrangian correspondences and
the generating-function calculus on open subsets of normed spaces, with the intrinsic mixed
Hessian on a product of manifolds (C3); and the symplectic Witt extension (C4). Consume ordinary Darboux and compact-manifold Moser with a given smooth symplectic path from
[HeegaardFloer](../../HeegaardFloer/README.md), F2.1. Generic differential-form calculus belong to
[DifferentialGeometry](../../DifferentialGeometry/README.md); generic tubular neighborhoods belong to
[GeometricTopology](../../GeometricTopology/README.md); bundle duals and smooth operations belong
to [SmoothBundlesConnections](../../SmoothBundlesConnections/README.md). The missing instances or
lemmas needed to connect these interfaces are explicit work here or there, not assumptions.

## C1. Intrinsic cotangent phase space

1. T*M is Tau Ceti's `TauCeti.CotangentBundle I M`, the Mathlib total space
   `Bundle.TotalSpace (E →L[ℝ] ℝ) (fun x ↦ TangentSpace I x →L[ℝ] ℝ)`, with model
   `I.prod 𝓘(ℝ,E →L[ℝ] ℝ)`; the family's statements name them `Cotangent I M` and
   `cotangentModel I`. Use the existing continuous-linear-map bundle charts and prove
   projection smooth with `Manifold.IsSubmersion`; zero section and smooth one-form sections; local transition
   formula `(q,p)↦(φ(q),p∘(dφ_q)⁻¹)`; fiberwise addition/scaling and vector-bundle laws.
2. The Liouville form λ(v)=p(dπ(v)) is Tau Ceti's `TauCeti.CotangentBundle.liouvilleForm`, a
   smooth one-form on T*M with the chart formula Σpᵢdqᵢ
   (`TauCeti.CotangentBundle.inChartAt_liouvilleForm`). Its pullback by the section s_α of a
   smooth one-form α is α (`TauCeti.CotangentBundle.mpullback_liouvilleForm`; pointwise, at every
   point where s_α is differentiable, `TauCeti.CotangentBundle.mpullback_liouvilleForm_section`);
   its naturality under diffeomorphisms is C1.3. The canonical form ω=−dλ is
   `TauCeti.CotangentBundle.symplecticForm`
   (`TauCeti.CotangentBundle.symplecticForm_eq_neg_mextDeriv`), named `canonicalForm` in the
   family's statements. It is closed and nondegenerate
   (`TauCeti.CotangentBundle.isSymplectic_symplecticForm`) and equals
   `TauCeti.strongDualCotangentSymplecticForm` in every cotangent chart
   (`TauCeti.CotangentBundle.inChartAt_symplecticForm_apply`; Cannas da Silva, §§2.2–2.3,
   pp. 9–10). Since the chart expression at the chart centre is the form itself
   (`TauCeti.RoughForm.inChartAt_extChartAt_self`), this chart identity fixes the form; it is the
   evidence that no convention has changed. Consume these; none of them needs a
   finite-dimensional or boundaryless base.
3. The cotangent lift `(q,p)↦(f(q),p∘(df_q)⁻¹)` of a diffeomorphism f:M→N is Tau Ceti's
   `Diffeomorph.cotangent`, with its identity, composition and inverse laws
   (`Diffeomorph.cotangent_refl`, `Diffeomorph.cotangent_trans`, `Diffeomorph.cotangent_symm`).
   It pulls λ back to λ and ω back to ω (`Diffeomorph.mpullback_cotangent_liouvilleForm`,
   `Diffeomorph.mpullback_cotangent_symplecticForm`). The lift of a group action by smooth maps
   is again one (`TauCeti.CotangentBundle.instMulAction`,
   `TauCeti.CotangentBundle.instContMDiffConstSMul`), jointly smooth for a smooth Lie group
   action (`TauCeti.CotangentBundle.instContMDiffSMul`), and every group element preserves both
   forms (`TauCeti.CotangentBundle.mpullback_smul_liouvilleForm`,
   `TauCeti.CotangentBundle.mpullback_smul_symplecticForm`). Consume these.
   Define cotangent pullback along a general map as a relation over the map, rather than a false
   total map T*M→T*N when derivatives are not invertible.
4. Tau Ceti proves the four identities of this item; consume them. The open-restriction
   diffeomorphism T*U ≅ π⁻¹(U), `TauCeti.CotangentBundle.restrictOpen`, identifies the
   Liouville and symplectic forms
   (`TauCeti.CotangentBundle.mpullback_restrictOpen_liouvilleForm`,
   `TauCeti.CotangentBundle.mpullback_restrictOpen_symplecticForm`). The diffeomorphism
   T*(M×N) ≅ T*M×T*N, `TauCeti.CotangentBundle.prodDiffeomorph`, pulls the sum of the Liouville
   forms and the product of the symplectic forms back to those of M×N
   (`TauCeti.CotangentBundle.mpullback_prodDiffeomorph_liouvilleForm`,
   `TauCeti.CotangentBundle.mpullback_prodDiffeomorph_symplecticForm`). Fiber translation by a
   smooth one-form α changes λ to λ+π*α and ω to ω−π*dα, and is symplectic iff dα=0
   (`TauCeti.CotangentBundle.mpullback_vectorBundleTranslateDiffeomorph_liouvilleForm`,
   `TauCeti.CotangentBundle.mpullback_vectorBundleTranslateDiffeomorph_symplecticForm`,
   `TauCeti.CotangentBundle.mpullback_vectorBundleTranslateDiffeomorph_symplecticForm_eq_self_iff`).
   Fiber dilation by c≠0 multiplies λ and ω by c, so fiber negation changes both signs
   (`TauCeti.CotangentBundle.mpullback_vectorBundleScalarDiffeomorph_liouvilleForm`,
   `TauCeti.CotangentBundle.mpullback_vectorBundleScalarDiffeomorph_symplecticForm`). Prove
   that the translation and dilation formulas hold on arbitrary open restrictions, by
   transporting them along `TauCeti.CotangentBundle.restrictOpen`.

## C2. Embedded Lagrangians and basic examples

The tangent-image predicates of a map into a manifold with a nondegenerate two-form are Tau
Ceti's `TauCeti.SmoothTwoForm.IsNondegenerate.HasSymplecticTangentImages` (every tangent image
meets its symplectic orthogonal in zero, equivalently carries a nondegenerate restriction),
`TauCeti.SmoothTwoForm.IsNondegenerate.IsIsotropicMap`,
`TauCeti.SmoothTwoForm.IsNondegenerate.IsCoisotropicMap` and
`TauCeti.SmoothTwoForm.IsNondegenerate.IsLagrangianMap`, each stated through the existing linear
predicate. Define symplectic, isotropic and coisotropic embeddings as smooth embeddings
satisfying the corresponding predicate; the Lagrangian case is Tau Ceti's
`TauCeti.SmoothTwoForm.IsNondegenerate.IsLagrangianEmbedding`, a smooth immersion that is a
topological embedding with Lagrangian tangent images, which on smooth embeddings is the
tangent-image condition alone
(`TauCeti.SmoothTwoForm.IsNondegenerate.isLagrangianEmbedding_iff_of_isSmoothEmbedding`). Prove independence of parametrization, transport by symplectomorphisms, dimension
bounds/equalities, products and restriction to open sets. Nonzero real rescaling of a
symplectic form preserves the isotropic, coisotropic and Lagrangian predicates, Lagrangian
immersions and, with the primitive rescaled by the same constant, exact Lagrangian maps
(`TauCeti.SmoothTwoForm.IsNondegenerate.isIsotropicMap_smul_iff`,
`TauCeti.SmoothTwoForm.IsNondegenerate.isCoisotropicMap_smul_iff`,
`TauCeti.SmoothTwoForm.IsNondegenerate.isLagrangianMap_smul_iff`,
`TauCeti.SmoothTwoForm.IsNondegenerate.isLagrangianImmersion_smul_iff`,
`TauCeti.SmoothTwoForm.IsNondegenerate.isExactLagrangianMap_smul_iff`); consume these and prove
the same invariance for symplectic tangent images. A Lagrangian immersion is a separate notion,
Tau Ceti's `TauCeti.SmoothTwoForm.IsNondegenerate.IsLagrangianImmersion`: a smooth immersion
with isotropic tangent images from a manifold of half the dimension. Prove its
transport/product API without replacing self-intersections by an embedded submanifold.

For a finite-dimensional real symplectic vector space and any subspace W, reuse
`SymplecticForm.orthogonal`, `mem_orthogonal_iff'`, `finrank_orthogonal`,
`orthogonal_orthogonal`, `isIsotropic_iff`, `IsIsotropic.two_mul_finrank_le`,
`IsLagrangian.two_mul_finrank` and `IsIsotropic.isLagrangian_of_finrank` from
`TauCeti.Geometry.Symplectic.Lagrangian.Basic`. Export their tangent-image
specializations rather than duplicate those definitions or proofs. Derive the
additive identity `dim W + dim W^ω = dim V`. For the restriction and splitting
equivalences, consume Mathlib's
`LinearMap.BilinForm.restrict_nondegenerate_iff_isCompl_orthogonal` and
`isCompl_orthogonal_iff_disjoint`: restricted nondegeneracy,
`W ∩ W^ω = 0`, and the internal direct sum `V = W ⊕ W^ω` are equivalent.
These two comparisons need only a reflexive bilinear form in finite dimension;
use the existing alternating form's reflexivity. Prove Lagrangian iff
`Maximal ω.IsIsotropic W`, using extension by an isotropic line when an
isotropic W is properly contained in W^ω. Include the coisotropic dimension
bound. In finite dimension, ambient nondegeneracy gives the complementary
dimension identity and the isotropic bound `2 * finrank W ≤ finrank V`.
For `B : LinearMap.BilinForm ℝ V` on finite-dimensional V with `B.IsRefl`,
use `B.orthogonal W`: the general dimension formula gives
`finrank W + finrank (B.orthogonal W) ≥ finrank V`; hence inclusion
`B.orthogonal W ≤ W` gives `2 * finrank W ≥ finrank V`, without assuming B
nondegenerate. Specialize this to `ω.toBilinForm` for the bundled symplectic case. The maximal-isotropic
equivalence uses alternation without that extra hypothesis. Include
zero-dimensional cases.

### C2.0. Elementary matrix polar package

This package is independent of LieGroups Layers 7 and 9. Own the elementary
finite-dimensional matrix polar decomposition over ℝ and ℂ: for invertible A,
construct the unique positive-definite self-adjoint `P=(AA*)^(1/2)` and
orthogonal/unitary U with `A=PU`, using Mathlib's Hermitian spectral theorem
and continuous functional calculus. Prove that matrix logarithm is the global inverse
`PD_n→Sym_n` to the symmetric exponential `Sym_n→PD_n`, with the corresponding
positive Hermitian version over ℂ. Prove both `log(exp X)=X` on `Sym_n` and
`exp(log P)=P` on `PD_n`. The continuous functional calculus gives a continuous logarithm and the
latter inverse identity; prove smoothness by the inverse function theorem, using the positive
divided-difference formula for the invertible derivative of `exp` on symmetric
(respectively Hermitian) matrices. Prove
uniqueness, smooth dependence on A,
unitary left/right equivariance, and the contraction `A↦P^(1−t)U` to the
unitary factor, fixing that factor. For SL(n,ℂ), prove detP=detU=1 and that
every positive real power of P still has determinant 1. For SL(2,ℂ), prove
equivariance under the central ±I action before PSL(2,ℂ) descent in HF F2.6h. This is the complete C2.0 polar package consumed by HF. Export both smooth
ambient polar coordinate diffeomorphisms for real invertible matrices
(`A=PU=U(UᵀPU)`, with orthogonal `U` and positive symmetric factors) and complex
invertible matrices (`A=PU=U(U*PU)`, with unitary `U` and positive Hermitian
factors). Prove the inverse maps, smoothness, equivariance and determinant-one
restrictions already specified above. LieGroups Layers 7 and 9 consume these
ambient polar maps; each layer proves preservation for its own stated closed
subgroups. C2.1 proves the Sp-specific polar-factor preservation needed for its
Sp application. For the GL_n(ℝ) orthogonal-left example use `A=U(UᵀPU)` and
the symmetric logarithm of `UᵀPU`. The positive spectral functional calculus
and inverse-function argument above supply both inverse identities and
smoothness over real symmetric and complex Hermitian matrices.

### C2.1. Compact intersections and group applications

Use Mathlib's native matrix submonoids `Matrix.symplecticGroup (Fin n) ℝ`,
`Matrix.orthogonalGroup (Fin n ⊕ Fin n) ℝ`, and
`Matrix.unitaryGroup (Fin n) ℂ`, together with the units carriers
`GL_R := (Matrix (Fin n ⊕ Fin n) (Fin n ⊕ Fin n) ℝ)ˣ` and
`GL_C := (Matrix (Fin n) (Fin n) ℂ)ˣ`. Work on the real index
`Fin n ⊕ Fin n` with `Matrix.J (Fin n) ℝ`; when `Fin (2*n)` is needed,
use `finSumFinEquiv` to reach `Fin (n+n)` and then the equivalence
`finCongr (two_mul n).symm` to reach `Fin (2*n)`, proving the
`Matrix.reindex` identities. Identify `(x,y)` with
`x+iy`, so multiplication by i is `J=[[0,−I],[I,0]]`.

The realification of a complex matrix is Tau Ceti's `Matrix.realify`,
`realify(X+iY)=Matrix.fromBlocks X (−Y) Y X`: an injective ℝ-algebra homomorphism
(`Matrix.realifyAlgHom`, `Matrix.realify_injective`) that sends conjugate transpose to
transpose (`Matrix.realify_conjTranspose`) and whose values commute with J
(`Matrix.commute_J_realify`). Prove that its image is exactly the matrices commuting with J.
The induced map on units `GL_C → GL_R` is Tau Ceti's `Matrix.GeneralLinearGroup.realify`.
Prove it is a topological group isomorphism onto the commuting-J subgroup: its inverse extracts the two real
blocks, and `realify(A⁻¹)=realify(A)⁻¹`. Prove this image is closed in `GL_R`.
Do not use `Matrix.UnitaryGroup.embeddingGL` as a topological embedding; its
comparison through matrix-to-linear-map equivalence is algebraic only.

Use the native monoid homomorphism `Unitary.toUnits`, specialized to
`Matrix (Fin n) (Fin n) ℂ`, for the inclusion `U(n)→GL_C`.
Consume `SymplecticGroup.mem_iff`, `mem_iff'`, and `transpose_mem_iff` for
`AJAᵀ=J` and `AᵀJA=J`, and `Matrix.mem_orthogonalGroup_iff` and
`mem_orthogonalGroup_iff'` for orthogonality. For invertible real A, prove
`AJ=JA ↔ AJA⁻¹=J`; combine these comparisons to derive the pairwise
intersection identities below. In particular, commutation with J turns the
symplectic identity into `AAᵀ=1`, and orthogonality gives the converse.

In the single ambient group `GL_R`, define `Sp_R` and `O_R` by inverse-image
membership under `Units.val` in the native symplectic and orthogonal
submonoids, and define `C_R` as the realified image of `GL_C` (equivalently,
the units commuting with J). Prove each is a subgroup; prove the native
matrix-subspace topology agrees with the units-subgroup topology, using
continuity of `Units.val` and the inverse map, with the explicit matrix inverse
formulas on invertible matrices: consume
`SymplecticGroup.inv_eq_symplectic_inv` and `coe_inv'` for
`A⁻¹=−J AᵀJ` on `Sp_R`, and `Matrix.UnitaryGroup.inv_val` for
`A⁻¹=Aᵀ` on `O_R` and `U⁻¹=U*` on U(n). The realification inverse
above gives the corresponding topology comparison for `C_R`, with
`realify(A⁻¹)=realify(A)⁻¹`. Prove these are closed subgroups
of `GL_R` by their defining polynomial matrix identities, and identify all
three pairwise intersections `Sp_R∩C_R`, `Sp_R∩O_R`, and `C_R∩O_R` with the
same realified image of native `U(n)` by topological group isomorphisms.

For compactness of U(n), use `isClosed_unitary` and
`entry_norm_bound_of_unitary` to place the native carrier in the finite
product of closed unit discs; that product is compact, so the closed unitary
carrier is compact. Transport compactness to its units image by the proven
homeomorphism. Avoid relying on a global matrix norm instance.

First prove that the C2.0 polar factors of a symplectic matrix are themselves symplectic. For A=P U∈Sp_R, use the native membership/transpose identities and functional calculus to prove `JPJ⁻¹=P⁻¹`, hence `JP^sJ⁻¹=P^(−s)` for every real s. Thus every P^s is symplectic and U=P⁻¹A belongs to Sp_R∩O_R, the realified U(n). The positive-factor path contracts P to id.

Tau Ceti proves U(n), GL(n,ℂ) and Sp(2n,ℝ) path connected, including for n=0: `Matrix.UnitaryGroup.instPathConnectedSpace` for `Matrix.unitaryGroup (Fin n) ℂ`, `TauCeti.instPathConnectedSpaceMatrixGeneralLinearGroup` for the units of the complex matrix algebra, and `Matrix.isPathConnected_symplecticGroup` for the native symplectic carrier as a subset of the real matrix space. Consume them, and prove the realified group C_R connected as the image of GL(n,ℂ) under the continuous units map `Matrix.GeneralLinearGroup.realify`.

U(n) is maximal compact in GL(n,ℂ): Tau Ceti proves that the unitary subgroup of `GL (Fin n) ℂ`, the range of `Unitary.toUnits`, is compact (`Matrix.GeneralLinearGroup.isCompact_unitarySubgroup`) and that every compact subgroup containing it equals it (`Matrix.GeneralLinearGroup.eq_unitarySubgroup_of_isCompact_of_le`), so it is `Maximal` among the compact subgroups of `GL_C`. Consume both. Their proof is trace growth on the positive polar factor: if a compact K contains U(n) and A=P U∈K, then P=A U⁻¹∈K; if P≠1, then after replacing P by P⁻¹ it has an eigenvalue λ>1, and `Re(tr(P^k))=Σ_i λ_i^k≥λ^k` is unbounded on K, whereas the continuous trace is bounded on the compact K. LieGroups Layer7 retains the general compact-complexification theorem.

The realified U(n)=Sp_R∩O_R is maximal compact in Sp_R: Tau Ceti proves that a compact subgroup of `GL (Fin n ⊕ Fin n) ℝ` contained in `TauCeti.GLSymplectic (Fin n) ℝ` and containing its orthogonal elements equals their intersection (`TauCeti.GLSymplectic.eq_inf_unitarySubgroup_of_isCompact_of_le`; as maximality among the compact subgroups of Sp_R, `TauCeti.GLSymplectic.maximal_isCompact_unitarySubgroup`), and that this intersection is the realification of U(n) (`Matrix.GeneralLinearGroup.range_realify_comp_toUnits`). Consume them. Their proof is the same trace growth, applied to the positive polar factor of a symplectic matrix, which is symplectic by the preservation theorem above. Apply LieGroups Layer2's generic closed-subgroup structure theorem to the explicitly defined closed matrix subgroups and identify their embedded structures through the established topological group equivalences.

Construct the required separate Sp structural and adjoint-model comparison. For n≥1 prove its real Lie algebra semisimple, its group center `{±I}`, and that `θ(A)=A⁻ᵀ` is a smooth involutive automorphism preserving Sp_R. Compute `dθ(X)=−Xᵀ` and `B(X,Y)=(2n+2)tr(XY)`, so `−B(X,dθ(X))=(2n+2)tr(XXᵀ)>0` for X≠0. Use LieGroups Layer9's generic adjoint-model construction with this actual positive Cartan metric and finite center. Identify its compact adjoint subgroup with Ad(U(n)) and prove `Ad⁻¹(Ad(U(n)))=U(n)`, using the central kernel `{±I}⊂U(n)`. Give the matrix comparison: if A=P U and Ad(A) is orthogonal for the Cartan metric, Ad(P) is both positive self-adjoint and orthogonal, hence id; positivity and the central-kernel calculation force P=1. These structural, Killing and adjoint comparisons are required targets; they are not hypotheses of the two preceding trace-growth proofs.

Finally give the separate LieGroups Layer9 matrix-model specializations for H=C_R and H=Sp_R, both with π=id. Prove closedness and transpose stability in GL_(2n)(ℝ), use the connectedness just established, and identify `K_H=H∩O(2n)` with realified U(n). Apply the generic matrix-model theorem and compare its polar/maximality maps with the direct proofs. No semisimple or finite-center hypothesis is imposed on GL(n,ℂ). The construction order is C2.0, these concrete matrix/preservation/connectedness results and direct maximality proofs, followed by the separate generic matrix and Sp-adjoint comparisons. Generic LieGroups Layer9 owns its theorems and uses C2.0 for its own subgroup arguments; C2.1's primary results do not depend on that later comparison.

### C2.2. Exact Lagrangians and basic examples

An exact symplectic manifold carries a chosen smooth one-form λ with ω=−dλ; an embedded
Lagrangian i is exact when i*λ=df for a specified smooth f; this is Tau Ceti's
`TauCeti.SmoothTwoForm.IsNondegenerate.IsExactLagrangianMap`, a predicate on maps with Lagrangian
tangent images that carries the primitive f. Tau Ceti proves that two primitives differ by a
constant on a preconnected source
(`TauCeti.SmoothTwoForm.IsNondegenerate.IsExactLagrangianMap.exists_eq_add_const`) and the
transport by an exact symplectomorphism, with the primitive shifted by the pulled-back function
(`Diffeomorph.isExactLagrangianMap_comp_iff`). For the cotangent bundle of a finite-dimensional
manifold it proves that the zero section is exact Lagrangian with primitive 0
(`TauCeti.CotangentBundle.isExactLagrangianMap_zeroSection`), that the graph of a smooth
one-form α is Lagrangian iff dα=0 (`TauCeti.CotangentBundle.isLagrangianMap_section_iff`) and
that its pulled-back Liouville primitive exists iff α is exact
(`TauCeti.CotangentBundle.exists_isExactLagrangianMap_section_iff`). Consume these. For compact Q
with at least two points, prove that the graph of df meets the zero section
in at least two distinct points: use the minimum and maximum of f when f
is nonconstant, and all of Q when f is constant. Construct the conormal N*Q as a smooth
vector subbundle over an embedded Q, its inclusion as an embedded submanifold of T*M, dimension dim M,
and λ|N*Q=0; conclude exact Lagrangian from Tau Ceti's
`TauCeti.CotangentBundle.isExactLagrangianMap_of_conormal`, which proves it for every smooth
map into T*M with injective differentials, from a manifold of the dimension of M, whose
covectors annihilate the tangent images of the submanifold; the subbundle and its embedding are
the targets here. A smooth **diffeomorphism** φ:M→N has embedded Lagrangian graph in
(M×N,ω_M−ω_N) iff it is symplectic
(`TauCeti.SmoothTwoForm.IsNondegenerate.isLagrangianEmbedding_graph_iff`, for the form
`TauCeti.SmoothTwoForm.twistedProd`; the diagonal is
`TauCeti.SmoothTwoForm.IsNondegenerate.isLagrangianEmbedding_diagonal`); consume it. A Lagrangian relation whose two projections are diffeomorphisms yields this
canonical transformation; local diffeomorphic projections yield it only on open neighborhoods.

The Liouville field Z is fixed by **ι_Zω=−λ** (more generally ι_Zω=−θ when ω=−dθ), so its
cotangent flow is `(q,p)↦(q,e^t p)` and its Lie derivative satisfies L_Zω=ω. On T*M it is the
Euler field of the bundle, and Tau Ceti proves that it is a Liouville vector field of the
canonical form (`TauCeti.CotangentBundle.isLiouvilleVectorField_vectorBundleEulerField`, for
the predicate `TauCeti.IsLiouvilleVectorField`); consume it. Prove local-flow
rescaling and that θ-preserving symplectomorphisms commute with local Liouville flow. On the full
cotangent total space, including the zero section, every smooth λ-preserving diffeomorphism
T*M→T*N is the cotangent lift of a unique base diffeomorphism: this is Tau Ceti's
`Diffeomorph.existsUnique_cotangent_eq_of_mpullback_liouvilleForm`, with the converse in
`Diffeomorph.exists_cotangent_eq_iff_mpullback_liouvilleForm`; consume them. No such
classification is asserted just on the punctured bundle. Provide oriented surfaces with nowhere-zero area forms (automatic closedness in dimension two). For
cotangent tori, Tau Ceti proves that the graph of a coordinate angle form is Lagrangian and
admits no exact-Lagrangian primitive
(`TauCeti.CotangentBundle.isLagrangianMap_section_torusTimeForm`,
`TauCeti.CotangentBundle.not_exists_isExactLagrangianMap_section_torusTimeForm`); consume
these as the zero-section/closed-nonexact graph tests. Provide a Kodaira–Thurston compact symplectic non-Kähler example: construct its
Heisenberg-lattice quotient times a circle as a smooth manifold using
SmoothBundlesConnections B1’s free proper discrete quotient charts; identify the
universal cover and deck group using
[UniversalCovers](../../../Completed/UniversalCovers/README.md), and compute π₁
through its covering/fundamental-group correspondence, then
H₁=π₁^ab using SmoothBundlesConnections B6.1’s degree-one comparison, and identify b₁=3 using
DifferentialGeometry’s de Rham comparison. Construct its closed nondegenerate form and odd first
Betti number obstruction using the compact Kähler
Hodge parity theorem: consume the degree-one Kähler harmonic/type decomposition and conjugation symmetry of
[ComplexKahlerGeometry](../../ComplexKahlerGeometry/README.md), including its explicit Hodge
parity theorem. That parity theorem is not a consequence of de Rham theory alone.

For a Riemannian Q of positive dimension, the unit cosphere bundle is Tau Ceti's
`TauCeti.CotangentBundle.cosphereBundle`; consume
[ContactGeometry CG1](../ContactGeometry/README.md#cg1--contact-distributions-contact-line-and-cooriented-forms)'s contact-form predicate. Tau Ceti proves that the boundary form
`α_b=−λ_can|S*Q` is contact, where `ι_Zω_can=−λ_can` for the outward radial
Liouville field (`TauCeti.CotangentBundle.isContactForm_mpullback_neg_liouvilleForm_cosphereBundle`),
and that its negative `α_g=+λ_can|S*Q`, which defines the opposite coorientation, is contact
(`TauCeti.CotangentBundle.isContactForm_mpullback_liouvilleForm_cosphereBundle`). The Reeb field
of α_g is the Hamiltonian field of the kinetic energy and its flow is the forward unit
cogeodesic flow (`TauCeti.CotangentBundle.mfderiv_coe_reebVectorField_cosphereBundle`,
`TauCeti.CotangentBundle.coe_flowOf_reebVectorField_cosphereBundle`), and `R_(α_b)=−R_(α_g)`
(`TauCeti.CotangentBundle.mfderiv_coe_reebVectorField_neg_cosphereBundle`).
The positive radial identification `Diffeomorph.cosphereRadial` between the cosphere bundles of
two metrics pulls each of these forms
back to a positive multiple of the corresponding form, preserving its contact
hyperplanes and coorientation
(`Diffeomorph.kerDistribution_mpullback_cosphereRadial_liouvilleForm`,
`Diffeomorph.pos_mpullback_cosphereRadial_liouvilleForm_iff`,
`Diffeomorph.pos_mpullback_cosphereRadial_neg_liouvilleForm_iff`). Consume these. [ContactGeometry CG4](../ContactGeometry/README.md#cg4--symplectization-and-contactization)
and [CG5](../ContactGeometry/README.md#cg5--isotropic-and-legendrian-neighborhoods) consume this application.

## C3. Correspondences and generating functions

A correspondence L:M⇝N is a Lagrangian embedding into M×N¯, with form ω_M−ω_N
(`TauCeti.SmoothTwoForm.twistedProd`). Tau Ceti proves that the transpose and the product of
correspondences are correspondences
(`TauCeti.SmoothTwoForm.IsNondegenerate.IsLagrangianEmbedding.swap_comp`,
`TauCeti.SmoothTwoForm.IsNondegenerate.IsLagrangianEmbedding.prodProdProdComm_comp_prodMap`)
and that the diagonal is one
(`TauCeti.SmoothTwoForm.IsNondegenerate.isLagrangianEmbedding_diagonal`); consume these. Define
composition. Prove composition L₁₂×_(M₂) L₂₃→M₁×M¯₃ is Lagrangian under transverse fiber-product
and embedding hypotheses. For clean intersections specify the excess tangent kernel and reduction by
it; only assert embedded composition when the quotient is a smooth manifold and its projected map is
an embedding. Associativity is proved when all intermediate products/quotients satisfy these hypotheses.
There is no ordinary category of all Lagrangian correspondences with unrestricted composition.

For S:Q×Q'→R, graph dS in T*(Q×Q') is exact Lagrangian. After reversing the second fiber it is
`p=d_qS, P=−d_QS`. For equal base dimensions the nondegenerate mixed Hessian at a point supplies
local diffeomorphic projections by the implicit function theorem, hence a local symplectomorphism.
Pin source/target open sets, uniqueness of the chosen branch and the exact primitive
λ_source−φ*λ_target=d(S restricted to that branch).

On real normed spaces V and W, complete where the inverse function theorem is used, Tau Ceti
proves this local theory for a function S on V×W that is C² at a point x₀; consume it. All
names are in the namespace `TauCeti`.

- The two projections of the relation, `(q,Q)↦(q,∂_qS)` and `(q,Q)↦(Q,−∂_QS)`, are
  `TauCeti.cotangentGeneratingSource` and `TauCeti.cotangentGeneratingTarget`. The mixed
  Hessian `TauCeti.cotangentMixedHessian` is invertible exactly when the derivative of the
  source projection is (`TauCeti.isInvertible_fderiv_cotangentGeneratingSource_iff`).
- With invertible mixed Hessian at x₀, the local inverse of the source projection is
  `TauCeti.cotangentGeneratingBranch` and the generated map is `TauCeti.cotangentGeneratedMap`.
  Near the source point its derivative preserves ω
  (`TauCeti.eventually_strongDualCotangentSymplecticForm_fderiv_cotangentGeneratedMap`), it
  satisfies λ−φ*λ=d(S∘branch)
  (`TauCeti.eventually_cotangentLiouvilleForm_sub_cotangentGeneratedMap`), and in finite
  dimension its derivative is invertible
  (`TauCeti.eventually_isInvertible_fderiv_cotangentGeneratedMap`). These statements are about
  germs at the source point: the branch and the generated map carry no meaning away from it.
- The other three charts, with q,Q positions and p,P covectors: F₂(q,P)=S+⟨P,Q⟩ gives p=∂qF₂,
  Q=∂PF₂ (`TauCeti.cotangentPartialLegendre` on `TauCeti.cotangentLegendreChart`, with
  `TauCeti.eventually_fderiv_cotangentPartialLegendre`); F₃(p,Q)=S−⟨p,q⟩ gives q=−∂pF₃,
  P=−∂QF₃ (`TauCeti.cotangentThirdKindLegendre`,
  `TauCeti.eventually_fderiv_cotangentThirdKindLegendre`); F₄(p,P)=S−⟨p,q⟩+⟨P,Q⟩ gives
  q=−∂pF₄, Q=∂PF₄ (`TauCeti.cotangentFourthKind`,
  `TauCeti.eventually_fderiv_cotangentFourthKind`). Each chart has its own invertible-Hessian
  hypothesis (`TauCeti.cotangentLegendreHessian`, `TauCeti.cotangentSourceHessian`,
  `TauCeti.cotangentMomentumHessian`).
- Composition: S₁₃=S₁₂+S₂₃ evaluated at a solution of ∂_(q₂)(S₁₂+S₂₃)=0, with invertible
  q₂-Hessian giving the unique local elimination branch
  (`TauCeti.exists_cotangentGeneratingComposition`).
- Families S(q,a) with ∂_aS=0, in finite dimension: when the fiber derivative ∂_aS is transverse
  to zero along the critical set, that set is a manifold of the dimension of V and
  `(q,a)↦(q,∂_qS)` is a Lagrangian immersion of it
  (`TauCeti.isLagrangianImmersion_cotangentGeneratingSource_comp_coe`); embeddedness is an
  additional hypothesis.
- On a product of manifolds, the intrinsic mixed Hessian of S at (q,Q), the bilinear map
  d_Q(d_qS) on T_QQ′×T_qQ, is `TauCeti.mixedHessian`. It is computed in any pair of charts of
  the C² atlases by the linear mixed Hessian of the coordinate expression
  (`TauCeti.mixedHessian_apply_eq_of_mem_maximalAtlas`), its invertibility is chart independent
  (`TauCeti.isInvertible_mixedHessian_iff_of_mem_maximalAtlas`), and exchanging the factors
  transposes it (`TauCeti.mixedHessian_comp_swap_apply`).

The targets of this roadmap are the statements on manifolds: for S on an open subset of Q×Q′
with invertible `TauCeti.mixedHessian` at a point, construct open sets of T*Q and T*Q′ and a
symplectomorphism between them whose graph is the relation `p=d_qS, P=−d_QS` near that point,
with the uniqueness of the branch and the exact primitive above, by applying the normed-space
statements in cotangent charts and the chart independence of the mixed Hessian. Prove the
manifold forms of the composition and family statements in the same way, a family being a
function S(q,Q,a) on Q×Q′×A.

Acceptance: S(q,Q)=−‖q−Q‖²/(2t), t≠0, generates `(q,p)↦(q+tp,p)` on Euclidean cotangent space
(`TauCeti.cotangentGeneratedMap_freeParticleGeneratingFunction_eventuallyEq`, on a real Hilbert
space, with p identified with a vector by the Riesz isomorphism).
This is the time-t flow of H=‖p‖²/2. F₂(q,P)=⟨q,P⟩+t‖P‖²/2 generates it for every t,
including the identity at zero. For the oscillator use
S_t(q,Q)=(2qQ−(q²+Q²)cos t)/(2sin t), t∉πZ; its transformation is
(q,p)↦(q cos t+p sin t,−q sin t+p cos t)
(`TauCeti.cotangentGeneratedMap_oscillatorGeneratingFunction_eventuallyEq`). Its type-one
projection fails exactly at t∈πZ (`TauCeti.not_isInvertible_oscillatorPositionProjection_iff`)
although the flow remains smooth. Consume these three; the F₂ statement and the cotangent
relation of R→R/(2πZ), which illustrates local invertibility without a global inverse, are
checked here.

### C3.1. Discrete action, iterates and convex billiards

**Fixed points and finite iterates.** Let S be a smooth generating function
on an open W⊂Q×Q whose relation `p=d_1S(q,Q), P=−d_2S(q,Q)` is the graph
of a specified symplectomorphism φ between open cotangent domains. On
`{q : (q,q)∈W}`, put ψ(q)=S(q,q). Prove
`dψ_q=d_1S(q,q)+d_2S(q,q)` and the bijection between its critical points
and the fixed phase points of φ with base pair in W, sending q to
`(q,d_1S(q,q))` (Cannas da Silva, Prop. 5.1, p. 29).

**Chains of generating functions.** Let `S_0,…,S_(N−1)`, N≥1, be generating
functions as above on open domains `W_i⊂Q×Q`, generating symplectomorphisms
`φ_0,…,φ_(N−1)` between open cotangent domains. Define the cyclic action
`A(q_0,…,q_(N−1))=Σ_i S_i(q_i,q_(i+1 mod N))`
on the open configuration domain where every edge `(q_i,q_(i+1 mod N))` lies
in `W_i`. Its critical equations are the matching-covector equations
`−d_2S_(i−1)(q_(i−1),q_i)=d_1S_i(q_i,q_(i+1))` at each vertex, indices mod N:
the outgoing covector of edge i−1 equals the incoming covector of edge i.
Prove the bijection between critical configurations and the phase points
fixed by the composite `φ_(N−1)∘…∘φ_0` whose every intermediate state
`φ_(i−1)∘…∘φ_0(z)` lies in the domain of `φ_i`, sending a configuration to
`(q_0,d_1S_0(q_0,q_1))` and a fixed point to its base points along the chain.
Iterates are the case of equal summands `S_i=S`: the critical points of
`A_N(q_0,…,q_(N−1))=Σ_i S(q_i,q_(i+1 mod N))` correspond to the marked
phase points fixed by the Nth iterate of φ with all intermediate iterates
defined, and N=1 recovers ψ. The least period may divide N; a cyclic shift
of a configuration is the same periodic orbit with another marked point, and
these shifts are identified before counting unmarked periodic orbits. This
chain form, after its sign change and deck quotient, is the dictionary that
IntegrableSystems I5.2's cyclic configurations instantiate.

For fixed endpoints q_0,q_N, use the open-chain action
`F_N=Σ_(i=0)^(N−1) S_i(q_i,q_(i+1))`. At a stationary internal configuration
with invertible full Hessian in `(q_1,…,q_(N−1))`, apply the implicit
function theorem to construct a smooth local critical branch and evaluate
F_N there to obtain `S_(0…N)(q_0,q_N)`. Prove the endpoint derivative
formulas, the mixed-Hessian nondegeneracy and the identification of its
generating relation with the composite on the resulting cotangent domains.
Give N=2 and N=3 explicitly (Cannas da Silva, Prop. 5.2, p. 30, for the
second iterate under a global uniqueness hypothesis, and the exercise
following it for the third). A global generating function requires the
corresponding global uniqueness and graph-projection hypotheses; local
elimination alone supplies a local branch. The cyclic critical-point
correspondence does not require eliminating the internal variables or
assuming nondegeneracy of the periodic orbit.

**Convex planar billiards.** Let χ:ℝ→ℝ² be a smooth L-periodic arclength
parametrization, L>0, of the boundary of a bounded strictly convex table,
positively oriented and injective on `[0,L)`: every tangent support line
meets the boundary only at its point of tangency. Work on the open strip
`ℝ×(−1,1)` with the translation `τ(s,v)=(s+L,v)`, where v is the component
of the unit outgoing velocity along χ′(s); the collision states are the
τ-orbits, and the quotient `(ℝ/Lℤ)×(−1,1)` is used below only as the
topological space `AddCircle L × (−1,1)`, with Mathlib's instances, never
as a manifold. Construct the next-collision map β̃ on the strip by the
straight chord and specular reflection. Prove existence, uniqueness,
smoothness, the smooth inverse and τ-equivariance `β̃∘τ=τ∘β̃`, so that β̃
descends to a homeomorphism β of the quotient. Tangent collisions v=±1 are
excluded (Cannas da Silva, §5.2, pp. 30–32, with period 1).

On `{(s,t) : s<t<s+L}` put `S(s,t)=−‖χ(t)−χ(s)‖`. Derive `v=∂_sS` and
`w=−∂_tS` for the next state (t,w) (Cannas da Silva, §5.2, pp. 31–32). Prove
`∂_s∂_tS<0` from strict convexity and the non-tangency of each chord, so
`∂t/∂v<0` for the strip map. S is invariant under translating both
arguments by L; its smooth domain excludes the diagonal and its
translates. Set λ=v ds and ω=ds∧dv on the strip. If ℓ(s,v) is the chord
length of the next collision, prove `β̃*λ−λ=dℓ`, hence `β̃*ω=ω`. On the
quotient take the product of the Haar measure `volume` of `AddCircle L`,
of total mass L by `AddCircle.measure_univ`, with Lebesgue measure on
(−1,1): a finite Borel measure of full support and total mass 2L. Prove
that β is `MeasureTheory.MeasurePreserving` for it, by the change of
variables `β̃*ω=ω` on the fundamental domain `[0,L)×(−1,1)` and the
quotient-measure comparison. Under the period-one coordinate u=s/L, the
canonical covector is p=Lv, so λ=p du and ω=du∧dp. Carry this factor
through the area and generating formulas.

Use the cyclic action above, with every `S_i=S`, to identify critical
inscribed N-gons with marked N-periodic billiard states (Cannas da Silva,
§5.2, p. 32); the negative of the cyclic action is the perimeter. Require
consecutive vertices to be distinct, allow nonconsecutive repetitions and
periods dividing N, and prove the equal-angle law at every vertex. For each
N≥2, maximize the perimeter, a continuous function on the compact space
`(AddCircle L)^N`. Show that a maximizer has no consecutive coincident
vertices: move a repeated vertex off the chord between its neighbors and
use the strict triangle inequality to increase the perimeter. A maximizer
therefore lifts into the smooth configuration domain of the strip, where it
is critical for `A_N`, and gives a periodic billiard state whose least
period divides N. As an explicit test, for the circle of radius R and
L=2πR derive `β(s,v)=(s+2R arccos(v) mod L,v)`, together with its
rational-rotation periodicity criterion and the chord-length primitive
formula; for N=4 the perimeter maximizer is the doubled diameter, of least
period 2, not the inscribed square.

**Finite-volume recurrence.** Consume Mathlib's
`MeasureTheory.MeasurePreserving.conservative`,
`Conservative.ae_mem_imp_frequently_image_mem` and
`Conservative.ae_frequently_mem_of_mem_nhds` from
`Mathlib.Dynamics.Ergodic.Conservative`. For a measurable self-map of a
topological space with its Borel σ-algebra, preserving a specified finite
measure of full support, prove the neighborhood return formulation: every nonempty
open U contains a point returning to U after a positive number of iterates
(Cannas da Silva, Thm. 5.3, p. 32, stated there for area-preserving
diffeomorphisms of finite-area surfaces; the measure-theoretic statement
needs no symplectic structure). On a second-countable space with its Borel
σ-algebra, also retain the native almost-everywhere conclusion of
infinitely many returns to every neighborhood of the starting point. Apply
both statements to the billiard map β and the finite invariant measure
above. Symplectomorphisms of higher-dimensional phase spaces preserving a
finite smooth measure are instances of the same two statements; the
Liouville measure that supplies such an instance is not constructed here.

## C4. Relative symplectic germs

Build the relative Poincaré lemma from fiber scaling in a tubular neighborhood
and DifferentialGeometry Layer 5.4's homotopy operator. On a fiberwise
star-shaped tube, or an adapted coordinate box, let i:Q→M be the zero-section
inclusion and r the retraction. For a closed form η of positive degree, construct
β with `dβ=η−r*(i*η)` and with β zero as a full ambient tensor along Q (Cannas da Silva,
Prop. 6.8, p. 39, for `i*η=0`; the tube is Thm. 6.5, p. 37).
In particular, `i*η=0` gives `dβ=η`, even when η does not vanish as a full
ambient tensor along Q. Full ambient vanishing is a stronger hypothesis that
also gives the zero-first-jet primitive used below. Consume HeegaardFloer F2.1’s local smooth-parameter primitive selection
and time-dependent pullback differentiation identity. Build the relative, parameter-preserving
version by tubular fiber scaling and the homotopy operator, ensuring primitives vanish
along the fixed submanifold. Consume HeegaardFloer F2.1's domain-local Moser
lemma and prove its submanifold-fixing refinement from these relative primitives.

Prove relative Moser on the same ambient M: if two closed symplectic forms agree as bilinear forms on **all ambient tangent
fibers along a compact embedded Q**, there are neighborhoods and a diffeomorphism fixing Q pointwise
which pulls one form back to the other (`exists_diffeomorph_opens_of_eq_along`; Cannas da Silva, Thm. 7.4, p. 45). Here and below a
symplectomorphism of neighborhoods is a diffeomorphism between open subsets whose pullback of
one restricted form is the other. The relative Poincaré primitive vanishes on Q; the affine
interpolation is symplectic on a uniform neighborhood of Q, and the time-dependent flow stays there
after shrinking. State the symplectic-path hypothesis explicitly in every global comparison theorem; equality of
endpoint cohomology classes alone does not imply such a path.

Under the full ambient-form equality along compact Q, strengthen this relative theorem
to an ambient first-jet identity: the neighborhood diffeomorphism fixes Q and its
differential is the identity on `TM|Q`. Prove that tubular fiber scaling applied to
`η=ω₁−ω₀` gives a primitive β whose value and first jet vanish along Q: contraction
contributes one normal factor and the tensor η contributes another. Formulate this
as β having zero first jet, equivalently β and its covariant derivative vanishing
there for any auxiliary smooth connection. The affine path is symplectic on a common
shrunk neighborhood; `ι_(Y_t)ω_t=−β` then gives Y_t with zero first jet along Q.
Use the variational equation for its flow to obtain the ambient differential identity.
This strengthening requires full ambient tensor equality, not merely equality of
the pulled-back forms on TQ.

For an arbitrary embedded submanifold Q and p∈Q, prove the point-germ relative
Darboux theorem: two symplectic forms on an ambient manifold of the same
dimension with equal pullbacks to Q have symplectomorphic germs at p by a map
fixing Q as a germ (`exists_diffeomorph_opens_of_mpullback_eq`, in which Q need not be
compact and the map fixes the points of Q near p; for Q a point this is Darboux, Cannas da
Silva, Thm. 8.1, p. 46, proved from Thm. 7.4). The restricted two-form may have varying rank. First extend
the identity of T_pQ to an ambient symplectic linear isomorphism by Tau Ceti's symplectic Witt
extension `TauCeti.SymplecticForm.exists_isSymplectomorphism_extend_linearEquiv`: for
finite-dimensional symplectic vector spaces of equal dimension, a linear isomorphism between
arbitrary subspaces, including degenerate ones, which carries one restricted form to the other
extends to a linear symplectomorphism agreeing with it on the subspace. The case of two forms on
one space, a subspace S and the identity of S is the extension of the identity of T_pQ used
here. Both hypotheses are needed: without equal dimension no linear isomorphism exists, and the
dilation by 2 of a symplectic plane preserves no nonzero bilinear form. Realize this extension
by a local diffeomorphism fixing Q in
adapted submanifold coordinates. The adjusted forms agree on the full ambient
tangent space at p. Their affine path is symplectic on a common neighborhood of
p for all t∈[0,1]. Apply the relative radial homotopy to their difference:
the resulting one-form vanishes as a full covector along Q. Its Moser field
vanishes on Q, and the stationary trajectory at p gives a full-parameter flow
on a smaller neighborhood. This local theorem uses no global normal-bundle
identification along all of Q. The compact-submanifold global germ theorems
below retain their specified normal-bundle data.

**Neighborhood germs with prescribed ambient derivative.** Let
`i:Q→(M,ω_M)` and `j:Q′→(N,ω_N)` be smooth embeddings of compact
submanifolds, and let f:Q→Q′ be a diffeomorphism. Given a smooth symplectic
vector-bundle isomorphism `A:i*TM→j*TN` over f satisfying
`A_q ∘ di_q = dj_(f(q)) ∘ df_q`, construct open neighborhoods U of i(Q)
and V of j(Q′) and a symplectomorphism Φ:U→V with
`Φ ∘ i = j ∘ f` and `dΦ_(i(q)) = A_q` (Cannas da Silva, Thm. 8.4, p. 48, and Weinstein 1971
give the Lagrangian case without the derivative prescription; the general statement is
proved here by the construction below). Conversely, differentiation of
any such symplectomorphism gives these bundle data. No constant-rank
hypothesis on the pulled-back two-form is required when A is supplied.

Construct the extension of the prescribed derivative before applying Moser.
Choose tubular splittings `TM|Q = TQ ⊕ ν_M` and `TN|Q′ = TQ′ ⊕ ν_N`.
Write `A_q(v,n) = (df_q(v)+B_q(n), C_q(n))`; C is a normal-bundle
isomorphism over f. On the source normal bundle, set
`q′ = exp_(f(q))(B_q(n))` using an auxiliary metric on Q′, and transport
`C_q(n)` in ν_N along `t↦exp_(f(q))(t B_q(n))`. Compose this map into ν_N
with the target tubular map. Prove that its derivative along the zero
section is A. The inverse function theorem, embeddedness and compactness
then give a diffeomorphism of neighborhoods extending f. Its pulled-back
form agrees with ω_M on all ambient tangent fibers along Q. Apply the
full-ambient relative Moser theorem above; its zero-first-jet refinement
preserves the derivative A.

Define neighborhood germs by agreement after shrinking around the whole
submanifold. Prove restriction, identity, inverse and composition laws, with
prescribed derivatives composing as bundle maps. Two extensions obtained
from the same (f,A), including those using different tubular maps, metrics
or connections, differ by a symplectic germ fixing Q pointwise with full
ambient derivative the identity. The point-germ theorem needs only an
extension at one point; this compact-submanifold theorem requires the
specified smooth bundle isomorphism along all of Q. Recover the
symplectic and Lagrangian neighborhood theorems below by constructing their
compatible ambient bundle isomorphisms from the stated normal data.

For a compact symplectic submanifold, construct its symplectic normal bundle TQ^ω and prove the
symplectic neighborhood theorem: a symplectic normal-bundle isomorphism over a symplectomorphism of
submanifolds extends to a symplectomorphism of neighborhood germs. Construct a smooth compatible J/complement along the submanifold and a symplectic connection
from SmoothBundlesConnections B2–B4 by preserving the fiber form. Build its model closed form,
nondegenerate on a neighborhood of the zero section, and show the germ is independent of connection. For a compact Lagrangian Q,
identify the normal quotient with T*Q by `[n]↦ω(·,n)|TQ` (Cannas da Silva, Thm. 9.1, p. 51) and prove Weinstein's neighborhood theorem with zero-section
restriction fixed (`exists_diffeomorph_opens_cotangent_of_isLagrangianEmbedding`: a neighborhood
of Q is symplectomorphic to a neighborhood of the zero section of T*Q with the canonical form,
each point of Q going to its zero covector; Cannas da Silva, Thm. 9.3, p. 51; Weinstein 1971). Distinguish pullback agreement on TQ from agreement on the ambient tangent bundle;
the linear extension/tubular realization is the step connecting them.

For an abstract compact presymplectic Q with closed constant-rank σ, build its kernel smooth
distribution, prove involutivity with the closed-form formula and construct its characteristic
foliation using DifferentialGeometry Layer 4. Construct the coisotropic embedding model near the
zero section of (ker σ)* and prove nondegeneracy there. Prove uniqueness: two coisotropic embeddings
inducing the same σ have symplectomorphic neighborhood germs relative to Q
(`exists_diffeomorph_opens_of_isCoisotropicMap`, for smooth embeddings i:Q→M and j:Q→N with
coisotropic tangent images and i*ω_M=j*ω_N; Cannas da Silva,
Thm. 8.6, p. 49, for two forms on one ambient manifold). For already embedded
coisotropics the kernel rank equals codimension automatically. This is
consumed by regular reduction/DH, with compactness only for uniform neighborhoods, not for fiberwise
linear statements. Develop the kernel/leaf/quotient tangent API used by R3 and T4.

## Acceptance and dependencies

C1 precedes C2/C3; C4 consumes C2.2, tubular realization and relative forms.
C3.1 consumes C3's generating relations, Mathlib's `AddCircle` measure and compactness
instances and Mathlib's finite-measure recurrence; it consumes nothing from the later
roadmaps of this family. Verify conormal examples for
points, all of M and coordinate submanifolds; graphs of closed nonexact torus one-forms; product/transpose
signs; free-particle generating function; compact Lagrangian zero-section neighborhood and symplectic
normal germ. Reuse chart formulas for every intrinsic construction. Floer theory, quantum invariants
and contact topology remain with their existing owners; C1/C2.2 supply cotangent forms, exact Lagrangians and graph/zero-section examples to HeegaardFloer F3.
The cosphere acceptance test uses C2.2's two explicitly signed forms and
[CG1](../ContactGeometry/README.md#cg1--contact-distributions-contact-line-and-cooriented-forms)'s
single contact predicate; its metric-radial comparison belongs to C2.2.

## Downstream consumers

[HamiltonianReduction R1](../HamiltonianReduction/README.md#r1-smooth-actions-moment-maps-and-equivariance)
consumes C1's cotangent form and lift for its cotangent momentum theorem. Its
form argument is `canonicalForm`, written σ below: Tau Ceti's
`TauCeti.CotangentBundle.symplecticForm I M` on `Cotangent I M`, that is
`TauCeti.CotangentBundle I M`, with model `cotangentModel I`. It is symplectic
(`TauCeti.CotangentBundle.isSymplectic_symplecticForm`), and its chart identity is
`TauCeti.CotangentBundle.inChartAt_symplecticForm_apply`: for every cotangent
chart centre z₀, every w in that chart's target and every pair of model tangent
vectors u,v, its coordinate value is `TauCeti.strongDualCotangentSymplecticForm u v`.
The chart-target condition excludes the total chart inverse's values outside
its domain. At each chart centre, `TauCeti.RoughForm.inChartAt_extChartAt_self`
identifies this value with the intrinsic form, so the chart identity determines
σ uniquely. Neither fact needs a finite-dimensional base.

For a jointly smooth left action, R1 uses σ to assert
`ι_(ξ_(T*M))σ=dH_ξ`, where `H_ξ(q,p)=p(ξ_M(q))` and ξ_(T*M) is the
fundamental field of the inverse-derivative cotangent lift (Cannas da Silva,
§18.1, exercise on p. 106). This supplies the form to R1; the group-action
momentum theorem remains R1's target.

**Checks.**

- For translation on T*ℝ, the lifted field is ∂q and H=p. Evaluation on
  ∂p gives `σ(∂q,∂p)=1=dH(∂p)`; the opposite sign gives −1.
- The symplectic form `2 dq∧dp` gives value 2 on the same pair, while
  `dH(∂p)=1`. It fails the chart identity: symplecticity alone does not
  characterize the form required by this consumer.
- For the trivial action, both the fundamental field and H are zero, so
  the Hamiltonian equation reads 0=0. On a zero-dimensional base the
  cotangent model is zero and the uniquely prescribed form is zero, which
  is nondegenerate on that zero space.

## References

Cannas da Silva, [*Lectures on Symplectic Geometry*](https://people.math.ethz.ch/~acannas/Papers/lsg.pdf),
§§2–8 (cotangent forms, Lagrangians, Darboux–Moser–Weinstein), §11 (contact example); in
particular Prop. 5.1, Prop. 5.2 and §5.2 (generating functions of iterates, billiards), Thm. 5.3
(recurrence), Prop. 6.8 (relative Poincaré lemma), Thm. 7.4 (relative Moser), Thms. 8.1, 8.4, 8.6
and 9.3 (Darboux, Lagrangian and coisotropic neighborhoods). Page numbers are those of the
author's 2006 version.
The cotangent-lift Hamiltonian identity is the exercise in §18.1, p. 106.
Weinstein, *Symplectic manifolds and their Lagrangian submanifolds*, Adv. Math. 6 (1971), 329–346
(Lagrangian neighborhood theorem; cited by locator).
