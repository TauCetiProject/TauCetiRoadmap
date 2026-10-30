# Roadmap: unitary Bessel models and the Gan–Gross–Prasad period formula

**Summary.** Build the relative restriction library for unitary groups from Hermitian geometry, local representation categories, actual enhanced Langlands correspondences and automorphic analysis. The endpoints are multiplicity one for every relevant odd codimension, the tempered nonsplit local theorem with its epsilon-factor enhancement, adjacent global period nonvanishing including endoscopy, and the completed Tamagawa-normalized identity `GGP.8`. The fixed-pair global assertion in arbitrary odd codimension is a named proposition proved in the literature under the discrete Hermitian base-change hypotheses compared in §4.4; its formal proof belongs to GanGrossPrasadUnitaryGroups, Part II. The split archimedean higher-codimension prediction retains its conjectural status. Every analytic theorem includes all permitted bad and infinite places.

## Scope and ownership

The general smooth category, induction, Jacquet filtrations, Satake theory, globalizations, adelic measures, ordinary endoscopy, classification of Langlands packets and L-functions have the supplier sections specified below. This roadmap owns their relative Bessel specializations and comparison proofs. NoncommutativeGeometry N1 owns completed projective tensors, their complete-target universal property and the dense algebraic tensor image. AutomorphicFormsOnReductiveGroups §2.6, using §2.7, owns archimedean tempered GL genericity; §2.7 owns SAF nuclearity and `seminormEstimate` for ordinary moderate growth. AutomorphicLFunctionsAndLocalFactors §AL.3 and its Representation prerequisites, Archimedean Whittaker comparisons, own the Whittaker realization and its smooth-globalization comparison.

GeometryOfNumbersAndQuadraticArithmetic §2.9 owns `SignedHermitianSpace` and the field adjoint API over every commutative field with involution and every finite-dimensional module. Use its sign +1 carrier for nonsplit coefficient fields, with the slot comparison of §1.1. The odd-residue local-field hypotheses of its classification and transfer-image results do not restrict this carrier or adjoint. MetaplecticAutomorphicForms §3.2a owns the split finite-projective Hermitian carrier, its A⊕A∨ description and its GL(A) isometry-group identification. Use its sign +1 carrier with the split-form comparison of §1.1. ReductiveGroupsPartII retains the complement/Witt geometry, arbitrary-form algebraic-group representability and additional scalar-extension/inner-form comparisons specified below. This roadmap owns the comparisons with both form suppliers after them; these comparisons impose no dependency of ReductiveGroupsPartII on either form supplier.

This roadmap owns relevant Hermitian pairs, their relative Bessel subgroups and characters, model spaces and transport, relative distribution symmetry and multiplicity, relative tempered forms and geometric multiplicities, the Bessel calculation over Langlands packets, global Bessel periods, relative normalizers and the adjacent period theorems. It includes rank-zero smaller spaces and split local algebras; the final global adjacent theorems have n ≥ 1. It makes no quasi-split, CM, totally-real, unramified, odd-residue-characteristic or auxiliary-supercuspidal restriction on the library. The split archimedean higher-codimension assertion is the proposition of §3.10; the theorem of §3.11 covers finite places and adjacent archimedean pairs.

Mathlib supplies `LinearMap.Nondegenerate`, `Submodule.orthogonalBilin`, algebraic representations, tensor representations and `Representation.IntertwiningMap`. Tau Ceti supplies `TauCeti.HopfAlgebra.pointsFunctor`. The relative definitions below use these carriers rather than parallel generic form, representation, intertwiner or points-functor structures. Mathlib’s `Matrix.unitaryGroup` is the identity-Gram-matrix group, not arbitrary U(h). Its definition is used as a compatibility witness for the requested Hermitian supplier, not as a substitute for it.

ReductiveGroups Layers 0, 3, 5 and 7 own the general algebraic-group dictionaries, subgroup representability, unipotent radicals and parabolics. GlobalNumberFields Layers 4–6 and 8 own the arithmetic adelic carriers. Completed RestrictedProducts Layers 0–3 own the generic restricted-product maps and rational diagonals. RepresentationTheory/ClassicalGroups Layer 6 states finite-dimensional GL branching; it does not supply a local admissible category or the arbitrary-form unitary correspondence. OrthogonalSpinGroups owns orthogonal groups and spinor arithmetic; none of its orthogonal endpoints is a prerequisite here. RepresentationTheory/LieGroups owns general real Lie-group constructions. None of these directions is planned again.

EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.4 owns the shared carriers for local parameters, inner twists, Langlands packets and pairings, including the extended local unitary packets of §11.3, and the interface for generic global Langlands packets. ModularityAndLanglandsExtensions §§3.12 and 3.16 supplies the Mok and KMSW classification results with its stated hypotheses; their comparison with the shared carrier is made here after both suppliers, without a dependency of EndoscopicTransferAndUnitaryTraceComparison on ModularityAndLanglandsExtensions. The additional unconditional and all-number-field classification obligations use this same interface. The general Hermitian/unitary realization, smooth and Casselman–Wallach categories, ordinary endoscopy, L-functions, general spectral analysis, Weil/theta theory and Tamagawa measures retain the named owners in the contracts below. Their exact comparison supplements are explicit mathematical obligations; none is an axiom or a hypothesis containing a relative endpoint. General Schwartz multipliers belong to the AutomorphicSpectralTheory continuation; general Jacquet–Rallis geometric comparison and all-place transfer belong to an EndoscopicTransferAndUnitaryTraceComparison continuation. This roadmap owns the relative spectral contribution after those inputs, not their general theories.

GanGrossPrasadUnitaryGroups, Part II begins after the unitary Bessel interfaces here: it owns the arbitrary-odd-codimension global proof and its additional Eisenstein-to-Bessel comparison, as well as orthogonal, symplectic/metaplectic and Fourier–Jacobi GGP endpoints. The integrated equal-rank oscillator form of §3.8 is an auxiliary for the real Bessel proof, without a Fourier–Jacobi multiplicity classification. Arithmetic cycles, heights, derivative identities, Selmer ranks and local level optimization remain with their arithmetic owners. Microlocal asymptotics remain with QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups. The period-witness premise in SelmerIwasawaCohomologyPartII §8.1 is not an input here and its rank theorem is not a consequence asserted by this roadmap.

## Conventions

Algebraically F is a field of characteristic different from 2 and E is a quadratic étale F-algebra with involution c. Modules are finite projective of constant E-rank, hence free in this field/étale setting. Forms satisfy h(ax,by)=a c(b)h(x,y) and h(y,x)=c(h(x,y)); nondegeneracy is explicit. The hyperbolic plane has Gram matrix [[0,1],[1,0]], so its basis satisfies h(e,e)=h(f,f)=0 and h(e,f)=h(f,e)=1. The line <a> has h(e,e)=a∈F×. A relevant complement is H^r orthogonal-sum <a>, of rank 2r+1. Over ℂ/ℝ the complements of signatures (r+1,r) and (r,r+1) are both present. Split E means F×F with coordinate swap; hermitian rank n becomes GL_n(F), not GL_(2n)(F).

Local analytic fields have characteristic zero: finite extensions of ℚₚ, ℝ or ℂ. All primes, including 2 and 3, are included. At finite places use smooth admissible complex representations; at infinity use Casselman–Wallach representations and continuous functionals on completed projective tensors. The smooth dual on the smaller factor is essential when comparing a bilinear Bessel model with an older restriction-Hom convention. A character ψ of split E must be nontrivial on each field factor. Distinguish this Bessel additive character from the epsilon-factor character ψ_E, which is nontrivial on E and trivial on F. The epsilon character uses the actual Whittaker normalization of GGP §17, transported with the complement reference and, over ℝ, Xue §2.1; freezing a label while changing the reference is not permitted.

Use right translations, H=N⋊U(W) mapped by (u,g)↦(u i(g),g), and m=dim Hom_H(π_V tensor π_W,ν). Thus P(f)=∫_[H]f(h)ν(h)⁻¹dh transforms by ν. The linear-first pairing B(x,y) corresponds to Mathlib’s conjugate-first inner product with slots exchanged. In particular B(i,1)=i, whereas Mathlib’s inner product of i with 1 is -i. Matrix coefficients, duals and polarization all use this convention. For upper B in GL₂, δ_B(diag(a,1))=|a|; normalized induction inserts |a|^(1/2), while §2.4 uses the explicitly unnormalized induction.

Parameters of degree m have conjugate-dual sign (-1)^(m-1). Component generators count distinct appropriate-sign irreducibles; the central element counts their multiplicities modulo two. The global Hermitian constituent has an Asai pole with sign (-1)^(m+1); the adjoint uses the opposite sign (-1)^m. In degree 1 the former sign is + and the latter is -. All global L-functions include infinite factors. Local class field theory sends geometric Frobenius to a uniformizer, with |Frob|=q⁻¹ (ggp §3, p. 8, ggp line 272–276). An arithmetic-Frobenius supplier is compared by inversion. For two unramified one-dimensional eigenvalues a,b the direct-sum L-factor is ((1-aq⁻ˢ)(1-bq⁻ˢ))⁻¹; replacing geometric Frobenius by its inverse changes the eigenvalues to a⁻¹,b⁻¹. Global H and G quotient measures are Tamagawa measures including global convergence factors, with local H measures factoring the fixed global measure. Local pairings can be scaled independently. Product-one local Haar rescalings preserve the identity; arbitrary changes of the global H measure do not.

Groups and vector spaces may occupy independent universes; tensor and intertwiner carriers use the maxima required by the native APIs. The functor-of-points test-algebra universe is recorded by the native Tau Ceti lift. No finite-dimensionality or completeness instance is inferred from a mere algebraic representation. Natural-number multiplicities are used only after finite-dimensionality. Quotients by vector norms require nonzero vectors; C_v is inverted only after local regularity and nonvanishing; the global central value is never inverted.

**Checks.**

- The two hyperbolic basis vectors have zero norm and mutual pairing 1; the diagonal form diag(1,1) over ℂ/ℝ fails this test.
- Over split E a rank-one unitary group is F×. Replacing the constant rank by F-dimension would give the wrong GL₂.
- U(2) standard weights 1,0 pair bilinearly with U(1) weights -1,0. Weight 1 is a negative control for the dual convention.
- If ν(h)=i, P(R(h)f)=iP(f). Weighting the integral by ν gives -i instead.
- In degrees 2 and 1, changing ψ_E by a nonnorm changes the one-dimensional even-side generator sign by -1 and leaves the odd-side label unchanged; two such changes cancel.
- For W=ℂ, x=-1, the moving-space norm determinant is 4; its reciprocal is the wrong geometric discriminant ratio.
- Constituent counts (1,1) and (2,1) give coefficients 1/4 and 1/8. A fixed 1/4 loses endoscopic cases.
- Scaling f by c≠0 multiplies both |P(f)|² and its Petersson norm by |c|²; scaling one local pairing by 2 cancels in q_v. Haar factors 2 and 1/2 at two places cancel; a global H Haar factor 2 multiplies |P|² by 4.

## Exact supplier contracts

The library pins are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. A contract labeled gap: is required mathematics, not a declaration available for use. It must be discharged before a dependent target is implemented as a theorem; the target’s final hypotheses do not acquire an arbitrary package of its desired conclusions.

### From Mathlib

- `LinearMap.Nondegenerate`, in `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean`, means both left and right separation of the sesquilinear map. `Submodule.orthogonalBilin` and `Submodule.mem_orthogonalBilin`, in `Mathlib/LinearAlgebra/SesquilinearForm/Orthogonal.lean`, give the orthogonal submodule by vanishing against every member of the first submodule. The complement definition must respect this chirality. `LinearMap.flip_nondegenerate`, in `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean`, preserves two-sided separation under slot exchange for §1.1.
- `Representation.IntertwiningMap`, `Representation.IntertwiningMap.ext` and `Representation.IntertwiningMap.isIntertwining`, in `Mathlib/RepresentationTheory/Intertwining.lean`, give the algebraic equivariant-map carrier and evaluation. They supply no continuity or admissibility.
- `Representation.tprod` and `Representation.tprod_apply`, in `Mathlib/RepresentationTheory/Basic.lean`, give the diagonal tensor action over a commutative semiring; use their complex specialization for finite-place algebraic tensors. `Representation.dual` uses the inverse action on the algebraic dual; it is not by itself a smooth contragredient.
- `Matrix.unitaryGroup`, in `Mathlib/LinearAlgebra/UnitaryGroup.lean`, is the unitary submonoid of matrices over a commutative star ring. The requested arbitrary-form group must agree with it on the identity Gram matrix, including size zero.
- `Prod.isUnit_iff` in `Mathlib/Algebra/Group/Prod.lean` and `isUnit_iff_ne_zero` in `Mathlib/Algebra/GroupWithZero/Units/Basic.lean` identify generators of the split line. `Nat.card_fun` and `Nat.card_sum` in `Mathlib/SetTheory/Cardinal/Finite.lean`, with the finite-cardinality instances for ZMod, supply the general cardinal arithmetic used by the constituent-sign specialization. No general counting theorem is a target here.
- `pi_eq_sum_univ'` in `Mathlib/Algebra/BigOperators/Pi.lean`, together with `map_sum` in `Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean`, supplies the finite coordinate expansion used in §3.1; applying a character gives the central-element calculation in §3.1. The complex inner product and its scalar identities in `Mathlib/Analysis/InnerProductSpace/Basic.lean` supply the swapped-slot pairing convention. `LinearMap.mul'` in `Mathlib/Algebra/Algebra/Bilinear.lean` and `TensorProduct.map_tmul` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean` supply the scalar-model examples. `Circle` and `Circle.coeHom` in `Mathlib/Analysis/Complex/Circle.lean` supply the weight-one character; its composite with `invMonoidHom` gives weight minus one. `LinearEquiv.finrank_eq` in `Mathlib/LinearAlgebra/Dimension/Finrank.lean` transfers the scalar-model dimension along the evaluation equivalences. These inputs do not impose the analytic smooth-vector topology.

### From Tau Ceti

`TauCeti.HopfAlgebra.pointsFunctor`, in `TauCeti/Algebra/AlgebraicGroup/PointsFunctor.lean`, sends a commutative R-algebra A to the convolution group on H→ₐ[R]A for a Hopf R-algebra H, and algebra maps act by postcomposition. Its coefficient and Hopf hypotheses are retained; it is not the group-like-elements functor. Apply it to the coordinate Hopf algebra of the relative subgroup constructed through ReductiveGroups.

### From TauCetiRoadmap.ReductiveGroups

Layers 0, 3, 5 and 7 supply the affine Hopf/scheme/point dictionaries, closed subgroup constructions, unipotent radicals and flag parabolics. Use those sections to prove representability of the concrete flag stabilizer and relative embedding in §1.2. Their generic reductive structure does not choose a Hermitian form.

### From TauCetiRoadmap.GlobalNumberFields

Layers 4–6 and 8 supply finite/full adeles, rational embeddings, completion maps and extension/base-change maps. Use these in §4.1 and localizing its rational Bessel character. Quotient measures on group points are the separate AdelicAlgebraicGroups contract.

### From [RestrictedProducts](../../Completed/RestrictedProducts/README.md) (completed)

Its completed Layers 0–3 supply compact-open reference families, coordinate maps, reference change, finite-place decomposition and eventually integral rational diagonals, each realized by the Tau Ceti declaration its README names. Use these to assemble the adelic relative group and identify its local factors. They do not assert a Tamagawa product.

### From TauCetiRoadmap.ReductiveGroupsPartII

What ReductiveGroupsPartII must provide (gap:hermitian-unitary): For nondegenerate forms on finite projective constant-rank modules over quadratic étale F-algebras, supply complement decompositions, Witt extension/cancellation, hyperbolic bases, arbitrary-form representable reductive U(h), and the additional scalar-extension and local-inner-form comparisons; carrier constructions and field adjoints are excluded from this request. At fields of characteristic ≠2 include split étale coefficients, zero rank, both real signatures, and nonsplit local forms. The comparisons with GeometryOfNumbersAndQuadraticArithmetic §2.9 and MetaplecticAutomorphicForms §3.2a are owned here by the field-form comparison and the split-form comparison, respectively, after all three suppliers; these comparisons impose no dependency of ReductiveGroupsPartII on either form supplier. `Matrix.unitaryGroup` represents only the identity Gram matrix; ClassicalGroups Layer 0 does not supply this generality. This complement and representability contract is a mathematical obligation of that continuation. The section contract is a Hermitian-form continuation section of ReductiveGroupsPartII, whose Hermitian forms and unitary groups appear on main only as the rank-one `SU_3` examples of RG2.1 and RG2.2.4 and the quaternionic forms of RG2.3.5: arbitrary-form Hermitian continuation. Needed by §1.1, §1.3, §3.4.

### From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

Consume §2.9 `SignedHermitianSpace E V 1`, `signedHermitianAdjoint`, `signedHermitianAdjoint_unique`, `signedHermitianAdjoint_id`, `signedHermitianAdjoint_comp` and `signedHermitianAdjoint_involutive` for finite-dimensional V over a commutative field E with its specified involution. The form is conjugate-linear first and linear second, and its adjoint satisfies k(Tx,y)=k(x,T*y). Neither odd residue characteristic nor a local-field hypothesis is imposed on these declarations. For nonsplit E/F, use h(x,y)=k(y,x) through the field-form comparison of §1.1 in §§1.1, 1.3 and 3.4. Split E=F×F uses MetaplecticAutomorphicForms §3.2a through the split-form comparison; it is not a field specialization of this carrier. The local classification and transfer-image results of §2.9 are not inputs here.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

Consume SR.0.1–SR.0.4 for the smooth category, admissibility, coefficient change and the smooth dual; SR.2.1–SR.2.3 for induction, Jacquet functors, the geometric lemma, the principal-series Jacquet filtration and twisted coinvariants; SR.3.1–SR.3.3 for cuspidal support, Bernstein blocks and tempered support; SR.4.1–SR.4.2 for Satake; and SR.5 for derivatives and the canonical mirabolic map. These constructions are inputs. The contracts below specify the combined restriction, all-place and normalization comparisons used here; they do not request a second construction of those generic objects.

What SmoothRepresentationsOfLocalGroups must provide (gap:local-categories): On the smooth category, contragredients, induction and Jacquet functors of SR.0–SR.2, supply the natural tensor–Hom comparison after restriction along continuous group homomorphisms to closed relative subgroups, with character twists and the identity Ind_unnorm(ρ)=Ind_norm(δ_P^(-1/2)ρ), including split groups, rank zero and dyadic fields. Retain p=2, split products and rank zero; require Hom_H(π⊗ρ,ν)≃Hom_H(π,ρ^∨⊗ν) on the appropriate restricted smooth-dual carrier and Ind_unnorm(ρ)=Ind_norm(δ_P^(-1/2)ρ) for every parabolic P, with functorial intertwiners. This category contract supplies neither Bernstein exclusions nor mirabolic calculations (ggp §§14–15, pp. 58–63). The section contract is SR.0.4 and SR.2.1–SR.2.3: restriction and tensor–Hom comparison supplement. Needed by §2.1, §2.3, §2.4, §3.3, §3.10, §3.11, §5.1a, §5.2.

What SmoothRepresentationsOfLocalGroups must provide (gap:local-bernstein): For each finite extension F/ℚₚ, k=r+1≥2 and fixed irreducible π_V,π_W of the relevant unitary groups, choose generic supercuspidal GL_k(E) inertial classes absent from the finite supercuspidal support of π_V^∨, then unramified twists in those classes for which unnormalized Ind_P^(U(V⊕(-L)))(τ⊠π_W) is irreducible, so every excluded block [GL_k(E)×U(V′),τ⊠μ] is absent for every μ, including split E and every residue characteristic. For k=r+1≥2, fixed irreducible π_W and π_V, first choose a generic supercuspidal inertial class for GL_k(E) (one in each factor for split E) outside the fixed support, and then choose an unramified twist avoiding the reducibility locus so that unnormalized Ind_P^(U(V⊕(-L)))(τ⊠π_W) is irreducible and π_V^∨ lies in none of the blocks [GL_k(E)×U(V′),τ⊠μ], for every μ and every such Levi in U(V). The support exclusion holds on the entire chosen inertial family, and the reducibility locus is proper in that family; no supercuspidality of either endpoint is assumed (ggp Corollary 15.2 and its proof, p. 63, ggp line 2229). The section contract is SR.3.1–SR.3.3: simultaneous auxiliary-support avoidance supplement. Needed by §2.4.

What SmoothRepresentationsOfLocalGroups must provide (gap:local-mirabolic): For every nonarchimedean characteristic-zero local field K and k≥1, supply the mirabolic restriction of generic supercuspidal GL_k(K) representations. For a generic supercuspidal τ of GL_k(K), its restriction to the last-row mirabolic P_k is compact induction from the maximal upper unipotent N_k with the fixed nondegenerate character, functorially with the source induction normalizations (ggp §15, pp. 62–63, ggp line 2190–2226). Include all residue characteristics. The Bessel open-orbit Hom comparison remains §2.4. The section contract is SR.5, mirabolic-derivatives and schwartz-submodule: supercuspidal restriction supplement. Needed by §2.4.

What SmoothRepresentationsOfLocalGroups must provide (gap:gl-tempered-genericity): For every nonarchimedean characteristic-zero local field K and k≥1, prove that every irreducible unitary tempered smooth admissible complex GL_k(K) representation admits a nonzero Whittaker functional for each nondegenerate unitary character of its maximal unipotent. Include every finite extension of ℚₚ, including dyadic fields. Use the Whittaker-functional and character-orbit carriers of SR.2.3 and temperedness of SR.3.3; the orbit-function realization is imported separately from AutomorphicLFunctionsAndLocalFactors §AL.3. This is the finite-place genericity input to the split tempered conclusions (ggp Theorem 17.2 and preceding discussion, p. 68, ggp line 2394–2405; zhang-period §4.5, pp. 30–31, zhang-period line 1469–1548). The section contract is SR.2.3 and SR.3.3: nonarchimedean tempered GL genericity supplement. Needed by §3.10, §3.11, §5.1a.

What SmoothRepresentationsOfLocalGroups must provide (gap:local-jacquet-filtration): Using the SR.2.2 Weyl-character Jacquet filtration, prove for GL_k(K) over every finite extension K/ℚₚ that normalized induction of pairwise distinct unitary characters is irreducible unitary tempered, its ordinary maximal-unipotent coinvariants have dimension k!, and its nondegenerate Whittaker quotient has dimension one, with the δ_B^(-1/2) torus-action comparison. For pairwise distinct unitary χ_i the normalized induction is irreducible unitary tempered and the ordinary N_k-coinvariants have dimension k!; dualizing gives dim Hom_N(π,1)=k!. For a nondegenerate character the Whittaker quotient has dimension 1. Keep the normalization distinction between ordinary coinvariants and the torus action twisted by δ_B^(-1/2). The filtration is the general geometric lemma, rather than an asserted splitting (bernstein-zelevinsky §2.12, p. 448, bernstein-zelevinsky line 329–338; ggp Theorem 17.2(ii), p. 68, ggp line 2398). The section contract is SR.2.2, geometric-lemma and principal-series-jacquet; SR.2.3: regular unitary GL comparison supplement. Needed by §3.10.

What SmoothRepresentationsOfLocalGroups must provide (gap:local-spherical): For every finite extension K/ℚₚ, including p=2, and split or unramified reductive groups with specified hyperspecials, supply Satake parameters, normalized spherical matrix coefficients, spherical Whittaker vectors, and their Cartan double-coset volumes and Iwasawa/Weyl formulas with the actual Haar normalization. For every unramified irreducible tempered GL_k(K) and conductor-zero generic character, normalize the spherical Whittaker vector by W(1)=1. Give compatible unitary Satake/base-change and normalized-induction comparisons and the group spherical formulas for all residue sizes q≥2, including coincident Satake eigenvalues by continuous specialization. Retain both split and unramified nonsplit unitary groups; no odd-residue hypothesis is allowed in this general input. Haar volume is explicit, and data without hyperspecial fixed vectors have no spherical evaluation. General group formulas are the input; the relative spherical integral and its dyadic root-coordinate comparison remain §5.3 (harris §2.2, pp. 7–23, harris line 368–403 and harris line 907–1000; zhang-period §3.3, p. 19, zhang-period line 982–986). The section contract is SR.4.1–SR.4.2: all-residue matrix-coefficient and Whittaker normalization supplement. Needed by §5.3.

### From TauCetiRoadmap.NoncommutativeGeometry

Consume N1 for the Hausdorff completed projective tensor of Hausdorff locally convex complex spaces, its canonical bilinear map, functoriality and universal property for continuous bilinear maps into complete targets. The algebraic tensor image is dense by the Hausdorff-completion construction. With target C, the universal property identifies continuous linear functionals on the completion with continuous bilinear forms; density gives uniqueness. Apply this to the Casselman–Wallach spaces with the topologies and nuclearity of AutomorphicFormsOnReductiveGroups §2.7 in §§2.1, 2.2, 2.5, 3.3, 5.1a and 5.2.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

Consume §§0.1–0.5 for adelic test spaces and right actions, §§2.3 and 2.7 for real induction and globalization, §§3.4–3.5 for restricted tensor factors and spherical lines, and §4.2 for cuspidal realizations and Petersson pairings. In §2.7 use SAF nuclearity and `seminormEstimate`: for each continuous seminorm q there are p,C,N with q(π(g)v)≤C H(g)^N p(v). Absorbing C into p gives the ordinary growth input to the Whittaker estimate. Use the §2.7 smooth topology and NoncommutativeGeometry N1 tensor throughout; the supplements below concern the relative smooth-dual comparison and vector-valued Whittaker decay with its Haar/Cartan comparison.

Consume §2.6 `HasWhittakerModel`, `genericUnitaryInduction`, `genericUnitaryClassification` and `whittakerTwist`, on the continuous §2.7 globalizations, for GL_k(R) and GL_k(C), k≥1. An irreducible unitary tempered representation is an essentially tempered block; normalized induction from the whole group is the same representation, so the genericity criterion supplies a nonzero continuous Whittaker functional for each specified nondegenerate unitary character. Use this in §§3.10, 3.11 and 5.1a, together with the finite-place gap:gl-tempered-genericity. The empty GL_0 factor is the trivial representation and is treated directly in §3.10.

What AutomorphicFormsOnReductiveGroups must provide (gap:archimedean-globalization): On the finite-length Casselman–Wallach globalizations of §2.7 for U(p,q) and GL_k(R/C), using the §2.7 nuclear smooth topologies and NoncommutativeGeometry N1 tensor, supply the functorial identification of continuous equivariant bilinear forms with continuous maps to the smooth contragredient under the relative subgroup actions. For the H=N⋊U(W) actions of §1.2, the first factor acts by u i(g), the second by g, and the target has character ν; retain these actions and the character twist in the curried map. Include the split adjacent GL actions of §5.1a and r=0, where the identification is Hom_H(π_V completed-tensor π_W,1)≃Hom_H(π_V,π_W^∨). The contragredient carries its supplied smooth topology, and the comparison is natural in continuous intertwiners. A raw algebraic dual is insufficient (sun-zhu Theorem B, p. 2, sun-zhu line 66–68; jsz-bessel §§3.2–3.3, pp. 6–7, jsz-bessel line 190–233). The section contract is 2.7: relative smooth-contragredient comparison supplement. Needed by §2.1, §2.2, §2.5, §3.3, §5.1a, §5.2.

What AutomorphicFormsOnReductiveGroups must provide (gap:archimedean-generic-induction): For the real unitary and split GL parabolics with Levi GL_(r+1)(E)×U(W), supply generic irreducibility for the precise Casselman–Wallach families in jsz-bessel §3.2, unnumbered inducing transformation and Proposition 3.1, p. 6, jsz-bessel line 207–216. Fix r≥1, irreducible π_W and generic irreducible auxiliary σ of GL_(r+1)(E), where E is C, R×R or C×C as appropriate. In unnormalized induction with transformation f(n g m x)=χ_(U(W))(g)^(-1)|det m|^s(π_W⊠σ)(g m)f(x), the reducible parameters form a Lebesgue-null subset of C^d, d=1 for a field and d=2 for a split algebra. Every componentwise right half-plane therefore contains an irreducible parameter; the finite-dimensional space S and its half-plane belong to §2.5 (jsz-bessel Proposition 3.1, p. 6, jsz-bessel line 207–216). The section contract is 2.3 and 2.7: specified JSZ induction-family supplement. Needed by §2.5.

What AutomorphicFormsOnReductiveGroups must provide (gap:archimedean-seminorms): Using §2.7 `seminormEstimate` and the NoncommutativeGeometry N1 tensor, supply vector-valued generic Whittaker decay for Casselman–Wallach representations of U(p,q) and GL_k(R/C), with the Haar/Cartan comparison in the JSZ coordinates used in §2.5. For ρ=π_W completed-tensor σ, Λ=id⊗λ and a nonzero continuous generic Whittaker λ, the supplied growth estimate applied to the continuous seminorm q∘Λ gives q(Λρ(g)v)≤||g||^c p_0(v). For every integer N>0 require a continuous seminorm p_N with q(Λρ(a_t)v)≤ξ(t)^(-N)||a_t||^c p_N(v) for all positive diagonal t and v; ξ(t)=∏_(i=1..k-1)(1+t_i/t_(i+1)), multiplied over the two factors for split E. The exponent c is fixed by the initial growth bound; p_N may depend on ρ,q,λ,N, not on t,v. Compare the actual Haar measure with the Cartan Jacobian in these coordinates. Bounds for a finite basis of S are combined by taking maxima; the relative quotient integral and half-plane are derived in §2.5 (jsz-bessel Lemma 6.2, p. 18, jsz-bessel line 652–656; §6.4, pp. 20–22, jsz-bessel line 765–804). The section contract is 2.7: vector-valued Whittaker-decay and Haar-comparison supplement. Needed by §2.5.

What AutomorphicFormsOnReductiveGroups must provide (gap:automorphic-realization): On the adelic Schwartz, cuspidal and Petersson carriers of §§0.1–0.5, 3.4–3.5 and 4.2, supply restricted completed smooth tensor factorization with pure-tensor density, continuous restriction estimates derived from cuspidal rapid decay and local invariant unitary pairings for all number fields and unitary inner forms. Need all number fields and arbitrary unitary inner forms, pure-tensor density, Petersson positive pairings, local invariant unitary structures, and the general finite-rank/smoothing operator bridge. Uniform estimates along the relevant flag are applied in target 4.1, not assumed as its conclusion. The section contract is 0.1–0.5, 3.4–3.5 and 4.2: completed smooth-factorization and period-estimate supplement. Needed by §4.1, §4.2, §5.3, §6.1.

### From TauCetiRoadmap.AutomorphicSpectralTheory

Consume Layers 0–2 for nuclear vector analysis, operator traces and local harmonic-analysis interfaces; Layers 3–4 for Eisenstein families and the continuous/discrete spectrum; and §§6.3–6.6, 6.12–6.16 for multipliers, kernels, truncation and ordinary trace expansions. The Jacquet–Rallis and local-distribution supplements below specify additional relative-period inputs. Schwartz isolation uses the requested multiplier continuation specified in gap:spectral-isolation, not the compact-support multiplier theorem of §6.3 alone.

What AutomorphicSpectralTheory must provide (gap:distribution-gk): For reductive groups over every characteristic-zero local field, supply test distributions, equivariant Harish–Chandra descent to normal representations of closed semisimple orbits, Fourier inversion with self-dual measures, and the Gelfand–Kazhdan criterion. Use compactly supported locally constant tests at finite places and smooth tests/generalized functions at infinity; for a reductive group acting on a smooth affine variety and a continuous character, descent must reduce vanishing of equivariant distributions to the stabilizer normal spaces at closed orbits, with the restricted character. For a finite-dimensional space with nondegenerate symmetric B, require the null-cone homogeneity theorem: at finite places a distribution supported with its Fourier transform on B(v,v)=0 has scaling δ_B(t)|t|^(dim V/2) and is zero for odd dim V; at infinity require a nonzero Fourier- and B-multiplication-stable subspace of null-cone-supported Schwartz distributions to contain a nonzero B-adapted distribution, with exactly the possible homogeneities of ag-descent Definition 5.1.6, not a universal scaling law for every real distribution. Here δ_B(t)=γ(B)/γ(tB), and the Fourier measure is self-dual (ag-descent Theorems 3.1.1, 5.1.5, 5.1.7 and 8.1.5, pp. 9, 13, 25, ag-descent line 406–410, ag-descent line 583–599, ag-descent line 1189–1191). For a reductive group M and closed unimodular reductive N, if an involutive anti-automorphism preserves N and fixes all N-biinvariant distributions, prove dim Hom_N(π,1) · dim Hom_N(π^∨,1)≤1 for every irreducible admissible π (continuous Casselman–Wallach at infinity). Include the diagonal-product adapter from conjugation invariance and the contragredient transport. This is the general criterion, not the relative symmetry or multiplicity theorem of §§2.2–2.6 (agrs Proposition 1.1 and Corollary 1.1, pp. 6–7, agrs line 220; sun-zhu §§1–2). The section contract is requested Part II local-distribution extension of Layers 0–2. Needed by §2.2, §2.3.

What AutomorphicSpectralTheory must provide (gap:local-schwartz-germs): For reductive groups over every characteristic-zero local field, supply Harish–Chandra Schwartz and quasi-character spaces and semisimple germ expansions with the fixed self-dual Fourier orbital measures. For each semisimple x and quasi-character θ, define the regular-nilpotent coefficients c_(θ,O)(x), with unique germ expansion on g_x; average only over a nonempty finite set and put c_θ(x)=0 when that set is empty. For each invariant compact-modulo-conjugacy L there is a continuous seminorm ν_L such that sup_(x∈L_ss) D_G(x)^(1/2)|c_θ(x)|≤ν_L(θ). Supply the centralizer-quotient Jacobians and normalized-induction character descent for all inner forms (bp-arch §4.5, Proposition 4.5.1, p. 106, bp-arch line 3984–4011). The relative Γ-integral remains §3.4. The section contract is requested Part II local germ extension of Layers 0–2. Needed by §3.4, §3.5.

What AutomorphicSpectralTheory must provide (gap:local-tempered-bounds): For reductive groups over every characteristic-zero local field, supply tempered matrix-coefficient bounds by Harish–Chandra Ξ and powers of a proper logarithmic norm, and Cartan integration with its Haar Jacobian. For each irreducible unitary tempered π there are d≥0 and continuous seminorms p,q on smooth vectors such that |B(π(g)v,w)|≤p(v)q(w)Ξ_G(g)(1+σ_G(g))^d for all g,v,w (on each compact-open fixed-vector stage at finite places). Retain arbitrary maximal-compact types, all real signatures and dyadic fields. The adjacent integral of the product of two Ξ functions is proved in §2.7 (harris Proposition 2.1 and proof, pp. 5–8; bp-arch §1.5 and §2.2). The section contract is requested Part II local estimates extension of Layers 0–2. Needed by §2.7, §3.3, §3.5.

What AutomorphicSpectralTheory must provide (gap:local-plancherel): For reductive groups over every characteristic-zero local field, supply tempered Plancherel inversion on Harish–Chandra Schwartz functions, distribution characters and normalized-induction disintegration. For every f in the Schwartz algebra, inversion and pairing against a Schwartz test converge in the stated Schwartz/distribution topologies using the actual tempered dual and Plancherel measure; include elliptic character independence and the Levi disintegration with its Weyl and formal-degree factors. These are group spectral theorems, not the relative trace identity of §3.5 (bp-arch §2.6, pp. 58–60). The section contract is requested Part II local spectral extension of Layers 0–2. Needed by §3.3, §3.5.

What AutomorphicSpectralTheory must provide (gap:local-fourier-extension): For F nonarchimedean of characteristic zero or R, supply the Fourier-averaging extension lemma for a unimodular closed algebraic H in a reductive G, an algebraic homomorphism λ:H→Ga and a cocharacter a:Gm→N_G(H) satisfying λ(a(t)ha(t)^(-1))=tλ(h). Let E₀ be a dense test subspace of a weak-Schwartz stage E with its locally constant finite-place or smooth real conjugation action. Assume there is a positive weight w on H such that restriction of f and, over ℝ, every required conjugation derivative is bounded by w times a continuous E-seminorm, and ∫_H w(h)(1+|λ(h)|)^(-δ)dh<∞ for every δ>0. Fix a nontrivial unitary ψ and d×t=dt/|t| for the self-dual additive dt. For ξ=ψ∘λ, require the unique continuous extension T of ∫_H f(h)ξ(h)dh from E₀, with |T(f)|≤Cp(f) for a continuous stage seminorm p, and the Fourier-averaging identity T(Ad_a(φ)f)=∫_H f(h) Fourier(|t|^(-1)δ_H(a(t))φ(t))(λ(h))dh for φ compactly supported smooth on F×; δ_H(a(t)) is the absolute determinant of conjugation on Lie H. At finite places prove this by averaging over the compact-open stabilizer in F×; over ℝ use the smooth conjugation derivatives and Fourier decay. This does not assert raw cutoff stabilization for every weak-Schwartz function. The relative bounds establishing the hypotheses, the H-equivariant form and its nonzero-iff-model theorem remain §3.3 (bp-arch Proposition 7.1.1 and Lemma 7.1.2, pp. 177–180, bp-arch line 6627–6773). The section contract is requested Part II local Fourier extension of Layers 0–2. Needed by §3.3.

What AutomorphicSpectralTheory must provide (gap:local-smoothing-trace): For every reductive group G over a characteristic-zero local F and every irreducible unitary tempered σ, prove that σ(f)=∫_G f(g)σ(g)dg is a smooth trace-class operator for f∈C_c∞(G(F)) at finite places or the Nash Schwartz space S(G(F)) at infinity; f↦σ(f) is continuous into the smooth endomorphism space and defines a canonical tensor admitting an absolutely convergent rank-one expansion. For a positive invariant linear-first B, require σ(f)=Σ_j T_(x_j,y_j), T_(x,y)(z)=B(z,y)x, with smooth x_j,y_j and Σ_j p(x_j)q(y_j)<∞ for every pair of continuous smooth-vector seminorms (a finite sum on a fixed compact-open stage at finite places). Require Tr(σ(g)σ(f))=Σ_j B(σ(g)x_j,y_j), continuously in the weak Harish–Chandra Schwartz topology, and equality with the absolutely convergent smooth K-basis expansion. The global automorphic-spectrum clause supplies nuclear sums on induced automorphic realizations, not this local assertion. Here the general smoothing/tensor bridge is supplied; §6.2 proves its H-integrability and interchange using §2.7 (bp-arch §7.2, pp. 180–181, bp-arch line 6780–6801 and bp-arch line 6827–6833; bpcz §10.3.1, pp. 90–91, bpcz line 4873–4888). The section contract is requested Part II local smoothing extension of Layers 0–2. Needed by §6.2.

What AutomorphicSpectralTheory must provide (gap:automorphic-spectrum): Supply actual cuspidal support decompositions, normalized Eisenstein/intertwiner families, Arthur truncation asymptotics and nuclear spectral-kernel pairings on the specified Schwartz spaces. Need canonical regularized Eisenstein Rankin–Selberg periods and Flicker–Rallis intertwining periods with convergence, parameter regularity and norm leading coefficients. No abstract complex of arbitrary distributions replaces actual automorphic kernels. Supply the actual general Jacquet–Rallis trace distribution and its cuspidal-support contribution I_χ, as distributions on the adelic Schwartz algebra (bpcz Theorem 3.2.4.1 and §10.1.6, bpcz line 4775). The star-generic relative contribution is target 6.3. The section contract is Layers 0–4 and 6: canonical relative Eisenstein-period and Jacquet–Rallis distribution supplement. Needed by §6.1, §6.2, §6.3.

What AutomorphicSpectralTheory must provide (gap:spectral-isolation): Supply normalized Schwartz multipliers isolating a prescribed GL cuspidal datum and the unitary cuspidal base-change classes, preserving transfer and the exact local support conditions. AutomorphicSpectralTheory owns this theory as a requested continuation of its §6.3, whose required contract is the one specified here. Arthur's multiplier theorem of §6.3 acts on compactly supported K-finite Hecke functions with support-radius and LF-topology control; it does not by itself isolate a cuspidal datum or a base-change class while keeping matching and the local support conditions, which is what §6.4 uses. No duplicate multiplier, interpolation, counting or isolation targets occur here. The section contract is requested Schwartz-multiplier continuation of AutomorphicSpectralTheory §6.3, with the specified preservation of transfer and support. Needed by §6.4.

### From TauCetiRoadmap.ModularityAndLanglandsExtensions

Consume §3.12 (Mok's quasi-split unitary classification) and §3.16 (KMSW's unitary inner-form classification), retaining TWFL and the Trace inputs in their stated scope. Compare their local parameters, Whittaker-normalized pairings, generic pure-inner global multiplicity formula and base changes with EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.4 on the latter's shared carriers. This comparison is made here after both suppliers. Section 3.13 is used only for comparison with its central-quotient enhanced parameters, through the component-group maps in §3.1.

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

Consume Layers 2–5 for ordinary geometric transfer and Fourier normalization, §11.2 for actual tempered unitary packets with extended pure-inner-twist pairings, §11.3 for the extended local unitary packets by positive-exponent induction, and §11.4 for generic global classification. These are the shared carriers throughout this roadmap. Retain the unitary classification contract of §§11.0d–11.0e (the Mok and weighted-stabilization inputs) and the CM scope of the supplied global theorem; its real pairing is bijective only over the specified union of inner forms. The following supplements require the additional mathematics before the unconditional local and all-number-field endpoints here can be proved.

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:enhanced-packets): On the shared carriers of §§11.2–11.3, supply the all-place tempered enhanced LLC for pure inner forms of characteristic-zero local unitary groups, with its refined component group, central restrictions and compatible Whittaker normalization; §3.1 constructs the comparison with the GGP component group after this input. Retain the unitary classification contract of §§11.0d–11.0e (the Mok and weighted-stabilization inputs) in the supplied conditional theorem and discharge those premises for the unconditional targets here; comparison with ModularityAndLanglandsExtensions §§3.12 and 3.16 uses those results only under their TWFL and Trace inputs. Require conjugate-dual signs (-1)^(m-1), multiplicities in z_φ, STAB/TRANS/WHITT, ordinary and twisted endoscopic character identities as in bp-refined §7.2, local factor compatibility, smooth duals, determinant twists, tempered induction, additive-character and scaling transport. Compare real enhancement labels with Xue §2.1 after choosing the complement reference. At split E use the shared singleton on split GL_m for ordinary pure inner forms; no division-algebra inner form is introduced by a Hermitian space. This supplement adds proofs and normalization comparisons to the shared interface, without constructing another correspondence for Langlands packets or assuming a GGP endpoint. The section contract is §§11.2–11.3: classification-input discharge and GGP-normalization supplement. Needed by §3.1, §3.2, §3.6, §3.7, §3.8, §3.9, §3.10, §4.3.

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:global-parameters): On the shared interface for global Langlands packets of §11.4 and its local carriers of §§11.2–11.3, supply Hermitian discrete Arthur parameters, constituent uniqueness, global packets and cuspidal multiplicity, strong base change and its comparison with split-almost-everywhere weak base change for every quadratic extension of number fields. Extend the supplied CM theorem to this generality and discharge its unitary classification contract of §§11.0d–11.0e (the Mok and weighted-stabilization inputs); keep those premises visible in every application of the conditional theorem until discharged. Compare ModularityAndLanglandsExtensions §§3.12 and 3.16 on their actual scope after both suppliers, retaining their TWFL and Trace inputs. Require the distinct constituent definition and Asai pole sign (-1)^(m+1), local compatibility at all places, the constituent sign group S_Π=(Z/2)^(r_n+r_(n+1)), and discrete Hermitian weak base change for every everywhere-tempered cuspidal representation used in §4.4. This is classification on one shared carrier and supplies no nonzero relative period or `GGP.8`. The section contract is §11.4: classification-input discharge, all-number-field and discrete-base-change supplement. Needed by §4.3, §4.4, §5.1, §6.4, §6.5, §7.1, §7.3, §7.4.

For the relative contracts below, locally G′=Res_(E/F)(GL_n×GL_(n+1)), H₁=Res_(E/F)GL_n embedded diagonally, and H₂=GL_n×GL_(n+1) with character η_(E/F)(det g_n)^(n+1)η_(E/F)(det g_(n+1))^n; U_h=U(h)×U(h⊕<1>) has diagonal H_h=U(h), over all nondegenerate h. Use compactly supported locally constant tests at finite places and the Schwartz spaces of bpcz §2.5 at infinity, their adelic restricted tensors, and regular semisimple matching under bp-plancherel §5.1–§5.3. Fix ψ_F and trace-zero τ∈E× to set ψ_E(x)=ψ_F(Tr_(E/F)(τx)); use self-dual additive measures, quotient measures by disintegration and the transfer factor Ω of that section. Global measures and partial Δ factors are those of bpcz §2.3.2–§2.3.3 and §10.1.6. Every constant is compared to these choices, including split E, rather than replaced by an unspecified scalar.

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:ordinary-endoscopy): Supply ordinary and twisted unitary transfer factors, Whittaker-normalized geometric transfer constants, and stable orbital-integral and quasi-character transfer independent of an enhanced classification of Langlands packets. Use all nonsplit characteristic-zero local unitary inner forms and the self-dual Fourier measures of bp-refined §§7.2, 7.7 and 8.3; provide the geometric germ and induction comparisons consumed in §3.6. On the same supplier’s shared §§11.2–11.3 carrier for Langlands packets, gap enhanced-packets supplies the ordinary/twisted character identities; §3.6 then combines these inputs in its own relative Fourier calculation. No GGP conclusion or second construction of character identities for Langlands packets is requested. The section contract is Layers 2–5: ordinary geometric germ and normalization supplement. Needed by §3.6.

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:relative-geometric-comparison): For every quadratic number-field extension E/F and n ≥ 1, prove equality of the regularized geometric Jacquet–Rallis distributions for matching adelic Schwartz tests on G′ and all U_h. Use the groups, characters and quotient measures fixed below. Truncate the actual kernels along the specified parabolics, prove their asymptotic constant terms exist and the geometric expansions converge in the Schwartz topology, then identify these constant terms for matching orbital integrals and spherical base-change tests outside S, with the partial Δ measure factors. This is an equality before cuspidal isolation or star-generic spectral calculation, not §6.4 or `GGP.8` (bpcz §10.1.6, proof pp. 89–90, bpcz line 4775–4831). The section contract is Part II relative comparison continuation (global geometry). Needed by §6.4.

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:relative-finite-transfer): For every finite extension F/ℚₚ, quadratic étale E/F and n ≥ 1, every compactly supported smooth test on G′ has a matching finite family on all U_h and conversely. Use the Schwartz spaces, relative orbital integrals and transfer factor Ω of bp-plancherel §5.3 with the quotient measures fixed below: Ω(γ)O_γ(f′)=O_δ(f_h) at every matching regular semisimple orbit, with zero on unmatched orbits. Require both directions, including a test supported on one prescribed inner form, all ramification and p=2; identify the elementary split convolution transfer (bp-plancherel Theorem 5.3.1(i), p. 84, bp-plancherel line 4480–4484). The section contract is Part II relative comparison continuation (finite smooth transfer). Needed by §6.4.

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:relative-archimedean-transfer): For F=ℝ or C, quadratic étale E/F and every n ≥ 1, construct dense subspaces of the Schwartz spaces on G′ and the finite direct sum over U_h whose members admit matching transfers in both directions. Density is in each native Schwartz Fréchet topology, with the same Ω and quotient measures as finite transfer; require relative orbital integral continuity and transfer with zero components on the other forms for a test in the chosen dense unitary subspace. This permits extension of continuous relative-character identities, without claiming transfer for every archimedean Schwartz test (bp-plancherel Theorem 5.3.1(ii), p. 84, bp-plancherel line 4485–4491; bpcz §10.3.4, p. 91, bpcz line 4920–4926). The section contract is Part II relative comparison continuation (infinite smooth transfer). Needed by §6.4, §6.5.

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:relative-fundamental-lemma): For every unramified quadratic extension of nonarchimedean characteristic-zero local fields and every n ≥ 1, prove matching of the hyperspecial unit test and zero transfer to the other inner forms; for split E=F×F give the elementary spherical base-change transfer. Use Ω and the disintegrated quotient measures fixed above; translate explicitly from the volume-one measures of bp-fundamental §1 to these measures. Include the Lie algebra unit lemma for every rank, its group comparison, and the elementary split convolution transfer. No residue characteristic is excluded: bp-fundamental Theorem 1, p. 3, bp-fundamental line 99–119, includes small residue characteristic. The final comparison uses unit tests at inert places outside S and permits arbitrary spherical Hecke tests only at split places, as in bpcz Proposition 10.1.6.1, pp. 88–89, bpcz line 4760–4782. Ramified data use relative-finite-transfer. This is precisely the fundamental-lemma input for enlargement of S, without asserting a full nonsplit Hecke-algebra fundamental lemma. The section contract is Part II relative comparison continuation (spherical transfer). Needed by §6.4.

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:relative-character-comparison): For every characteristic-zero local F, quadratic étale E/F, n ≥ 1 and actual irreducible tempered distinguished σ of U_h with Π=BC(σ), prove I_Π(f′)=κ_(h,ψ)J_σ(f_h) for every matching Schwartz family, with κ_(h,ψ) explicit and nonzero. Groups and measures: G′=Res_(E/F)(GL_n×GL_(n+1)), H₁=Res_(E/F)GL_n diagonal, H₂=GL_n×GL_(n+1) with η(det g_n)^(n+1)η(det g_(n+1))^n; U_h=U(h)×U(h⊕<1>), H_h=U(h). Fix ψ_E=ψ_F∘Tr(τ·), self-dual root measures, disintegrated quotient measures and Ω of bp-plancherel §5.3; globally use bpcz §2.3.2–§2.3.3 Δ factors. Use the Whittaker λ, β and norm pairings of bpcz §10.3.3 and the raw unitary matrix-coefficient character of §6.2; for nonsplit E/F compare bp-plancherel Theorem 5.5.1 constants under dual/Whittaker and Haar changes, rather than identifying its differently normalized characters. For global rational ψ, trace-zero τ and Tamagawa-compatible measures prove ∏_v κ_(h_v,ψ_v)=1, including split places via zhang-period §4.5. No global period identity is assumed (bp-plancherel Theorem 5.5.1 and Remark 5.5.2, p. 89, bp-plancherel line 4734–4748; bpcz §10.3.5, p. 92, bpcz line 4935–4941). The section contract is Part II relative comparison continuation (local spectral comparison). Needed by §6.5.

### From TauCetiRoadmap.MetaplecticAutomorphicForms

Consume §3.2a's sign +1 split finite-projective Hermitian carrier over E=F×F, with F any field of characteristic ≠2, its idempotent description M≃A⊕A∨, conjugate-first pairing k((x,l),(y,m))=(l(y),m(x)), and isometry group GL(A) acting by (g,(g⁻¹)∨). Use the split-form comparison of §1.1 for the linear-first convention in §§1.1 and 1.3 and the split comparison boundary of §3.4. These algebraic inputs require no local-field or oscillator estimates. Consume §0.18 for smooth oscillator vectors and §§3.3–3.6 for unitary splittings and local theta modules. The exact real mixed-model estimates and enhanced signature rules below are supplements on those carriers.

What MetaplecticAutomorphicForms must provide (gap:real-oscillator-model): For every real dual pair U(V)×U(V′) with V Hermitian and V′ skew-Hermitian, construct the oscillator action on its nuclear Schwartz mixed model with the specified unitary splittings and matrix-coefficient decay. Use ψ(x)=exp(-2πix), χ_V|R×=sgn^(dim V′) and χ_(V′)|R×=sgn^(dim V); compare Hermitian V′ by -iV′. Require one continuous Schwartz seminorm p such that for every positive diagonal dilation λ of the mixed Euclidean coordinates and all Φ,Φ′, the absolute mixed overlap is bounded by ∏_j min(1,λ_j^(-1)) p(Φ)p(Φ′), and the resulting continuity/absolute convergence of the integrated oscillator pairings in equal or adjacent ranks. This is the general model estimate; the Bessel seesaw is §3.8 (xue-real §3.1, Lemmas 3.1–3.4, pp. 1003–1009, xue-real line 312–425). The section contract is 0.18 and 3.3–3.3b: real mixed-model overlap-estimate supplement. Needed by §3.8.

What MetaplecticAutomorphicForms must provide (gap:real-small-theta): For each irreducible tempered U(V) representation with actual enhancement (φ,η), supply nonzero small theta lifts, exact signature selection and parameter formulas for target dimension dim V or dim V+1, with determinant-twist transport. Use the splittings of real-oscillator-model. In equal rank put θφ=φ⊗χ_V^(-1)χ_(V′) and θη(a_i)=ε(φ_i⊗χ_V^(-1),conj(ψ_C))η(a_i); there is exactly one target signature. In rank n+1 add χ_(V′): if χ_V occurs in φ there is exactly one target and θη=η on the same component group; if it does not occur there are exactly two, θη restricts to η and its new generator has value (∏η(a_i))(-1)^(n(n+1)/2-q′). To specify the signature rather than only its discriminant, remove the paired summands not of the required conjugate-self-dual sign by tempered induction, contributing (t,t) to signature, then order the remaining appropriate-sign characters with multiplicity by decreasing exponent as in Xue §3.2 and count p′=t+#{i:θη(e_i)=(-1)^(i-1)}, q′=dim V′-p′; all other signatures have zero lift. Include the inverse statement: a tempered target of rank n+1 containing an appropriate-sign self-dual character is, after a determinant twist, a nonzero small lift from rank n. These assertions concern the small lift, not irreducibility of the big lift (xue-real §3.2, equations (3.11)–(3.15) and Lemma 3.5, pp. 1010–1013, xue-real line 554–609; signature rule xue-real line 677–685). The section contract is 3.4–3.6: real tempered signature and enhancement supplement. Needed by §3.8.

### From TauCetiRoadmap.AdelicAlgebraicGroups

Consume §§0.1–0.3 and 1.1–1.5 for restricted-product measures, adelic points and unimodularity, and §§2.2–2.5 for disintegration, quotient measures and Tamagawa normalization. The following comparison fixes their Artin–Tate convergence factors to the BPCZ normalization; the relative volume tail is used in §5.5.

What AdelicAlgebraicGroups must provide (gap:adelic-measures): Compare the adelic quotient and Tamagawa measures of §§0.1–0.3, 1.1–1.5 and 2.2–2.5 with the BPCZ Artin–Tate convention dh=(Δ_H^*)⁻¹∏_vΔ_(H,v)|ω_H|_v, including its partial measures, nonzero convergent hyperspecial-volume tail, unipotent rational quotient mass one and compatibility with diagonal inclusions over all number fields and unitary inner forms. For arbitrary number fields and all unitary inner forms supply the formulas of bpcz §2.3.2: dh=(Δ_H^*)⁻¹∏_v Δ_(H,v)|ω_H|_v, its partial measure factors and the product-formula independence. Need convergence/nonzero of the volume tail for any local factorization of this measure, unipotent rational quotient mass 1, and compatibility with diagonal inclusions; GlobalNumberFields and RestrictedProducts explicitly stop before these claims. The section contract is 0.3, 1.2–1.5 and 2.2–2.5: BPCZ convergence-factor comparison supplement. Needed by §4.1, §5.4, §5.5, §6.1, §6.4, §7.3, §7.4.

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

Consume AL.0–AL.1 for self-dual Fourier measures and rank-one factors; AL.3 for Whittaker realizations, Rankin–Selberg integrals, test realization and global unfolding; AL.4 for Weil–Deligne operations and Satake comparisons; and AL.5 for leading terms and signed-value comparisons. The six contracts below isolate the exact unitary signed-Asai, normalization, regularity and residue interfaces, rather than redeveloping the general L-functions.

Import §AL.3 The Whittaker realization (AL.3.1.2), with its unipotent equivariance, right-translation law, pointwise extensionality and representation isomorphism onto its image, and Representation prerequisites, Archimedean Whittaker comparisons (AL.R.1). For a generic irreducible π and a specified nonzero functional λ, these identify π with the orbit-function image W_v(g)=λ(π(g)v), with its smooth or Casselman–Wallach topology. Apply the realization separately to each representation and its smooth contragredient with the specified opposite character; form tensor maps from these isomorphisms using Mathlib at finite places and NoncommutativeGeometry N1 at infinity. The relative smooth-dual comparison is gap:local-categories or gap:archimedean-globalization; the invariant Whittaker pairing and Fourier identity are gap:whittaker-pairing-fourier. These are the precise comparisons used in §§3.11 and 5.1a.

In §AL.3 import Local convergence and continuity (AL.3.2.2), The Rankin–Selberg local L-factor (AL.3.2.3) and The normalized adjacent-rank period (AL.3.8.1): the normalized quotient is entire, has no common zero among test inputs at any point, is invariant at the center and has spherical value 1 with the stated Haar. Their generic irreducible inputs, opposite Whittaker characters, all characteristic-zero local fields, continuous archimedean realizations and tempered half-plane Re(s)>−1/2 are retained. At adjacent ranks our λ(s,W) is the supplier’s adjacent integral, or the Ψ₀(s+1/2,W_(n+1),W_n) of The local Rankin–Selberg integrals (AL.3.2.1); the shift changes its exponent (s+1/2)−1/2 to s. The entire normalized functional has a nonzero test at every s₀; scalar multiplication makes its value 1. These targets supply the analytic theory used in §§3.11, 5.1a, 5.3 and 6.1. The residual gap below compares only measures.

What AutomorphicLFunctionsAndLocalFactors must provide (gap:factor-epsilon-identities): For every characteristic-zero local field F and quadratic étale E/F, and for quadratic number-field extensions globally, supply completed factors of actual Weil–Deligne, archimedean Weil and automorphic parameters, compatible with sums, induction, tensor products and duals; at the central argument prove ε(1/2,M,ψ_E)=1 for conjugate-orthogonal M and nontrivial ψ_E trivial on F, ε(M,ψ_E)ε(M^∨,ψ_E)=det M(-1), and ε(M,ψ_E(t·))=det M(t)ε(M,ψ_E) for t∈F×. Include zero parameters (factor 1), epsilon lift-independence under the connected centralizer, and multiplicativity used in ggp Theorem 6.1, pp. 20–21, ggp line 728–753, with the duality formula in §5, p. 16, ggp line 598–615. For actual degree-m unitary base change identify L_F(s,σ_m,Ad)=L_F(s,BC(σ_m),As^((-1)^m)), locally and globally (harris Remark 1.4, p. 3, harris line 149–157; bpcz §10.3.5, p. 92, bpcz line 4945). Use geometric Frobenius of norm q⁻¹ (ggp §3, p. 8, ggp line 272–276), compare arithmetic Frobenius by inversion, and retain split products, gamma factors and p=2. The section contract is §AL.1 and §§AL.3–AL.5 factor identities and signed-Asai comparison: exact normalization and all-place comparison supplement. Needed by §3.1, §3.2, §4.3, §5.1, §5.3, §6.5.

What AutomorphicLFunctionsAndLocalFactors must provide (gap:tempered-local-regularity): For every characteristic-zero local F, quadratic étale E/F, n ≥ 1 and actual irreducible unitary tempered σ of an adjacent rank-(n,n+1) unitary pair, prove that L_F(s,η^i) at s=i for 1≤i≤n+1, L_E(s,BC(σ_n)×BC(σ_(n+1))) at s=1/2, and L_F(s,σ,Ad) at s=1 are holomorphic and nonzero. Here η is the quadratic character, equal to 1 in the split case, and σ has no globalization premise. Include ramified and split algebras, dyadic fields and archimedean gamma factors. These are regularity assertions for the individual factors, not for an assumed quotient: C_v and its nonvanishing are constructed and deduced solely in §5.1 (bpcz §1.1.6, p. 4, bpcz line 148–167). The section contract is §AL.1 and §§AL.3–AL.5 tempered regularity: exact normalization and all-place comparison supplement. Needed by §5.1, §5.1a, §5.3.

What AutomorphicLFunctionsAndLocalFactors must provide (gap:hermitian-global-values): For a quadratic number-field extension E/F and normalized isobaric inductions Π_a,Π_b of distinct unitary conjugate-self-dual cuspidal constituents in each degree, with a-b odd, prove the completed L_E(s,Π_a×Π_b) is holomorphic at s=1/2 and may vanish there; prove each opposite-parity L_F(1,Π_m,As^((-1)^m)) is finite and nonzero when its degree-m constituents have Asai pole sign (-1)^(m+1). For b=0 the tensor L-function is 1. Include all infinite factors and the finite nonzero completed L_F(i,η^i), i≥1, for the globally nontrivial quadratic η. The same central regularity applies to the generic tempered base changes in §4.4; no central value is inverted. At adjacent ranks the opposite-parity product is the global adjoint denominator via factor-epsilon-identities (ggp Conjecture 24.1, p. 90, ggp line 3175–3182; harris Remark 1.4, p. 3, harris line 149–157; bpcz §§1.1.2–1.1.6, pp. 2–5; bplzz Definition 1.5, p. 3, bplzz line 128). The section contract is §§AL.3–AL.5 global Rankin–Selberg and signed-Asai values: exact normalization and all-place comparison supplement. Needed by §4.4, §5.1, §6.1, §7.2.

What AutomorphicLFunctionsAndLocalFactors must provide (gap:local-rankin-selberg): Compare the §AL.3 integral and normalized period, on the same generic irreducible adjacent GL_(n+1)(K)×GL_n(K) Whittaker models with opposite characters, with the unnormalized differential measure dg_n^d=|det g|^(-n)∏dx_ij and the N_n quotient measure used here, for every characteristic-zero local K and n ≥ 1. Use the same ψ-self-dual dx on every root group in both conventions. At finite K take the supplier GL_n Haar with GL_n(O_K) mass 1; put κ=vol_dx(O_K), c_n=κ^(n²)∏_(j=1..n)(1−q^(-j)). Then dg_n^d=c_n dg_n^AL, dḡ_n^d=c_n dḡ_n^AL, λ^d(s)=c_n λ^AL(s) and (λ^d/L)(s)=c_n(λ^AL/L)(s). At infinity instantiate the supplier Haar by dg_n^d, so c_n=1. More generally, dg→a dg and du_N→b du_N give dḡ→(a/b)dḡ and λ→(a/b)λ, with a,b>0. For conductor-zero ψ, κ=1 and the supplier’s spherical normalized value 1 becomes ∏_(j=1..n)(1−q^(-j))=vol_(dg_n^d)(GL_n(O_K)); hence λ^d(s,W°)=vol_(dg_n^d)(GL_n(O_K))L_K(s+1/2,π_(n+1)×π_n). At finite places Zhang’s earlier ζ_K(1)dg_n^d convention instead multiplies this quotient integral by ζ_K(1); §§5.1a and 5.3 use his unnormalized local convention. Compare these choices by disintegration, including ramified characters and q=2 (zhang-period §2.1, pp. 10–11, zhang-period line 489–522; measure changes p. 9, zhang-period line 424–440; §3.3, equations (3.23)–(3.26), p. 19, zhang-period line 962–986). The section contract is §AL.3 local Rankin–Selberg periods: differential and quotient Haar comparison supplement. Needed by §3.11, §5.1a, §5.3, §6.1.

**Checks for the differential Haar comparison.**

- With conductor-zero ψ, n=1 and q=2, dg₁^d=dx/|x| gives O_K× mass 1/2. The supplier’s normalized spherical value 1 therefore becomes 1/2; identifying the two Haar choices would fail.
- For n=2 and q=2 the same volume is (1−1/2)(1−1/4)=3/8. Keeping only the rank-one factor gives the wrong spherical value.
- Scaling the GL_n measure by 2 with the N_n measure fixed doubles λ; scaling only the N_n measure by 2 halves λ. The conversion uses a/b, with strictly positive factors, so neither change destroys normalized nonvanishing.

What AutomorphicLFunctionsAndLocalFactors must provide (gap:whittaker-pairing-fourier): For every characteristic-zero local K, k≥1 and generic unitary GL_k(K) representation, supply the absolutely convergent positive invariant Whittaker pairing ϑ_k(W,W′)=∫_(N_(k-1)\GL_(k-1))W(diag(g,1))conj(W′(diag(g,1)))dḡ; for tempered representations supply the Fourier identity F̂_(W,W′)(ψ_t)=δ_(B_k)(t)^(-1)W(t)conj(W′(t)) on regular unipotent characters. Here F(u)=∫_([N_k,N_k])B(π(vu)W,W′)dv converges absolutely, F lies in L² of the unipotent abelianization, and its Fourier transform is smooth on the regular-character open set. Fix self-dual root measures and quotient measures by disintegration; include k=1, ℝ,ℂ and dyadic K. For unramified π and conductor-zero ψ, its spherical W(1)=1 has ϑ_k(W,W)=vol(GL_k(O_K))L_K(1,π×π^∨) in the unnormalized differential measures (zhang-period equation (3.2), pp. 13–14, zhang-period line 656–678; Lemma 4.9, pp. 30–31, zhang-period line 1523–1542). The relative split integral identity remains §5.1a. The section contract is §§AL.3–AL.4 Whittaker pairing and Fourier continuation: exact normalization and all-place comparison supplement. Needed by §5.1a, §5.3.

What AutomorphicLFunctionsAndLocalFactors must provide (gap:global-mirabolic-norms): For every quadratic number-field extension E/F, m≥1 and full normalized GL_m(A_E) induction Π_m of distinct unitary conjugate-self-dual cuspidal constituents with Asai pole sign (-1)^(m+1), supply the nonzero (-1)^(m+1)-distinguished mirabolic functional and positive invariant Whittaker norm: their finite-S expressions have coefficients (Δ_(GL_m/F)^(S,*))⁻¹L^(S,*)(1,Π_m,As^((-1)^(m+1))) and (Δ_(Res GL_m)^(S,*))⁻¹L^(S,*)(1,Π_m×Π_m^∨), respectively, where L^(S,*)(1) means the finite nonzero limit of (s-1)^r_m L^S(s) and r_m is the number of distinct constituents (the exact pole order of both functions). Prove convergence of the corresponding mirabolic integrals, independence of sufficiently large S, nonzero leading coefficients of the stated orders, and equality of the Whittaker norm with the normalized induced Petersson norm; retain endoscopic inductions, all infinite places and local ramification. This is the general one-degree distinction/norm input. Its two-degree assembly, the continued global λ and their relative-character factorization remain §§6.1–6.5 (bpcz §8.1.2 and Theorem 8.1.2.1, pp. 76–77, bpcz line 4132–4154; zhang-period §§3.1–3.2, pp. 13–19). The section contract is §§AL.3–AL.5 global mirabolic distinction and norm residues: exact normalization and all-place comparison supplement. Needed by §6.1.

## How to read the build

Layer 1 fixes algebraic relative data and transport. Layer 2 builds the actual local Hom space, proves distribution symmetry and multiplicity one, and establishes adjacent tempered integrability before it is used in Layer 3. Layer 3 constructs the epsilon character, regularized forms and geometric multiplicity, then proves the nonsplit tempered theorem for Langlands packets and separates the certified split range from the higher-codimension archimedean prediction. Layer 4 defines global periods and the historically named fixed-pair conjecture proposition, with the literature theorem and its hypothesis comparison in §4.4. Layer 5 supplies all local normalizers, scaling laws and the all-place product. Layer 6 computes the relative spectral contribution and assembles it through the specified comparison contracts. Layer 7 states and proves the two adjacent global endpoints, with `GGP.8` as the precise period/L-value export. Suggested.lean is the acceptance test for the headline theorems against the pinned APIs. Its module docstring identifies the missing carriers for each headline; none is expressible at these pins using only a few simple definitions. The constructions, API facts and Checks below specify the full library. Source identifiers and line locators refer to the exact versions in References. A proof uses only its listed targets, pinned declarations or recorded supplier gaps.

The headline theorems are adjacent distribution symmetry (§2.2), odd-codimension multiplicity one and its reductions (§§2.3–2.6), adjacent tempered integrability (§2.7), the epsilon-character construction and normalization (§§3.1–3.2), regularized-form nonvanishing and the local relative trace formula (§§3.3–3.5), the component-character Fourier identity and nonsplit tempered local GGP (§§3.6–3.9), split generic nonvanishing in the proved ranges (§3.11), global period convergence and factorization and the tensor L-function comparison (§§4.1–4.3), the split Whittaker identity and local-form evaluations (§§5.1a–5.3), global Whittaker-period factorization and the endoscopic spectral and relative-character identities (§§6.1–6.5), adjacent global nonvanishing and its stable specialization (§§7.1–7.2), and the completed period identity GGP.8 (§7.4). Section 3.10 retains its conjectural status; §4.4 records the proved literature result and assigns its formal proof to GanGrossPrasadUnitaryGroups, Part II. These section labels identify the targets independently of a choice of Lean declaration names.

## Layer 1: Relative Hermitian geometry and Bessel data

### 1.1 Relevant Hermitian pairs and form comparisons

For the algebraic hypotheses below, define a relevant Hermitian pair (W,V,r,L) to mean an isometric inclusion i:W→V together with the property that i(W)⊥ is isometric to H^r orthogonal-sum L, where H has Gram matrix [[0,1],[1,0]] and L=<a> with a∈F×. A framed pair additionally chooses such an isometry, a hyperbolic basis and an E-basis vector e of L, meaning E→L, a↦ae is an isomorphism (equivalently h(e,e)∈F×); relevance itself forgets the frame. (ggp, §2, pp. 5–7; ggp line 229; ggp line 255; §12, p. 44, ggp line 1567–1569).

Here F is a field of characteristic different from 2; E is a quadratic étale F-algebra with its nontrivial involution c; all Hermitian E-modules are finite free of constant rank and their forms are nondegenerate; n=rank_E W, r≥0 and L is a nondegenerate rank-one space.

Use the upstream orthogonal-complement decomposition and Witt extension theorem to relate the embedding, complement and frame descriptions. Extend scalars on the actual forms, rather than on a chosen signature.

For a nonsplit quadratic field E/F and finite-dimensional E-module V, use `SignedHermitianSpace E V 1` as the field-form data. Prove the field-form comparison between this carrier and the field specialization of the quadratic-étale module form carrier: it is the identity on V and sends a supplier form k to h(x,y)=k(y,x); its inverse sends h to k(x,y)=h(y,x). Both carriers require Hermitian symmetry and nondegeneracy, with the standing characteristic ≠2 assumption. Swapping twice is the identity; symmetry identifies the two separation conditions. Isometries and orthogonal submodules therefore agree, and the adjoint of every E-linear endomorphism is the imported `signedHermitianAdjoint` without an inverse or sign change. This comparison concerns the two form carriers, not a new field-form construction (ggp §2, pp. 5–7, ggp line 229–243; GeometryOfNumbersAndQuadraticArithmetic §2.9; Mathlib `LinearMap.flip_nondegenerate` and `Submodule.mem_orthogonalBilin`).

The comparison has the following API.

- Its forward and inverse maps satisfy the displayed slot formulas.
- It identifies form-preserving E-linear equivalences and orthogonal submodules.
- It identifies the adjoint characterized by h(Tx,y)=h(x,T*y). The comparison applies to the forms on W, V and their complements.

**Checks for the field-form comparison.**

- On E=ℂ with k(x,y)=conj(x)y, the image has h(i,1)=i and h(1,i)=-i. Reusing k without swapping gives -i at (i,1). The scalar pairing Check in §2.1 gives the same numerical witness on the native complex inner product.
- On the zero E-module, the unique form is nondegenerate and the slot swap and its inverse fix it. A comparison requiring positive rank would reject it.
- Over a quadratic extension of ℚ₂, on the line k(x,y)=c(x)y, multiplication by a has adjoint multiplication by c(a) on both sides. Taking a with c(a)≠a rejects an adjoint without conjugation, while taking a=2 rejects replacing the adjoint by its inverse. The same comparison applies over ℂ/ℝ to both line signs and their hyperbolic sums.

For split E=F×F with coordinate-swap involution, use the sign +1 finite-projective carrier of MetaplecticAutomorphicForms §3.2a. Prove the split-form comparison between its perfect conjugate-first forms on a fixed finite projective constant-rank E-module M and the linear-first quadratic-étale form interface: the underlying map on M is the identity, h(v,w)=k(w,v), and the inverse swaps the slots again. In the supplied coordinates M≃A⊕A∨, with A finite-dimensional over F and (a,b)(x,l)=(ax,bl), this gives h((x,l),(y,m))=(m(x),l(y)). The coordinate identification comes from the supplied perfect pairing; it requires no chosen basis. Slot exchange preserves perfectness and Hermitian symmetry. For every E-linear equivalence f between two such modules, preservation of k is equivalent to preservation of h. For every E-submodule S, h(s,v)=0 for all s∈S iff k(s,v)=0 for all s∈S, by k(v,s)=c(k(s,v)). Thus isometries and orthogonal submodules agree with the supplier, including its GL(A) action. This is the split counterpart of the field-form comparison, under the same standing characteristic ≠2 hypothesis (MetaplecticAutomorphicForms §3.2a; Mathlib `LinearMap.flip_nondegenerate` and `Submodule.mem_orthogonalBilin`; linear-first convention ggp §2, p. 5, ggp line 179–190; relative complements pp. 5–7, ggp line 229–243).

The split comparison has the following API.

- Its forward and inverse maps satisfy the two slot formulas.
- It fixes every underlying vector, preserves identity isometries and respects composition.
- It identifies isometries and transports the supplied GL(A) identification with action (g,(g⁻¹)∨).
- It identifies the orthogonal submodule of every S, including on the zero module. Use the comparison on W, V and their complements when defining a relevant Hermitian pair and its frames.

**Checks for the split-form comparison.**

- For A=0 the unique perfect form, its slot swap and the inverse coincide; the map fixes the unique vector, the isometry group GL(0) is trivial, and the orthogonal of the zero submodule is zero. Requiring positive rank or assigning a nontrivial isometry group fails. This is the zero-module comparison on the supplier's carrier.
- For A=F, identify A∨ with F. With v=(1,0), w=(0,1), the values are k(v,w)=(0,1) and h(v,w)=(1,0), while both self-pairings are zero. The E-submodule F×{0} is its own orthogonal for both forms; the ambient form remains perfect. The vector (1,1) frames the line with norm (1,1), whereas v fails the split-line frame condition. Keeping the slots unchanged or treating E as a field fails.
- For A=F and t∈F×, the action (t,t⁻¹) preserves both k and h. Over ℚ take t=2: h((2,0),(0,1/2))=(1,0), whereas scaling both components by 2 gives (4,0). Both (2,1/2) and (2,1) satisfy the split-line frame condition, with norms 1 and 2 respectively. Thus preservation of the form requires inverse dual scaling, while a frame need not have norm one.

Provide a constructor of relevance from a complement isometry. Adjoining a hyperbolic basis and an E-basis vector e of L constructs a frame, which forgets to relevance.

- rank_E V=rank_E W+2r+1.

- Construct transport from isometries intertwining i: it preserves relevance and transports the hyperbolic basis and E-basis vector of a frame. Prove its identity and composition laws.

- Construct base change under scalar extension of fields, including splitting E, and prove it preserves the embedding and the displayed complement.

- Two framed witnesses with the same embedding, complement isometry, hyperbolic basis and E-basis vector e of L are equal; the basis and nonzero-norm proofs carry no extra choices.

*Needs:* Mathlib `LinearMap.Nondegenerate`; GeometryOfNumbersAndQuadraticArithmetic §2.9 field carrier and adjoint API; MetaplecticAutomorphicForms §3.2a split Hermitian carrier and GL(A) identification; contract gap hermitian-unitary.

**Checks.**

- (degenerate) W=0,V=<1>,r=0 is relevant; a definition requiring positive rank W fails.

- (computation) For W=0,V=H orthogonal-sum <1>,r=1 the rank is 3 and the maximal isotropic subspace has rank 1; a codimension-r convention fails.

- (non-example) A positive definite real Hermitian 3-space has no complement H orthogonal-sum L for W=0,r=1; both indefinite signatures (2,1) and (1,2) do.

- (non-example) For E=F×F and L=E with h(x,y)=x c(y), e₀=(1,1) generates L and has norm 1, whereas e=(1,0) is nonzero with norm 0 and Ee=F×{0}≠L. A frame constructor accepting every nonzero vector fails.

Use this interface for all Bessel constructions and pure-inner-form indexing.

On the standard split line the split-line frame condition says that e is a unit of F×F. Its intended domain is any field F; the surrounding Hermitian theory retains characteristic ≠2. A vector e frames the line exactly when e₁e₂≠0, by the native product-unit and field-unit criteria in the supplier contract. This uses the line norm h(e,e)=(e₁e₂,e₁e₂) and tests the basis-vector clause of a relevant Hermitian pair, without constructing the arbitrary-form supplier (ggp §12, p. 44, ggp line 1567–1569).

Its API is the native unit API specialized to the split algebra.

- A vector frames the line iff each coordinate is nonzero, equivalently its norm is nonzero.
- Multiplying frames gives a frame; the product of their norms is the norm of their product.
- A frame has an inverse frame, with reciprocal norm; coordinate equality determines the vector.

**Checks.**

- The vector (1,1) satisfies the split-line frame condition and has norm 1; a frame condition excluding this vector is false.
- The vector (1,0) is nonzero, has norm 0 and fails the split-line frame condition; accepting every nonzero vector loses the second split character coordinate.
- Over ℚ the vector (2,1) satisfies the split-line frame condition and has norm 2. Requiring norm one would reject this basis. The unit criterion retains its all-field scope.

### 1.2 Bessel subgroups and their characters

Construct the Bessel datum as follows. For a framed relevant pair construct the flag parabolic P stabilizing 0<X₁<⋯<X_r, its unipotent radical N, H=N⋊U(W), and the closed embedding (u,g)↦(u·i(g),g) into U(V)×U(W). For r>0 put b(u)=Σ_(j=1..r-1) h(u v_(j+1),v_j*)+h(u e,v_r*). Prove b:N→Res_(E/F) Ga is additive and U(W)-invariant. For a continuous unitary additive character ψ:E→S¹ nontrivial on every field factor put ν(u,g)=ψ(b(u)); for r=0 use N=1,b=0,ν=1. (ggp, §12, pp. 44–46; ggp line 1593; ggp line 1603; ggp line 1624; ggp line 1634).

Here F is a field of characteristic different from 2; E is a quadratic étale F-algebra with its nontrivial involution c; all Hermitian E-modules are finite free of constant rank and their forms are nondegenerate; a frame as in §1.1 with E-basis vector e of L is fixed; the character clause assumes F local and ψ nontrivial on each field factor.

Apply the algebraic parabolic and unipotent-radical contracts to the flag, then check the simple coordinates of a product. Their abelianization kills all cross terms. U(W) fixes the line and the flag, hence b. Representability and closedness use ReductiveGroups, not a set-theoretic subgroup argument.

- The embedding has first coordinate u·i(g) and second coordinate g, and is injective.

- b(u u′)=b(u)+b(u′); b(gug⁻¹)=b(u).

- ν is a unitary character extending ψ∘b and trivial on U(W).

- In codimension one H is the diagonal U(W) and ν=1.

- Characters with the stated values on N and U(W) agree.

*Needs:* this roadmap §1.1; ReductiveGroups Layer 0; ReductiveGroups Layer 3; ReductiveGroups Layer 5; ReductiveGroups Layer 7; Tau Ceti `TauCeti.HopfAlgebra.pointsFunctor`.

**Checks.**

- (degenerate) r=0 gives the diagonal subgroup, not the whole U(V)×U(W).

- (computation) For r=2 a unipotent with simple coordinates (x,z) has b=x+z; the character of a product with coordinates (x′,z′) is ψ(x+z+x′+z′). Omitting either coordinate fails.

- (compatibility) For E=F×F,W=0,r=1, use the first-factor basis (v,e₀,v*) and u=[[1,x,z],[0,1,y],[0,0,1]]. The second action is J⁻¹(u⁻¹)ᵗJ for the hyperbolic-plus-line Gram matrix J. The valid e₀=(1,1) gives b(u)=(x,-y) and ν=ψ₁(x)ψ₂(-y), with both simple coordinates nonzero as functionals. Replacing e₀ by (1,0)e₀ gives b(u)=(x,0), norm 0 and a character trivial on the second simple root (ggp §12, pp. 44–45, ggp line 1567–1569 and ggp line 1624–1634).

Use this interface for local models, global rational characters, relative trace distributions.

### 1.3 Isometry and auxiliary-data transport

Construct the transport of Bessel data as follows. An isometry of framed pairs induces an isomorphism of the embedded (H,ν) data. Changing flag, hyperbolic frame, line generator or generic additive data on a fixed pair gives a conjugate embedded model, with the induced intertwining maps on Hom spaces. Simultaneous scaling h_V,h_W by a∈F× preserves the underlying unitary groups and transports the relative data; over ℝ, a=-1 exchanges the two line signs. The transports respect identity and composition. (ggp, §12, p. 46; §18, pp. 71–72; ggp line 1637; ggp line 2503).

Here F is a field of characteristic different from 2; E is a quadratic étale F-algebra with its nontrivial involution c; all Hermitian E-modules are finite free of constant rank and their forms are nondegenerate; the two frames lie on isometric relevant pairs and their line vectors are E-basis vectors; local characters are nondegenerate on the indicated additive coordinates.

Use Witt extension to conjugate flags and the diagonal Levi to scale simple coordinates. Pull back characters and representation actions along this explicit conjugacy. Scaling the form cancels in its preservation equation.

For nonsplit coefficient fields, transport the imported `SignedHermitianSpace E V 1` and its W and complement counterparts through the field-form comparison. Its isometry and adjoint comparisons identify the same conjugating maps in both slot conventions. For split coefficients use the split-form comparison on the MetaplecticAutomorphicForms §3.2a carrier; its identity, isometry and orthogonal comparisons identify the same flag conjugacies and their compositions, with the supplied action (g,(g⁻¹)∨).

- Identity data induce identity group and model maps.

- Transport along a composite equals composite transport.

- ν′∘transport=ν when characters are transported with the frame.

- U(p,q)=U(q,p) as the matrix groups for a form and its negative; the complement line changes sign.

*Needs:* this roadmap §1.1 field-form and split-form comparisons; this roadmap §1.2; GeometryOfNumbersAndQuadraticArithmetic §2.9 field carrier and adjoint API; MetaplecticAutomorphicForms §3.2a split Hermitian carrier and GL(A) identification; contract gap hermitian-unitary.

**Checks.**

- (degenerate) An unchanged frame acts identically, not by taking duals.

- (computation) diag(1,-1) and diag(-1,1) have the same stabilizer equations; their distinguished final lines have opposite signs.

- (non-example) Keeping a changed additive character while freezing its coordinates does not give equality of characters; the assertion supplies a conjugacy, not literal equality.

Use this interface for normalisation independence in the local theorem and both real line signs.

### Examples

The zero smaller space, the split algebra F×F, and the real complements of signatures (r+1,r) and (r,r+1) exercise the same constructions. Rank zero is allowed algebraically; it is not added to a theorem whose source assumes n ≥ 1.

### Dependencies

Mathlib `LinearMap.Nondegenerate`; GeometryOfNumbersAndQuadraticArithmetic §2.9 field carrier and adjoint API; MetaplecticAutomorphicForms §3.2a split Hermitian carrier and GL(A) identification; contract gap hermitian-unitary; ReductiveGroups Layer 0; ReductiveGroups Layer 3; ReductiveGroups Layer 5; ReductiveGroups Layer 7; Tau Ceti `TauCeti.HopfAlgebra.pointsFunctor`.

## Layer 2: Local Bessel models, multiplicity one and tempered integrability

### 2.1 Local model spaces and pairing conventions

For local data of 1.2 define the Bessel model ℬ(π_V,π_W) as Hom_H(π_V|H tensor π_W|H,ν). At finite places this is the subspace of algebraic linear functionals satisfying ℓ(π_V(u i(g))v tensor π_W(g)w)=ν(u,g)ℓ(v tensor w). At infinity use continuous linear functionals on the completed projective tensor product. Define the Bessel multiplicity as its complex vector-space dimension, initially a cardinal; finite-dimensionality precedes its natural-number form. (ggp, §14, pp. 57–58; ggp line 2020; ggp line 2051; ggp line 2060; xue-real §2.2, p. 1000, xue-real line 196).

Here F is a local field of characteristic zero; E/F is quadratic étale; W embeds isometrically in V, with V/W isometric to H^r orthogonal-sum L for r≥0 and a nondegenerate line L; the representations are irreducible smooth admissible complex representations at finite places and irreducible Casselman–Wallach representations at infinite places.

Use the native intertwiner and tensor representation carriers; impose continuity as supplied by the analytic category. NoncommutativeGeometry N1 gives the completed-tensor bilinear description and density; AutomorphicFormsOnReductiveGroups §2.7 gives the nuclear smooth topology, and gap:archimedean-globalization compares with its smooth contragredient. Schur theory is not used to assert multiplicity here.

- A linear functional satisfying the displayed equivariance, continuous at infinity, belongs to the model.

- Equality on pure tensors determines a model functional, using density at infinity.

- Intertwining isomorphisms and 1.3 transport induce linear equivalences of models.

- For r=0, currying identifies the model with intertwiners π_V→π_W^∨ in the supplied smooth dual category; at infinity require the corresponding continuous bilinear/smooth-dual adapter.

- Once finite-dimensional, the cardinal dimension is the cast of `Module.finrank` ℂ.

*Needs:* this roadmap §1.2; this roadmap §1.3; Mathlib `Representation.IntertwiningMap`; Mathlib `Representation.tprod`; contract gap local-categories; NoncommutativeGeometry §N1; AutomorphicFormsOnReductiveGroups §2.7; contract gap archimedean-globalization.

**Checks.**

- (degenerate) For H=1 and both spaces ℂ, evaluation at 1⊗1 is a linear equivalence of the model with ℂ, inverse c↦(z⊗w↦czw), so its finrank is 1. This is the trivial-character specialization of the scalar-character equivalence below.

- (computation) On U(1)=Circle, let z act by zx on the first line and z⁻¹y on the second. Evaluation at 1⊗1 identifies the invariant model with ℂ, with multiplication as its nonzero inverse image of 1 and finrank 1. With weights 1 and 1, z=i acts by -1 on the tensor and by +1 on the trivial target, forcing every invariant functional to vanish on 1⊗1 and hence on every pure tensor; the model has finrank 0. Omitting the dual fails.

- (compatibility) At a finite place the defining equations coincide with `Representation.IntertwiningMap` into the one-dimensional representation ν, not Hom into the trivial representation when ν≠1.

Use this interface for Every multiplicity statement; global local obstruction and period comparisons.

The linear-first pairing B(x,y) is the native positive complex inner product with its two slots exchanged. It is defined for every complex inner-product space, without a completeness or finite-dimensionality hypothesis, and fixes the convention for local matrix coefficients and Petersson polarization (harris pairings, pp. 2–3, harris line 75–111; Mathlib Analysis/InnerProductSpace/Basic.lean).

Its API is the native inner-product API after swapping slots.

- The pairing is linear in its first slot and conjugate-linear in its second.
- Exchanging the slots conjugates the value; its diagonal value is real and positive on nonzero vectors.
- It vanishes if either argument is zero.

**Checks.**

- The value of the linear-first pairing on (i,1) is i and on (1,i) is −i. Leaving the slots in their native order reverses the signs.
- For every complex c and vectors x,y, the linear-first pairing sends (cx,y) to cB(x,y) and (x,cy) to conjugate(c)B(x,y). Omitting conjugation fails at c=i.
- On (0,x) and (x,0), the linear-first pairing is 0. Both values also hold in the zero vector space.

For representations ρV and ρW already restricted to a group H, and an actual representation ν of H on ℂ, take the algebraic Bessel model to be the native intertwiner space from their tensor to ν. It makes no smoothness or topological assertion. The native `Representation.IntertwiningMap.isIntertwining`, evaluated on a pure tensor, gives for ℓ in this space, h∈H and v,w, ℓ(ρV(h)v⊗ρW(h)w)=ν(h)(ℓ(v⊗w)). For the Bessel character line this is multiplication by ν(h), with no inverse (ggp §14, p. 58, ggp line 2051–2060).

Use the native intertwiner API for this algebraic specialization.

- The native constructor turns a linear functional satisfying the displayed equivariance into an intertwiner.
- Equality on pure tensors determines an intertwiner; sums and scalar multiples preserve equivariance.
- `Representation.IntertwiningMap.isIntertwining` and `Representation.tprod_apply` give the displayed evaluation identity. The analytic Bessel model above also imposes its specified topology.

**Checks.**

- For any scalar character ν on the first factor and target, with trivial action on the second factor, evaluation at 1⊗1 is a linear equivalence with ℂ and the model has finrank 1. Its inverse at 1 is multiplication, with values 1 on 1⊗1 and i on i⊗1.
- If h fixes v and w while acting by −1 on the target line, every member of the algebraic Bessel model vanishes on v⊗w.
- If ν(h)1=i in the scalar-character example, translating 1⊗1 gives i⊗1 and its functional value is i. The native intertwiner equation uses ν, while the inverse-character convention would prescribe −i. The full unitary-weight Check above supplies the dual-convention witness.

### 2.2 Adjacent invariant distributions

For an adjacent unitary pair U(W)⊂U(V) over a characteristic-zero local field with quadratic étale coefficients, construct an algebraic anti-involution ι of U(V) preserving U(W) such that every distribution on U(V) invariant under conjugation by U(W) is invariant under pullback by ι. For nonsplit coefficients an orthogonal basis gives ι(g)=c₀g⁻¹c₀, where c₀ is coefficient conjugation; in the split GL realization use the corresponding transpose anti-involution. Include the representation/contragredient identities needed by the Gelfand–Kazhdan criterion. (agrs, Theorem 2′, p. 3, agrs line 80–83; split Theorem 2, p. 2, agrs line 35–40; sun-zhu Theorem A, pp. 1–2, sun-zhu line 49–54).

Here F is a local field of characteristic zero; E/F is quadratic étale; W embeds isometrically in V, with V/W isometric to H^r orthogonal-sum L for r≥0 and a nondegenerate line L; the representations are irreducible smooth admissible complex representations at finite places and irreducible Casselman–Wallach representations at infinite places; r=0; distributions are continuous duals of the supplied compactly supported locally constant or smooth test spaces, with generalized functions at infinity.

Linearize equivariant distributions near semisimple strata. Decompose the centralizer action into lower-rank classical models, then use Fourier support and the nilpotent descent argument to kill anti-invariant distributions. The distribution-gk contract requested from AutomorphicSpectralTheory supplies only the general descent, Fourier uncertainty and criterion; the relative symmetry itself is this target.

- ι(ι(g))=g and ι(gg′)=ι(g′)ι(g).

- ι preserves the embedded smaller unitary group.

*Needs:* this roadmap §1.3; contract gap distribution-gk; NoncommutativeGeometry §N1; AutomorphicFormsOnReductiveGroups §2.7; contract gap archimedean-globalization.

**Checks.**

- (degenerate) In rank 1, coefficient conjugation sends a norm-one z to z⁻¹, hence c₀g⁻¹c₀=g; inversion alone would be wrong.

- (computation) On split GL₂, ι([[1,x],[0,1]])=[[1,0],[x,1]]; the order of a product is reversed.

- (non-example) The identity is not an anti-automorphism of a noncommutative rank-2 group.

Use this interface for the adjacent multiplicity bound.

### 2.3 Adjacent multiplicity one

Prove that for local data under the hypotheses below, with r=0, the Bessel model is finite-dimensional and its finrank is at most 1, for split and nonsplit E and all inner forms. (agrs, Theorem 1′, p. 2, agrs line 59; sun-zhu Theorem B, p. 2, sun-zhu line 66; ggp Theorem 14.1(ii), p. 58, ggp line 2071).

Here F is a local field of characteristic zero; E/F is quadratic étale; W embeds isometrically in V, with V/W isometric to H^r orthogonal-sum L for r≥0 and a nondegenerate line L; the representations are irreducible smooth admissible complex representations at finite places and irreducible Casselman–Wallach representations at infinite places; r=0.

Apply the symmetry theorem 2.2 and its contragredient identities to the supplier’s general Gelfand–Kazhdan criterion, then use the tensor/smooth-dual adapter of 2.1. This proves finite-dimensionality and the bound without a temperedness assumption.

*Needs:* this roadmap §2.1; contract gap distribution-gk; contract gap local-categories; this roadmap §2.2.

**Checks.**

- (degenerate) U(0)⊂U(1) gives finrank 1 for a character.

- (compatibility) A ramified quadratic extension of ℚ₂ is within the finite-place statement.

- (compatibility) GL₂(R)↓GL₁(R) lies in the same theorem; compactness is not an assumption.

Use this interface for the reductions 2.4–2.6.

### 2.4 Nonarchimedean reduction to adjacent pairs

Over a nonarchimedean characteristic-zero F, let W′=V orthogonal-sum (-L), with the chosen totally isotropic Y=X⊕E(e+f) of rank r+1, where e spans L and f spans -L, so W′=Y⊕W⊕Y∨ and the stabilizer of Y has Levi GL_E(Y)×U(W). For a supercuspidal τ of GL_E(Y), use unnormalized I(τ,π_W). If π_V^∨ belongs to none of the Bernstein components [GL_E(Y′)×U(V′),τ⊠μ] with rank Y′=r+1 and μ irreducible, there is a linear equivalence Hom_(U(V))(I(τ,π_W) tensor π_V,ℂ)≃ℬ(π_V,π_W). Moreover τ can be chosen with this exclusion and I irreducible. (ggp, Theorem 15.1 and Corollary 15.2, pp. 60–63; ggp line 2152; ggp line 2158; ggp line 2217; ggp line 2233).

Here F is a local field of characteristic zero; E/F is quadratic étale; W embeds isometrically in V, with V/W isometric to H^r orthogonal-sum L for r≥0 and a nondegenerate line L; the representations are irreducible smooth admissible complex representations at finite places and irreducible Casselman–Wallach representations at infinite places; F is nonarchimedean; r≥1.

Mackey restricts I to open and closed orbits. The Bernstein exclusion kills the closed orbit; the mirabolic restriction of τ, induction in stages and Frobenius reciprocity give the open-orbit model. First choose auxiliary supercuspidal inertial classes outside the fixed finite supports; then choose unramified twists avoiding the reducibility locus inside those classes. These generic induction/Bernstein facts are requested in local-bernstein; the mirabolic restriction is requested separately in local-mirabolic.

- The open-orbit compact induction is induction from H of π_W tensor ν⁻¹.

- The Hom equivalence commutes with intertwiners of π_V and π_W.

*Needs:* this roadmap §2.1; contract gap local-categories; contract gap local-bernstein; contract gap local-mirabolic.

**Checks.**

- (computation) r=1 uses GL₂(E) auxiliary data and a rank-2 isotropic Y; GL₁ would have the wrong dimensions.

- (non-example) If the forbidden Bernstein component occurs, the closed-orbit quotient need not vanish; no unconditional Hom equivalence is asserted.

- (compatibility) Only τ is chosen supercuspidal; π_V and π_W remain arbitrary irreducible admissible representations.

- (computation) For GL₂ with upper B and diag(a,1), δ_B=|a|. Normalized induction inserts |a|^(1/2); target 2.4 uses unnormalized induction, so silently inserting this factor changes its stated representation.

- (non-example) For W=H and r=1, V=H² orthogonal-sum L and W′≃H³. The chosen Y has rank 2, while the Witt index of W′ is 3: an isotropic line in W extends Y. The residual U(W) is retained, without an anisotropy hypothesis.

Use this interface for nonarchimedean multiplicity one and split generic nonvanishing.

### 2.5 Archimedean reduction on finite-dimensional subspaces

Prove that for archimedean local data under the stated hypotheses and r≥1, given π_V,π_W and any finite-dimensional subspace S of ℬ(π_V,π_W), there are auxiliary generic GL_(r+1)(E) data and a complex induction parameter s such that the adjacent-pair induced representation is irreducible Casselman–Wallach and the Jiang–Sun–Zhu integral gives an injective linear map from S to its adjacent-pair invariant bilinear forms. The parameter is allowed to depend on S. (jsz-bessel, Theorem A and §3, Propositions 3.3–3.4; pp. 1–2, 6–8; jsz-bessel line 24; jsz-bessel line 215; jsz-bessel line 260–283).

Here F is a local field of characteristic zero; E/F is quadratic étale; W embeds isometrically in V, with V/W isometric to H^r orthogonal-sum L for r≥0 and a nondegenerate line L; the representations are irreducible smooth admissible complex representations at finite places and irreducible Casselman–Wallach representations at infinite places; F is ℝ or ℂ; r≥1.

Use NoncommutativeGeometry N1 for completed tensors and AutomorphicFormsOnReductiveGroups §2.7 `seminormEstimate` for ordinary growth. The residual gap:archimedean-seminorms supplies vector-valued Whittaker decay and the Haar/Cartan comparison. Apply Propositions 3.3 and 3.4 on a finite basis of S to choose a common half-plane, then Proposition 3.1 to choose an irreducible inducing parameter. The integral is nonzero on every nonzero functional in S. Only finite-dimensional S is embedded; no uniform half-plane for the full Hom space is assumed.

- The integral defines an invariant continuous bilinear functional.

- For every finite-dimensional S there is a common right half-plane of convergence; a generic irreducible parameter there gives an injective map on S.

*Needs:* this roadmap §2.1; NoncommutativeGeometry §N1; AutomorphicFormsOnReductiveGroups §2.7; contract gap archimedean-globalization; contract gap archimedean-generic-induction; contract gap archimedean-seminorms.

**Checks.**

- (computation) The first higher-codimension case r=1 uses an auxiliary GL₂ and an adjacent-rank pair.

- (compatibility) Negating both forms transports the source convention q≥r+1 to the other line sign.

- (non-example) No injection at every complex s or at a pole of the inducing integral is claimed.

Use this interface for all archimedean odd-codimension multiplicity bounds.

### 2.6 Multiplicity one in every relevant odd codimension

Prove that for every local pair and representation pair under the stated hypotheses, the Bessel model is finite-dimensional and its multiplicity is at most 1, without temperedness or supercuspidality assumptions on π_V,π_W. (ggp, Corollary 15.2, p. 63, ggp line 2229; jsz-bessel Theorem A, pp. 1–2, jsz-bessel line 24).

Here F is a local field of characteristic zero; E/F is quadratic étale; W embeds isometrically in V, with V/W isometric to H^r orthogonal-sum L for r≥0 and a nondegenerate line L; the representations are irreducible smooth admissible complex representations at finite places and irreducible Casselman–Wallach representations at infinite places.

Use 2.3 directly for r=0. At finite places choose τ in 2.4 and apply 2.3 to I. At infinity apply 2.5 to any finite-dimensional subspace S of the model; 2.3 gives dim S≤1. A two-dimensional subspace would therefore be impossible, proving finite-dimensionality and the claimed bound.

*Needs:* this roadmap §2.3; this roadmap §2.4; this roadmap §2.5; this roadmap §1.3.

**Checks.**

- (degenerate) W=0 gives the generic Whittaker uniqueness bound.

- (compatibility) Both real complement signs satisfy the bound by 1.3.

- (non-example) The U(2) standard representation paired with U(1) weight 1 has multiplicity 0, so ≤1 cannot be replaced by =1.

Use this interface for local packets; period factorization; unitary Bessel descents.

### 2.7 Adjacent tempered integrability

Prove that for any characteristic-zero local F, quadratic étale E/F, nondegenerate adjacent pair W⊂V, unitary tempered irreducible π_V,π_W, and smooth vectors v,w in their tensor representation σ, the integral I(v,w)=∫_(U(W)(F)) <σ(t)v,w> dt converges absolutely. Prove the stronger basic estimate ∫_(U(W)(F)) Ξ_(U(V))(t) Ξ_(U(W))(t)(1+lognorm(t))^d dt<∞ for every fixed d≥0 with compatible special maximal compact subgroups and the source proper log-norm. (harris, Proposition 2.1 and proof, pp. 5–8; harris line 230–250; bpcz §1.1.6, p. 4, bpcz line 166).

Here F is a local field of characteristic zero; E/F is quadratic étale; W embeds isometrically in V, with V/W isometric to H^r orthogonal-sum L for r≥0 and a nondegenerate line L; the representations are irreducible smooth admissible complex representations at finite places and irreducible Casselman–Wallach representations at infinite places; r=0; both representations are unitary tempered; inner products are positive definite invariant and linear in the first argument.

Apply matrix-coefficient bounds by Ξ times powers of the proper logarithmic norm. In relative Cartan coordinates the adjacent root exponents are strictly negative at infinity after the Haar Jacobian, so polynomial log factors remain integrable. Split, real and nonarchimedean root calculations belong to this theorem; the individual group bounds and integration formula are upstream.

*Needs:* this roadmap §1.2; contract gap local-tempered-bounds.

**Checks.**

- (computation) For W of rank 1 over ℂ/ℝ and inverse weights, I(1,1)=vol(U(1)).

- (compatibility) GL_n(F) inside GL_(n+1)(F) requires the decay of both factors; neither Haar finiteness nor compactness is used.

- (non-example) For split GL₂×GL₁ with both representations trivial, I(1,1)=∫_(F×)1 dt diverges; temperedness cannot be dropped.

Use this interface for Normalized local forms, local relative characters and the unitary portion of the microlocal G8 obligation.

### Examples

For compact U(2)↓U(1), the standard representation restricts with weights 1 and 0. Pairing it bilinearly with weight -1 or 0 gives dimension 1; pairing with weight 1 gives 0. The rank-one group over the zero smaller space gives dimension 1 for every one-dimensional representation.

### Dependencies

this roadmap §1.2; this roadmap §1.3; Mathlib `Representation.IntertwiningMap`; Mathlib `Representation.tprod`; contract gap local-categories; NoncommutativeGeometry §N1; AutomorphicFormsOnReductiveGroups §2.7; contract gap archimedean-globalization; contract gap distribution-gk; contract gap local-bernstein; contract gap local-mirabolic; contract gap archimedean-generic-induction; contract gap archimedean-seminorms; contract gap local-tempered-bounds.

## Layer 3: Root-number characters and the tempered local theorem

### 3.1 Epsilon characters and central multiplicities

For the stated tempered parameter data construct χ=(χ_W,χ_V):A_(φ_V)×A_(φ_W)→{±1}. If s is represented by an involution in the parameter centralizer, set χ_W(s)=ε(1/2,φ_V^(s=-1) tensor φ_W,ψ_E), and interchange V,W for χ_V. Prove independence of lift and conjugate-dual form and the character law. On the generator for a distinct appropriate-sign irreducible ρ this is ε(1/2,ρ tensor φ_W,ψ_E), with one copy of ρ, not its full multiplicity. The central element z_φ is the image of -Id and includes the multiplicities modulo two. (ggp, Theorem 6.1, pp. 20–21, ggp line 728; Hermitian clause of §17, p. 69, ggp line 2425; bp-refined §8.1, pp. 64–65, bp-refined line 2626).

Here E/F is a quadratic field extension of nonarchimedean characteristic-zero local fields, or ℂ/ℝ; dim V=n+2r+1 and dim W=n, n,r≥0; φ_V and φ_W are tempered parameters of signs (-1)^(dim V-1) and (-1)^(dim W-1); the actual enhanced correspondence uses the compatible Whittaker datum and a nontrivial additive ψ_E trivial on F; pure inner forms are indexed by Hermitian spaces and restricted to the fixed complement H^r orthogonal-sum L.

On the shared carrier for Langlands packets, let C_φ be the centralizer of the full unitary L-parameter in the dual GL_m, equivalently the form-preserving centralizer of its conjugate-dual restriction. Use A_φ=π₀(C_φ), retaining z_φ=[−Id]. The refined group paired with extended pure inner twists is S_φ♮=C_φ/(C_φ∩SL_m)°. For nonsplit E/F the projection induces S_φ♮≃A_φ; the fixed dual center {±1} maps to the subgroup generated by z_φ. The quasi-split central quotient of ModularityAndLanglandsExtensions §3.13 is therefore A_φ/⟨z_φ⟩. Prove these identifications with their quotient maps: a character of A_φ descends to the quasi-split quotient exactly when its value at z_φ is +1, whereas the shared pure-inner-twist pairing has value χ_z(−1) there. The comparison preserves the chosen Whittaker datum, the inner-twist central restriction and their transport under a change of datum or twist. At real places it retains injectivity on each form and the supplied bijection over the specified union, without asserting surjectivity on one form. In the split case retain the supplier’s refined group and central restriction directly: its component group is trivial, but its refined group need not be finite (kmsw §0.4.4, pp. 27–28, kmsw line 1074–1113; §1.2.4, p. 62, kmsw line 2578–2619; bp-refined §7.2, p. 53, bp-refined line 2224–2225).

The carrier comparison is made here after both suppliers and is used throughout §§3.1–3.9; the epsilon-character calculation below is its relative specialization.

Decompose the centralizer into orthogonal, symplectic and general linear factors. Multiplicativity of epsilon factors and the conjugate-orthogonal sign identity kill changes inside the identity component and changes of involution lift. The orthogonal component coordinates give the asserted character.

- The two sets of generator values are the epsilon factors just displayed.

- χ(s+s′)=χ(s)χ(s′) in additive component notation.

- Equality of all appropriate-sign generator values implies equality of characters.

- χ_W(z_(φ_V))=χ_V(z_(φ_W))=ε(1/2,φ_V tensor φ_W,ψ_E).

*Needs:* contract gap enhanced-packets; ModularityAndLanglandsExtensions §3.13 central-quotient parameters; contract gap factor-epsilon-identities.

**Checks.**

- For a degree-one parameter over a nonsplit quadratic extension of ℚ₂ or ℚ₃, C_φ={±1}, A_φ=S_φ♮ has order 2 and z_φ is its nonidentity element, while A_φ/⟨z_φ⟩ has order 1. The two characters give values +1 and −1 at z_φ; the quotient retains only the first. Thus a quotient enhancement cannot encode the nontrivial pure-inner-twist central restriction, even when the rank-one groups are isomorphic.
- For one appropriate-sign irreducible of multiplicity 2, C_φ=O₂(ℂ), A_φ has order 2 and z_φ=0, so its quasi-split quotient still has order 2. Treating the central element as the single generator would instead give order 1.
- For split GL₁ the centralizer and refined group are ℂ×, while the component group has order 1; for the zero parameter all three groups have order 1. A finite sign group cannot replace the refined group at split places.

- (degenerate) φ_W=0 gives χ_W=1; tensoring with the zero parameter has epsilon 1.

- (computation) For E/F=ℂ/ℝ take φ_V=χ₁⊕χ₋₁, φ_W=1, with χ_j(z)=(z/|z|)^j and any fixed nontrivial ψ_E trivial on ℝ. These have signs - and +. The two generator values are ε(χ₁,ψ_E), ε(χ₋₁,ψ_E), and their product is χ₁(-1)=-1 by epsilon duality. Hence the epsilon character gives χ_W(z_(φ_V))=-1; the constant character fails (ggp §5, p. 16, ggp line 598–601).

- (non-example) For E/F=ℂ/ℝ take φ_V=χ₁⊕χ₁ and φ_W=1, and choose the sign of ψ_E trivial on ℝ giving ε(χ₁,ψ_E)=-1; scaling ψ_E by -1 reverses this sign since χ₁(-1)=-1. Then the epsilon character has value -1 on the single component generator but +1 on z_(φ_V)=0, whose multiplicity is even. Using the whole multiplicity at the generator would wrongly give +1 (ggp §5, p. 16, ggp line 598–601; Theorem 6.1, p. 20).

Use this interface for the enhancement formula in §3.6 and normalisation transport in §3.2.

Write the finite sign group additively as functions I→ℤ/2. For a family of actual constituent multiplicities d:I→ℕ, its component central element z_d has coordinates dᵢ modulo two. Prove the central-element character identity: for finite I with a chosen decidable equality and every additive character χ:(I→ℤ/2)→ℤ/2, χ(z_d)=Σᵢ(dᵢ mod 2)χ(eᵢ), where eᵢ is the single-coordinate generator. This elementary component calculation is used after the actual centralizer has been identified; it is not an encoding of an enhanced correspondence (ggp §4, pp. 14–15, ggp line 510–548; §6, p. 20, ggp line 720–730).

The coordinate description has the following API.

- Each coordinate of z_d is its multiplicity modulo two.
- Applying any additive character to z_d gives the displayed finite sum, using `pi_eq_sum_univ'` and the additive-map finite-sum law.
- Reindexing transports the same coordinate function and preserves its character evaluations.

**Checks.**

- A singleton constituent of multiplicity 2 has component central element zero while its component generator is nonzero.
- Two distinct constituents of multiplicity 1 give both central coordinates; the empty parameter gives the unique empty element.
- On Fin 2→ZMod 2, the additive character χ(x)=x(0)+x(1) has χ(e₀)=χ(e₁)=1 and, for constant multiplicity 1, χ(z_d)=0. Multiplying the two nontrivial signs gives the trivial sign. The epsilon example above instead has generator values whose product is −1.

### 3.2 Whittaker normalization and enhancement transport

For the stated tempered parameter data, replace ψ_E by ψ_E(t·), t∈F×. Prove that on each component s of A_(φ_V) the distinguished character is multiplied by det(φ_V^(s=-1) tensor φ_W)(t), and likewise on W. Under the corresponding change of Whittaker datum the actual labeling of Langlands packets changes by exactly these characters; simultaneous scaling of the two Hermitian forms and transport of their Whittaker data gives the same represented Bessel pair under 1.3. (ggp, Theorem 6.1(3), p. 20, ggp line 732; §18, pp. 71–72, ggp line 2503–2519).

Here E/F is a quadratic field extension of nonarchimedean characteristic-zero local fields, or ℂ/ℝ; dim V=n+2r+1 and dim W=n, n,r≥0; φ_V and φ_W are tempered parameters of signs (-1)^(dim V-1) and (-1)^(dim W-1); the actual enhanced correspondence uses the compatible Whittaker datum and a nontrivial additive ψ_E trivial on F; pure inner forms are indexed by Hermitian spaces and restricted to the fixed complement H^r orthogonal-sum L.

Apply the epsilon change-of-additive-character formula at s=1/2 and the supplier’s Whittaker-change theorem, then use 1.3. This is an assertion about that correspondence, not about an arbitrary bijection of finite sets.

*Needs:* this roadmap §1.3; this roadmap §3.1; contract gap enhanced-packets; contract gap factor-epsilon-identities.

**Checks.**

- (computation) For dim φ_V=2, dim φ_W=1 and an appropriate one-dimensional summand on V, t in the nonnorm class changes its enhancement sign by -1; the W label is unchanged.

- (compatibility) For t a norm from E×, the label change is trivial.

- (compatibility) For ℂ/ℝ, t=-1 realizes the nonnorm change. The model transport and the relabeling must be applied together.

Use this interface for Choice-independent local theorem, real line-sign conversion.

### 3.3 Regularized tempered Bessel forms

For any relevant nonsplit characteristic-zero local pair and a finite-length unitarizable tempered representation π of U(V)×U(W), construct the continuous relative sesquilinear form L_π(v,w) by the regularized H-integral of the matrix coefficient times ν⁻¹ in the linear-first convention. For r=0 it is the ordinary absolutely convergent integral. For arbitrary r it is the stable/continuous extension of the Fourier-cutoff integrals of bp-arch §7.1, not an unqualified Haar integral. Prove L_π≠0 iff Hom_H(π,ν)≠0; normalized tempered induction from a Levi preserves this nonvanishing after deleting its GL factors. (bp-arch, §§7.1–7.4; Theorem 7.2.1, p. 181, bp-arch line 6813–6814; Proposition 7.4.1, p. 192, bp-arch line 7165–7166; xue-real Propositions 2.3–2.4, p. 1001, xue-real line 238).

Here F is a local field of characteristic zero; E/F is quadratic étale; W embeds isometrically in V, with V/W isometric to H^r orthogonal-sum L for r≥0 and a nondegenerate line L; π is finite-length unitarizable tempered; the last assertion uses actual normalized induction and the residual GGP Levi pair; E/F is a quadratic field extension; the split model is handled separately.

Build the regularized integral using the Fourier extension and polynomial bounds, identify its image in the distributional model, then unfold normalized induction and use the supplied Plancherel theorem to prove the converse. The induction statement is for the entire induced representation, not every constituent individually.

- L_π(π(h)v,w)=ν(h)L_π(v,w), with the conjugate law in w.

- Intertwining unitary equivalences and isometries transport the form with the supplied measures.

- For irreducible π the associated map to the distribution dual has rank at most 1 and is nonzero exactly when m(π)=1.

- For r=0, L_π(v,w)=∫_(U(W)) <π(t)v,w> dt in the source linear-first pairing.

*Needs:* this roadmap §2.6; contract gap local-categories; NoncommutativeGeometry §N1; AutomorphicFormsOnReductiveGroups §2.7; contract gap archimedean-globalization; contract gap local-tempered-bounds; contract gap local-plancherel; contract gap local-fourier-extension; this roadmap §2.7.

**Checks.**

- (degenerate) For H=1 of Haar mass a>0, L(v,w)=a<v,w>; forgetting the measure fails.

- (computation) For U(1) of mass 1 and two characters with sum weight k, L(1,1)=1 when k=0 and 0 when k≠0.

- (non-example) For r>0 the definition requires regularization; it does not assert absolute convergence of the full H-integral.

Use this interface for Higher-codimension real reduction, local trace formula and microlocal unitary relative forms.

### 3.4 Geometric multiplicity

Construct the geometric Bessel multiplicity as follows. For a relevant nonsplit local pair define Γ(G,H) to be the semisimple U(W)-conjugacy classes x for which U(im(x-1))_x is an anisotropic torus. Write W=ker(x-1) orthogonal-sum im(x-1). Give Γ the torus quotient measure with each anisotropic torus of mass 1 and rational Weyl-group divisor. Set D_G(x)=|det(1-Ad(x) on g/g_x)|, D_H analogously and Δ=D_G D_H⁻². For a Harish–Chandra quasi-character θ, put c_θ(x)=0 if the regular-nilpotent orbit set in g_x is empty; otherwise let c_θ(x) be the average of its finitely many germ coefficients, normalized by the supplied Fourier orbital measures. Define m_geom(θ)=lim_(s→0+) ∫_Γ D_G(x)^(1/2)c_θ(x)Δ(x)^(s-1/2) dx. Prove convergence for Re(s)>0, existence of the limit, continuity, semisimple descent, and compatibility with normalized parabolic induction. (bp-arch, §11.1, pp. 259–260, bp-arch line 10054–10078 (Γ measure); equation (11.2.1), p. 263, bp-arch line 10204–10208 (Δ); Proposition 11.2.1, pp. 265–266, bp-arch line 10248; Lemma 11.3.1, p. 272, bp-arch line 10538–10539; §4.5, Proposition 4.5.1(1)(i), p. 106, bp-arch line 3994–4000).

Here F is a local field of characteristic zero; E/F is quadratic étale; W embeds isometrically in V, with V/W isometric to H^r orthogonal-sum L for r≥0 and a nondegenerate line L; θ is a quasi-character in the supplied Harish–Chandra space; all discriminants are on the indicated centralizer quotients; E/F is a quadratic field extension; the split model is handled separately.

Stratify by the fixed and moving Hermitian spaces. The germ estimates and determinant power integrability establish absolute convergence; semisimple descent reduces the limit to smaller dimension, with Lie-algebra Fourier descent at identity. General germ theory is requested in local-schwartz-germs; its analytic Fourier extension and Plancherel inputs have separate contracts.

Use `SignedHermitianSpace E W 1` and its restrictions to the fixed and moving subspaces through the field-form comparison of §1.1. The orthogonal and adjoint comparisons give the same unitary centralizers and the same operators on the centralizer quotients; the discriminants and the norm determinant in the API are unchanged by the slot convention.

At the split comparison boundary, the split-form comparison of §1.1 likewise identifies the fixed and moving orthogonal submodules and their isometry centralizers with the supplied GL(A) model. This algebraic identification supplies no split geometric-multiplicity formula: the theorem in this subsection assumes nonsplit E/F, and split Bessel multiplicities use §§3.10–3.11.

- m_geom is a continuous complex-linear functional on quasi-characters.

- Δ(x)=|N_(E/F)det(1-x on im(x-1))|; the determinant of a zero-dimensional quotient is 1.

- Descent near a semisimple x carries the torus measure and discriminant Jacobian to those of its residual GGP triple.

- For a Levi L=L_GL×G̃, m_geom(i_L^G(θ_GL tensor θ̃))=c_(θ_GL)(1)m_geom(θ̃).

*Needs:* this roadmap §1.1 field-form and split-form comparisons; this roadmap §1.2; GeometryOfNumbersAndQuadraticArithmetic §2.9 field carrier and adjoint API; MetaplecticAutomorphicForms §3.2a split Hermitian carrier and GL(A) identification; contract gap local-schwartz-germs; contract gap hermitian-unitary.

**Checks.**

- (degenerate) At x=1 the zero moving-space determinant is 1, not det(1-x on all W)=0.

- (computation) For W=C of rank 1 and x=-1, |N_(ℂ/ℝ)(1-x)|=4. Reversing the determinant ratio gives 1/4.

- (compatibility) m_geom(0)=0; torus masses alone cannot be the integrand.

- (degenerate) For compact U(2)×U(1) at x=1, the moving space is zero and x lies in Γ, but g_x has no regular nilpotent orbit. Thus c_θ(1)=0; the integrand has no division by the empty set cardinality and this inner form is not excluded.

Use this interface for Geometric multiplicity and stable cancellation across Langlands packets.

### 3.5 The local relative trace formula

Prove that for every relevant nonsplit local pair, the relative trace distribution J(f)=∫_(H(F)\G(F)) K_f(x,x)dx, with K_f(x,y)=∫_H^* f(x⁻¹hy)ν(h)⁻¹dh, on strongly cuspidal Harish–Chandra Schwartz functions has geometric expansion J(f)=m_geom(θ_f), and its spectral expansion in tempered characters has coefficient the Bessel multiplicity. Consequently m(π)=m_geom(θ_π) for every irreducible tempered π. Include the Lie-algebra identity J_Lie(f)=m_geom,Lie(θ_f) for strongly cuspidal Lie Schwartz f. (bp-arch, Theorems 11.4.1–11.4.3, p. 273, bp-arch line 10551–10558; bp-unitary-tempered Theorem 17.1.1, p. 100, bp-unitary-tempered line 5003).

Here F is a local field of characteristic zero; E/F is quadratic étale; W embeds isometrically in V, with V/W isometric to H^r orthogonal-sum L for r≥0 and a nondegenerate line L; the representations are irreducible smooth admissible complex representations at finite places and irreducible Casselman–Wallach representations at infinite places; π_V and π_W are tempered; f is strongly cuspidal in the stated Schwartz space; E/F is a quadratic field extension; the split model is handled separately.

Define J by integrating the relative Schwartz kernel on H\G with the source truncation. Use the supplied Plancherel expansion and 3.3 for its spectral expression. Semisimple descent, Lie Fourier inversion and induction on dim G give the geometric expression. Compare coefficients using elliptic tempered character independence, treating proper-Levi inductions with 3.4. Generic germ, estimate and Plancherel facts have separate local-analysis contracts; the relative trace and its equality are owned here.

*Needs:* this roadmap §3.3; this roadmap §3.4; contract gap local-schwartz-germs; contract gap local-tempered-bounds; contract gap local-plancherel.

**Checks.**

- (degenerate) W=0 leaves the regular Whittaker germ contribution; no torus of positive dimension is forced.

- (compatibility) Real indefinite groups require the regularized trace and Schwartz estimates, not compact-group traces.

- (compatibility) Normalized induction matches the factor c_(θ_GL)(1) of 3.4.

Use this interface for uniqueness within Langlands packets and the nonarchimedean epsilon criterion.

### 3.6 The component-character Fourier identity

For the stated nonarchimedean tempered parameter data, let G₀ be the even-dimensional member and G₁ the odd-dimensional member of the relevant pair. Let μ∈{±1} be the pure-inner-form invariant in the compatible quasi-split reference, ε=ε(1/2,φ₀ tensor φ₁,ψ_E). For s∈A_(φ₀),t∈A_(φ₁), prove Σ_(η₀,η₁ in the actual packets on this pair) η₀(s)η₁(t)m(π_(η₀),π_(η₁))=χ₁(s)χ₀(t)(1+με)/2. The labeling and μ are those transported from the classification, including its central restrictions. (bp-refined, §8.6, equation (1), pp. 71–72; bp-refined line 2880–2908).

Here E/F is a quadratic field extension of nonarchimedean characteristic-zero local fields, or ℂ/ℝ; dim V=n+2r+1 and dim W=n, n,r≥0; φ_V and φ_W are tempered parameters of signs (-1)^(dim V-1) and (-1)^(dim W-1); the actual enhanced correspondence uses the compatible Whittaker datum and a nontrivial additive ψ_E trivial on F; pure inner forms are indexed by Hermitian spaces and restricted to the fixed complement H^r orthogonal-sum L; F is nonarchimedean; μ refers to the fixed relevant pair, not an independently chosen sign.

Transfer the quasi-character multiplicity integral under endoscopy using geometric transfer from ordinary-endoscopy and the stable/twisted character identities for the actual Langlands packets supplied solely by enhanced-packets. Separate the ± eigensummands; use the epsilon comparison and Whittaker normalization to compute the transfer constants. This produces the Fourier formula. Finite character inversion then recovers multiplicities; the supplier contract does not assume this formula.

*Needs:* this roadmap §3.1; this roadmap §3.5; contract gap enhanced-packets; contract gap ordinary-endoscopy.

**Checks.**

- (computation) If μ=-ε the Fourier transform is identically zero.

- (computation) If μ=ε its value at (0,0) is 1.

- (compatibility) On A=Z/2, the values (1,-1) recover the delta mass at the nontrivial enhancement, not the trivial one.

Use this interface for nonarchimedean refined local theorem.

### 3.7 The nonarchimedean tempered theorem

Prove that for the stated nonarchimedean tempered parameter data the union of Cartesian products of the actual Langlands packets over all pure inner forms with the fixed complement contains exactly one isomorphism class with m=1. It is the pair whose enhancements are (χ_W,χ_V) of 3.1; all other pairs have m=0. The enhancements restricted to z_(φ_V),z_(φ_W) equal the classification invariants of precisely the relevant inner forms. (bp-refined, Theorem 8.5.1, pp. 70–71, bp-refined line 2855–2879; bp-arch Theorem 12.4.1, p. 290, bp-arch line 11200).

Here E/F is a quadratic field extension of nonarchimedean characteristic-zero local fields, or ℂ/ℝ; dim V=n+2r+1 and dim W=n, n,r≥0; φ_V and φ_W are tempered parameters of signs (-1)^(dim V-1) and (-1)^(dim W-1); the actual enhanced correspondence uses the compatible Whittaker datum and a nontrivial additive ψ_E trivial on F; pure inner forms are indexed by Hermitian spaces and restricted to the fixed complement H^r orthogonal-sum L; F is nonarchimedean.

Apply Fourier inversion to 3.6. Central character restrictions identify which pair carries the resulting enhancement. In rank zero use the supplier’s Whittaker normalization rather than inventing a second inner form of the zero space. Properties of Langlands packets assumed in the older papers are theorems required in enhanced-packets.

*Needs:* this roadmap §2.6; this roadmap §3.6; contract gap enhanced-packets.

**Checks.**

- (degenerate) For W=0 the one relevant odd space is fixed by the complement; its distinguished member is the normalized generic one.

- (compatibility) The theorem includes ramified extensions of ℚ₂ and ℚ₃.

- (non-example) A different enhancement of the same L-parameter has m=0.

Use this interface for local obstruction in global period identities; explicit selection within Langlands packets.

### 3.8 Real theta reduction and the integrated seesaw form

For ℂ/ℝ let W⊂V have dimensions n,n+1 and V=W orthogonal-sum <(-1)^n>, with irreducible tempered π,σ, the actual enhancements and Xue’s compatible Whittaker datum. Let a,b count the appropriate-sign conjugate-self-dual characters in their parameters with multiplicity. Define the real theta reduction to be the following conditional seesaw comparison and induction on the odd number a+b. The induction proves the full equivalence m(π,σ)=1 iff both enhancements are the epsilon characters of §3.1; it does not assert that every input has nonzero multiplicity (xue-real §2.4, pp. 1002–1003, xue-real line 267–303; Lemmas 4.2–4.4, pp. 1026–1029, xue-real line 1098, xue-real line 1172, xue-real line 1188).

Fix ψ(x)=exp(-2πix), μ(z)=z/|z| and s=(-1)^n; set (ψ₀)_C(z)=ψ₀(Tr_(ℂ/ℝ)(iz)), so ψ_C(z)=exp(2π(z−conj(z))) (xue-real p. 996, xue-real line 63–67). In theta notation θ_(A,B), A is the source. For a Hermitian A and skew-Hermitian B, both of dimension n, use splitting characters (χ_A,χ_B)=(μ^n,μ^n); for dim A=n±1, dim B=n use (μ^n,μ^(n+(-1)^n)); on the complementary line use (μ^n,μ^((-1)^n)). Signatures are those selected by real-small-theta: in the equal-rank case the unique signature is read from θη(e_i)=ε(φ_iχ_A⁻¹,conj(ψ_C))η(e_i), and in rank n+1 use θφ=(φχ_A⁻¹χ_B)⊕χ_B, its restriction θη=η and, when χ_A is absent, its new-generator value (∏η(e_i))(-1)^(n(n+1)/2-q′). Here (p′,q′) is the signature of -iB; the ordered-character signature count in that contract, not merely the discriminant, selects the allowed spaces. All other target signatures have zero lift. Counter-twists (π⊗det^k,σ⊗det^(-k)) and the corresponding parameter twists are transported together (xue-real §3.2, equations (3.11)–(3.15), pp. 1010–1011, xue-real line 561–587; §3.4, p. 1020, xue-real line 893–909).

For irreducible tempered π′,σ′ of U(V′), dim V′=n, define the auxiliary the integrated seesaw form F_(ψ₀,μ₀)(π′,σ′) on X×X, where X=π′ tensor-completed σ′ tensor-completed conjugate(ω_(ψ₀,μ₀)). With positive invariant linear-first pairings and a fixed Haar measure, on elementary tensors it is the integral over U(V′) of B_(π′)(π′(h)v,v′) B_(σ′)(σ′(h)w,w′) conj(B_ω(ω(h)Φ,Φ′)). Here (ψ₀,μ₀)=(ψ^t,μ^t), t∈{1,-1}, with the matching oscillator splitting. Prove sesquilinearity and continuity: it is linear in the first argument, conjugate-linear in the second, and its absolutely convergent integral extends continuously to X×X (xue-real §3.3, equation (3.17), p. 1019, xue-real line 848–864). This is the auxiliary integrated form needed for the Bessel proof.

Write L_(π,σ) for the regularized tempered Bessel form of §3.3. Prove the following comparisons, retaining each nonzero-lift conjunct.

- for a skew-Hermitian V′ of dimension n, irreducible tempered π′ and a nonzero small lift π=θ_(V′,V)(π′), put σ′=θ_(W,V′)(σ). Then L_(π,σ)≠0 iff σ′≠0 and F_(ψ^s,μ^s)(π′,σ′)≠0. The latter form is evaluated only in the nonzero branch. In particular σ′=0 forces L_(π,σ)=0 (xue-real Lemma 3.8, pp. 1022–1023, xue-real line 983–1016).
- for a source-compatible relevant pair V₀⊂W₀ of dimensions n−1,n, irreducible tempered π₀ and a nonzero lift π′=θ_(V₀,V′)(π₀), put σ₀=θ_(V′,W₀)(σ′). For irreducible tempered σ′, F_(ψ^s,μ^s)(π′,σ′)≠0 iff σ₀≠0 and L_(σ₀,π₀)≠0. Here n ≥ 1 and W₀=V₀ orthogonal-sum <(-1)^(n-1)>. A zero σ₀ forces this intermediate form to vanish (xue-real Lemma 3.9, p. 1024, xue-real line 1017–1025).
- for irreducible tempered equal-rank inputs, F_(ψ₀,μ₀)(π′,σ′)≠0 iff η_(π′)(a_i)=ε(1/2,χ_i tensor φ_(σ′) tensor μ₀⁻¹,conj((ψ₀)_C)) and η_(σ′)(b_j)=ε(1/2,φ_(π′) tensor μ_j tensor μ₀⁻¹,conj((ψ₀)_C)) on the distinct appropriate-sign constituent generators χ_i,μ_j. This auxiliary assertion is proved jointly with the Bessel assertion by the induction, using the second seesaw; it is not assumed as a Fourier–Jacobi multiplicity theorem (xue-real Proposition 3.6, p. 1019, xue-real line 873–886; Lemma 4.2, pp. 1026–1028, xue-real line 1098–1171).

For a+b=1, tempered induction reduces to the rank-one scalar model: the enhancement characters are trivial and m=1, including paired summands of larger ranks (xue-real Lemma 4.1 and proof, pp. 1024–1025, xue-real line 1050–1088). For a≥2 the inverse small-lift theorem, with determinant counter-twists, selects π′ and π₀. The first step has self-dual counts (a−1,b); in its nonzero branch the second step has counts (b,a−2). Carry the signature and enhancement formulas above through each step: the original epsilon condition is equivalent to σ′≠0 together with the equal-rank epsilon condition, and that condition is equivalent to σ₀≠0 together with the lower Bessel epsilon condition. Thus the full Bessel equivalence follows from the lower assertion; when either companion lift is zero, both the corresponding nonvanishing assertion and its epsilon/signature condition fail. If b≥2, induce σ by a non-conjugate-self-dual character on W⊕H and apply the a≥2 argument to (σ₁,π); §3.3 transports the full assertion back. The lower induction measure is a+b−2 in either case. The intermediate equal-rank step has a′=a−1≥1 and a′+b′=a+b−1, so it uses only lower Bessel assertions; after the Bessel induction, the same almost-equal-rank comparison gives the full auxiliary equal-rank criterion (xue-real Lemmas 4.2–4.4 and §4.4, pp. 1026–1029, xue-real line 1098–1211).

*Needs:* this roadmap §3.1; this roadmap §3.3; contract gap real-oscillator-model; contract gap real-small-theta; contract gap enhanced-packets.

**Checks.**

- (degenerate) a+b=1 is the base case, even when extra non-self-dual paired summands make the ranks larger.

- (computation) In the nonzero branches, (a,b)=(2,1) gives intermediate counts (1,1) and lower Bessel counts (1,0), with π₀ count 0 and σ₀ count 1. The sum drops from 3 to 1; reversing the order of the lower pair loses its relevant inclusion.

- (non-example) No replacement of the integrated seesaw by an assumed irreducibility of the big theta lift is permitted; the source explicitly avoids that premise.

- (non-example) For V=<-1,-1>, W=<-1>, π the standard U(2) representation and σ the U(1) character of weight 1, the restricted tensor has weights 2,1 and no weight 0. Thus m=0 although (a,b)=(2,1) and both representations are tempered. At least one companion lift in the two conditional identities vanishes; there is no unconditional reduction to a nonzero base model.

**Checks for the integrated seesaw form.**

- On U(0), with its trivial representations and Haar mass 1, the oscillator and both representation spaces are C and F(1,1)=1. Omitting this rank gives the wrong base form.
- For n=1, V′ of signature -iV′=(1,0), ψ₀=ψ and μ₀=μ, the smooth oscillator is a sum of one-dimensional U(1) weights. Choose an occurring weight k and unit vector Φ; choose π′ of weight k and σ′ trivial. With Haar mass 1 the integrand on Φ⊗1⊗conj(Φ) is 1 and its diagonal value is 1; scaling the first argument by i gives i and scaling the second by i gives -i. Omitting the conjugate oscillator or reversing pairing slots fails these covariance tests.
- In the same one-dimensional weight spaces, replace π′ by weight k+1. The integrand becomes h↦h and its integral is 0. This tests actual relative invariance, rather than a nonzero form on arbitrary equal-rank inputs.

Use this interface for the real enhancement theorem without extrapolating nonarchimedean calculations.

### 3.9 The real tempered theorem

Prove that for the stated tempered parameter data with E/F=ℂ/ℝ, for every relevant odd codimension and both line signs, m(π_V,π_W)=1 iff their actual enhancements equal (χ_W,χ_V). Over all relevant pure inner forms there is exactly one such pair and every other pair has multiplicity 0. Central restrictions and Whittaker normalization are part of this statement. (xue-real, Theorem 2.2, p. 1000, xue-real line 213; Propositions 2.3–2.4 and Corollary 2.5, p. 1001, xue-real line 238–266; line-sign conversion, p. 999, xue-real line 179).

Here E/F is a quadratic field extension of nonarchimedean characteristic-zero local fields, or ℂ/ℝ; dim V=n+2r+1 and dim W=n, n,r≥0; φ_V and φ_W are tempered parameters of signs (-1)^(dim V-1) and (-1)^(dim W-1); the actual enhanced correspondence uses the compatible Whittaker datum and a nontrivial additive ψ_E trivial on F; pure inner forms are indexed by Hermitian spaces and restricted to the fixed complement H^r orthogonal-sum L; E/F=ℂ/ℝ.

For r=0 use §3.8’s joint induction on the Bessel and integrated equal-rank epsilon assertions, including the zero companion-lift branches and their failed signature/enhancement conditions. It transports the full equivalence, not unconditional multiplicity nonvanishing. For r>0 use 3.3 with an auxiliary tempered GL_(r+1)(C) principal series induced from non-conjugate-self-dual characters, so its paired added summands do not change the component group. This is Xue’s higher-codimension reduction. Apply 1.3 and 3.2 to reverse line signs. Uniqueness across the actual Langlands packets also follows by the stable character cancellation of 3.5 and the supplier’s STAB/TRANS/WHITT properties.

*Needs:* this roadmap §2.6; this roadmap §3.2; this roadmap §3.3; this roadmap §3.8; this roadmap §1.3; contract gap enhanced-packets.

**Checks.**

- (computation) For U(2) highest weight (1,0), U(1) weight -1 has dual weight 1 and interlaces; weight 1 has dual -1 and fails interlacing.

- (compatibility) Simultaneous negation of a compact pair gives the same restriction multiplicity for the opposite line sign, with its transported labels.

- (degenerate) For W=0,r=0 every U(1) character has a one-dimensional model; the actual enhancement under the Langlands correspondence equals the trivial distinguished character in this dimension.

Use this interface for Tempered local GGP across all nonsplit characteristic-zero places.

### 3.10 The split tempered prediction

For E=F×F, n,r≥0 and irreducible tempered representations of GL_(n+2r+1)(F) and GL_n(F), define the split tempered Bessel prediction to be the proposition m=1 for the split model of 1.2. The corresponding GL Langlands packets are singletons. Keep this proposition distinct from a proof in the ranges of 3.11; for archimedean r>0 it has no exported proof. (ggp, Conjecture 17.1 and discussion before Theorem 17.2, p. 68; ggp line 2386–2400).

Here F is a local field of characteristic zero; E/F is quadratic étale; W embeds isometrically in V, with V/W isometric to H^r orthogonal-sum L for r≥0 and a nondegenerate line L; the representations are irreducible smooth admissible complex representations at finite places and irreducible Casselman–Wallach representations at infinite places; E=F×F; both representations are tempered.

Specialize the relevant prediction for singleton Langlands packets to the split algebra. For positive ranks use gap:gl-tempered-genericity at finite places and AutomorphicFormsOnReductiveGroups §2.6 on the §2.7 globalizations at infinity; handle GL_0 directly. Genericity proves this prediction only in the ranges of §3.11.

- The proposition unfolds to finite-dimensionality and finrank 1 for the constructed split model.

- Isomorphic representations and conjugate frames give equivalent propositions.

- There is no component-character choice because the GL Langlands packets are singletons.

*Needs:* this roadmap §2.1; contract gap local-categories; contract gap enhanced-packets; contract gap gl-tempered-genericity (finite places); AutomorphicFormsOnReductiveGroups §§2.6–2.7 (archimedean genericity); AutomorphicLFunctionsAndLocalFactors §AL.3 The Whittaker realization (AL.3.1.2) and Representation prerequisites, Archimedean Whittaker comparisons (AL.R.1); contract gap local-jacquet-filtration.

**Checks.**

- (degenerate) GL₁(F)×GL₀(F) reduces the proposition to dim Hom_1(ℂ,ℂ)=1.

- (compatibility) For GL₂×GL₁, 3.11 proves the proposition.

- (degenerate) For GL_1(K), K=ℝ,ℂ or a finite extension of ℚ₂, a unitary character has trivial maximal unipotent and its nonzero scalar functional is Whittaker; GL_0 has the scalar empty-factor model. Neither positive-rank supplier is applied to GL_0.

- (non-example) The trivial representation of GL_2(R) or GL_2(C) is unitary but is not tempered and has no nondegenerate Whittaker functional: equivariance at a unipotent with character value different from 1 forces the functional to vanish. The tempered hypothesis cannot be replaced by unitarity.

- (non-example) For nonarchimedean F and GL₃(F)×GL₀(F), take normalized Ind_B^(GL₃)(χ_1⊠χ_2⊠χ_3) with pairwise distinct unitary characters χ_i (hence χ_i/χ_j≠|·|^(±1)); it is regular irreducible unitary tempered. The generic N-character of §1.2 gives model dimension 1. Replacing it by 1 gives Hom_N(π,1) of dimension 6, from the six one-dimensional Weyl pieces of its Jacquet module (bernstein-zelevinsky §2.12, p. 448, bernstein-zelevinsky line 329–338).

Use this interface for Honest split-local contract for all odd codimensions.

### 3.11 Split generic nonvanishing in the proved ranges

Prove that for E=F×F and irreducible generic representations of GL_(n+2r+1)(F) and GL_n(F), m=1 if F is nonarchimedean, or if r=0 and F is archimedean. In these ranges this proves the split tempered Bessel prediction for tempered representations. (ggp, Theorem 17.2, p. 68; ggp line 2394–2405).

Here F is a local field of characteristic zero; E/F is quadratic étale; W embeds isometrically in V, with V/W isometric to H^r orthogonal-sum L for r≥0 and a nondegenerate line L; the representations are irreducible smooth admissible complex representations at finite places and irreducible Casselman–Wallach representations at infinite places; E=F×F; the two representations are generic; F is nonarchimedean or r=0.

AutomorphicLFunctionsAndLocalFactors §AL.3 Local convergence and continuity (AL.3.2.2), The Rankin–Selberg local L-factor (AL.3.2.3) and The normalized adjacent-rank period (AL.3.8.1) supply the nonzero continuous adjacent functional; the local-factor target supplies entire quotients and a nonzero normalized test at each point. Identify λ(s) with Ψ₀(s+1/2); the differential Haar conversion in gap:local-rankin-selberg multiplies it by the positive c_n and preserves nonvanishing. Over finite places use the supercuspidal reduction 2.4 to reach all odd codimensions. Combine nonzero with 2.6. For tempered inputs obtain genericity from gap:gl-tempered-genericity at finite places and AutomorphicFormsOnReductiveGroups §§2.6–2.7 at infinity; use the imported §AL.3 Whittaker realizations in both cases.

*Needs:* AutomorphicLFunctionsAndLocalFactors §AL.3 Local convergence and continuity (AL.3.2.2), The Rankin–Selberg local L-factor (AL.3.2.3) and The normalized adjacent-rank period (AL.3.8.1); this roadmap §2.6; this roadmap §2.4; this roadmap §3.10; contract gap local-rankin-selberg; contract gap local-categories; contract gap gl-tempered-genericity (finite places); AutomorphicFormsOnReductiveGroups §§2.6–2.7 (archimedean genericity); AutomorphicLFunctionsAndLocalFactors §AL.3 The Whittaker realization (AL.3.1.2) and Representation prerequisites, Archimedean Whittaker comparisons (AL.R.1).

**Checks.**

- (computation) GL₂(F)×GL₁(F) has a nonzero Rankin–Selberg functional at every characteristic-zero local F.

- (compatibility) GL₄(F)×GL₁(F), r=1, is covered at a finite place.

- (non-example) For F=ℝ, E=F×F, W=F, r=1, order the first-factor basis as (v,w,e₀,v*). Then N consists of u=[[1,a,x,z],[0,1,0,b],[0,0,1,y],[0,0,0,1]] and H=N⋊F× embeds as (u diag(1,t,1,1),t). With e₀=(1,1), b(u)=(x,-y); for ψ(s₁,s₂)=exp(i(s₁+s₂)), ν(u,t)=exp(i(x-y)). Each of x and y has a nonzero coefficient, while a,b,z are killed. The two character coordinates define the real higher-codimension model (ggp §12, pp. 44–46, ggp line 1624–1639).

Use this interface for All-place adjacent period formula and the split specialization of local GGP.

### Examples

The empty W-parameter gives the trivial distinguished character on the V component group. In a product of two order-two component groups the values (-1,+1) multiply to -1 on their sum. Compact U(2)↓U(1) with highest weights (1,0) and -1 has multiplicity 1; replacing -1 by 1 gives 0.

### Dependencies

AutomorphicLFunctionsAndLocalFactors §AL.3 Local convergence and continuity (AL.3.2.2), The Rankin–Selberg local L-factor (AL.3.2.3) and The normalized adjacent-rank period (AL.3.8.1); contract gap enhanced-packets; contract gap factor-epsilon-identities; contract gap local-rankin-selberg; this roadmap §1.3; this roadmap §2.6; contract gap local-categories; NoncommutativeGeometry §N1; AutomorphicFormsOnReductiveGroups §2.7; contract gap archimedean-globalization; contract gap local-tempered-bounds; contract gap local-plancherel; contract gap local-fourier-extension; this roadmap §2.7; this roadmap §1.2; contract gap local-schwartz-germs; contract gap hermitian-unitary; GeometryOfNumbersAndQuadraticArithmetic §2.9 field carrier and adjoint API; MetaplecticAutomorphicForms §3.2a split Hermitian carrier and GL(A) identification; contract gap ordinary-endoscopy; contract gap real-oscillator-model; contract gap real-small-theta; this roadmap §2.1; contract gap gl-tempered-genericity (finite places); AutomorphicFormsOnReductiveGroups §§2.6–2.7 (archimedean genericity); AutomorphicLFunctionsAndLocalFactors §AL.3 The Whittaker realization (AL.3.1.2) and Representation prerequisites, Archimedean Whittaker comparisons (AL.R.1); contract gap local-jacquet-filtration; this roadmap §2.4.

## Layer 4: Global Bessel periods and the fixed-pair conjecture

### 4.1 Global periods and their character law

Construct the global Bessel period as follows. For the stated global data choose a nontrivial continuous additive character ψ:A_E/E→S¹ that is nondegenerate on each local simple coordinate and form ν=ψ∘b on H(A), extended trivially over U(W). Prove H is unimodular, ν|H(F)=1 and absolute convergence of P(f)=∫_(H(F)\H(A)) f(h)ν(h)⁻¹ dh for every cusp form f on U(V)×U(W). Construct P as a continuous linear functional on the supplied cuspidal smooth realization. Prove P(R(h)f)=ν(h)P(f) and compatibility with localization and 1.3. (ggp, §23, pp. 86–88; ggp line 3036; ggp line 3077–3093; inverse-character translation of the source convention).

Here E/F is a quadratic extension of number fields; W⊂V is a nondegenerate relevant Hermitian pair of ranks n and n+2r+1, n,r≥0; the global Bessel character is trivial on H(F); cusp forms and right translations use the supplied automorphic realization and quotient measures.

Use the supplied adelic points and rational quotient construction. Rationality of b makes ν trivial on H(F); unitary determinant action gives unimodularity. Cuspidal rapid decay, the relative flag coordinates and unipotent compact quotient give convergence and continuity. Change variables y=xh to get the character direction.

- P is complex-linear and continuous in the cuspidal topology.

- P(R(h)f)=ν(h)P(f) for h∈H(A).

- For r=0, P(f_V tensor f_W)=∫_[U(W)] f_V(t)f_W(t)dt.

- A rational pair isometry transports the rational quotient, Haar measure and period.

*Needs:* this roadmap §1.2; this roadmap §1.3; GlobalNumberFields Layers 4–6; GlobalNumberFields Layer 8; RestrictedProducts Layers 0–3; contract gap adelic-measures; contract gap automorphic-realization.

**Checks.**

- (computation) If ν(h)=i, right translation multiplies P by i, whereas the integral weighted by ν would multiply by -i.

- (degenerate) For r=0 the empty unipotent integral contributes 1 and ν=1.

- (non-example) A character nontrivial on H(F) does not descend to [H]; that datum is rejected before integration.

Use this interface for Fixed-pair conjecture, adjacent period and relative characters.

### 4.2 Local obstructions and factorization

Prove that for the stated global data and an irreducible cuspidal subrepresentation π with supplied restricted tensor factorization, P|π≠0 implies every local model ℬ(π_v)≠0. If P|π≠0, choose a pure tensor f⁰ with P(f⁰)≠0. Partial evaluation gives local model functionals ℓ_v normalized by ℓ_v(f⁰_v)=1, and P(⊗f_v)=P(f⁰)∏_v ℓ_v(f_v) whenever f_v=f⁰_v almost everywhere. Changing f⁰ gives the expected reciprocal scalar changes. (ggp, §23 and Conjecture 24.1(ii)–(iii), pp. 87–90; ggp line 3050; ggp line 3175).

Here E/F is a quadratic extension of number fields; W⊂V is a nondegenerate relevant Hermitian pair of ranks n and n+2r+1, n,r≥0; the global Bessel character is trivial on H(F); cusp forms and right translations use the supplied automorphic realization and quotient measures; π is irreducible cuspidal and its smooth realization has the supplier’s restricted completed tensor factorization.

Continuity and density of pure tensors produce f⁰. Partial evaluation is an equivariant local functional. Multiplicity one identifies every other partial evaluation with its scalar multiple and gives the finite product formula. This does not claim a canonical normalization or that arbitrary local models create an automorphic period.

*Needs:* this roadmap §2.6; this roadmap §4.1; contract gap automorphic-realization.

**Checks.**

- (non-example) One zero local model forces P|π=0; the converse is not deduced without an L-value theorem.

- (computation) Replacing f⁰ at two places v,w by vectors with ℓ_v=2 and ℓ_w=3 multiplies P by 6.

- (compatibility) Multiplying one chosen reference vector by a≠0 divides that normalized local functional by a and multiplies P(f⁰) by a.

Use this interface for Eulerian period structure and the distinction between local and global nonvanishing.

### 4.3 The tensor L-representation

Construct the tensor L-representation as follows. For ranks a=n+2r+1 and b=n use the finite-Galois L-group (GL_a(C)×GL_b(C))⋊Gal(E/F), with the standard unitary action of Gal(E/F). Define R by inducing Std_a tensor Std_b from its index-two connected dual; inflate R along the natural map from the Weil L-group when using Weil parameters. Prove its dimension is 2ab and that its Weil pullbacks are the induced tensor parameters. For actual strong base change, prove completed L_F(s,π,R)=L_E(s,BC(π_V)×BC(π_W)), including split, ramified and infinite factors. (ggp, §22 table, p. 86, ggp line 3026; §24, pp. 89–90, ggp line 3151–3173; split specialization ggp line 3184).

Here E/F is a quadratic extension of number fields; W⊂V is a nondegenerate relevant Hermitian pair of ranks n and n+2r+1, n,r≥0; the global Bessel character is trivial on H(F); cusp forms and right translations use the supplied automorphic realization and quotient measures; the L-group, its standard representations and actual strong local base change are the supplied ones; the connected dual has index two in the finite-Galois L-group, not in the full Weil L-group.

Use the general induction construction on the actual index-two L-subgroup, then Artin formalism and the supplier’s LLC/base-change compatibility for local factors. Completed Euler products give the equality where convergent and meromorphic continuation extends it.

- On the connected dual subgroup R restricts to the tensor representation plus its conjugate translate.

- Changing Hermitian form changes only the inner twist, not this L-representation.

- The global equality is induced by equality of every local factor.

*Needs:* contract gap enhanced-packets; contract gap global-parameters; contract gap factor-epsilon-identities.

**Checks.**

- (degenerate) b=0 gives a zero-dimensional representation and L(s)=1.

- (computation) At a split place the factor is the product of the two conjugate-dual Rankin–Selberg factors; at the center the unitary factors give |L(1/2,π_V×π_W)|².

- (computation) Ranks (2,1) give dim R=4, not 2; omitting index-two induction fails.

Use this interface for the general global conjecture’s R and its adjacent Rankin–Selberg specialization.

### 4.4 The fixed-pair global conjecture

For the stated global data and an irreducible everywhere tempered π occurring with multiplicity one in the cuspidal spectrum, define the fixed-pair global Bessel conjecture for (π,W,V) as the proposition P|π≠0 iff (for every place v, ℬ(π_v)≠0) and the completed L_F(1/2,π,R) is nonzero. The value at 1/2 uses the supplied regularity theorem in this tempered generic-parameter range. This target defines the historically named conjecture proposition; its formal proof for general r belongs to GanGrossPrasadUnitaryGroups, Part II (ggp, Conjecture 24.1, p. 90; ggp line 3175–3182).

Here E/F is a quadratic extension of number fields; W⊂V is a nondegenerate relevant Hermitian pair of ranks n and n+2r+1, n,r≥0; the global Bessel character is trivial on H(F); cusp forms and right translations use the supplied automorphic realization and quotient measures; π is irreducible everywhere tempered and occurs with multiplicity one in the cuspidal spectrum; the L-function is the completed function for R of 4.3.

The arbitrary-odd-codimension global Bessel assertion is proved in the literature. Beuzart-Plessis–Chaudouard Theorem 1.3.3.1 equates nonvanishing of the completed Rankin–Selberg value for a discrete Hermitian parameter with a nonzero Bessel period on some Hermitian inner form; it does not specify the given pair. Their Theorem 1.3.6.1 gives a refined identity on a fixed pair for an everywhere-tempered cuspidal representation whose weak base change is discrete Hermitian, including n=0 by Remark 1.3.6.2(3) (bpc-bessel pp. 7, 9, bpc-bessel line 268–284, bpc-bessel line 352–379). The global-parameters contract supplies that discrete Hermitian weak base change for the π here. To deduce the displayed fixed-pair equivalence from the existence theorem, combine the prescribed local models with uniqueness of distinguished members of nonsplit local Langlands packets, split base-change singleton fibers, and global classification with multiplicity one. The L-function comparison is §4.3; §1.3 transports a complement line <a> to <1> by simultaneous scaling by a⁻¹ and transports the character, using ν=ψ_Bh⁻¹ for the source's period convention. These comparisons preserve nonvanishing. This is a deduction with classification inputs, not the literal statement of Theorem 1.3.3.1. The additional Eisenstein-to-Bessel comparison and the general-r formal proof belong to GanGrossPrasadUnitaryGroups, Part II; Layers 6–7 prove the adjacent endpoints.

Package the precise GGP equivalence on the constructed period and actual local representations. No theorem is manufactured by assuming this proposition; the adjacent global results have independent proofs in Layers 6–7.

- The proposition unfolds to exactly the displayed conjunction and equivalence.

- Rational isometry and consistent auxiliary-data transport preserve the proposition.

- Under this proposition, failure of any local model implies the global period is zero; 4.2 proves this implication independently.

*Needs:* this roadmap §4.1; this roadmap §4.2; this roadmap §4.3; contract gap hermitian-global-values; contract gap global-parameters. The literature deduction also uses this roadmap §1.3, §3.7 and §3.9, and contract gap enhanced-packets.

**Checks.**

- (degenerate) With W=0 the L-factor is 1 and the proposition asks for the generic Fourier coefficient, not an empty period condition.

- (non-example) The definition keeps L(1/2)≠0 even when all local models exist.

- (characterisation) The proposition concerns the specified W⊂V. If an existential inner-form period is nonzero but the local model on this pair is zero, the period on this pair is zero by §4.2; the existence theorem alone cannot identify the two pairs.

- For a complement line <2>, simultaneous scaling by 1/2 gives <1> with the same unitary groups; ν(h)=i corresponds to the source character ψ_Bh(h)=−i, so both period integrands have character factor −i. Freezing the character or using ψ_Bh=ν changes the period covariance.

Use this interface for the fixed-pair global Bessel proposition, whose literature proof and formalization scope are distinguished above from the adjacent export `GGP.8`.

### Examples

Right translation by h multiplies the period by ν(h). Inverting ν in the integral is essential: replacing it by ν gives ν(h)⁻¹. For r=0 the character disappears and the period is the diagonal integral of the product of the two cusp forms.

### Dependencies

this roadmap §1.2; this roadmap §1.3; GlobalNumberFields Layers 4–6; GlobalNumberFields Layer 8; RestrictedProducts Layers 0–3; contract gap adelic-measures; contract gap automorphic-realization; this roadmap §2.6; contract gap enhanced-packets; contract gap global-parameters; contract gap factor-epsilon-identities; contract gap hermitian-global-values.

## Layer 5: Adjacent local integrals and all-place normalization

### 5.1 Local and global period normalizers

Construct the unitary period normalizer as follows. For any characteristic-zero local adjacent unitary pair and its actual unitary tempered σ_v, define C_v=(∏_(i=1..n+1)L_v(i,η_v^i)) L_v(1/2,BC(σ_v)_n×BC(σ_v)_(n+1))/L_v(1,σ_v,Ad), and prove it regular and nonzero. For the stated adjacent global data define Δ_(n+1)=∏_(i=1..n+1)L_F(i,η^i) and C(σ)=Δ_(n+1)L_E(1/2,Π_n×Π_(n+1))/L_F(1,σ,Ad). All factors are completed. The global adjoint denominator is finite and nonzero; the global central value is finite and may vanish. Define the quotient only after proving denominator nonvanishing. (bpcz, §1.1.6, p. 4, bpcz line 148–167; harris Remark 1.4, p. 3, harris line 149–157).

For the local assertion, F_v is any characteristic-zero local field, E_v/F_v is quadratic étale, n ≥ 1, and σ_v is an actual irreducible unitary tempered representation of an adjacent unitary pair, with no globalization premise. For the global assertion, E/F is a quadratic number-field extension, n ≥ 1, h is nondegenerate of rank n, G_h=U(h)×U(h orthogonal-sum <1>), and σ is an irreducible everywhere-tempered cuspidal subrepresentation with actual strong base change Π.

Use local tempered bounds and the nonvanishing of local L-factors, with the gamma-factor argument at infinity. Globally the opposite-parity Asai factors and distinct constituents yield regular nonzero adjoint values. The tempered-local-regularity and hermitian-global-values contracts supply the individual factor regularity and nonvanishing, and factor-epsilon-identities supplies the adjoint/Asai comparison; this target alone constructs their quotient and derives C_v≠0, including all places and endoscopic parameters.

- C_v= (∏_(i=1..n+1)L_v(i,η_v^i)) L_v(1/2,Π_n,v×Π_(n+1),v)/L_v(1,σ_v,Ad).

- C_v≠0, including ramified, dyadic, split and archimedean places.

- C(σ)=0 iff the completed central Rankin–Selberg value is 0.

- The adjoint denominator equals the appropriate opposite-parity Asai function of the actual base change.

*Needs:* contract gap factor-epsilon-identities; contract gap tempered-local-regularity; contract gap hermitian-global-values; contract gap global-parameters.

**Checks.**

- (computation) n=1 gives Δ₂=L_F(1,η)L_F(2,1), not L_F(1,1)L_F(2,η); η is globally nontrivial.

- (compatibility) η_v=1 at a split place, so the local Δ is ∏_(i=1..n+1)ζ_v(i), each finite for q_v>1.

- (non-example) A zero global central value makes C=0 while every local C_v remains nonzero; no Euler product convergence at the central point is claimed.

Use this interface for local α_v and the completed constant in `GGP.8`.

### 5.1a The split adjacent Whittaker identity

Let F be any characteristic-zero local field, n ≥ 1, and π=π_(n+1)⊠π_n an actual irreducible unitary tempered GL_(n+1)(F)×GL_n(F) representation. Fix a nontrivial unitary additive ψ of F, opposite generic characters on the two upper unipotents, and the standard diagonal GL_n embedding. With the compatible unnormalized Haar measures of zhang-period §4.5 and positive invariant Whittaker pairings ϑ_m of equation (3.2), put λ(W)=∫_(N_n\GL_n) W_(n+1)(diag(g,1))W_n(g) dḡ. Prove ∫_(GL_n) (ϑ_(n+1)⊗ϑ_n)(π(g)W,W′) dg=λ(W)conj(λ(W′)). For B=b(ϑ_(n+1)⊗ϑ_n) and dt=a dg, a,b>0, the left side is ab λ(W)conj(λ(W′)); thus it is nonzero and has a positive nonzero diagonal value on some smooth tensor. (zhang-period, §4.5, Proposition 4.10, pp. 31–33, zhang-period line 1505–1568; §3.3, equations (3.23)–(3.25), p. 19, zhang-period line 962–981; introductory measure warning p. 9, zhang-period line 424–440; change of measures p. 29, zhang-period line 1437–1440).

Here F is a nonarchimedean characteristic-zero local field, ℝ or ℂ; n ≥ 1; both GL representations are irreducible unitary tempered, hence generic; use their actual Whittaker realizations; fix self-dual additive measures for ψ on root groups, dg_m=|det g|^(-m)∏dx_ij on GL_m and quotient measures by disintegration, consistently in λ and ϑ_m; no ζ_F(1) or L(1,Ad) factor is inserted; the pairings ϑ_m are the invariant positive pairings of equation (3.2); B=bϑ_(n+1)⊗ϑ_n and dt=a dg_n for explicit a,b>0; vectors are smooth.

Obtain genericity from gap:gl-tempered-genericity at finite places and AutomorphicFormsOnReductiveGroups §§2.6–2.7 at infinity, and use AutomorphicLFunctionsAndLocalFactors §AL.3 The Whittaker realization (AL.3.1.2) and its Archimedean Whittaker comparisons (AL.R.1) for the actual smooth realizations. Apply the general Whittaker pairing and Fourier matrix-coefficient identity, then unfold as in Zhang’s Proposition 4.10. AutomorphicLFunctionsAndLocalFactors §AL.3 The Rankin–Selberg local L-factor (AL.3.2.3) and The normalized adjacent-rank period (AL.3.8.1) supply an entire normalized quotient with a nonzero test; with the c_n conversion of gap:local-rankin-selberg and regular nonzero L(1/2), it gives a nonzero raw integral in these differential measures. Uniqueness of the invariant positive pairing gives b>0; Haar uniqueness gives a>0. Neither Hom nonvanishing alone nor the nonsplit form of §3.3 proves this comparison.

- A Whittaker tensor with normalized λ/L(1/2)=1 has raw diagonal integral ab|L(1/2,π_(n+1)×π_n)|²>0; all factors are finite and nonzero by tempered local regularity.

- Scaling B by b and dt by a multiplies the raw period by ab, while λ stays fixed at the source reference measures.

*Needs:* AutomorphicLFunctionsAndLocalFactors §AL.3 Local convergence and continuity (AL.3.2.2), The Rankin–Selberg local L-factor (AL.3.2.3) and The normalized adjacent-rank period (AL.3.8.1); this roadmap §2.7; this roadmap §2.6; contract gap local-categories; NoncommutativeGeometry §N1; AutomorphicFormsOnReductiveGroups §2.7; contract gap archimedean-globalization; contract gap tempered-local-regularity; contract gap local-rankin-selberg; contract gap whittaker-pairing-fourier; contract gap gl-tempered-genericity (finite places); AutomorphicFormsOnReductiveGroups §§2.6–2.7 (archimedean genericity); AutomorphicLFunctionsAndLocalFactors §AL.3 The Whittaker realization (AL.3.1.2) and Representation prerequisites, Archimedean Whittaker comparisons (AL.R.1).

**Checks.**

- (computation) For n=1, N₁=1 and λ(W)=∫_(F×)W₂(diag(t,1))χ(t)dt; a normalized RS vector gives a strictly positive raw diagonal period ab|L(1/2)|².

- (computation) With the Whittaker reference measures fixed, replacing dt by 2dt doubles the raw period; it does not leave the coefficient in front of λconj(λ) equal to 1.

- (non-example) If λ(W)=0 then its raw diagonal period is 0, although the period form is nonzero on the representation; existence does not mean every vector is a test vector.

Use this interface for the split implication of §5.2.

### 5.2 Normalized local period forms

Construct the normalized local Bessel period as follows. For an adjacent characteristic-zero local Hermitian pair, actual unitary tempered σ_v, invariant positive inner product B_v, Haar measure dt_v and C_v of 5.1, define α_v(x,y)=C_v⁻¹∫_(U(W)(F_v))B_v(σ_v(t)x,y)dt_v. Define q_v(x)=α_v(x,x)/B_v(x,x) only for x≠0. Give the associated continuous invariant sesquilinear form on the smooth vectors, separately from any positivity assertion. (bpcz, §1.1.6, p. 4, bpcz line 159–169; harris local pairings, pp. 2–3, harris line 92–111).

Here F_v is a characteristic-zero local field, E_v/F_v is quadratic étale and W⊂V is a nondegenerate adjacent pair of ranks n,n+1 with n ≥ 1; σ_v is an actual irreducible unitary tempered representation of U(V)×U(W); B_v is a positive definite invariant inner product, dt_v a Haar measure, and C_v the proved regular nonzero local factor of 5.1; x≠0 when q_v(x) is formed.

Apply 2.7 and divide by the proved nonzero local factor. Invariant measure changes variables to prove the two invariances. Continuity follows from the supplied tempered seminorm bounds. For nonsplit E/F compare with the ordinary r=0 form of 3.3; for split E use the nonzero Whittaker test vectors and integral identity of 5.1a.

- α_v is linear in x and conjugate-linear in y, and invariant under independent diagonal U(W) translations.

- At finite places two sesquilinear forms on the algebraic tensor carrier agreeing on every pair of pure tensors are equal. At infinity two jointly continuous sesquilinear forms on the completed projective tensor carrier agreeing on every pair of pure tensors are equal, by density in both arguments.

- α_v is nonzero iff the local Bessel model is nonzero: use 3.3 for nonsplit E/F, 5.1a and its nonzero Whittaker test vectors for split E, and C_v≠0 in both cases.

- Its value is the source’s P_h,σ_v^natural with the same pairing and Haar measure.

*Needs:* this roadmap §2.7; this roadmap §5.1; this roadmap §3.3; contract gap local-categories; this roadmap §5.1a; NoncommutativeGeometry §N1; AutomorphicFormsOnReductiveGroups §2.7; contract gap archimedean-globalization.

**Checks.**

- (computation) With U(1) mass a, inverse weights and B(1,1)=1, α(1,1)=a/C_v and q(1)=a/C_v.

- (degenerate) α(0,0)=0; q is not formed on 0, avoiding 0/0.

- (compatibility) For c≠0, q(cx)=q(x); α(cx,cx)=|c|²α(x,x).

- (compatibility) For two continuous forms on X=V completed-projective-tensor W, equality on pure-tensor pairs extends first by linearity to A×A, A=V tensor W, and then by density to X×X. This identifies the constructed α with any continuous comparison form; algebraic spanning suffices at finite places (bp-arch §7.2, pp. 180–181, bp-arch line 6797–6801 and bp-arch line 6820–6825).

- (non-example) For infinite-dimensional split GL₃(R)×GL₂(R) principal series, the completed tensor X contains infinite-rank tensors outside the proper dense algebraic tensor A. Choose x∉A and an algebraic functional ℓ with ℓ|A=0 and ℓ(x)=1. Then β(u,v)=ℓ(u)conj(ℓ(v)) vanishes on all pure-tensor pairs but β(x,x)=1, so β≠0 and is discontinuous.

Use this interface for the local factors exported in `GGP.8`.

### 5.3 Spherical normalization in every residue characteristic

Let F be any nonarchimedean characteristic-zero local field, including residue characteristic 2, and E/F unramified quadratic or split. For an adjacent rank-(n,n+1) Hermitian pair, n ≥ 1, with compatible hyperspecials K_W=K_V∩U(W) from a self-dual integral pair, an actual irreducible unitary tempered spherical σ=π_V⊠π_W, a nonzero K_V×K_W-fixed tensor x, positive invariant B and Haar dt on H=U(W)(F), prove ∫_H B(σ(t)x,x)dt=C·vol_dt(K_W)B(x,x), hence q(x)=vol_dt(K_W), where C is the local normalizer of 5.1. The almost-everywhere assertion for factorizable global tempered cuspidal data is its corollary. (harris, Odd-residue intermediate: §2 hypotheses (1)–(7), pp. 4–5, harris line 170–181; Theorem 2.12, p. 23, harris line 1289–1294. General local proof: relative spherical calculation of §2.2, pp. 7–23, especially nonsplit Weyl rational expressions, pp. 16–20, harris line 907–1147, extended here using all-residue Cartan/Satake input; split Whittaker calculation zhang-period equations (3.3), (3.26), pp. 14, 19, zhang-period line 675–678 and zhang-period line 982–986, with Proposition 4.10, p. 31, zhang-period line 1543–1551. Global corollary: bpcz equation (1.1.6.1), p. 4, bpcz line 168–169).

Here F is a finite extension of ℚₚ for any p, E/F is unramified quadratic or F×F, and n ≥ 1; W⊂V is nondegenerate of ranks n,n+1 and admits self-dual O_E-lattices Λ_V=Λ_W orthogonal-sum Λ_L with unramified smooth reductive unitary integral models; K_V,K_W are their compatible hyperspecial stabilizers; σ=π_V⊠π_W is an actual irreducible unitary tempered representation with nonzero K_V×K_W-fixed tensor x; B is positive definite invariant and dt is any Haar on H; C is the regular nonzero local factor of 5.1; there is no globalization hypothesis; for the Whittaker proof choose a conductor-zero additive character and self-dual root measures; no additive character is part of the resulting spherical identity.

In the split case combine 5.1a with the spherical Whittaker norm and AutomorphicLFunctionsAndLocalFactors §AL.3 The normalized adjacent-rank period (AL.3.8.1), with its normalized spherical value 1; gap:local-rankin-selberg converts its value 1 to c_n=vol_(dg_n^d)(GL_n(O_K)), keeping the differential Haar volumes until the final cancellation. For nonsplit unramified E/F, prove the relative Cartan expansion from the self-dual integral pair and the supplier’s all-residue spherical matrix coefficients and double-coset volumes. Establish its uniform root-coordinate volume formulas also at p=2: O_E→O_F trace is surjective, so choose a trace-one element in the short-root coordinates instead of dividing by 2. The finite unitary reductive quotients have factors q^j-(-1)^j, valid also at q=2. This identifies the same rational function in q and the Satake variables as Harris’s §2.2 calculation. Its equality to C for infinitely many odd residue sizes proves the rational identity; evaluate it at every q≥2, including the nonsplit dyadic case, and extend across apparent Satake singularities by the convergent integral of 2.7 and tempered regularity. Thus Harris’s odd-residue theorem is an intermediate, not the claimed source of the extension. Haar and vector rescaling give the displayed formula. Restricted tensor factorization then gives the global almost-everywhere corollary.

- For everywhere-tempered cuspidal global data with nonzero factorizable f, q_v(f_v)=vol(K_(H,v)) at every place satisfying the local spherical hypotheses, hence almost everywhere; dyadic places satisfying those hypotheses are included.

*Needs:* AutomorphicLFunctionsAndLocalFactors §AL.3 Local convergence and continuity (AL.3.2.2), The Rankin–Selberg local L-factor (AL.3.2.3) and The normalized adjacent-rank period (AL.3.8.1); this roadmap §5.2; contract gap factor-epsilon-identities; contract gap tempered-local-regularity; contract gap local-rankin-selberg; contract gap whittaker-pairing-fourier; contract gap local-spherical; this roadmap §5.1a; contract gap automorphic-realization (global corollary).

**Checks.**

- (computation) If vol(K_H)=1 and B_v(x_v,x_v)=1, α_v(x_v,x_v)=1.

- (computation) If dt is multiplied by 2, α_v/B_v is 2vol(K_H), not 1.

- (non-example) For F=ℚ₂ and split E, take π_V=St_(GL₂) and π_W a unitary character of ℚ₂× of conductor 4. Then π_V^(GL₂(Z₂))=0 and π_W^(Z₂×)=0, so no nonzero hyperspecial-fixed tensor exists. The ramified nonspherical datum has its convergent 5.2 form, but cannot be assigned a spherical value.

- (computation) For F=ℚ₂, split E, n=1, π_V=Ind_B^(GL₂)(1⊠ω) normalized with ω unramified and ω(2)=-1, and π_W=1, take a spherical x with B(x,x)=vol(Z₂×)=1. Its Satake eigenvalues are 1,-1: L_F(1/2,π_V×1)=2, Δ₂=8/3 and L_F(1,σ,Ad)=32/9. Hence C=(8/3)·4/(32/9)=3, the spherical coefficient at diag(2^k,1) is 0 for odd k and 2^(-|k|/2) for even k, so the raw integral is 1+2Σ_(m≥1)2^(-m)=3, and α(x,x)=q(x)=1. Excluding residue characteristic 2 loses this value.

- (computation) For the unramified quadratic E/ℚ₂, n=1 and W=<1>, V=<1,1>, take compatible self-dual lattices and any tempered spherical π_V paired with the trivial spherical U(W) character. Here H=U(1)=K_W is compact. With total H mass 1 and B(x,x)=1, its embedded action fixes x, so the raw integral is 1; for Satake eigenvalues t,t⁻¹ over E, Δ₂=8/9 and L_F(1,σ,Ad)=(8/9)L_E(1/2,BC(σ_V)×1), so C=1 and α(x,x)=q(x)=1, also at residue size 2.

Use this interface for Existence of the all-place product.

### 5.4 Pairing, vector and Haar rescaling

Prove that under the hypotheses of 5.2, replacing B_v by b_v B_v, b_v>0, leaves q_v unchanged; replacing dt_v by a_vdt_v, a_v>0, multiplies q_v by a_v. For finitely many Haar rescalings with ∏a_v=1 the product of q_v is unchanged. For a nonzero global factorizable f, replacing f by cf multiplies |P(f)|² and the Petersson norm by |c|². Rescaling the global H Haar by a>0 multiplies |P|² by a², so `GGP.8` requires its stated Tamagawa measure rather than invariance under an arbitrary global Haar change. (bpcz, §1.1.6, pp. 4–5, bpcz line 160–188; §2.3.2, p. 15, bpcz line 679).

Here E/F is a quadratic extension of number fields; n ≥ 1 and h is any nondegenerate rank-n Hermitian E-space; G_h=U(h)×U(h orthogonal-sum <1>), with diagonal subgroup H_h=U(h); σ is an irreducible cuspidal automorphic subrepresentation of G_h(A_F), tempered at every place; Π=BC(σ) is its actual strong Hermitian discrete base change; all scalars for pairings and measures are positive real; vector scalars are nonzero complex; local Haar changes have finite support.

Use linearity of integration and sesquilinearity. Factorized local H Haar measures have a fixed global product; only product-one rescalings preserve it. The independent global Petersson pairing fixes the scale on G, so changing global H measure is a different theorem datum.

*Needs:* this roadmap §4.1; this roadmap §5.2; contract gap adelic-measures.

**Checks.**

- (computation) B_v→2B_v doubles α_v and B_v(x,x), leaving q_v unchanged.

- (computation) Haar changes 2 at v and 1/2 at w multiply the local product by 1.

- (non-example) Multiplying the global H measure by 2 multiplies the squared period by 4; it is not an invariance of the fixed-normalization identity.

Use this interface for Choice-independent form of the exported identity.

### 5.5 The product over all places

Construct the all-place Bessel product as follows. For the stated adjacent global data, nonzero factorizable f=⊗_v f_v, arbitrary invariant local pairings and local H Haar measures factoring its Tamagawa measure, construct ∏_v q_v(f_v) as the unordered product of a finite modification of the hyperspecial-volume product. Prove the latter product is convergent and nonzero under the supplier’s Tamagawa convergence factors, and the resulting product is independent of enlarging the exceptional finite set. Do not define it by a central Euler product of C_v. (bpcz, Equation (1.1.6.1) and Theorem 1.1.6.1, pp. 4–5, bpcz line 168–193; §2.3.2, p. 15, bpcz line 679).

Here E/F is a quadratic extension of number fields; n ≥ 1 and h is any nondegenerate rank-n Hermitian E-space; G_h=U(h)×U(h orthogonal-sum <1>), with diagonal subgroup H_h=U(h); σ is an irreducible cuspidal automorphic subrepresentation of G_h(A_F), tempered at every place; Π=BC(σ) is its actual strong Hermitian discrete base change; each f_v≠0 and f_v is the chosen hyperspecial-fixed reference vector almost everywhere; the reference Haar volume product and Tamagawa factorization satisfy adelic-measures.

Take the finite-exceptional expression from 5.3, multiply by the absolutely convergent volume tail supplied with Tamagawa normalization, and prove coherence under adding a good place. This construction permits zero q_v and never divides by a period.

- For a finite S containing all exceptional places, the product is ∏_(v∈S)q_v times the convergent volume product outside S.

- Moving a good place into S does not change the value.

- If a local q_v vanishes, the product vanishes; a finite zero factor is retained.

- Changing arbitrary local inner-product scales leaves the product unchanged.

*Needs:* this roadmap §5.3; this roadmap §5.4; contract gap adelic-measures.

**Checks.**

- (compatibility) For volume-one reference measures almost everywhere, only finitely many q_v differ from 1.

- (degenerate) A single q_v=0 yields product 0, not an undefined inverse.

- (computation) A good place of volume 2 contributes 2 on either side when moved into S.

Use this interface for the product on the right side of `GGP.8`.

### Examples

For compact U(1) of Haar mass a and paired weights k,-k, the unnormalized local integral on unit vectors is a. Rescaling a local pairing by b>0 scales that integral by b. The ratio α_v(f_v,f_v)/<f_v,f_v> is unchanged. A spherical ratio is vol(K_v), which equals 1 only when the local Haar measure gives K_v volume 1.

### Dependencies

AutomorphicLFunctionsAndLocalFactors §AL.3 Local convergence and continuity (AL.3.2.2), The Rankin–Selberg local L-factor (AL.3.2.3) and The normalized adjacent-rank period (AL.3.8.1); contract gap factor-epsilon-identities; contract gap tempered-local-regularity; contract gap hermitian-global-values; contract gap local-rankin-selberg; contract gap whittaker-pairing-fourier; contract gap global-parameters; this roadmap §2.7; this roadmap §2.6; contract gap local-categories; NoncommutativeGeometry §N1; AutomorphicFormsOnReductiveGroups §2.7; contract gap archimedean-globalization; contract gap gl-tempered-genericity (finite places); AutomorphicFormsOnReductiveGroups §§2.6–2.7 (archimedean genericity); AutomorphicLFunctionsAndLocalFactors §AL.3 The Whittaker realization (AL.3.1.2) and Representation prerequisites, Archimedean Whittaker comparisons (AL.R.1); this roadmap §3.3; contract gap local-spherical; this roadmap §4.1; contract gap adelic-measures; contract gap automorphic-realization.

## Layer 6: Relative characters and the endoscopic spectral calculation

### 6.1 Global Whittaker relative periods

Construct the global Whittaker relative periods as follows. For the stated Hermitian Arthur data let G′=Res_(E/F)(GL_n×GL_(n+1)), H′=Res_(E/F)GL_n diagonally, G_R=GL_n/F×GL_(n+1)/F, N its compatible maximal unipotent over E, P_m the mirabolic and N_m its upper unipotent. On the actual global Whittaker model define λ(W)=Z_RS(0,W), where Z_RS(s,W)=∫_(N_(H′)(A)\H′(A))W(h)|det h|_E^s dh continued from Re(s)≫0. Define β_η and the invariant Whittaker norm by the finite-S mirabolic integrals with the leading Asai and Rankin–Selberg coefficients and Tamagawa convergence factors of bpcz §8.1.2. Prove independence of S, nonzero β_η, λ≠0 iff L_E(1/2,Π_n×Π_(n+1))≠0, and equality of the Whittaker norm with the normalized induced Petersson norm. (bpcz, §8.1.2 and Theorem 8.1.2.1, pp. 76–77, bpcz line 4122–4154; §10.2.1, p. 90, bpcz line 4835–4845).

Here E/F is a quadratic extension of number fields and n ≥ 1; Π_m, for m=n,n+1, is the full normalized induction of distinct conjugate-self-dual cuspidal constituents Π_(m,j); each constituent has a pole of L(s,Π_(m,j),As^((-1)^(m+1))) at s=1; the actual induced representations are the supplier’s Hermitian discrete Arthur parameters; their constituent and base-change uniqueness are supplied, not postulated anew.

Use AutomorphicLFunctionsAndLocalFactors §AL.3 Local convergence and continuity (AL.3.2.2), The Rankin–Selberg local L-factor (AL.3.2.3) and The normalized adjacent-rank period (AL.3.8.1) for local continuation and tests, with gap:local-rankin-selberg only for the c_n Haar conversion; use §AL.3 global unfolding/continuation and the mirabolic distinction and leading-coefficient norm contracts for the global assertions. Factor the Eisenstein Whittaker coefficient along constituent blocks; compare the cross terms in its norm with the adjoint Euler factors. These are genuine relative constructions on the supplied parameters, not arbitrary functionals chosen to satisfy a period formula.

- The integration variable s=0 corresponds to the Rankin–Selberg central argument 1/2.

- For large S, β_η=(Δ_(G_R)^(S,*))⁻¹ L^(S,*)(1,Π_n,As^((-1)^(n+1)))L^(S,*)(1,Π_(n+1),As^((-1)^n)) times the integral over N_R(F_S)\P_R(F_S) of W(p)η_(G_R)(p).

- The squared norm is (Δ_(G′)^(S,*))⁻¹ L^(S,*)(1,Π_n×Π_n^∨)L^(S,*)(1,Π_(n+1)×Π_(n+1)^∨) times ∫_(N(F_S)\P(F_S))|W(p)|²dp; polarize for mixed vectors.

- η_(G_R)(g_n,g_(n+1))=η(det g_n)^(n+1)η(det g_(n+1))^n.

- Enlarging S inserts exactly the local unramified factor removed from the leading coefficient.

*Needs:* AutomorphicLFunctionsAndLocalFactors §AL.3 Local convergence and continuity (AL.3.2.2), The Rankin–Selberg local L-factor (AL.3.2.3) and The normalized adjacent-rank period (AL.3.8.1); contract gap hermitian-global-values; contract gap local-rankin-selberg; contract gap global-mirabolic-norms; contract gap automorphic-realization; contract gap automorphic-spectrum; contract gap adelic-measures.

**Checks.**

- (computation) For n=1, the two Asai signs in β are + on Π₁ and - on Π₂; reversing the signs selects the wrong distinction.

- (degenerate) λ(0)=β(0)=0 and the norm of 0 is 0; no normalized quotient is formed on 0.

- (characterisation) If the central L-value is zero, λ is the zero functional even though β_η and the Whittaker model are nonzero.

Use this interface for GL relative character, its central-value nonvanishing and Euler factorization.

### 6.2 Global and local relative characters

Construct the unitary global relative character as follows. For a cuspidal automorphic realization σ define J_σ(f)=Σ_e P(σ(f)e)conj(P(e)) over an orthonormal smooth K-basis for the actual Petersson pairing, the union of orthonormal bases of its finite-dimensional K-isotypic subspaces (bpcz §2.8.3, p. 25, bpcz line 1167–1170; §10.1.2, p. 87, bpcz line 4694–4701). For the stated Hermitian Arthur data define I_Π(f)=Σ_W λ(Π(f)W)conj(β_η(W))/<W,W>_Whitt over an orthogonal smooth K-basis. Prove convergence, basis independence and continuity on the supplied adelic Schwartz algebra. Define the induced relative character I_(P,ρ) by the same pairing of the canonically regularized Rankin–Selberg period of E(φ,0) with the Flicker–Rallis intertwining period; both are the supplied canonical periods, not arbitrary extensions. (bpcz, §2.8; §5.1.5 and Proposition 5.1.5.1, p. 59, bpcz line 3040–3058; §8.1.3, p. 78, bpcz line 4225–4233; §10.3.1, pp. 90–91, bpcz line 4873–4888 (local integral)).

Here E/F is a quadratic extension of number fields and n ≥ 1; Π_m, for m=n,n+1, is the full normalized induction of distinct conjugate-self-dual cuspidal constituents Π_(m,j); each constituent has a pole of L(s,Π_(m,j),As^((-1)^(m+1))) at s=1; the actual induced representations are the supplier’s Hermitian discrete Arthur parameters; their constituent and base-change uniqueness are supplied, not postulated anew; for J_σ, σ is cuspidal; temperedness is required only for its local integral realization; f belongs to the supplied adelic Schwartz algebra; all global basis vectors lie in the smooth automorphic realization, and convergence uses bpcz Proposition 2.8.4.1, p. 25, bpcz line 1174–1186; orthogonal K-bases are rescalings of compatible orthonormal smooth K-bases and their elements are nonzero. For the local assertion, F_v is any characteristic-zero local field, E_v/F_v is quadratic étale, G_v=U(V)(F_v)×U(W)(F_v), H_v=U(W)(F_v) diagonally, n ≥ 1 and σ_v is irreducible unitary tempered; f_v∈C_c∞(G_v) at finite v and f_v∈S(G_v) in the bpcz §2.5 Nash Schwartz topology at infinite v; fix Haar dg_v on G_v and dt_v on H_v; put σ_v(f_v)=∫_(G_v)f_v(g)σ_v(g)dg_v; global specializations use the disintegrated measures of bpcz §2.3.3.

Use the supplier’s nuclear trace-kernel and continuous period pairing theorem to prove convergence and independence. This applies to the actual λ and β of 6.1 and the actual P of 4.1. Positivity follows by writing the global relative character on a convolution square as a sum of absolute squares; it is not inferred from an archimedean local positivity conjecture.

For the local trace, consume the rank-one tensor expansion and trace-coefficient clause of local-smoothing-trace. The tempered bound gives an integrable majorant Ξ_(U(V))(t)Ξ_(U(W))(t)(1+lognorm(t))^d times Σ_j p(x_j)q(y_j). Target 2.7 makes its H-integral finite, so absolute Fubini exchanges that integral with the smoothing sum. The continuous form of 5.2 then identifies the sum with C_v times its α_v pairing; this uses no globalization premise.

- Changing compatible smooth K-bases, or rescaling their vectors with the displayed norm denominators, leaves the distributions unchanged.

- J_σ(f*f*)≥0 and J_σ is nonzero iff P|σ≠0, using the source convolution adjoint.

- For the local data just specified, J_(σ_v)(f_v)=∫_(H_v)Tr(σ_v(t)σ_v(f_v))dt_v is absolutely convergent and continuous in f_v. For the smoothing expansion σ_v(f_v)=Σ_j T_(x_j,y_j) supplied by local-smoothing-trace, it equals Σ_j∫_(H_v)B_v(σ_v(t)x_j,y_j)dt_v=C_vΣ_jα_v(x_j,y_j), with absolute convergence; the same value is obtained from a smooth orthonormal K-basis.

- Equivariant unitary identifications of the actual automorphic realizations transport the relative characters.

*Needs:* this roadmap §4.1; this roadmap §6.1; contract gap automorphic-spectrum; this roadmap §2.7; this roadmap §5.2; contract gap local-smoothing-trace.

**Checks.**

- (computation) For a one-dimensional realization, J_σ(f)=σ(f)|P(e)|²/<e,e>.

- (degenerate) P|σ=0 gives J_σ=0 even if σ(f) is nonzero.

- (compatibility) Replacing an orthogonal basis vector by ce multiplies numerator and norm by |c|² and does not change I_Π.

- An arbitrary orthonormal Hilbert basis can contain vectors outside the smooth realization, where P is undefined. Such a basis does not define J_σ; K-type-adapted smooth bases keep every summand in the period domain.

- (compatibility) For f_v=e_(K_G)=1_(K_G)/vol(K_G) and a one-dimensional hyperspecial-fixed subspace spanned by a unit vector x, σ_v(f_v)=T_(x,x), so J_(σ_v)(f_v)=C_vα_v(x,x). Rescaling dg_v changes e_(K_G) reciprocally and leaves this projector identity intact; omitting dt_v or C_v gives the wrong integral.

Use this interface for Spectral comparison and conversion back to pure-vector period norms.

### 6.3 The star-generic spectral contribution

For the stated Hermitian Arthur data, let χ=[M_P,ρ] be its actual cuspidal datum and r_total=r_n+r_(n+1) its constituent count. Prove that for every adelic Schwartz f, the χ-contribution I_χ to the Jacquet–Rallis trace distribution satisfies I_χ(f)=2^(-r_total)I_(P,ρ)(f)=2^(-r_total)I_Π(f). More generally the contribution is zero for a star-generic datum which is not relevant. A star-generic datum consists of pairwise distinct constituents within each degree with no two distinct constituents in the same degree conjugate-contragredient; relevance adds the individual conjugate-self-duality and prescribed Asai distinction. These are predicates on the actual cuspidal support. (bpcz, §5.1.3; Theorem 5.2.1.1, p. 59, bpcz line 3066–3083; Theorem 8.1.4.1, p. 78, bpcz line 4243–4254; equation (10.1.5.2), p. 88, bpcz line 4749).

Here E/F is a quadratic extension of number fields and n ≥ 1; Π_m, for m=n,n+1, is the full normalized induction of distinct conjugate-self-dual cuspidal constituents Π_(m,j); each constituent has a pole of L(s,Π_(m,j),As^((-1)^(m+1))) at s=1; the actual induced representations are the supplier’s Hermitian discrete Arthur parameters; their constituent and base-change uniqueness are supplied, not postulated anew; I_χ is the actual spectral contribution of the general Jacquet–Rallis trace distribution supplied by automorphic-spectrum; dim a_P=r_total includes the full split centre.

Unfold the truncated spectral kernel along H′ and G_R. The general Arthur truncation estimates from automorphic-spectrum justify taking its constant term. The Flicker–Rallis intertwining calculation leaves the factor 2^(-dim a_P); the canonical Rankin–Selberg continuation identifies the second period. Equivalently use the Whittaker expansion with 6.1. The specialized truncation-period computation is owned here; general Eisenstein, intertwiner and polynomial-exponential asymptotics are imported.

*Needs:* this roadmap §6.1; this roadmap §6.2; contract gap automorphic-spectrum.

**Checks.**

- (computation) r_n=r_(n+1)=1 gives coefficient 1/4.

- (computation) r_n=2,r_(n+1)=1 gives coefficient 1/8.

- (non-example) Repeated cuspidal constituents are excluded; the star-generic calculation is not a formula for arbitrary residual Arthur parameters.

Use this interface for Endoscopic comparison and variable component-group constant.

For finite types I and J indexing the distinct constituents in the two degrees, define the constituent sign group as the additive sign group (I⊕J)→ℤ/2. Its order is 2^(#I+#J) by `Nat.card_fun` and `Nat.card_sum`. Define the constituent coefficient as the inverse of this order in ℂ; the same native cardinal identities give (2^(#I+#J))⁻¹. The group always has at least its identity, so the inverse denominator is nonzero. The full sign group, rather than a quotient by a diagonal sign, is the one used in §7.4 (bpcz §§1.1.3, 8.1.4, pp. 3, 78, bpcz line 96–107 and bpcz line 4243–4254).

Use the native function group and finite-cardinality API.

- Addition and inversion are coordinatewise, and reindexing is an additive equivalence.
- `Nat.card_fun` and `Nat.card_sum` give order 2^(#I+#J), which is positive for every finite I,J.
- The coefficient is its inverse in ℂ; reindexing leaves both order and coefficient unchanged.

**Checks.**

- One constituent in each degree gives a constituent sign group of order 4 and coefficient 1/4; quotienting by a diagonal sign would give 1/2.
- Counts (2,1) give a constituent sign group of order 8 and coefficient 1/8; a constant 1/4 loses endoscopy.
- Empty I and J give the trivial constituent sign group of order 1 and coefficient 1.

### 6.4 Isolated relative comparison

For the stated Hermitian Arthur data choose finite S containing infinite and all bad places, and H° the finite set of rank-n Hermitian forms unramified outside S. Let f on G′(A) and f_h on G_h(A), h∈H°, be factorizable Schwartz tests with the source Tamagawa convergence factors, matching relative orbital integrals at S, spherical base-change transfer away from S, and finite-place support compact at split places and the hyperspecial unit at inert places outside S. Prove Σ_(h∈H°) J_(h,BC=Π)(f_h)=2^(-r_total)I_Π(f). Here J_(h,BC=Π) is the sum over the actual cuspidal realizations with this base change and the chosen level, not a single arbitrary representation. Include enough matched tests to detect every nonzero I_Π and every nonzero global J_σ, in the continuous archimedean topology. (bpcz, Proposition 10.1.6.1, pp. 88–89, bpcz line 4755–4767; proof bpcz line 4775–4831; detection in §10.2, p. 90, bpcz line 4850–4864).

Here E/F is a quadratic extension of number fields and n ≥ 1; Π_m, for m=n,n+1, is the full normalized induction of distinct conjugate-self-dual cuspidal constituents Π_(m,j); each constituent has a pole of L(s,Π_(m,j),As^((-1)^(m+1))) at s=1; the actual induced representations are the supplier’s Hermitian discrete Arthur parameters; their constituent and base-change uniqueness are supplied, not postulated anew; the test functions satisfy matching and support as stated, including compatible convergence factors; the multiplier theorem preserves those matching and support conditions.

Apply the general geometric Jacquet–Rallis comparison from relative-geometric-comparison. Use the supplier’s Schwartz multipliers and split-place strong multiplicity one to isolate χ on the GL side and the entire base-change class on each unitary side while preserving transfer. Then insert 6.3. Dense archimedean transfer plus exact finite-place transfer and positivity of the global J on convolution squares give detection. No individual representation is isolated by assuming `GGP.8`.

- Writing S for S₀, use f=(Δ_H′^(S,* )Δ_(G_R)^(S,*)) f_S tensor f^S and f_h=(Δ_(H_h)^S)² f_(h,S) tensor f_h^S, with the supplier’s partial/leading measure factors; matching uses its local quotient measures.

- Enlarging S preserves the same global distributions, by the fundamental lemma and spherical transfer.

*Needs:* this roadmap §6.3; contract gap relative-geometric-comparison; contract gap relative-finite-transfer; contract gap relative-archimedean-transfer; contract gap relative-fundamental-lemma; contract gap spectral-isolation; contract gap global-parameters; contract gap adelic-measures.

**Checks.**

- (compatibility) Isolation uses Schwartz multipliers without a supercuspidal local component of Π.

- (degenerate) When transfer at S vanishes on all other forms, only the designated form remains in the sum, but all cuspidal realizations with that base change remain.

- (computation) For three constituents the isolated GL term is I_Π/8; replacing it by I_Π/4 fails.

Use this interface for Adjacent nonvanishing and the period identity.

### 6.5 The tempered relative-character Euler identity

For the stated adjacent global data, let S contain infinite and all bad places and choose factorizable f_h=(Δ_(H_h)^S)²(⊗_(v∈S) f_(h,v)) tensor (⊗_(v∉S)1_(G_h(O_v))) with the source partial measure factors. Prove J_σ(f_h)=|S_Π|⁻¹ L_E^S(1/2,Π_n×Π_(n+1))/L_F^S(1,σ,Ad) ·∏_(v∈S)J_(σ_v)(f_(h,v)), where S_Π is the supplier’s product of constituent sign groups. The local comparison constants for matching tests are nonzero and their global product is 1; they are supplied by relative-character-comparison with this exact measure and additive-character convention. (bpcz, §10.3, pp. 90–92; equations (10.3.2.1), (10.3.3.2), (10.3.5.4); bpcz line 4889–4892; bpcz line 4918–4946).

Here E/F is a quadratic extension of number fields; n ≥ 1 and h is any nondegenerate rank-n Hermitian E-space; G_h=U(h)×U(h orthogonal-sum <1>), with diagonal subgroup H_h=U(h); σ is an irreducible cuspidal automorphic subrepresentation of G_h(A_F), tempered at every place; Π=BC(σ) is its actual strong Hermitian discrete base change; all local factors and test functions use the normalization of 5.2–5.4 and 6.4.

Uniqueness within local Langlands packets in Layer 3 and the actual global multiplicity formula collapse the sum of 6.4 to σ whenever every local model exists. Otherwise 4.2 and 5.2 make both sides zero. Use the supplier’s local relative-character comparison and its product-one constants, then 6.1’s Whittaker factorization and the adjoint/Asai identification. The coefficient is 2^(-dim a_P)=|S_Π|⁻¹.

*Needs:* this roadmap §3.7; this roadmap §3.9; this roadmap §3.11; this roadmap §4.2; this roadmap §5.3; this roadmap §6.4; contract gap relative-archimedean-transfer; contract gap relative-character-comparison; contract gap global-parameters; contract gap factor-epsilon-identities.

**Checks.**

- (degenerate) A place with no local model makes both global and local relative characters zero; the proof must not divide by that relative character.

- (compatibility) Local constants κ_v may be nontrivial, but their product is 1; setting every κ_v=1 without transport is not asserted.

- (computation) With constituent counts 2 and 1, |S_Π|⁻¹=1/8. The identity uses the inverse group order, not the order.

Use this interface for the pure-vector formula `GGP.8`.

### Examples

A cuspidal parameter on each GL factor has two constituents in total and coefficient 2⁻²=1/4. With two constituents on one side and one on the other, the coefficient is 2⁻³=1/8. The dimension in this calculation is that of a_P including the split centre, not a_P/a_G.

### Dependencies

AutomorphicLFunctionsAndLocalFactors §AL.3 Local convergence and continuity (AL.3.2.2), The Rankin–Selberg local L-factor (AL.3.2.3) and The normalized adjacent-rank period (AL.3.8.1); contract gap hermitian-global-values; contract gap local-rankin-selberg; contract gap global-mirabolic-norms; contract gap factor-epsilon-identities; contract gap automorphic-realization; contract gap automorphic-spectrum; contract gap adelic-measures; this roadmap §4.1; contract gap relative-geometric-comparison; contract gap relative-finite-transfer; contract gap relative-archimedean-transfer; contract gap relative-fundamental-lemma; contract gap spectral-isolation; contract gap global-parameters; this roadmap §3.7; this roadmap §3.9; this roadmap §3.11; this roadmap §4.2; this roadmap §5.3; contract gap relative-character-comparison; this roadmap §2.7; this roadmap §5.2; contract gap local-smoothing-trace.

## Layer 7: Global adjacent theorems and the `GGP.8` export

### 7.1 Adjacent global nonvanishing with endoscopy

Prove that for the stated Hermitian Arthur data, the completed L_E(1/2,Π_n×Π_(n+1)) is nonzero iff there exist a nondegenerate rank-n Hermitian space h, an irreducible cuspidal automorphic subrepresentation σ of U(h)×U(h orthogonal-sum <1>) with actual weak (equivalently strong) base change Π, and a cusp vector f in σ with P_h(f)≠0. No temperedness or auxiliary-supercuspidal-place hypothesis is imposed. (bpcz, Theorem 1.1.5.1, p. 3, bpcz line 124–134; proof §10.2, p. 90, bpcz line 4835–4864).

Here E/F is a quadratic extension of number fields and n ≥ 1; Π_m, for m=n,n+1, is the full normalized induction of distinct conjugate-self-dual cuspidal constituents Π_(m,j); each constituent has a pole of L(s,Π_(m,j),As^((-1)^(m+1))) at s=1; the actual induced representations are the supplier’s Hermitian discrete Arthur parameters; their constituent and base-change uniqueness are supplied, not postulated anew.

By 6.1 the central value is nonzero exactly when I_Π is nonzero. The detection statement of 6.4 equates this with a nonzero unitary relative character on some h. By 6.2 that character is nonzero exactly when its actual cusp period is nonzero. Weak/strong base-change comparison is supplied in global-parameters and does not follow from local multiplicity one.

*Needs:* this roadmap §4.1; this roadmap §6.1; this roadmap §6.2; this roadmap §6.4; contract gap global-parameters.

**Checks.**

- (degenerate) n=1 is in the theorem; no n > 1 restriction is inherited from the stable source.

- (non-example) The conclusion quantifies over h; it is not a theorem about every h with that rank.

- (compatibility) Several distinct cuspidal constituents are allowed on either degree, subject to the stated Hermitian Arthur conditions.

Use this interface for PeriodsAndSpecialValues; possible period witnesses for arithmetic applications.

### 7.2 The stable cuspidal specialization

Prove that for any quadratic number-field extension E/F, n > 1 and Hermitian cuspidal Π_n,Π_(n+1) of GL_n(A_E),GL_(n+1)(A_E), the equivalence of 7.1 holds. Hermitian means conjugate-self-dual with L(s,Π_m,As^((-1)^m)) regular at s=1, equivalently the opposite signed Asai factor has a pole there in this cuspidal range. No split supercuspidal place is required. (bplzz, Definition 1.5, p. 3, bplzz line 128; Theorem 1.8, p. 4, bplzz line 157–174).

Here E/F is a quadratic extension of number fields and n ≥ 1; Π_m, for m=n,n+1, is the full normalized induction of distinct conjugate-self-dual cuspidal constituents Π_(m,j); each constituent has a pole of L(s,Π_(m,j),As^((-1)^(m+1))) at s=1; the actual induced representations are the supplier’s Hermitian discrete Arthur parameters; their constituent and base-change uniqueness are supplied, not postulated anew; n > 1; each degree has a single cuspidal constituent.

Specialize 7.1 and use the supplier’s signed-Asai factorization to identify the two definitions of Hermitian cuspidal parameters. This uses the proof of 7.1 rather than replanning BPLZZ’s spectral-isolation theory.

*Needs:* this roadmap §7.1; contract gap hermitian-global-values.

**Checks.**

- (computation) The total constituent count is 2.

- (compatibility) Ramified, dyadic and infinite places remain part of the theorem.

- (non-example) The source’s n > 1 stable formulation is not used to prove n=1; that case is supplied separately by 7.1.

Use this interface for Stable-base-change applications and verification of the former auxiliary-place restriction.

### 7.3 The refined unitary period proposition

For the stated adjacent global data define the refined unitary period proposition for σ to assert that for every nonzero factorizable f, |P_h(f)|²/<f,f>_Pet = |S_Π|⁻¹ C(σ)·∏_v q_v(f_v), using the Tamagawa normalization and local product of 5.5. The group S_Π is (Z/2)^(r_n+r_(n+1)), with r_m counting the distinct actual cuspidal constituents. Also give its polarized mixed-vector period identity P(f)conj(P(g)) after local pairings are chosen to multiply to the Petersson pairing. The polarized version uses <x,y> linear in x and is equivalent by polarization, not an assumption in 7.4. (harris, Conjecture 1.3, p. 3, harris line 132–144; pairings pp. 2–3, harris line 75–111; completed formulation bpcz §1.1.6, pp. 4–5, bpcz line 148–193).

Here E/F is a quadratic extension of number fields; n ≥ 1 and h is any nondegenerate rank-n Hermitian E-space; G_h=U(h)×U(h orthogonal-sum <1>), with diagonal subgroup H_h=U(h); σ is an irreducible cuspidal automorphic subrepresentation of G_h(A_F), tempered at every place; Π=BC(σ) is its actual strong Hermitian discrete base change; both global quotient measures are Tamagawa, and the local H Haar measures factor its Tamagawa measure.

State Harris’s refined assertion on the already constructed carriers and compare its Δ and adjoint conventions with 5.1 and BPCZ. Polarization applies to the Hermitian period norm after vector-norm denominators are cleared; no division by a zero mixed pairing is used.

- The proposition quantifies over nonzero pure tensors with exactly the displayed factors.

- With product-compatible pairings its mixed-vector version is obtained by polarization on each finite set of modified tensor factors.

- Vector and local-pairing rescaling follow 5.4; product-one Haar rescaling preserves it.

*Needs:* this roadmap §4.1; this roadmap §5.1; this roadmap §5.2; this roadmap §5.5; contract gap global-parameters; contract gap adelic-measures.

**Checks.**

- (computation) r_n=r_(n+1)=1 gives 1/4.

- (computation) r_n=2,r_(n+1)=1 gives 1/8, not 1/4.

- (non-example) The zero global vector is excluded before forming its Petersson quotient; zero period on a nonzero vector is allowed.

Use this interface for A precise conjecture interface with its proof delivered by `GGP.8`.

### 7.4 The completed unitary period identity

Prove the completed unitary period identity, labeled `GGP.8`. For the stated adjacent global data, with both global integrals measured by Tamagawa measures and arbitrary positive invariant local inner products, choose local H Haar measures whose product is its Tamagawa measure. For every nonzero factorizable f=⊗_v f_v, prove |P_h(f)|²/<f,f>_Pet = 2^(-(r_n+r_(n+1))) · (∏_(i=1..n+1)L_F(i,η^i)) · L_E(1/2,Π_n×Π_(n+1))/L_F(1,σ,Ad) · ∏_v (α_v(f_v,f_v)/<f_v,f_v>_v). Here α_v=C_v⁻¹ times the local diagonal matrix-coefficient integral. Every L-function is completed, local normalizers are regular nonzero, and the product is the one of 5.5. Endoscopic, ramified, dyadic, split and infinite places are all included. (bpcz, Theorem 1.1.6.1, pp. 4–5, bpcz line 179–193; measures §2.3.2, p. 15, bpcz line 679–699; proof §10.3, pp. 90–92, bpcz line 4865–4946).

Here E/F is a quadratic extension of number fields; n ≥ 1 and h is any nondegenerate rank-n Hermitian E-space; G_h=U(h)×U(h orthogonal-sum <1>), with diagonal subgroup H_h=U(h); σ is an irreducible cuspidal automorphic subrepresentation of G_h(A_F), tempered at every place; Π=BC(σ) is its actual strong Hermitian discrete base change; the two global quotient measures and the local Haar factorization are as stated; f≠0 is a pure restricted tensor; consequently every f_v≠0; the refined unitary period proposition is defined in 7.3; its truth is not a hypothesis.

First prove the denominator-cleared polarized vector identity by applying 6.5 to smoothing rank-one tensors and using continuity/density in the supplied nuclear category. 2.6 and 4.2 identify the period factors, 5.3 supplies the unramified tail, and the source’s Tamagawa convergence factors restore Δ_(n+1). Divide only by the positive Petersson norm of f and the positive local vector norms. The component coefficient comes from 6.3, not an assumed refined formula.

- The theorem proves the refined unitary period proposition; it does not assume it.

- If both base changes are cuspidal, the coefficient is 1/4; for n > 1 this is BPLZZ Theorem 1.10, p. 4, bplzz line 185.

- PeriodsAndSpecialValues consumes the declaration together with all local, measure, convergence and component-count hypotheses under the stable label GanGrossPrasadUnitaryGroups:GGP.8.

*Needs:* this roadmap §2.7; this roadmap §5.1; this roadmap §5.2; this roadmap §5.3; this roadmap §5.4; this roadmap §5.5; this roadmap §6.5; this roadmap §7.3; contract gap adelic-measures; contract gap global-parameters.

**Checks.**

- (compatibility) f→cf cancels |c|² on the left; B_v→2B_v cancels on the right.

- (compatibility) Local Haar changes by 2 and 1/2 at two places preserve both sides; an arbitrary change of the global Tamagawa normalization is excluded.

- (computation) For actual Π with counts (2,1) the coefficient is 1/8. Counts (1,1) give 1/4.

- (degenerate) If the central value is 0 the right side is 0 with all local terms defined, hence the period of every such vector is 0.

Use this interface for the exact `GGP.8` downstream export.

### Examples

The existential nonvanishing theorem chooses an inner form; it does not assert a period on a prescribed h. The refined theorem applies to each prescribed h carrying an everywhere-tempered cuspidal σ. Constituent counts (1,1) and (2,1) give respectively 1/4 and 1/8.

### Dependencies

this roadmap §4.1; this roadmap §6.1; this roadmap §6.2; this roadmap §6.4; contract gap global-parameters; contract gap hermitian-global-values; this roadmap §5.1; this roadmap §5.2; this roadmap §5.5; contract gap adelic-measures; this roadmap §2.7; this roadmap §5.3; this roadmap §5.4; this roadmap §6.5.

## Downstream consumers

- **PeriodsAndSpecialValues** consumes `GanGrossPrasadUnitaryGroups:GGP.8`, §7.4, with the complete measures, local convergence, spherical normalization and variable component-group constant. Its consumer section is not assigned by this roadmap.
- **TwistedAutomorphicDescents** consumes the unitary Bessel subgroup, multiplicity and Langlands correspondence interfaces in §§1.2, 2.6, 3.7 and 3.9, and the period identity in §7.4. Its orthogonal and Fourier–Jacobi requirements belong to the named Part II and retain their other owners.
- **QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups**, G8, consumes the unitary multiplicity theorem §2.6, adjacent Ξ estimate §2.7, relative form §3.3 and factorization §§4.2, 7.4. This does not supply its mixed orthogonal requirements, moment-map geometry, upper-semicontinuity or full induced-component positivity.

The period-witness premise in SelmerIwasawaCohomologyPartII §8.1 has an arithmetic owner. Applying §7.1 to fill that premise requires a continuation after this roadmap, together with an independent argument selecting its required definite form and integral test vector. The existential inner-form theorem alone does not supply those extra requirements, and the arithmetic roadmap supplies no premise to `GGP.8`.

## References

The following identifiers fix the legal source copies and the numbering used above. A citation such as ggp line 229 refers to the numbered text extraction of that exact version. Preprint numbering is retained separately from publication numbering.

- **xue-real**: Hang Xue, [Bessel models for real unitary groups: the tempered case](https://par.nsf.gov/servlets/purl/10476094), 2023. Theorem 2.2, published p. 1000; Sections 2.1-2.3, pp. 997-1001; Corollary 2.5, p. 1001.

- **ggp**: Wee Teck Gan, Benedict H. Gross, Dipendra Prasad, [Symplectic local root numbers, central critical L-values, and restriction problems in the representation theory of classical groups](https://arxiv.org/abs/0909.2999v1), 2009. Sections 2, 6, 12, 14-15, 17-19, 23-24; Theorems 6.1, 14.1(ii), 15.1, 17.2; Conjectures 17.1, 17.3, 24.1; arXiv v1 pp. 5-7, 20-21, 58-63, 68-76, 86-91.

- **agrs**: Avraham Aizenbud, Dmitry Gourevitch, Steve Rallis, Gérard Schiffmann, [Multiplicity one Theorems](https://arxiv.org/abs/0709.4215v1), 2007. Theorem 1 prime (1'), arXiv v1 p. 2.

- **sun-zhu**: Binyong Sun, Chen-Bo Zhu, [Multiplicity one theorems: the Archimedean case](https://arxiv.org/abs/0903.1413v2), 2009. Theorem B and Casselman-Wallach conventions, arXiv v2 p. 2.

- **bp-unitary-tempered**: Raphaël Beuzart-Plessis, [La conjecture locale de Gross-Prasad pour les représentations tempérées des groupes unitaires](https://arxiv.org/abs/1205.2987v2), 2012. Theorem 17.1.1, arXiv v2 p. 100; Section 18.1, pp. 106-107; Theorem 18.4.1, p. 110.

- **bp-arch**: Raphaël Beuzart-Plessis, [A local trace formula for the Gan-Gross-Prasad conjecture for unitary groups: the archimedean case](https://arxiv.org/abs/1506.01452v3), 2015. Theorem 12.4.1, arXiv v3 pp. 289-290; Sections 12.2-12.3.

- **bp-refined**: Raphaël Beuzart-Plessis, [Endoscopie et conjecture locale raffinée de Gan-Gross-Prasad pour les groupes unitaires](https://arxiv.org/abs/1212.0951v2), 2012. Theorem 8.5.1, arXiv v2 pp. 70-71; Sections 7.2, 7.7, 8.1, 8.3; introduction Theorem 1, pp. 3-4.

- **harris**: R. Neal Harris, [The Refined Gross-Prasad Conjecture for Unitary Groups](https://arxiv.org/abs/1201.0518v2), 2012. Conjecture 1.3, arXiv v2 p. 3; pairings and normalized local periods, pp. 2-3; Proposition 2.1, p. 5; Theorem 2.12, p. 23; Section 2 spherical-data assumptions.

- **bplzz**: Raphaël Beuzart-Plessis, Yifeng Liu, Wei Zhang, Xinwen Zhu, [Isolation of cuspidal spectrum, with application to the Gan--Gross--Prasad conjecture](https://arxiv.org/abs/1912.07169v3), 2019. Definition 1.5, arXiv v3 p. 3; Theorems 1.8 and 1.10, p. 4.

- **bpc-bessel**: Raphaël Beuzart-Plessis and Pierre-Henri Chaudouard, [The global Gan–Gross–Prasad conjecture for unitary groups. II. From Eisenstein series to Bessel periods](https://webusers.imj-prg.fr/~pierre-henri.chaudouard/GGP2.pdf), 2025; Forum of Mathematics, Pi 13, e16, [doi:10.1017/fmp.2025.8](https://doi.org/10.1017/fmp.2025.8). Locators refer to the author manuscript: Theorems 1.3.3.1 and 1.3.6.1, pp. 7, 9; Remarks 1.3.3.2 and 1.3.6.2(3), pp. 7, 9.

- **kmsw**: Tasho Kaletha, Alberto Mínguez, Sug Woo Shin and Paul-James White, [Endoscopic classification of representations: inner forms of unitary groups](https://arxiv.org/abs/1409.3731v1), 2014, arXiv v1. Sections 0.4.4 and 1.2.4, pp. 27–28, 62; Theorem 1.6.1, pp. 79–81. The component-group comparisons use the definitions in this version and retain its classification premises.

- **bpcz**: Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard, Michał Zydor, [The global Gan-Gross-Prasad conjecture for unitary groups: the endoscopic case](https://arxiv.org/abs/2007.05601v1), 2020. Sections 1.1.2-1.1.6, arXiv v1 pp. 2-5; Theorems 1.1.5.1 and 1.1.6.1; Section 2.3.2, p. 15.

- **jsz-bessel**: Dihua Jiang, Binyong Sun, Chen-Bo Zhu, [Uniqueness of Bessel models: the archimedean case](https://arxiv.org/abs/0908.1728v2), 2009. Theorem A, arXiv v2 pp. 1-2; Sections 2.1-2.2.

- **zhang-period**: Wei Zhang, [Automorphic period and the central value of Rankin–Selberg L-function](https://arxiv.org/abs/1208.6280v4), 2014, arXiv v4. Equation (3.2), pp. 13–14; §3.3, p. 19; Lemma 4.9 and Proposition 4.10, pp. 31–33; change of measures, p. 29.

- **bernstein-zelevinsky**: I. N. Bernstein and A. V. Zelevinsky, [Induced representations of reductive p-adic groups. I](https://www.numdam.org/item/ASENS_1977_4_10_4_441_0/), 1977. Geometric lemma §2.12, published p. 448.

- **bp-plancherel**: Raphaël Beuzart-Plessis, [Plancherel formula for GL_n(F)\GL_n(E) and applications to the Ichino–Ikeda and formal degree conjectures for unitary groups](https://arxiv.org/abs/1812.00047v2), 2018, arXiv v2. Theorem 5.3.1, p. 84; Theorem 5.5.1 and Remark 5.5.2, p. 89.

- **bp-fundamental**: Raphaël Beuzart-Plessis, [A new proof of Jacquet-Rallis’s fundamental lemma](https://arxiv.org/abs/1901.02653v3), 2019, arXiv v3 dated 2020. Theorem 1 and group comparison, p. 3.

- **ag-descent**: Avraham Aizenbud and Dmitry Gourevitch, [Generalized Harish-Chandra descent, Gelfand pairs, and an Archimedean analog of Jacquet-Rallis’s theorem](https://arxiv.org/abs/0812.5063v6), 2009, arXiv v6 dated 2026. Theorems 3.1.1, 5.1.5, 5.1.7 and 8.1.5, pp. 9, 13, 25.
