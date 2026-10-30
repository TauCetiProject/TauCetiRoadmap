# Roadmap: automorphic L-functions and local factors, part II

**Summary.** This roadmap develops classical unitary doubling in a fixed right-action normalization, its holomorphic archimedean test sections, and generalized doubling for split symplectic, special orthogonal and general spin groups. It builds on Fourier analysis, Tate and general-linear local factors, admissible representation theory and Eisenstein continuation. Its end theorems are the meromorphic unitary standard function and Garrett pullback, nonvanishing and normalized algebraicity of critical archimedean integrals, generalized local functional equations and stability, global entireness after sufficiently ramified twists, and weak global and coarse local standard transfer without a genericity hypothesis on the classical representation.

## Scope and ownership

AutomorphicLFunctionsAndLocalFactors, Layers AL.0–AL.4, is the base roadmap. It stops at Fourier analysis, Tate, Godement–Jacquet, generic Rankin–Selberg and parameter/Euler-factor comparisons. Its Representation prerequisites owns GL isobaric sums, and AL.3 owns isobaric strong multiplicity one and its stated GL converse theorems. These constructions are imported here; through them the split-torus groups SO₂ and GSpin₂ keep their full global scope in §§6.11 and 9.5, without a doubling period. The outside-S converse theorem with a fixed ramified twisting character in §10.3 has a different testing family and permits nongeneric candidate components. The base's Layer AL.5 owns period, sign and finite-correction interfaces; p-adic interpolation and integral congruence applications of the unitary doubling outputs are outside this roadmap.

SmoothRepresentationsOfLocalGroups, SR.0–SR.5, owns smooth admissible categories, induction, Jacquet functors, Satake theory, Harish–Chandra support and GL segment/multisegment constructors. AutomorphicFormsOnReductiveGroups §§2.1–2.7, 3.4–3.5, 4.1–4.3, 5.3–5.4 and 6.1–6.2 owns their real, globalized and cohomological counterparts. No classification is rebuilt here. The local generalized Speh comparison of §5.2 identifies canonical quotient data with their (k,c) models over every characteristic-zero local field; it preserves the distinction between a possibly reducible inducing representation and its distinguished irreducible subquotient.

AutomorphicSpectralTheory §§1.1–1.4 and 2.1–2.6 owns general Eisenstein continuation from discrete unitary inducing data, intertwiners and ordered residues; the unitary Siegel Eisenstein family of §1.3 is its specialization to the one-dimensional datum χ∘det, and MetaplecticAutomorphicForms §6.2 uses that family for splitting characters χ_V, through its Siegel–Weil sections. AutomorphicSpectralTheory §4.14a owns number-field residual Speh representations and their local quotient realizations, and §5.12 owns the cuspidal-support decomposition of automorphic forms. EndoscopicTransferAndUnitaryTraceComparison §5.1 uses that same residual representation, and §10.29 owns nongeneric GL pair factors. GL2AutomorphicRepresentationsAndTransfer R16.1.8 owns finite-image Hecke characters with prescribed full local components. Those constructions are imported. This roadmap owns their generalized-doubling specializations, the two-term constant-term recursion and its nonessential-self-duality holomorphy theorem.

MetaplecticAutomorphicForms §§6.10a–6.11 owns the general classical standard doubling integral, local factors, spherical denominator, good-section gcd and completed standard function, and the local extension of §2.0 extends them to unitary inducing characters without a splitting condition; §3.15 owns the MVW involution over nonarchimedean fields. They are imported. Section 3.2 proves the archimedean contragredient comparison on the Harish–Chandra modules and globalizations of AutomorphicFormsOnReductiveGroups §§2.4 and 2.7. Sections 2.1–2.4 and 3.2–3.4 below are the EHLS right-action, inverse-character, normalized-pairing and flat/dagger comparisons, with their full ramified and archimedean scope. The holomorphic theta criterion and rational projected-kernel comparison of §§4.8–4.10 are additional targets. They do not assert an explicit general vector-weight gamma-value formula.

ReductiveGroups Layer 7 owns rational parabolics and Levi structure. ReductiveGroupsPartII RG2.0, RG2.4 and RG2.5 owns point topologies, local structure and dual/L-groups. OrthogonalSpinGroups Layers 0–1 own general-field SO, the Lipschitz and Spin groups and their action on vectors through the Clifford algebra. RepresentationTheory/ClassicalGroups Layers 2–3 owns the complex Schur and highest-weight theory; the pinned Tau Ceti Weyl modules supply the characteristic-zero coefficient-field carriers used in §4.4. GeometryOfNumbersAndQuadraticArithmetic §2.9 owns signed Hermitian spaces over fields and their adjoints; MetaplecticAutomorphicForms §3.2a owns the split étale pairing. Section 0.0 constructs the U/GU/GSpin coordinate and reductivity comparisons on these supplied form and Clifford carriers. Mathlib owns block matrices, conjugate transpose, Hermitian matrix predicates, trace, additive characters, the Lipschitz subgroup of Clifford units and the Pin/Spin submonoids and their elementary algebra; Tau Ceti identifies the Lipschitz group with the classical Clifford group. None is introduced again here.

The additional comparison targets are owned here: §0.0 gives the unitary/general spin group comparisons; §0.4 gives archimedean standard transfer; §2.0 and §3.4 extend unitary doubling to arbitrary inducing characters; §3.2 gives real contragredients; §§5.0 and 5.1a give classical quotient and rectangular support comparisons; §5.6 gives opposite-unipotent estimates; §§8.0, 8.2 and 8.5 give pole detection, Hermitian support and Speh/square normalizer comparisons; §§10.0, 10.2 and 10.3 give the globalization, general automorphic support, gamma-support and epsilon character-change comparisons. Their underlying representation categories, induction, spectral continuation and canonical GL factors retain the supplier ownership just described.

The independent Speh-integral and Asai/general-linear-period continuations are separate mathematical directions. The present targets concern doubling, not newform uniqueness or mixed-truncation periods. General global endoscopic transfer, Arthur packets, integral congruence modules and p-adic measures are outside these layers.

## Conventions

All local fields have characteristic zero. A finite place has residue cardinality q≥2, uniformizer ϖ and |ϖ|=q⁻¹. The additive character ψ:F→ℂ× is continuous, nontrivial and unitary. Self-dual additive measures are chosen relative to ψ; group and quotient Haar measures remain explicit data. A hyperspecial compact subgroup has volume 1 only when the spherical calculation assumes it. Characteristic-zero fields with residue characteristic 2 or 3 are included; |2| is not replaced by 1. Positive real absolute values use the real logarithm in complex powers.

For a quadratic étale algebra E/F, conjugation is its nonidentity F-involution and |z|_E=|N_(E/F)z|_F. For E=ℂ and F=ℝ this is z z̄, so |2|_ℂ=4. For E=F×F it is |xy|_F. A nonsplit unramified quadratic extension has q_E=q_F²; split products have two degree-n general-linear factors. Hermitian forms are conjugate-linear in their first variable. Their split-algebra version uses finite projective constant-rank E-modules, not a field instance on F×F. Similitudes record their multiplier as data, including dimension zero; recovering it from the action requires positive dimension.

Use row vectors and right matrix action for the EHLS parabolic coordinates. The ordered polarization is anti-diagonal then diagonal, A⊕D. Before dual bases are rescaled, their cross-pairing is 2h. The block Gram identity can also be written using columns, after the explicit transpose identification. The radical is skew-adjoint in these unrescaled coordinates; multiplication by a chosen trace-zero unit identifies it with Hermitian matrices. The parabolic's actual modulus is the absolute determinant of its conjugation action on the radical. The separate notation δ_EHLS is not its definition.

The unitary variable is s_U and its standard L-variable is z=s_U+1/2; reflection of z sends s_U to −s_U. The generalized local variable is s_G, centered at 1/2. Its global Eisenstein exponent is s_E=s_G−1/2. For example s_G=1/2 gives s_E=0. A symbol s inside a subsection uses that subsection's convention. Compact-picture entire sections, finite-place Laurent-polynomial sections and meromorphic sections are distinct spaces.

Write C_G^• for the image of e₀∨:Gₘ→GSpin_c and for the trivial group outside GSpin. For c>2 it is the identity component of the center. For GSpin₂=Gₘ×Gₘ it has dimension 1 whereas the full connected center has dimension 2; the doubling kernel and quotients always use C_G^•. The formal GSpin₀ and GSpin₁ tails are Gₘ. This distinction also fixes χ_π as the restriction along e₀∨ (CFK §1, pp.6–7; CFK line 264). For SO₂≅Gₘ and GSpin₂ the quotient G/C_G^• is a one-dimensional split torus, so C_G^•(A)G(F)⧸G(A) has infinite volume over a number field F; these are the split-torus cases. Their local factors are those of Layer 6, computed in §6.11, and their global theory is §9.5 rather than the period of §9.1.

Finite-place representations are smooth admissible complex representations. Archimedean representations use the Casselman–Wallach category, its smooth continuous dual and K-finite Harish–Chandra module. Holomorphic branching concerns the algebraic K-finite restriction, not an unqualified Hilbert direct-sum assertion. Coefficient fields for algebraicity are embedded CM number fields containing the specified compact-type and differential-operator data. The letter E in those statements denotes that coefficient field; it is distinguished from a local quadratic algebra by context. The complex number π in a period exponent is the circular constant, and π in a representation argument is a representation.

All spaces and index types lie in fixed universes; a local algebraic group is finite type and its vector spaces are finite dimensional, while smooth/globalized representations may be infinite dimensional. Adelic restricted products and quotient integration carry the countability, local compactness, second countability and measurability hypotheses of the suppliers. Meromorphic equalities and quotients are equalities of continued families or germs. Values at poles are never obtained by division of infinite values, and the order of the zero germ is treated separately. Empty products equal 1. Parameters requiring n≥1, c>1 or k≥1 retain those bounds, so natural subtraction and out-of-range partitions do not create extra cases.

## Exact supplier contracts

### From Mathlib

Use `Matrix.fromBlocks` in Mathlib/Data/Matrix/Block.lean, line 45, and `Matrix.fromBlocks_multiply`, line 213. The constructor uses compatible rectangular blocks without algebraic assumptions; multiplication needs finite contracted index types and nonunital nonassociative semiring coefficients. Use `Matrix.conjTranspose` in Mathlib/LinearAlgebra/Matrix/ConjTranspose.lean, line 43: transpose followed by the coefficient star operation. Use `Matrix.IsHermitian` in Mathlib/LinearAlgebra/Matrix/Hermitian.lean, line 44: equality with the conjugate transpose, with no positivity or nondegeneracy condition. Use `Matrix.trace` in Mathlib/LinearAlgebra/Matrix/Trace.lean, line 43: the finite diagonal sum over an additive commutative monoid. Use `AddChar` in Mathlib/Algebra/Group/AddChar.lean, line 70: an additive-monoid-to-multiplicative-monoid map preserving zero and addition; continuity, unitarity and nontriviality are extra hypotheses. These exact native carriers supply the block and adjacent-trace calculations of Layers 0 and 5. Use `lipschitzGroup` in Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean, line 61: the subgroup of Clifford-algebra units generated by the invertible vectors, for any quadratic form over a commutative ring; and `spinGroup`, line 292: the submonoid of the Clifford algebra given by the intersection of the Pin submonoid with the even subalgebra. Its elements are the even elements satisfying the Pin star-unitary condition; its native carrier is not a subgroup of the units. They are the rational-point carriers behind the general spin groups of Layers 0 and 5; neither is a group scheme, and neither records a root datum.

### From Tau Ceti

No Tau Ceti module is imported by Suggested.lean. Use `CliffordAlgebra.mem_lipschitzGroup_iff_involute_act_ι_mem_range_ι` in TauCeti/LinearAlgebra/CliffordAlgebra/Lipschitz/CliffordGroup.lean, line 138: over a field with 2 invertible, for a nondegenerate quadratic form on a finite-dimensional space that takes a unit value somewhere, a Clifford unit lies in `lipschitzGroup` exactly when its twisted conjugation preserves the vectors. Since the main involution is the identity on even elements, the rational points of GSpin_c for c≥2 are the even elements of `lipschitzGroup`. Use `TauCeti.weylModuleOfShape` and `TauCeti.weylRepOfShape` in TauCeti/RepresentationTheory/ClassicalGroups/WeylModule/Basic.lean, lines 429 and 441, over a commutative ℚ-algebra: these are the image of the row-superstandard Young symmetrizer and its GL action, not a general Schur functor on arbitrary modules. Use `TauCeti.isIrreducible_weylRepOfShape_iff` in TauCeti/RepresentationTheory/ClassicalGroups/WeylModule/Irreducible.lean, line 160, over a characteristic-zero field: the representation is irreducible exactly when the shape has at most n rows. Section 4.4 constructs the field-compatible Cauchy decomposition and selected projectors on these carriers. The mathematical build consumes the pinned group, linear-algebra and analytic foundations through the following roadmap contracts; these contracts do not identify planned declarations with executable library data.

### From TauCetiRoadmap.ReductiveGroups and TauCetiRoadmap.OrthogonalSpinGroups

Consume ReductiveGroups Layer 7, rational parabolics, Levi decomposition, root subgroups and Weyl transport for a specified reductive group. Consume OrthogonalSpinGroups Layer 0, the general-field orthogonal/SO carriers, and Layer 1, the Lipschitz group, the spinor norm and the map from Spin to SO given by the Clifford action on vectors, in characteristic different from 2. Preserve their nondegeneracy and invertibility-of-2 hypotheses. No arbitrary quadratic-étale unitary or general spin group is inferred from a standard complex matrix group.

### From TauCetiRoadmap.ReductiveGroupsPartII

Consume RG2.0.1–RG2.0.2 for rational-point topology and local groups, RG2.0a for restriction of scalars, RG2.4 for local decompositions and the adjoint-determinant modulus, and RG2.5.1–RG2.5.2 for dual groups and L-groups of supplied pinned reductive groups.

Section 0.0 makes the unitary and general spin comparisons on these group-scheme foundations.

### From TauCetiRoadmap.RepresentationTheory.ClassicalGroups

Consume Layers 2–3 over ℂ for the complex Schur representations, highest-weight classification, compact-type duals and highest lines. Their standing complex-field convention is retained. The coefficient-field forms, polynomial Cauchy isomorphism and normalized highest-line projectors in §4.4 are built on the pinned Weyl modules, then compared after extension to ℂ; no general Schur construction is repeated.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

Consume SR.0 admissible smooth carriers, with SR.0.4 for admissibility and smooth contragredients, hence matrix coefficients; SR.2.1–SR.2.3 for normalized induction, Jacquet functors, the geometric lemma and pairings; SR.3.3 Harish–Chandra tempered support and the conditional Langlands classification; SR.4 Satake theory; SR.5.1 *mirabolic-derivatives*, SR.5.2 *segment-representations* and SR.5.3 *highest-derivative-adapter*, preserving their distinct submodule and quotient conventions. Every use of the classification retains the exact Harish–Chandra input until the supplier's tempered-support target is proved. The local generalized Speh comparison is constructed in §5.2, using these existing constructors.

### From TauCetiRoadmap.AdelicAlgebraicGroups

Consume §§0.1–0.4 for restricted Haar products and Fubini, AA.1 for adelic group points, and §§2.2–2.3 for compatible quotient measures and central quotients. Their measure-theoretic hypotheses accompany every unfolding.

### From TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer

Consume R16.1.8, finite Hecke characters with prescribed full local components: for a number field M, a finite set S of finite places and continuous finite-image characters χ_v of the full groups M_v×, v∈S, there is a continuous finite-image character of the idele class group restricting to χ_v on each M_v× and trivial at every infinite place; auxiliary finite ramification and growth of the order are allowed. A finite-image character is unitary. No arithmetic restriction beyond finite image is imposed on the χ_v. Sections 10.4–10.5 make their local choices before applying this theorem: deep conductor at the bad places, with η_v₀²χ_(π_v₀) ramified at one of them in §10.4, and trivial component on all of M_v₀× at the isolated place in §10.5.

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

Consume AL.0 Schwartz–Bruhat spaces, vector-space Fourier inversion and Schwartz convolution; AL.1 Tate factors, quadratic characters and norm/conductor conventions; AL.2 Godement–Jacquet integrals and the Jacquet–Shalika Satake bound; AL.3 generic GL pair factors, their finite/archimedean continuation, global poles, boundary nonvanishing, functional equations, isobaric strong multiplicity one and the vertical-strip bounds of its Hecke and Rankin–Selberg data, which §9.5 uses for the GL₁×GL_k functions of the split-torus branch; AL.4 Satake factors (the unramified Euler factor det(1−T r(t))⁻¹) and right Euler convergence. Consume Representation prerequisites, GLₙ isobaric sums, for the isobaric constructor. The generic GL converse theorems in AL.3 have their stated testing families; §10.3 proves the fixed-ramified-character variant, together with the right convergence of the formal twisted products it needs, from the AL.4 unramified factor and the AL.2 Jacquet–Shalika bound.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

Consume §§2.1–2.7 for Harish–Chandra modules, normalized real induction, Langlands quotients, real/complex parameters, the generic unitary exponent bound, Dixmier–Malliavin and Casselman–Wallach globalization. Consume §§3.4–3.5 for restricted tensors, §4.2 for cuspidal globalization and actual automorphic occurrences, and §§5.3–5.4 and 6.1–6.2 for Hermitian cohomological modules and rational compact-type structures.

### From TauCetiRoadmap.AutomorphicSpectralTheory

Consume §§1.1–1.4 and 2.1–2.6 for convergence, constant terms, smooth meromorphic Eisenstein families induced from discrete unitary data (including the functional equation E_Q(M(w,λ)φ,wλ)=E_P(φ,λ) and regularity on the unitary axis i𝔞_P* in §2.4, and the smooth extension of §2.4a), local/global intertwiners and ordered residues. Consume §2.3a for GL normalized-intertwiner estimates, §2.5 for local–global factorization of intertwiners, §4.14a for the number-field residual Speh representation and all its local components, Layer 4 for residual square-integrability, and §5.12 for the cuspidal-support decomposition of automorphic forms. The additional constant-term and Hermitian-support comparisons are targets of §8.0.

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

Consume §10.29, Analytic factors for segments and Langlands quotients, with canonical ordered GL quotient data and nongeneric pair-factor products. Its segment formula makes the pair γ-factor of an irreducible Π of GL_N(F) against a supercuspidal τ the product of γ(s,ρ×τ,ψ) over the supercuspidal support of Π, so equal supports give equal γ-factors (HEN02 §5.1(b), p.601; HEN02 line 610). Section 5.1's global residual block is the same AutomorphicSpectralTheory §4.14a representation used here. No global endoscopic classical-group transfer theorem is an input to the transfer proved in Layer 10.

### From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

Consume §2.9, signed Hermitian spaces over fields, their adjoints and trace-transfer comparison, with sign +1 for unitary doubling. The quadratic-étale split case uses MetaplecticAutomorphicForms §3.2a. Section 0.0 constructs the group/reductivity and coordinate comparisons of these supplied forms.

### From TauCetiRoadmap.MetaplecticAutomorphicForms

Consume §3.2a's split quadratic-étale Hermitian carrier, §3.3's unitary splitting data with the §3.3b oscillator normalizations, §§3.5–3.7's local theta carriers, §3.15's MVW involution over nonarchimedean fields of characteristic different from 2 (assumed: π∘θ≅π∨ for every irreducible smooth π of the unitary groups of its Hermitian datum), §6.2's Siegel–Weil sections in the unitary Siegel family for splitting characters (assumed: they are sections of the §1.3 family at χ=χ_V; for other χ nothing is taken from §6.2), and §§6.10a–6.11's classical standard doubling integral, factors, good-section gcd with Yamana's comparison of good and holomorphic sections on Re s≥0, archimedean normalized-quotient and nonzero-test assertions, and completed product. The normalization transport in Layers 1–3 must compare its parabolic, character, parameter, measures and vector pairing individually. Section 4.9 constructs the specialized holomorphic theta-image and projected-integral nonvanishing theorem used here from the supplied oscillator/local theta carriers, rather than assuming that every nonzero theta correspondence supplies that particular critical vector.

The supplied §6.10a factors are built with the compatible splitting characters, whose restriction to F× is the quadratic character of E/F raised to dim V; norm twists only shift the parameter. The unitary targets of Layers 2–4 use an arbitrary inducing character χ of E×; §2.0 constructs the local extension, and §3.4 its completed global extension.

The inverse-character dictionary between the MetaplecticAutomorphicForms convention and the EHLS right-action family is proved in Layers 1–3. For E=ℚ₃×ℚ₃ and χ=(ϑ,1) with ϑ a ramified quadratic character of ℚ₃×, χ(2,2)=ϑ(2)=−1 because 2 is a nonsquare unit, whereas every splitting character for the split algebra and every norm twist takes the value 1 at (2,2); so this χ is reached only through the extension.

## How to read the build

Layer 0 fixes the geometry and standard dual representations. Layers 1–3 construct the EHLS section comparison, its local normalization dictionary and global pullback. Layer 4 supplies holomorphic test sections and their critical nonvanishing and period. Layer 5 constructs (k,c) models, their geometry and estimates before Layer 6 defines generalized local factors. Layer 7 proves pole attainment through auxiliary GL integrals, while Layer 8 independently proves Eisenstein holomorphy. Layer 9 combines them into completed factors, functional equations, strip bounds and ramified-twist entireness; for the split tori SO₂ and GSpin₂, whose global period diverges, it derives these from the GL₁×GL_k factors computed in §6.11. Layer 10 then applies the specialized converse theorem and proves weak/global and coarse/local transfer. Every stated source comparison is a construction to prove, not an unverified hypothesis standing for its desired conclusion. Suggested.lean records the headline signatures that can be expressed on native carriers; its module docstring identifies the seventeen headlines whose representation-theoretic carriers require this build.

## Layer 0: doubled spaces and classical standard data

### 0.0 unitary and general spin group comparisons

For a nondegenerate Hermitian form on a finite projective constant-rank module over a characteristic-zero quadratic étale algebra E/F, construct the unitary group U and the multiplier-recording similitude group GU as reductive F-group schemes compatible with base change, together with the block embedding U(V)×U(−V)→U(V⊕(−V)) and its equal-multiplier fibre-product analogue for GU. (EHLS §4.1.1, pp.43–44; EHLS line 1862.)

For a nondegenerate split quadratic space of dimension c≥2 over a characteristic-zero field F, construct GSpin_c as a connected reductive F-group scheme whose F-points are the even elements of Mathlib's `lipschitzGroup`, with its distinguished central cocharacter e₀∨:Gₘ→GSpin_c, the morphism to SO_c whose F-points are the OrthogonalSpinGroups Layer 1 vector action, and a pinned root datum. (CFK §1, pp.6–8; CFK line 264.)

The U and GU comparison sends an automorphism, with its multiplier for GU, to its action on the supplied Hermitian module. The GSpin comparison identifies its rational points with the even Clifford units and transports the vector action and the distinguished central cocharacter. The vector action alone does not determine an even Clifford unit: its scalar kernel is retained. Prove base-change compatibility, compatibility with the doubled block embedding, and equality through the faithful rational-point identification; retain the multiplier at rank zero. A proof can descend from a separable closure, where U and GU become GL_n and GL_n×Gₘ, and identify GSpin with the central quotient of Spin×Gₘ by the diagonal μ₂, using the supplied affine-group quotient and Clifford action. The rank-zero GU case is Gₘ separately.

- The U comparison preserves multiplication and identifies the form-preserving automorphisms.
- The GU comparison preserves both the action and the recorded multiplier; equality requires equality of both.
- The GSpin comparison identifies the even Lipschitz points, the map to SO and e₀∨ with the supplied Clifford action and the chosen pinning.

**Checks.**

- For V=0 the isometry group has one element, while multiplier-recording GU has every λ∈F×; on F=ℚ the zero action admits λ=1 and λ=2, so forgetting the multiplier identifies distinct elements.
- For E=F×F and rank one, the action (x,ℓ)↦(2x,ℓ/2) preserves the pairing, whereas (2x,2ℓ) multiplies it by 4; the two nonzero idempotents multiply to zero.
- For split GSpin₂ the cocharacter lattice has rank 2 and e₀∨ has rank 1; quotient by its image has rank 1, while quotient by the whole center has rank 0.

*Needs:* ReductiveGroups Layer 7; ReductiveGroupsPartII RG2.0a and RG2.5; OrthogonalSpinGroups Layers 0–1; GeometryOfNumbersAndQuadraticArithmetic §2.9; MetaplecticAutomorphicForms §3.2a.

### 0.1 the doubled hermitian space

Let E/F be a quadratic étale algebra in characteristic zero, with involution x↦x̄, and h a nondegenerate hermitian form on the n-dimensional E-space V. Define W=V⊕V with h_W((x,y),(x′,y′))=h(x,x′)−h(y,y′), D={(x,x)} and A={(x,−x)}. Then W=A⊕D, both summands are maximal isotropic, and h_W((x,−x),(y,y))=2h(x,y). The inverse decomposition sends (u,v) to ((u−v)/2,(u+v)/2). The block action gives U(V)×U(−V)→U(W); for similitudes use the equal-multiplier fiber product.

Assume E/F quadratic étale; char(F)=0; h nondegenerate; n≥0, with the zero-dimensional case included. (EHLS, §4.1.1, pp.43–44; EHLS line 1862.)

Prove the following basic properties of this construction.

- In an h-basis the Gram matrix is Matrix.fromBlocks H 0 0 (−H).

- A⊕D≃W has the inverse displayed in the definition.

- The isometry embedding respects multiplication; the similitude embedding is defined on matching multipliers.

- An isometry of hermitian spaces induces the doubled isometry, preserving A and D and commuting with the polarization equivalence.

- A linear map from W is determined by its restrictions to A and D; equality of doubled forms follows from their four polarization blocks.

**Checks.**

- For h(x,y)=x̄y, the doubled Gram matrix is diag(1,−1) and the diagonal vector is isotropic.

- The same construction for V=0 gives W=0 and both isotropic subspaces zero.

- For the rank-one unit vectors in A and D the pairing is 2, rather than 0 or 1.

Additional normalization checks:

- For h=1, h_W((1,1),(1,1))=0 and h_W((1,−1),(1,1))=2; replacing the opposite form by h gives 2 and 0 instead.
- For (u,v)=(3,1), the inverse coordinates are (1,2) and reconstruct (3,1); omitting the halves reconstructs (6,2).
- At rank zero the form and both summands are zero; multiplier-recording GU still has every λ∈F×, so uniqueness of λ from the zero action fails.

A proof can proceed as follows: Form h⊕(−h) on the Hermitian-space carrier and the group comparison of §0.0; the complex matrix milestone uses the native block-matrix carrier only. Use 2 invertible to construct mutually inverse diagonal/antidiagonal coordinates. Check preservation of the form and the equal-multiplier condition directly.

The U/GU constructions use the supplied signed Hermitian field form and split étale form. The comparison is invariant under isometry and compatible with extension of the ground field; no chosen basis is part of the underlying doubled space.

*Needs:* `Matrix.fromBlocks`; `Matrix.IsHermitian`; ReductiveGroups Layer 7 (parabolics and Levi theory); the comparison of §0.0.

### 0.2 siegel parabolic and modulus conventions

Let P=Stab(D) in GU(W). Use row vectors with matrices acting on the right, so P is block upper triangular. With the ordered polarization A⊕D, its Levi is GL_E(V)×G_m: m(B,λ) acts as diag(λ(B*)⁻¹,B), where B* is the adjoint for h. In these unrescaled coordinates its unipotent radical consists of blocks [[1,X],[0,1]] with X skew-adjoint for the cross-pairing. Fixing a nonzero trace-zero scalar t∈E identifies X=tY with a hermitian coordinate Y; this coordinate change is explicit, including for E=F×F. Conjugation by m(B,λ) sends X to λ(B*)⁻¹XB⁻¹. Write Δ(p)=p|D and ν(p)=λ. Keep δ_EHLS(p)=|det_E Δ(p)|_E^n distinct from the actual group modulus δ_mod. On U(W), with this ordering, δ_mod(m(B,1))=|det B|_E^(−n)=δ_EHLS⁻¹. On GU(W) the full formula is δ_mod(m(B,λ))=|λ|_F^(n²)|det B|_E^(−n), because Lie(N) has F-dimension n². This is the absolute F-determinant of the displayed conjugation action.

Assume n≥1; the polarization and norm convention of §0.1; |z|_E=|N_E/F z|_F. (EHLS, §4.1.1–4.1.2, p.44; EHLS line 1862.)

Prove the following basic properties of this construction.

- Identify M with GL_E(V)×F× and record the restrictions Δ and ν.

- The skew-adjoint block space is the additive radical N; the chosen trace-zero scalar transports it to hermitian coordinates and preserves addition.

- δ_mod(m(B,λ))=|λ|_F^(n²)|det B|_E^(−n); its restriction to U is δ_EHLS⁻¹.

- Two Levi elements agree iff their D-coordinate B and multiplier λ agree.

- Every p∈P factors uniquely as a Levi element times a radical element; multiplication uses the displayed conjugation of X.

**Checks.**

- For n=1, λ=1, the actual modulus is |B|_E⁻¹.

- For B=t·Id and λ=t t̄, the Levi element is scalar, so its true modulus is 1.

- Two unipotent elements with coordinates X,Y multiply to the element with coordinate X+Y.

Additional normalization checks:

- For n=1, |B|_E=4 and λ=1, the radical scales by 1/4, giving modulus 1/4 rather than 4.
- For B=2I_n and λ=4 over ℂ/ℝ, |λ|^(n²)|det B|_E^(−n)=4^(n²)4^(−n²)=1.
- For skew coordinates X=i and Y=2i in rank one, n(X)n(Y)=n(3i); n(i)n(−i)=1.

A proof can proceed as follows: Use row-vector right action to identify the upper block stabilizer, and derive skew-adjointness from the cross-form; record the trace-zero rescaling used for hermitian coordinates. Compute conjugation on the hermitian unipotent block and its F-determinant. Derive both modulus characters from that action; do not equate a paper notation with δ_mod.

*Needs:* §0.1; ReductiveGroups Layer 7 (parabolics and Levi theory); AdelicAlgebraicGroups §§0.1–0.4 and 2.2–2.3 (restricted products and quotient measures); the comparison of §0.0.

### 0.3 classical groups and standard transfer degree

For the split characteristic-zero groups G=Sp_c (c even), SO_c, or GSpin_c, with c>1 in the main transfer theorem, fix a pinning and the standard representation r of the complex dual group. For Sp_(2n), SO_(2n), SO_(2n+1), GSpin_(2n), GSpin_(2n+1), the standard degree N is respectively 2n+1,2n,2n,2n,2n. Define χ_π=1 outside GSpin; in GSpin it is the central character restricted along e₀∨:F×→C_G^•. The determinant character of r∘t_π is 1 outside GSpin and χ_π^n for GSpin_(2n) or GSpin_(2n+1). For the split tori, identify SO₂ with GL₁ through diag(t,t⁻¹)↦t, its action on the first isotropic basis line, and GSpin₂ with Gₘ×Gₘ through its cocharacters e₁∨ and e₀∨ (CFK §1, p.7; CFK lines 264–267), so that a character π of GSpin₂(F) is π(e₁∨(y)e₀∨(x))=σ(y)χ_π(x) for characters σ,χ_π of F×. The split-torus pair of π is (α,β)=(μ,μ⁻¹) for π=μ on SO₂ and (α,β)=(σ,σ⁻¹χ_π) on GSpin₂; thus αβ=χ_π, and α⊕β is the standard transfer r∘t_π of the parameter of π. The pair is unordered: replacing the identification of SO₂ with GL₁ by its inverse exchanges μ and μ⁻¹. General root data and dual groups are imported from ReductiveGroups and ReductiveGroupsPartII; the general-field SO carrier is imported from OrthogonalSpinGroups. Use §0.0 for the U/GU and GSpin group comparisons.

Assume local or global characteristic-zero field; admissible irreducible π locally or cuspidal π globally; fixed pinning. (CFK, §1, pp.6–8; §3.1–3.2, pp.10–12; CFK line 250.)

Prove the following basic properties of this construction.

- Return the five degrees N and their dual groups.

- Restrict the GSpin central character along e₀∨, with value 1 for the other families.

- For SO₂ and GSpin₂, the split-torus pair (α,β) has product χ_π and sum r∘t_π, independently of the order of the pair.

- The determinant of each standard transfer has the character specified above.

- Pinned isomorphisms transport r and the distinguished-central-torus embedding, preserving N and the determinant formula.

**Checks.**

- Sp₂ has N=3, not 2.

- SO₃ has N=2, not 3.

- For GSpin_(2n+1), the determinant of the standard similitude representation is χ_π^n; the determinant is trivial when χ_π=1.

- For GSpin₂ with σ=1 and χ_π unramified with χ_π(ϖ)=−1, the pair is (1,χ_π) and det(α⊕β)(ϖ)=−1=χ_π(ϖ), the n=1 case of the determinant rule; the pair (σ,σ⁻¹)=(1,1), which forgets χ_π, has determinant 1 and violates it.

Additional normalization checks:

- For Sp₂ the dual standard degree is 3 and determinant 1; for SO₃ the degree is 2.
- For GSpin₅, a scalar dual similitude tI₄ has χ=t² and determinant t⁴=χ², not χ.
- For GSpin₃ the degree is 2 and determinant χ; χ=1 gives determinant 1.
- For GSpin₂, dim(center)=2, dim(C_G^•)=1 and dim(G/C_G^•)=1. Quotienting by the whole connected center would instead give dimension 0 and would change the integral.

A proof can proceed as follows: Use the imported root-data and dual-group construction once the comparison of §0.0 has supplied GSpin_c with its root datum. Identify the distinguished central torus in the general spin cases. Compute the determinant of the standard dual representation, retaining its central character.

*Needs:* ReductiveGroups Layer 7 (parabolics and Levi theory); AutomorphicLFunctionsAndLocalFactors Layer AL.4 (Satake Euler factors and convergence); ReductiveGroupsPartII §§RG2.5.1–RG2.5.2 (dual groups and L-groups); the comparison of §0.0.

### 0.4 archimedean standard transfer

For each irreducible admissible representation π of one of the five split classical families over ℝ or ℂ, with c>1 and N as in §0.3, construct its local Langlands parameter up to dual-group conjugacy and the irreducible admissible GL_N representation T(π) attached to its composite with the standard dual representation r_G. Prove compatibility with the determinant character of §0.3, infinitesimal characters, contragredients and the chosen Casselman–Wallach globalizations. Use the GL_N correspondence of AutomorphicFormsOnReductiveGroups §2.5 on the receiving side. (CFK §3.2, (3.1), p.12; CFK line 478; Theorem 3.5, (3.13), p.16; CFK line 659.)

- The parameter and T(π) are invariant under representation isomorphism and the chosen parameter conjugacy.
- The determinant equals the central character prescribed by §0.3, and the infinitesimal character is its r_G image.
- Contragredients commute with standard transfer, and the resulting Harish–Chandra-module isomorphisms extend to the chosen smooth globalizations.

**Checks.**

- For Sp₂ the dual standard weights are t,1,t⁻¹; their product is 1 and their number is 3. A two-dimensional GL transfer has the wrong degree.
- For GSpin₃ the standard transfer has two weights x,y and determinant xy, its multiplier; at x=2,y=3 the determinant is 6, rather than 1.
- For SO₂ and μ=sgn at a real place the parameter is sgn⊕sgn with determinant 1; its local factor is Γ_ℝ(s+1)², whereas the trivial parameter gives Γ_ℝ(s)².

*Needs:* §0.3; AutomorphicFormsOnReductiveGroups §§2.4–2.5 and 2.7; ReductiveGroupsPartII RG2.5.

### Examples

In rank one, h(x,y)=x̄y gives h_W((1,−1),(1,1))=2. For (u,v)=(3,1), the anti-diagonal and diagonal coordinates are 1 and 2, and (1,−1)+(2,2)=(3,1). On the split algebra E=F×F take the trace-zero unit (1,−1); its two idempotents have product zero, so a field-only Hermitian carrier cannot cover this example. For n=0, U(0)=1; if similitudes are pairs, GU(0)=Gₘ and the multiplier cannot be recovered from its action on the zero space.

### Dependencies

The group comparisons precede the analytic layers; §0.4 uses the supplied archimedean representation theory. The direct supplier inputs are `Matrix.fromBlocks`; `Matrix.IsHermitian`; ReductiveGroups Layer 7 (parabolics and Levi theory); AdelicAlgebraicGroups §§0.1–0.4 and 2.2–2.3 (restricted products and quotient measures); AutomorphicLFunctionsAndLocalFactors Layer AL.4 (Satake Euler factors and convergence); ReductiveGroupsPartII §§RG2.5.1–RG2.5.2 (dual groups and L-groups); OrthogonalSpinGroups Layers 0–1; GeometryOfNumbersAndQuadraticArithmetic §2.9; MetaplecticAutomorphicForms §3.2a; AutomorphicFormsOnReductiveGroups §§2.4–2.5 and 2.7.

## Layer 1: unitary induced sections and Eisenstein series

### 1.1 unitary degenerate principal series

Use right translation and normalized induction. For a quasi-character χ:E×→C× and s∈C define I_EHLS(χ,s)=i_P^GU(W)(χ(det Δ)·δ_EHLS^(−s/n)·|ν|_F^(sn/2)); thus functions transform on the left by δ_mod^(1/2) times this inducing character. Work on U(W) by restriction, and globally with the corresponding Hecke character. Entire sections are holomorphic in the fixed compact picture; at finite places polynomial sections are finite Laurent polynomials in q^(−s). The passage to the usual left-action inducing convention is an explicit inverse-character and parameter change, never an implicit renaming.

Assume n≥1; Layer 0 conventions; continuous quasi-character χ; fixed positive real logarithm in complex powers. (EHLS, §4.1.2, p.44; §4.3.1, (54), pp.51–52; EHLS line 1882.)

Prove the following basic properties of this construction.

- The covariance is the complete δ_mod^(1/2)χ(det Δ)δ_EHLS^(−s/n)|ν|^(sn/2) covariance.

- All parameter fibers have the same compact-picture carrier.

- Restriction to multiplier 1 removes exactly the ν factor.

- Extend a smooth compact-picture function satisfying the P∩K covariance uniquely to the normalized induced representation.

- Sections in a fixed fiber agree if their restrictions to K agree; families agree if all compact-picture evaluations agree.

**Checks.**

- At s=0 the covariance is δ_mod^(1/2)χ(det Δ).

- On split U(1,1), the character on the D-coordinate gives χ⁻¹ in the spherical standard factors after unfolding.

- Multiplying χ by |·|_E^t changes the determinant exponent by t, without changing the half-modulus.

Additional normalization checks:

- At n=1,s=0, χ=1 and |B|_E=4, covariance is 1/2 from the half-modulus.
- Changing χ by |·|_E raises that determinant factor by 4; at the same B the covariance becomes 2.
- At split rank one X=1/2,Y=1/3 the inverse-character convention gives Z=5/2; exchanging χ and χ⁻¹ changes X,Y for a character with χ(ϖ)=2.

A proof can proceed as follows: Apply normalized induction from the existing smooth or Casselman–Wallach category. Restrict all family members to a common maximal compact subgroup. Compute the transformation law under Δ and ν before changing character or parameter conventions.

*Needs:* §0.2; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 (induction, Jacquet functors, geometric lemma and pairings) and §SR.0.4 (admissible duals and matrix coefficients); AutomorphicFormsOnReductiveGroups §§2.1–2.7 (real representations and globalizations); AutomorphicSpectralTheory §§1.1–1.4 (Eisenstein convergence and constant terms).

### 1.2 godement sections from Schwartz functions

At a split place E=F×F, identify the relevant factor with GL_(2n)(F) through the w-projection, so that the D-block of m(B,1) is B_w and its A-block is the w-component of (B*)⁻¹, which is determined by B_wbar; write χ₁=χ_w and χ₂=χ_wbar⁻¹, and let Φ be a Schwartz–Bruhat function on Mat_(n,2n)(F)=Hom_F(F^n,F^(2n)). Use the second row block (0,X) in the ordered polarization A⊕D, and set f_Φ(g)=χ₂(det g)|det g|^(n/2+s)∫_(GL_n(F)) Φ((0,X)g)χ₁⁻¹χ₂(det X)|det X|^(n+2s)d×X in its convergence region, then meromorphically. For p=[[A,B],[0,D]], changing variables Y=XD gives f_Φ(pg)=χ₂(det A)χ₁(det D)|det A/det D|^(n/2+s)f_Φ(g). This is first an isometry-group construction (ν=1); extension to GU uses the decomposition G(ℚ_p)=ℚ_p^××∏_w G_w through which (54) attaches the factor |ν|^(sn/2), recomputed here in the m(B,λ) coordinates, where λ enters through the w-component of λ(B*)⁻¹. This is the general section construction in (55); particular ordinary Schwartz choices are not targets here.

Assume split local place; χ₁,χ₂ as above; fixed right Haar d×X; Φ Schwartz–Bruhat; initial Re(s) sufficiently large. (EHLS, §4.3.1, equations (54)–(55), pp.52–53; EHLS line 2228.)

Prove the following basic properties of this construction.

- The assignment Φ↦f_Φ is linear on its convergence domain and on the continued family.

- For p=[[A,B],[0,D]], f_Φ(pg)=χ₂(det A)χ₁(det D)|det A/det D|^(n/2+s)f_Φ(g) on ν=1.

- Right translation of g corresponds to the same right translation of Φ.

- Equal Schwartz functions give equal sections, first on the convergence half-plane and then as continued meromorphic families.

**Checks.**

- Φ=0 gives the zero section.

- For n=1 the inner integral is a Tate integral with exponent 1+2s.

- Replacing d×X by a·d×X multiplies the section by a, rather than leaving it unchanged.

- For n=1 and p=diag(a,1), (0,x)p=(0,x), and the section scales by χ₂(a)|a|^(1/2+s). Choosing (x,0) would produce the wrong character.

Additional normalization checks:

- For Φ=0 the integral is 0 and every translated section is 0.
- For n=1,s=0,p=diag(4,1), trivial characters give scaling 2; the wrong row changes the inner variable.
- Replacing d×X by 3d×X takes a section of value 2 to value 6.

A proof can proceed as follows: Use the AutomorphicLFunctionsAndLocalFactors AL.0 Schwartz carrier on the matrix space and the AutomorphicLFunctionsAndLocalFactors AL.2 determinant-integral estimates. Use (0,X)p=(0,XD), set Y=XD, and use the unimodularity of GL_n to derive the displayed covariance, including both characters and the determinant ratio. Transport the construction to the EHLS family by the explicit split-group identification.

*Needs:* §1.1; AutomorphicLFunctionsAndLocalFactors Layer AL.0 (vector-space Fourier analysis); AutomorphicLFunctionsAndLocalFactors Layer AL.2 (Godement–Jacquet theory).

### 1.3 degenerate Siegel Eisenstein continuation

Over a number field F with quadratic CM extension E, form E(f,s,g)=Σ_(P(F)⧸GU(W)(F)) f(s,γg), or its restriction to U(W). This is the specialization of AutomorphicSpectralTheory §§1.1–1.4, 2.4 and 2.4a to the Siegel parabolic P with the one-dimensional inducing datum χ(det Δ), a unitary character of M_P(𝔸) trivial on M_P(F) and hence a discrete unitary representation of M_P(𝔸)¹, and to the parameter λ_s given by §1.1; when χ is a splitting character χ_V, whose restriction to 𝔸_F× is the quadratic character of E/F raised to the power dim V (MetaplecticAutomorphicForms §3.3), its U(W) restriction is the Siegel family in which MetaplecticAutomorphicForms §6.2 places its Siegel–Weil sections, while for general χ the family is the AutomorphicSpectralTheory specialization alone. For a smooth K-finite section the sum converges absolutely and locally normally for Re(s) sufficiently large, extends meromorphically to C as an automorphic family, is regular on Re(s)=0, and satisfies E(M(w,λ_s)f,wλ_s)=E(f,λ_s) for the long Siegel Weyl element w. What this subsection adds is the translation into the EHLS normalization: on U(W), w sends the inducing character of I_EHLS(χ,s) to that of I_EHLS((χ^c)⁻¹,−s), where χ^c(x)=χ(x̄), and in the standard variable z=s+1/2 this is the reflection z↔1−z; on GU(W) the multiplier part of the transformed character is computed separately and carried along, since agreement on U(W) does not determine it.

Assume number field; unitary Hecke character with norm twists absorbed into the parameter; finite K-type section; coherent quotient measures. (EHLS, §4.1.3, p.45; §4.1.4, pp.45–48; EHLS line 1893; HLS, §3.1, internal pp.43–49; HLS line 1704.)

A proof can proceed as follows: Identify K-finite sections of I_EHLS(χ,s) with flat sections of the AutomorphicSpectralTheory §1.1 induced family for the datum χ(det Δ), using the covariance of §1.1. Apply AutomorphicSpectralTheory §2.4 for continuation, unitary-axis regularity and the functional equation, and §2.4a for smooth sections. Compute the action of w on the Siegel Levi, m(B,λ)↦m(λ(B*)⁻¹,λ), to read off the transformed character: on U(W) the determinant factor χ(det B)|det B|_E^(−s) becomes χ(det B*)⁻¹|det B|_E^s=(χ^c)⁻¹(det B)|det B|_E^s, because det B*= overline(det B).

*Needs:* §1.1; AutomorphicSpectralTheory §§1.1–1.4 (Eisenstein convergence and constant terms); AutomorphicSpectralTheory §§2.4 and 2.4a (discrete-data continuation, functional equations and smooth extension); MetaplecticAutomorphicForms §6.2 (Siegel–Weil sections, for the splitting-character comparison).

### Examples

For n=1 and p=diag(a,1), the Godement section scales by χ₂(a)|a|^(1/2+s). Taking a=4, χ₂=1 and s=0 gives 2. The alternative row (x,0) changes the integration variable and gives a different character. At s=0 the induced covariance is precisely the true half-modulus times χ. The raw determinant exponent in the one-variable integral is 1+2s. For the Siegel functional equation at n=1 over ℂ/ℝ, take χ=|·|_E^i and B=2: the original character has value 4^i at B, the transformed character (χ^c)⁻¹ has value 4^(−i), and keeping χ would give 4^i; for χ(z)=z/|z| the two values agree, so only a character with (χ^c)⁻¹≠χ tests the inversion.

### Dependencies

This layer follows Layer 0. The direct supplier inputs are SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 (induction, Jacquet functors, geometric lemma and pairings) and §SR.0.4 (admissible duals and matrix coefficients); AutomorphicFormsOnReductiveGroups §§2.1–2.7 (real representations and globalizations); AutomorphicSpectralTheory §§1.1–1.4 (Eisenstein convergence and constant terms); AutomorphicLFunctionsAndLocalFactors Layer AL.0 (vector-space Fourier analysis); AutomorphicLFunctionsAndLocalFactors Layer AL.2 (Godement–Jacquet theory); AutomorphicSpectralTheory §§2.4 and 2.4a (discrete-data continuation, functional equations and smooth extension); MetaplecticAutomorphicForms §6.2 (Siegel–Weil sections, for the splitting-character comparison).

## Layer 2: unitary local normalization comparisons

### 2.0 unitary doubling for arbitrary inducing characters

For a characteristic-zero local field F, a quadratic étale algebra E/F, a nondegenerate Hermitian space V of positive rank and an irreducible admissible π of U(V), smooth at finite places and Casselman–Wallach at infinity, construct the MetaplecticAutomorphicForms §6.10a doubling integrals, their continuation, normalized functional equation, standard local factors, good-section gcd and unramified denominator for the Siegel induction from χ∘det twisted by |det|_E^s, for every continuous quasi-character χ of E× with no condition on its restriction to F×, and for cuspidal π over a number field and every Hecke character χ of 𝔸_E×/E× the completed standard function with its meromorphic continuation and functional equation, in the MetaplecticAutomorphicForms §6.10a parabolic convention. The local assertions are proved in this layer; their completed global extension is the target of §3.4. (EHLS §§4.1.4–4.2.1, pp.45–49; EHLS line 1971.)

- The arbitrary-character integral specializes to the splitting-character integral with the same Haar and pairing.
- Its normalized intertwiner and local factors obey the functional equation for the complete inducing character, including its restriction to F×.
- The good-section ideal and the spherical denominator retain the normalization transported in §§2.1–2.4.

**Checks.**

- For split E=ℚ₃×ℚ₃ and χ=(ϑ,1), with ϑ the ramified quadratic character, χ(2,2)=−1; split splitting characters and norm twists have value 1 there.
- At split rank one with X=1/2,Y=1/3, Z=5/2 and d₁=6/5 give d₁Z=3; dropping the denominator instead gives 5/2.
- At χ(z)=z/|z| over ℂ/ℝ the Weyl character is χ itself, with value i at i; replacing it by χ⁻¹ gives −i.

*Needs:* §1.1; AutomorphicLFunctionsAndLocalFactors AL.1–AL.4; MetaplecticAutomorphicForms §§6.10a–6.11; SmoothRepresentationsOfLocalGroups SR.2; AutomorphicFormsOnReductiveGroups §§2.1–2.7.

### 2.1 local unitary doubling integral

Use the local integral of MetaplecticAutomorphicForms §§6.10a–6.11. Prove its comparison with the EHLS right-action family, preserving the unnormalized evaluation pairing; the formula below specifies that comparison, rather than a second local integral. For an irreducible admissible π of U(V)(F), v∈π and ℓ∈π∨ with the continuous evaluation pairing, its transported expression is Z_U(s,f,v,ℓ)=∫_U(V)(F) f(s,ι(g,1))ℓ(π(g)v)dg in its absolute-convergence half-plane. Its continued value is a meromorphic trilinear functional, rational in q^(−s) at finite places and continuous on the archimedean smooth models. If ℓ(v)≠0 set I_U=Z_U/ℓ(v); retain Z_U as primary because this division is unavailable on orthogonal vectors. The finite-place Haar convention is vol(U(V)(O_F))=1 when this is hyperspecial.

Assume Characteristic-zero local field; π smooth admissible at finite places or Casselman–Wallach at infinity; compatible section and Haar. (EHLS, §4.1.4, equations (49)–(51), pp.46–48; EHLS line 1971.)

Prove the following basic properties of this construction.

- Z_U is linear in section, vector and smooth dual vector.

- I_U·ℓ(v)=Z_U whenever ℓ(v)≠0.

- Scaling dg by a scales both Z_U and I_U by a.

- A representation isomorphism and its dual inverse preserve the evaluation matrix coefficient, hence the integral with the same section and measures.

**Checks.**

- Z_U(s,f,0,ℓ)=0 although normalized I_U is not defined on that data.

- Replacing ℓ by bℓ for b≠0 leaves I_U unchanged and multiplies Z_U by b.

- For compact U(V), with f|ι(U,1)=1 and π trivial, Z_U=vol(U(V))·ℓ(v).

Additional normalization checks:

- For v=0, Z_U=0 and ℓ(v)=0; the displayed normalized quotient has no meaning there.
- For a nonzero pairing 2 and Z_U=6, I_U=3; scaling ℓ by 5 gives pairing 10 and Z_U=30, still I_U=3.
- For the trivial representation of a compact group of Haar mass 7, with f=1 and pairing 2, Z_U=14 and I_U=7.

A proof can proceed as follows: Bound the matrix coefficient and the section along the Cartan decomposition. Continue by the unitary doubling uniqueness/intertwining argument; the precise comparison is in the exact unitary normalization comparison of §§1.3 and 2.4. Divide by the pairing only on its nonzero locus.

The comparison map has source the EHLS induced fiber and target the supplied classical doubled induction, followed by restriction along U(V)→U(W). It tracks the inverse inducing character, affine parameter and Haar scalar, and is natural under representation transport. It also includes ramified open-cell sections: choose the lattice inside the fixing subgroup and the conductor of χ(det(1−x)), and retain the scalar attached to the chosen Weyl representative (EHLS Lemma 4.2.3, p.50; EHLS line 2129).

*Needs:* §0.1; §1.1; SmoothRepresentationsOfLocalGroups §SR.3.3 (tempered support and Langlands quotients); AutomorphicFormsOnReductiveGroups §§2.1–2.7 (real representations and globalizations); AutomorphicLFunctionsAndLocalFactors Layer AL.0 (vector-space Fourier analysis); MetaplecticAutomorphicForms §6.10a (canonical classical factors); the comparison of §2.0.

### 2.2 unitary unramified denominator

Identify the supplied classical doubling denominator of MetaplecticAutomorphicForms §6.10a with the following indexed Tate product in the EHLS convention. For an unramified quadratic étale E/F, residue norm q_F, associated quadratic character η of F×, and unramified χ:E×→C×, write the supplied denominator as d_n(s,χ)=∏_(r=0)^(n−1) L_F(2s+n−r,χ|F×·η^r), using the AutomorphicLFunctionsAndLocalFactors AL.1 Tate factors. Under the EHLS right-action convention the denominator used in the spherical integral is d_n(s,χ⁻¹). The standard numerator is the degree-n base-change factor over E; at a nonsplit place its expression in q_F^(−s) has degree 2n. Keep the local-field normalization explicit rather than calling it a degree-n polynomial over F.

Assume unramified local data; unramified quadratic extension or split algebra; self-dual additive measures and hyperspecial Haar convention. (EHLS, §4.2.1, (53), pp.48–49; EHLS line 2081.)

Prove the following basic properties of this construction.

- The denominator consists of the n Tate factors with the index r and η parity.

- d_(n+1)(s,χ)=d_n(s+1/2,χ)·L_F(2s+1,χ|F×·η^n).

- The right-action spherical identity uses d_n(s,χ⁻¹), not d_n(s,χ).

- The n=0 product is 1; this is a boundary convention for the denominator, not an n=0 induced-series construction.

**Checks.**

- d₀=1.

- d₁(s,χ)=L_F(2s+1,χ|F×).

- d₂=L_F(2s+2,χ|F×)L_F(2s+1,χ|F×η); replacing η by 1 fails at a nonsplit place.

Additional normalization checks:

- The empty product d₀ is 1, while n=0 remains excluded from the induced-family formula with s/n.
- For q=2 and trivial χ, d₁(0)=2; for n=2 and η(ϖ)=−1, d₂(0)=8/9.
- The recurrence at n=1,s=0 gives d₁(1/2)=4/3 and the new η-factor 2/3, whose product is 8/9.

A proof can proceed as follows: Build the finite product out of Tate factors. Compare χ and χ⁻¹ using the inducing transformation law. Record base-change degree over E and the different residue norm over F.

*Needs:* §1.1; AutomorphicLFunctionsAndLocalFactors Layer AL.1 (Tate factors); AutomorphicLFunctionsAndLocalFactors Layer AL.4 (Satake Euler factors and convergence); MetaplecticAutomorphicForms §6.10a (canonical classical factors); the comparison of §2.0.

### 2.3 unramified unitary doubling formula

Transport the spherical identity of MetaplecticAutomorphicForms §6.10a through that denominator and inverse-character comparison. Fix a self-dual O_E-lattice L in V, let K_V⊂U(V)(F) be its stabilizer and let K_W⊂U(W)(F) be the stabilizer of L⊕L in the original coordinates W=V⊕(−V); L⊕L is self-dual for h_W, K_W is hyperspecial and ι(K_V×K_V)⊂K_W. Transport K_W to the polarization A⊕D by the inverse decomposition of §0.1, together with ι and the Haar measures. For the K_W-spherical section f° with f°(1)=1 and K_V-spherical vectors with ℓ(v)=1, prove d_n(s,χ⁻¹)Z_U(s,f°,v,ℓ)=L_E(s+1/2,BC(π∨)⊗χ⁻¹), equivalently L_E(s+1/2,BC(π)⊗(χ^c)⁻¹), since BC(π∨)≅BC(π)∨≅BC(π)^c and an L-factor over E is unchanged by conjugation. At a split rank-one place write π=β, a character of U(1)={(x,x⁻¹)}, with w-coordinate β₀(x)=β(x,x⁻¹), so that BC(β)(z)=β(z/z̄) is (β₀,β₀⁻¹) on E_w××E_wbar×; write χ=(χ_w,χ_wbar), t=q^(−s−1/2), X=β₀(ϖ)χ_wbar(ϖ)⁻¹t and Y=β₀(ϖ)⁻¹χ_w(ϖ)⁻¹t. With the w-projection of §1.2, the embedded element ι((x,x⁻¹),1) has Iwasawa D-entry a unit and A-entry of absolute value |x| when |x|<1, and D-entry of absolute value |x| when |x|>1, the Iwasawa entries being measured on the transported lattice L⊕L, so directly Z_U=1/(1−X)+Y/(1−Y)=(1−XY)/((1−X)(1−Y)). Since d₁(s,χ⁻¹)=(1−XY)⁻¹, the product is ((1−X)(1−Y))⁻¹, the Euler factor of (β₀⁻¹χ_w⁻¹,β₀χ_wbar⁻¹)=BC(β⁻¹)⊗χ⁻¹. This computes the inverse character, the contragredient and the missing cross-factor. The identity refers to this compatible lattice datum, at every residue characteristic including 2: it fails for other hyperspecial subgroups of U(W)(F) that contain ι(K_V×K_V), for instance the stabilizer of the product lattice of the A⊕D coordinates at a dyadic place (Layer 2 Examples). The nonsplit general-rank computation must be supplied from the spherical doubling calculation, with its normalization comparison retained in the exact unitary normalization comparison of §§1.3 and 2.4.

Assume unramified π and χ; spherical normalized data; initial convergence domain, then rational continuation. (EHLS, §4.2.1, pp.48–49, with the stated right-action convention; EHLS line 2081.)

A proof can proceed as follows: Use Iwasawa/Cartan and spherical matrix coefficients to express the integral as a Satake series. Identify the symmetric-function series with the standard base-change Euler product and the Tate denominator. Independently sum the two rank-one geometric series to detect inverse-character mistakes.

*Needs:* §2.1; §2.2; SmoothRepresentationsOfLocalGroups Layer SR.4 (Satake theory); AutomorphicLFunctionsAndLocalFactors Layer AL.4 (Satake Euler factors and convergence); MetaplecticAutomorphicForms §6.10a (canonical classical factors); the comparison of §2.0.

### 2.4 unitary local functional equation

Transport the normalized local functional equation of MetaplecticAutomorphicForms §6.10a to the precise opposite family in §1.1. The meromorphic functionals Z_U for I_EHLS(χ,s) and its opposite Siegel induction are proportional after the standard intertwiner, outside a discrete exceptional parameter set. Normalize the proportionality using the degenerate Whittaker functional and require the unramified ratio from §2.3; translate to z=s+1/2 before writing z↔1−z. On U(W) put χʷ=(χ^c)⁻¹ and construct the typed meromorphic maps R_ψ(χ,s):I_EHLS(χ,s)→I_EHLS(χʷ,−s) and R_(ψ⁻¹)(χʷ,−s):I_EHLS(χʷ,−s)→I_EHLS(χ,s); their two composites are the identity. On GU(W) carry the full Weyl-transformed multiplier character of §1.3 as well, rather than identifying it from its U restriction. This target includes finite-place rationality, archimedean continuity and the local functional equation used by the completed global unitary L-function; it does not assert a general unitary local Langlands correspondence.

Assume Irreducible admissible π; nontrivial additive character and self-dual Haar; the right/left convention comparison in the exact unitary normalization comparison of §§1.3 and 2.4. (EHLS, §4.1.3–4.1.4, pp.45–48; EHLS line 1893.)

A proof can proceed as follows: Analyze the finite set of unitary doubling orbits and kill all closed-orbit functionals for generic parameter. Compare the two nonzero local zeta functionals through the intertwiner. Fix its scalar by degenerate Whittaker normalization and the explicit unramified computation, then continue meromorphically.

Construct the section-transport isomorphism before identifying either functional equation; specify its source and target normalized induction with the same ψ and quotient measure. Compare the degenerate Whittaker functionals on a nonzero common test section. This determines the full meromorphic normalization scalar in the nonsplit and ramified cases, in addition to the spherical comparison.

*Needs:* §1.3; §2.1; §2.3; AutomorphicSpectralTheory §§2.1–2.6 (meromorphic induction, intertwiners and ordered residues); SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 (induction, Jacquet functors, geometric lemma and pairings) and §SR.0.4 (admissible duals and matrix coefficients); AutomorphicFormsOnReductiveGroups §§2.1–2.7 (real representations and globalizations); MetaplecticAutomorphicForms §6.10a (canonical classical factors); the comparison of §2.0.

### Examples

For the returning intertwiner take E/F=ℂ/ℝ and χ(z)=z/|z|. Then χʷ=χ, so χʷ(i)=i while χ⁻¹(i)=−i; applying χ↦χʷ twice returns χ. For χ=|·|_E^i at B=2, χʷ(2)=4^(−i), and the second operation returns 4^i.

At split rank one take X=1/2 and Y=1/3 in the convergence domain. The two geometric tails give 2+1/2=5/2, while the standard Euler product is 2·3/2=3 and d₁=1/(1−1/6)=6/5; thus d₁Z=3. The contragredient in the label is detected by β₀(ϖ)=i, χ_w(ϖ)=1, χ_wbar(ϖ)=−1 and t=1/2: then X=Y=−i/2 and d₁Z_U=(1+i/2)⁻²=(3/4+i)⁻¹, the factor of (β₀⁻¹χ_w⁻¹,β₀χ_wbar⁻¹)=(−i,−i)=BC(π∨)⊗χ⁻¹, whereas BC(π)⊗χ⁻¹=(i,i) would give (1−i/2)⁻²=(3/4−i)⁻¹; only χ_w(ϖ)=χ_wbar(ϖ) or β₀(ϖ)²=1 hides the difference. The lattice datum is detected over ℚ₂ at split rank one with β=χ=1 and s=1/2, so t=1/2 and d₁=4/3: the embedded element of x∈ℚ₂× has A⊕D matrix ((x+1,x−1),(x−1,x+1))/2, and for K_W, the stabilizer of ℤ₂⊕ℤ₂ in the original coordinates, the section at v₂(x)=±m equals t^m, so Z_U=(1+t)/(1−t)=3 and d₁Z_U=4=(1−1/2)⁻². The stabilizer GL₂(ℤ₂) of the product lattice in the A⊕D coordinates is also hyperspecial and contains the embedded ℤ₂×, but its lower-row norm is 2·max(1,|x|) for x a nonunit, so the section is t^(m+2) there, Z_U=1+2t³/(1−t)=3/2 and d₁Z_U=2≠4. For n=2 at a nonsplit place η(ϖ)=−1, so the denominator contains both 1−a q^(−2s−2) and 1+a q^(−2s−1). Taking q=2, a=1, s=0 gives d₂=8/9; replacing η by 1 gives 8/3.

### Dependencies

This layer follows Layer 0, Layer 1. The direct supplier inputs are SmoothRepresentationsOfLocalGroups §SR.3.3 (tempered support and Langlands quotients); AutomorphicFormsOnReductiveGroups §§2.1–2.7 (real representations and globalizations); AutomorphicLFunctionsAndLocalFactors Layer AL.0 (vector-space Fourier analysis); AutomorphicLFunctionsAndLocalFactors Layer AL.1 (Tate factors); AutomorphicLFunctionsAndLocalFactors Layer AL.4 (Satake Euler factors and convergence); SmoothRepresentationsOfLocalGroups Layer SR.4 (Satake theory); AutomorphicSpectralTheory §§2.1–2.6 (meromorphic induction, intertwiners and ordered residues); SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 (induction, Jacquet functors, geometric lemma and pairings) and §SR.0.4 (admissible duals and matrix coefficients).

## Layer 3: unitary pullback and standard L-functions

### 3.1 unitary doubling identity

For cuspidal automorphic π on U(V)(A_F), a specified realization of its dual on U(−V), decomposable cusp vectors φ,φ♭ and section f, form the center-compatible double Eisenstein period with the determinant twist. Unfolding expresses it as an integral against the matrix coefficient of the chosen global Petersson pairing P. When every selected local pairing and P(φ,φ♭) is nonzero, and distinguished good vectors have local pairing 1, it equals P(φ,φ♭) times the product of normalized local integrals I_U,v, with the global/local pairing comparison retained. For orthogonal vectors the primary assertion uses the unnormalized trilinear functionals. A zero value P(φ,φ♭) does not force this period to vanish: convolution can move φ before pairing. Vanishing for inequivalent contragredient representation types follows from the invariant Petersson pairing, with the automorphic realization hypotheses stated; general global multiplicity one is not assumed.

Assume cuspidal automorphic realizations; central-character cancellation; fixed compatible invariant pairings; good local pairings normalized to 1; nonzero pairings only for the divided formula. (EHLS, §4.1.4, (49)–(51), pp.45–48; EHLS line 1971; HLS, §3.1.2–3.1.3, internal pp.45–48; §3.2.1, pp.49–50; HLS line 1789.)

A proof can proceed as follows: Unfold along P(F)⧸U(W)(F)/(U(V)×U(−V))(F). Use cuspidality to remove every nonopen orbit and identify the open orbit with the diagonal pairing. Factor the open-orbit integral with coherent quotient measures and apply Schur orthogonality to distinct representation types.

*Needs:* §1.3; §2.1; AutomorphicFormsOnReductiveGroups §§4.1–4.3 (globalization, cuspidality and pairings); AdelicAlgebraicGroups §§0.1–0.4 and 2.2–2.3 (restricted products and quotient measures).

### 3.2 unitary MVW comparison

Use the MVW involution of MetaplecticAutomorphicForms §3.15 on the unitary groups; construct its comparison with EHLS flat/dagger realizations and determinant twists. Choose an F-linear conjugate-linear isometry j:V→V, meaning j(ax)=āj(x) and h(jx,jy)=overline(h(x,y)), with j²=1 in a diagonal hermitian basis. Conjugation by j defines an involution θ of U(V). For every irreducible admissible π over a characteristic-zero local field prove π∘θ≃π∨ in these coordinates; the comparison is an isomorphism class, not a canonical choice of a nonzero intertwiner. Over a nonarchimedean field this is the MVW theorem supplied by MetaplecticAutomorphicForms §3.15. Over an archimedean field it is a target here: prove that θ, composed with an inner automorphism of U(V)(F), acts by inversion on a fundamental Cartan subgroup, and apply the comparison of §3.2 to the Harish-Chandra module of π and then to its Casselman–Wallach globalization. Explicitly, for E=ℂ, F=ℝ and h of signature (p,q) in a diagonal basis, j is coordinatewise conjugation, the diagonal unitary torus is a compact, hence fundamental, Cartan subgroup and θ(t)=t̄=t⁻¹ on it. For E=F×F, U(V)≅GL_n(F) and θ is the transpose-inverse up to an inner automorphism; it inverts the diagonal torus, which is fundamental when F=ℂ, and when F=ℝ it inverts the fundamental Cartan subgroup, a product of ⌊n/2⌋ copies of ℂ× embedded as rotation-scaling blocks and, for odd n, one copy of ℝ×, after composing with conjugation by diag(1,−1,1,−1,…). Transport the result through the identification of U(V) and U(−V) and through the χ∘det twist used in the global pairing.

Assume nondegenerate hermitian V; diagonalization over E/F; smooth admissibility or Casselman–Wallach category. (EHLS, §6.5.3, equation (143), p.101; §9.1.3, p.150; EHLS line 4495; ADAMS14, Theorem 1.2 and Corollary 1.4, p.2, ADAMS14 line 59, for the archimedean case.)

Prove the following basic properties of this construction.

- θ²=Id and θ respects multiplication.

- π∘θ is isomorphic to the smooth contragredient π∨.

- Changing the diagonalization changes the involution by an inner automorphism, preserving the isomorphism class.

- Pullback by the chosen involution is a functor on representations and continuous intertwining maps, with its square naturally identified with the identity.

**Checks.**

- On the norm-one torus, every character is sent to its inverse.

- The trivial representation is fixed.

- Applying θ twice recovers π, compatibly with admissible smooth biduality.

Additional normalization checks:

- For a norm-one scalar z and character z², θ sends z² to z⁻²; at z=i both equal −1, whereas at z=exp(iπ/6) the two values are distinct conjugates.
- For the trivial representation both pullback and dual are 1.
- For a scalar similitude of multiplier 4, multiplier twists 4^0=1 and 4^1=4 have the same restriction to U and different GU values.
- For E=ℝ×ℝ and n=2, U(V)≅GL₂(ℝ) and the fundamental Cartan subgroup is ℝ_(>0)·SO(2)≅ℂ×. The transpose-inverse sends a·r_φ to a⁻¹·r_φ, so it fixes the rotation r_φ instead of inverting it; after conjugation by diag(1,−1) it sends a·r_φ to a⁻¹·r_(−φ)=(a·r_φ)⁻¹. The inner adjustment is needed before the real contragredient theorem applies, and it does not change π∘θ up to isomorphism.

For the real points G of a connected reductive ℝ-group and an involution C of G that acts by inversion on some fundamental Cartan subgroup, prove that π∘C≅π∨ for every irreducible Harish-Chandra module π, hence for its Casselman–Wallach globalization (ADAMS14, Theorem 1.2 and Corollary 1.4, p.2; ADAMS14 line 46).

A proof can proceed as follows: Diagonalize h and construct conjugation j explicitly. Over a nonarchimedean field take π∘θ≃π∨ from MetaplecticAutomorphicForms §3.15. Over ℝ or ℂ compute θ on a fundamental Cartan subgroup, as above, and apply the comparison of §3.2; the Casselman–Wallach equivalence of AutomorphicFormsOnReductiveGroups §2.7 carries the isomorphism of Harish-Chandra modules to the globalizations. Compare the resulting involution with EHLS dagger/flat notation and its determinant twist.

The EHLS similitude comparison has source the chosen GU representation pulled back by its flat/dagger automorphism and target its contragredient tensored with the explicitly computed multiplier character. The multiplier twist is determined by evaluating both central actions; equality after restriction to U alone does not determine it (EHLS (143), p.101; EHLS line 4495).

*Needs:* §0.1; SmoothRepresentationsOfLocalGroups §SR.3.3 (tempered support and Langlands quotients); AutomorphicFormsOnReductiveGroups §§2.1–2.7 (real representations and globalizations); MetaplecticAutomorphicForms §3.15 (MVW over nonarchimedean fields); §3.2 (the real contragredient comparison).

### 3.3 garrett pullback map

For a fixed cusp realization π and meromorphic section f set G_f(φ)(g₂)=χ(det g₂)⁻¹∫_[U(V)]E(f,s,ι(g₁,g₂))φ(g₁)dg₁. The section remains a variable of this bilinear operator. Pairing the output with φ′∈π∨ gives the doubling period, so the output lies in (π∨)∨≃π, realized on U(−V) with the indicated flat/dagger identification. EHLS Theorem 9.1.3 explicitly has output π. At its nearly holomorphic critical specialization, the corresponding Hecke eigenpacket is π with the prescribed Hecke involution. For arbitrary fixed f do not assert that G_f commutes with every Hecke operator: equivariance involves the simultaneous section action or the specialized Hecke-compatible section.

Assume cuspidal π and fixed realization; central-character compatibility; multiplicity/pairing hypothesis when used; critical nearly holomorphic data for the specialized Hecke assertion. (EHLS, §9.1.1–9.1.4, (178) and Theorem 9.1.3, pp.149–150; EHLS line 6350.)

Prove the following basic properties of this construction.

- Pairing G_f(φ) with φ′ equals the global doubling period.

- The map is linear in f and φ.

- At the specialized nearly holomorphic section, the Hecke action is transported through the specified flat involution.

- Transport the chosen cusp embedding and its dual pairing together; the resulting map has the same automorphic output under the transported realization.

**Checks.**

- f=0 gives zero output.

- G_(af)(φ)=aG_f(φ).

- On a non-self-dual π, the output pairs naturally with π∨ and belongs to π after the function-model identification.

Additional normalization checks:

- For f=0 the pullback is 0; replacing a section with value 1 by 3f makes its paired value 3.
- A character χ of order 3 gives output character χ and pairs with χ⁻¹; χ≠χ⁻¹.
- Transporting a cusp embedding by a scalar 2 and its dual by 1/2 keeps the evaluation pairing 1.

A proof can proceed as follows: Use rapid decay to define the pullback in a right half-plane. Identify its pairing with each dual cusp vector by §3.1. Use admissible biduality and the EHLS specialized Hecke action to identify the image; continue meromorphically.

*Needs:* §3.1; §3.2; AutomorphicFormsOnReductiveGroups §§3.4–3.5 (restricted tensor realizations).

### 3.4 unitary standard L-function from doubling

Identify the completed standard function supplied by MetaplecticAutomorphicForms §6.10a with the Euler product extracted from the EHLS period. For cuspidal π of U(V)(A_F) and Hecke character χ of A_E×/E×, the partial Euler product L_E^S(z,BC(π∨)⊗χ⁻¹), equivalently L_E^S(z,BC(π)⊗(χ^c)⁻¹), defined at good places by Satake and z=s+1/2, has meromorphic continuation obtained from the doubled Eisenstein period. Completing it with the local factors defined by the unitary local functional equation gives its global functional equation with z↔1−z and the typed Weyl character χʷ=(χ^c)⁻¹ of §2.4. In the spherical numerator the original twist is χ⁻¹ and the returning twist is (χʷ)⁻¹=χ^c. The returning spherical factor is therefore L(1−z,BC(π∨)⊗χ^c). At unramified places conjugation sends BC(π∨) to BC(π), so exchanging the conjugate places identifies it with L(1−z,BC(π)⊗χ), the factor of the dual of BC(π∨)⊗χ⁻¹. Identify the completed returning factor with the usual dual completed factor using the local equation of §2.4 and the representation involution of §3.2; this is a factor comparison and assumes no automorphic base change. The assertion is meromorphic; no general entireness, base-change automorphy, or value formula follows solely from this construction.

Assume cuspidal π; finite S containing ramification and infinity; selected nonzero local data at each prescribed z; coherent measures and local normalization. (EHLS, §4.1.4–4.2.1, pp.45–49; EHLS line 2081.)

A proof can proceed as follows: Use the unramified identity to isolate the partial Euler product. Choose local sections avoiding zeros at a specified point and divide meromorphic functions locally. Apply the Eisenstein functional equation and the local intertwining relations, then glue the continuations.

*Needs:* §1.3; §2.4; §3.1; AutomorphicLFunctionsAndLocalFactors Layer AL.4 (Satake Euler factors and convergence); MetaplecticAutomorphicForms §6.10a (canonical classical factors); the comparison of §2.0.

### Examples

A zero pairing is a negative control for the divided period. In the standard two-dimensional representation of S₃, choose v=(1,−1,0) and the restricted linear functional ℓ(x)=x₃ on x₁+x₂+x₃=0. Then ℓ(v)=0 but for g=(23), ℓ(gv)=−1. A convolution section concentrated at g can therefore pair nontrivially. On the norm-one torus, z↦z² pulls back by conjugation to z↦z⁻²; applying the involution twice returns z². This also distinguishes a non-self-dual Garrett output from its contragredient.

### Dependencies

This layer follows Layer 0, Layer 1, Layer 2. The direct supplier inputs are AutomorphicFormsOnReductiveGroups §§4.1–4.3 (globalization, cuspidality and pairings); AdelicAlgebraicGroups §§0.1–0.4 and 2.2–2.3 (restricted products and quotient measures); SmoothRepresentationsOfLocalGroups §SR.3.3 (tempered support and Langlands quotients); AutomorphicFormsOnReductiveGroups §§2.1–2.7 (real representations and globalizations); AutomorphicFormsOnReductiveGroups §§3.4–3.5 (restricted tensor realizations); AutomorphicLFunctionsAndLocalFactors Layer AL.4 (Satake Euler factors and convergence).

## Layer 4: holomorphic archimedean sections

### 4.1 holomorphic unitary modules and strong positivity

For U(a,b), K=U(a)×U(b), fix the hermitian positive system with Lie algebra g_C=k_C⊕p⁺⊕p⁻. For a dominant integral K-weight κ=(κ₁≥…≥κ_a;κ₁ᶜ≥…≥κ_bᶜ), let W_κ be the finite-dimensional K-module and put D(κ)=U(g_C)⊗_(U(k_C⊕p⁻))W_κ∨, with p⁻ acting trivially on the generating type. Strong positivity means that μ=(−κ_bᶜ−a,…,−κ₁ᶜ−a;−κ_a+b,…,−κ₁+b) is dominant integral, equivalently κ_a−κ₁ᶜ≥a+b when a,b>0. Define D_c(κ) to be the K-finite restricted contragredient, realized with p⁺ and W_κ. In this range these are holomorphic and antiholomorphic discrete-series modules, their minimal K-types are W_κ∨ and W_κ, and the corresponding relative cohomology with coefficient W_μ or W_μ∨ is one-dimensional in degree ab. Compact cases a=0 or b=0 are interpreted separately through finite-dimensional K-modules.

Assume a,b≥0; a+b=n; specified integral K-weight; central character fixed if extended to GU(a,b). (EHLS, §4.4.1, (88)–(91), pp.69–71; EHLS line 3280.)

Prove the following basic properties of this construction.

- The generating subspace is W_κ∨ annihilated by p⁻.

- The K-finite dual is D_c(κ) with generating type W_κ annihilated by p⁺.

- In the strongly positive range the specified degree-ab cohomology has dimension one.

- A K-map from W_κ∨ into a (g,K)-module, annihilated by p⁻, extends uniquely to a U(g)-map from D(κ).

- Two such module maps agree once they agree on the generating K-type; agreement on a highest generator suffices after K-equivariance is fixed.

**Checks.**

- For a=b=1, strong positivity requires κ₁−κ₁ᶜ≥2; the pair (0,0) fails.

- For a=b=1 and κ=(1;−1), μ=(0,0) is dominant, so the weak partition/dominance boundary is included.

- Taking the restricted dual exchanges W_κ∨ and W_κ; a non-self-dual compact type detects a mistaken dual.

Additional normalization checks:

- For a=b=1, κ=(0;0) has gap 0 and fails the bound 2; κ=(1;−1) has gap 2 and μ=(0,0).
- For κ=(2;−1), the generator dual has weight (−2;1), not (2;−1).
- For a=0,b=1 the compact case has ab=0; there is no cross-block inequality to evaluate.

A proof can proceed as follows: Import the highest-weight K-module and hermitian positive system. Construct the two generalized Verma modules on the actual enveloping-algebra carriers. Specialize the existing discrete-series and Vogan–Zuckerman theorems in the dominant range, using the restricted dual.

*Needs:* RepresentationTheory/ClassicalGroups Layer 3 (highest weights); AutomorphicFormsOnReductiveGroups §§2.1–2.7 (real representations and globalizations); AutomorphicFormsOnReductiveGroups §§5.3–5.4 and 6.1–6.2 (Hermitian cohomological representations).

### 4.2 automorphy factors and scalar holomorphic model

On the U(n,n) tube realization, choose the algebraic CM base point z₀ and the Harish–Chandra factorization. Let J,J′ be its two canonical GL_n-valued automorphy factors, with J(g,z)=Cz+D for g in block coordinates, and let j,j′ be their determinants at z₀. Identify the compact coordinates with (J,conjugate J′); hence the right-translation weight of J_χ is (−m+a_χ repeated n;m−b_χ repeated n). Define the scalar holomorphic module D²(m,χ₀) by the dual-label parameter Λ=(m−a_χ repeated n;−m+b_χ repeated n). Its generating compact type is W_Λ∨ in the convention of §4.1. On the multiplier-one group send its generator v_χ to J_χ(g)=j(g)^(−m+a_χ)j′(g)^(−m+b_χ). Extend by U(g_C) and denote this map ι_χ. The similitude central character is separate data, recovered from the required induced transformation law; an omitted or ambiguous power of ν is not silently restored.

Assume n≥1; m,a_χ,b_χ integers with 2m−a_χ−b_χ≥2n; χ₀,∞(z)=z^(−a_χ)z̄^(−b_χ); fixed CM rational structure. The compact-dual/automorphy-factor comparison is proved as part of this construction. (EHLS, §4.4.2, (92), pp.71–73; Remark 4.5.3, p.80; EHLS line 3330.)

Prove the following basic properties of this construction.

- ι_χ(v_χ)=J_χ on the multiplier-one group.

- The two canonical factors satisfy the group-action cocycle with their specified block actions.

- A GU extension records and verifies its full central character independently of the U restriction.

- Transport by a group element carries the base point, compact subgroup and J factors together, and intertwines the resulting scalar realization.

**Checks.**

- With normalized base point, J(1)=J′(1)=I and J_χ(1)=1.

- On U(n)×U(n) in coordinates (J,conjugate J′), the function has weight (−m+a_χ;m−b_χ), each repeated n, precisely the dual of Λ under right translation.

- Two different ν-powers restrict identically to U(n,n); the GU covariance test distinguishes them.

Additional normalization checks:

- At g=1 both canonical determinant factors are 1 and J_χ(1)=1; the zero map sends the generator to 0.
- For n=1,m=3,a_χ=2,b_χ=0, Λ=(1;−3) and its dual has weight (−1;3). At zI₂ with z=exp(iπ/4), J=z, J′=z̄ and J_χ=z⁻¹z̄⁻³=z²=i, agreeing with that dual; the swapped parameter (3;−1) would give −i.
- Central extensions ν^0 and ν^1 agree on U but at ν=4 take values 1 and 4.

A proof can proceed as follows: Construct the canonical factors from the Harish–Chandra decomposition and prove their cocycle law. Evaluate at the chosen rational base point and differentiate the right action. Extend the generating function by the enveloping-algebra universal property, carrying the compact-dual identification and the independently specified central character.

Construct an explicit comparison from the scalar generalized Verma module with generating type W_Λ∨ to the U automorphy-factor realization, transporting the compact Borel and dual highest weight. For GU, specify the central character separately and prove that its restriction agrees. The source is that cyclic module and the target is the corresponding smooth-function subrepresentation; equality on its generating compact type determines the map.

*Needs:* §4.1; §1.1; AutomorphicFormsOnReductiveGroups §§5.3–5.4 and 6.1–6.2 (Hermitian cohomological representations).

### 4.3 injectivity of the holomorphic realization

In the holomorphic discrete-series range for the scalar parameter (m,χ₀), the map ι_χ:D²(m,χ₀)→C∞(U(n,n)) is injective. Under PBW, D² is free of rank one over U(p⁺), generated by v_χ. The claim uses irreducibility in the stated range and the nonzero value J_χ(1)=1; no injectivity is asserted for an arbitrary singular generalized Verma module.

Assume m,a_χ,b_χ integers, 2m−a_χ−b_χ≥2n, and the identification from §4.2 of J_χ with the W_Λ∨ generator. (EHLS, Lemma 4.4.4, pp.73–74; EHLS line 3436.)

A proof can proceed as follows: Use PBW for the abelian p⁺ to identify the cyclic module. Apply the irreducibility theorem for the chosen holomorphic parameter. The generator has nonzero image, so its kernel is zero.

*Needs:* §4.2; AutomorphicFormsOnReductiveGroups §§2.1–2.7 (real representations and globalizations).

### 4.4 Cauchy decomposition and highest minor vectors

Over a characteristic-zero coefficient field, use the left action of GL_u×GL_u on polynomial functions on Mat_u given by ((g₁,g₂)·f)(X)=f(g₁⁻¹Xg₂). The homogeneous degree-d component decomposes as ⊕_(λ⊢d, length λ≤u) F_λ∨⊗F_λ. Here F_λ is the native shape-selected Weyl module over that field, and the decomposition and its summand projectors are linear over the field and commute with scalar extension. For λ=(c₁≥…≥c_u≥0), use the lower-triangular Borel in the first GL_u and the upper-triangular Borel in the second; the selected highest line is generated by Δ_λ=∏_(i=1)^u Δ_i^(c_i−c_(i+1)), where c_(u+1)=0 and Δ_i is the leading principal minor. The sum of the weighted minor degrees is d. Normalize the selected highest line by the displayed minor polynomial, in which the diagonal monomial ∏X_ii^(c_i) has coefficient 1; its coefficient projector on each finite homogeneous component is defined over the same field.

Assume u,d≥0; a characteristic-zero coefficient field; the displayed polynomial pullback action and the lower/upper Borel pair. The compact-weight comparison uses the longest Weyl element when changing this first Borel to the upper one. (EHLS, Lemma 4.4.8 and (100), pp.75–76; EHLS line 3500.)

Prove the following properties of this specialization.

- The Cauchy isomorphism has source the degree-d polynomial space and target the displayed direct sum of native Weyl-module tensor products, is GL_u×GL_u-equivariant and commutes with every characteristic-zero field extension.
- Its summand projectors are field-linear pairwise orthogonal idempotents with sum the identity; each selected highest-line projection fixes Δ_λ and kills the other torus-weight lines in that summand.
- The minor normalization and these maps commute with extension from the prime field, allowing comparison with the complex compact types without an arbitrary complex scalar.

**Checks.**

- Over E=ℚ(i), u=d=2, the tensor projectors (1+swap)/2 and (1−swap)/2 are E-linear idempotents of ranks 3 and 1 on (E²)⊗², giving the Cauchy count 10=3²+1²; rescaling a normalized highest vector by π does not preserve its E-form.
- For u=2 and d=2 the homogeneous dimension is 10=3²+1², from the partitions (2) and (1,1); d=0 gives the constant line, including u=0.
- For g₁=[[1,1],[0,1]], h₁=[[1,0],[1,1]] and g₂=h₂=I, the composed pullbacks evaluate f at h₁⁻¹g₁⁻¹X=(g₁h₁)⁻¹X. At X=I this matrix is [[1,−1],[−1,2]]. The literal transposed substitution gives the competing matrices [[2,−1],[−1,1]] and [[1,−1],[−1,2]], so it cannot be used as this left action.
- The polynomial X₁₁ is fixed by the first lower and second upper unipotents. A first upper unipotent with entry t sends it to X₁₁−tX₂₁; at X₂₁=1 and t=1 the change is −1. This fixes the Borel choice for leading principal minors.

A proof can proceed as follows: Use the native rational Young-symmetrizer images on the two tensor factors and the simultaneous permutation invariants in degree d. Normalize the symmetrizers by their nonzero rational hook factors and construct the Cauchy maps and complementary idempotents over the prime field; extension of scalars gives the chosen characteristic-zero field. Compute the torus weights and diagonal-monomial coefficient of each minor product to normalize its highest line, then compare over ℂ with the supplied compact highest-weight classification.

*Needs:* `TauCeti.weylModuleOfShape`; `TauCeti.weylRepOfShape`; `TauCeti.isIrreducible_weylRepOfShape_iff`; RepresentationTheory/ClassicalGroups Layers 2–3 (complex Schur and highest-weight comparison).

### 4.5 holomorphic branching for the doubled group

Restrict the scalar holomorphic discrete-series module of §4.2 to U(a,b)×U(b,a). Its K-finite module is an algebraic multiplicity-one sum of holomorphic tensor factors indexed by partitions r₁≥…≥r_a≥0, s₁≥…≥s_b≥0. In the dual-label convention D(κ) generated by W_κ∨, put κ=(m−a_χ+r₁,…,m−a_χ+r_a;−m+b_χ−s_b,…,−m+b_χ−s₁). Its first minimal K-type has highest weight λ=(−m+a_χ−r_a,…,−m+a_χ−r₁;m−b_χ+s₁,…,m−b_χ+s_b). The opposite factor is D(κ^opp), where κ^opp=(m−a_χ+s₁,…,m−a_χ+s_b;−m+b_χ−r_a,…,−m+b_χ−r₁). Intrinsically it is the restricted contragredient of D(κ), transported across the opposite-signature identification and twisted by χ₀⁻¹∘det. Indeed its generator is obtained by dualizing and interchanging the two compact blocks of λ, then adding a_χ−b_χ to each coordinate, since χ₀⁻¹(z)=z^(a_χ−b_χ) on the norm-one torus. These are the labels of (93)–(95) transported to the compact coordinates of §4.2. No strict partition inequalities are imposed; the smooth globalized restriction is distinct from this algebraic sum.

Assume a+b=n; 2m−a_χ−b_χ≥2n; fixed opposite-signature embedding, compact Borels and χ₀⁻¹ determinant twist. The automorphy-factor comparison of §4.2 supplies the compact/Borel dictionary. (EHLS, §4.4.2, equations (93)–(95), p.73; EHLS line 3390.)

A proof can proceed as follows: Identify the noncompact tangent decomposition under the subgroup. Use the polynomial Cauchy decomposition and PBW to identify the minimal types. Use holomorphic discreteness and character multiplicities to prove exhaustion and multiplicity one.

*Needs:* §0.1; §4.3; §4.4; AutomorphicFormsOnReductiveGroups §§2.1–2.7 (real representations and globalizations).

### 4.6 algebraic raising operators

For a critical pair (κ,χ) corresponding to the κ and κ^opp labels and partitions r,s in §4.5, embed polynomials on Mat_a×Mat_b into the diagonal blocks of Mat_n. Let p_(r,s)=∏Δ_i^(r_i−r_(i+1))∏(Δ′_j)^(s_j−s_(j+1)). Through the PBW isomorphism Sym(p⁺)≃U(p⁺), define δ_(χ,κ) as the differential operator attached to p_(r,s). Normalize the algebraic highest vectors over a specified field E containing the CM coefficients and compact-type fields. Dependence on these choices is retained; rescaling the chosen highest vector rescales the comparison constant.

Assume critical partition labels; algebraic rational structures; r_(a+1)=s_(b+1)=0. (EHLS, §4.4.5–4.4.9, (98)–(100), pp.74–77; EHLS line 3470.)

Prove the following basic properties of this construction.

- The PBW symbol is the displayed minor product.

- The operator is defined over the specified algebraic coefficient field.

- Its PBW degree is the sum of all partition parts.

- The PBW polynomial-to-operator map is linear and multiplicative because p⁺ is abelian.

- Operators obtained from equal polynomials agree; the leading PBW symbol recovers the polynomial.

**Checks.**

- For r=s=0 the operator is the identity.

- For a=2,r=(1,1),s=0, the symbol is det A, not Δ₁².

- For a=b=1,r=(1),s=0 the symbol is the first diagonal-block coordinate and has degree 1.

Additional normalization checks:

- For r=s=0 the minor polynomial and its operator equal 1, of degree 0.
- For a=2,r=(1,1), the differences (0,1) give Δ₂ of degree 2; Δ₁² has the same degree but a different polynomial.
- On A=[[1,2],[3,4]], Δ₂=−2 whereas Δ₁²=1; for a=b=1,r=(1), the symbol is the first coordinate and has degree 1.

A proof can proceed as follows: Build the minor polynomial with nonnegative difference exponents. Use the abelian tangent algebra and PBW to obtain the enveloping-algebra operator. Apply it to the scalar cyclic vector and compare its selected highest-type projection.

*Needs:* §4.4; §4.2; §4.5.

### 4.7 nonzero rational holomorphic projection

For a critical pair with chosen algebraic highest vectors, the projection of δ_(χ,κ)v_χ to the highest line of the κ-branch is P_(χ,κ)·v_κ⊗v_(κ^opp), with P_(χ,κ)∈E×. The two generating vectors belong to D(κ) and D(κ^opp) of §4.5. The projection is algebraic on each fixed finite K-type and annihilates the other branch components under pairing with the selected antiholomorphic vectors. Only this nonzero highest-line assertion of EHLS Corollary 4.4.9 is used; the further triangular expansion has differential-operator coefficients off the diagonal and is not needed here.

Assume critical pair in the holomorphic discrete-series range; fixed E-forms and normalized highest vectors. (EHLS, Corollary 4.4.9, first assertion and proof, pp.76–77; EHLS line 3540.)

A proof can proceed as follows: Use the Cauchy highest lines in the PBW model. Compare their projection to the multiplicity-one branching component. Use rationality of the decomposition to place its nonzero scalar in E and identify the annihilator under the dual pairing.

*Needs:* §4.6; §4.5; §4.3.

### 4.8 critical archimedean doubling section

Choose B_(χ,κ)∈E× and set f∞(g)=B_(χ,κ)·δ_(χ,κ)J_χ(g) on U(n,n). To regard it as a section of I_EHLS(χ_u⁻¹,s_crit), first write the algebraic Hecke character at the place as χ_alg=|·|_ℂ^m χ₀, with the integer m of §4.2 (EHLS line 3373), and as χ_alg=|·|_ℂ^t χ_u with χ_u unitary, and solve the exact Levi covariance for s_crit using §1.1. Record that χ₀=z^(−a_χ)z̄^(−b_χ) has norm exponent −(a_χ+b_χ)/2 with respect to |·|_ℂ. Thus t=m−(a_χ+b_χ)/2 and χ_u(z)=(z/|z|)^(b_χ−a_χ). On m(B,1), writing d=det B, the canonical factors have j=d and j′=d̄, so the left covariance is d^(−m+a_χ)d̄^(−m+b_χ)=χ_u⁻¹(d)|d|_ℂ^(−t). In §1.1 the same covariance is χ_u⁻¹(d)|d|_ℂ^(−n/2−s_crit); therefore s_crit=t−n/2 and z_crit=s_crit+1/2=t−(n−1)/2. Right differentiation commutes with this left parabolic action. Neither the integer m nor the suppressed similitude factor may be substituted for t without this computation. The map into the correct induced fiber, including the GU central character if used, is part of the construction.

Assume critical pair and holomorphic range; B algebraic nonzero; fixed Haar and vector normalizations; comparison in the precise inducing and central-character comparison. (EHLS, Lemma 4.5.2, Remark 4.5.3 and (107), p.80; EHLS line 3675.)

Prove the following basic properties of this construction.

- On U(n,n), f∞=Bδ_(χ,κ)J_χ.

- Its complete parabolic covariance identifies I_EHLS(χ_u⁻¹,t−n/2) on U(W), with a separately computed GU multiplier character if used; the corresponding standard L-factor of §§2.3 and 3.4 is that of BC(π∨)⊗χ_u.

- Rescaling B rescales the section and its zeta integral by the same factor.

- Replacing B_(χ,κ) by aB_(χ,κ), with a∈E×, multiplies the section and its local zeta value by a.

- After the inducing fiber has been identified, equality on its maximal compact subgroup determines equality of the sections.

**Checks.**

- For zero partitions the section is BJ_χ.

- If a_χ+b_χ≠0, the unitary norm exponent t differs from m by −(a_χ+b_χ)/2.

- A positive real scalar similitude detects a wrong multiplier exponent even when the restriction to U is correct.

Additional normalization checks:

- At zero partitions f∞=BJ_χ; B=2 and g=1 give value 2.
- For m=3,a_χ=2,b_χ=0,n=1, t=2 and s_crit=3/2. On the positive Levi m(2,1), J_χ=2⁻¹2⁻³=1/16 and normalized covariance is (1/2)·4^(−3/2)=1/16. The phase test at zI₂, z=exp(iπ/4), gives χ_u⁻¹(z)=z²=i=J_χ(zI₂); χ_u(z)=−i fails. The norm decomposition also gives 4³·2⁻²=4²=16.
- A positive similitude with ν=4 distinguishes powers 1 and 4 even when their U restrictions agree.

A proof can proceed as follows: Apply the algebraic differential operator to the scalar automorphy function. Compute its covariance along P and solve for the normalized unitary parameter. Extend to GU only after matching the multiplier character and prove independence from a chosen norm/phase presentation.

The inducing-fiber comparison must compute the complete P-character of the differentiated automorphy function, express it as the covariance of §1.1, and determine s_crit and the GU central character from that equality. This is a target calculation, not the definition of a free critical-parameter predicate. In particular the integer m in the algebraic character cannot be substituted for the unitary parameter t.

*Needs:* §4.2; §4.6; §1.1.

### 4.9 nonvanishing of the critical archimedean integral

For the critical section in I_EHLS(χ_u⁻¹,t−n/2) of §4.8 and the algebraically normalized antiholomorphic vectors in the minimal K-types dual to the selected highest lines of the D(κ)⊗D(κ^opp) branch, the continued local doubling integral at the matched critical parameter is finite and nonzero. The invariant pairing kills the nonselected holomorphic components, so the full raising operator has the same integral as its nonzero holomorphic projection, up to P_(χ,κ). The projected integral is nonzero by the holomorphic Siegel–Weil/theta-lift nonvanishing criterion in Harris Remark 4.4(iv); prove that precise holomorphic theta criterion and the projected-integral comparison as part of this target, on the supplied oscillator and local theta carriers.

Assume critical holomorphic range; nonzero paired vectors; the inducing-fiber comparison of §4.8; the local theta criterion proved in this subsection. (EHLS, Proposition 4.5.5, pp.80–81; EHLS line 3684; HARRIS, Remark 4.4(iv), pp.27–28; HARRIS line 1150.)

A proof can proceed as follows: Project the differentiated section to the selected branch. Prove the holomorphic Siegel–Weil image identification, nonzero local theta lift in the critical range and its projected-integral comparison, then apply it to the selected branch. Multiply by the two nonzero algebraic scalars B and P_(χ,κ).

The local theta target identifies the holomorphic Siegel–Weil image with the holomorphic part of the critical principal series, proves the theta lift of the specified antiholomorphic representation to the compact unitary pair is nonzero in the critical inequalities, and identifies its nonzero pairing with the projected local integral. Its source is the supplied oscillator coinvariant module and its target is the critical holomorphic induced submodule. The rank-one test and the nonzero coefficient P from §4.7 distinguish this map from the zero map (HARRIS Remark 4.4(iv), pp.27–28; HARRIS line 1184).

*Needs:* §4.8; §4.7; §2.1; MetaplecticAutomorphicForms §§3.3 and 3.5–3.7 (oscillator and local theta carriers).

### 4.10 normalized archimedean algebraicity

For the I_EHLS(χ_u⁻¹,t−n/2) section and branch of §§4.8–4.9, fix a CM coefficient field E, algebraic forms and bases for the compact types and differential operators, pairing of the test vectors equal to 1, and B∈E×. For U(a,b), use Garrett’s Haar convention: vol(K)=1 and invariant domain measure dz/det(I_b−z*z)^(a+b) on Mat_(a,b)(C). After identifying the holomorphically projected doubling kernel with Garrett’s E-rational convolution kernel, prove π^(−ab)I∞∈E×. Equivalently, rescale this Haar by π^(−ab) and obtain an E×-valued integral. For compact signatures the exponent is zero. The rational-kernel comparison, including its scalar and coefficient field, is a target of this subsection. Unnormalized algebraicity under an arbitrary Haar measure, and a general vector-weight gamma-value evaluation, are not assertions of this roadmap.

Assume critical range and finite nonzero integral; all rational structures and measure specified; the projected kernel comparison. (GARRETT, §1, pp.1–3; qualitative theorem and measure normalization, §2, p.4; GARRETT line 164; EHLS, Proposition 4.5.6 and Remark 4.5.7, p.81; EHLS line 3696; HARRIS, Remark 4.4(iii), p.27, for the compensation of the power of π in Garrett's integral by the choice of measure; HARRIS line 1170.)

A proof can proceed as follows: Reduce to the selected rational compact-type convolution operator. Apply Garrett’s qualitative theorem, whose scalar is π^(ab) times an E-number for the stated Haar. Use §4.9 to show the algebraic scalar is nonzero and transport B and the rational pairings.

The rational comparison identifies, over the embedded coefficient field and with the same normalized maximal compact and domain Haar, the projected doubling convolution kernel with Garrett’s rational compact-type kernel. Its source and target are the two specified compact-type kernel spaces. Compute its scalar on the selected highest line, carry B and P through the comparison, and prove this scalar lies in the coefficient field and is nonzero; an arbitrary complex rescaling is excluded.

*Needs:* §4.9; §4.7; AutomorphicFormsOnReductiveGroups §§5.3–5.4 and 6.1–6.2 (Hermitian cohomological representations); AutomorphicLFunctionsAndLocalFactors Layer AL.0 (vector-space Fourier analysis).

### Examples

For U(1,1), κ=(1;−1) gives μ=(0,0), gap 2 and cohomological degree 1. With m=2 and a_χ=b_χ=0, r=s=0 gives κ=(2;−2), whereas its generating dual highest weight is (−2;2). For a=b=1,n=2,m=3,a_χ=2,b_χ=0 and r=s=0, both branches have dual-label κ=κ^opp=(1;−3) and generator (−1;3); transporting the contragredient gives (−3;1), then the χ₀⁻¹ determinant twist adds 2 to give (−1;3). With r=1,s=0 the first generator is (−2;3), its transported dual is (−3;2), and the same twist gives the opposite generator (−1;4). At the common scalar z=exp(iπ/8), both generator characters multiply to z⁴=i, exactly J_χ(zI₄); the inverse twist would give z⁻⁴=−i. For r=(1,1), the differences are (0,1), the minor product is Δ₂ and its degree is 2, while the unweighted sum of differences is 1. On the unit disk the scalar kernel (1−|z|²)^m against dz/(1−|z|²)² has integral π/(m−1) for integral m>1: m=2 gives π and π⁻¹I=1. Replacing dz by 2dz doubles both values. This fixes the Haar power without asserting a general vector-weight evaluation.

### Dependencies

This layer follows Layer 0, Layer 1, Layer 2. The direct supplier inputs are RepresentationTheory/ClassicalGroups Layer 3 (highest weights); AutomorphicFormsOnReductiveGroups §§2.1–2.7 (real representations and globalizations); AutomorphicFormsOnReductiveGroups §§5.3–5.4 and 6.1–6.2 (Hermitian cohomological representations); the pinned Tau Ceti Weyl modules and §4.4 coefficient-field Cauchy projectors; RepresentationTheory/ClassicalGroups Layer 2 (complex Schur comparison); AutomorphicLFunctionsAndLocalFactors Layer AL.0 (vector-space Fourier analysis).

## Layer 5: (k,c) models and generalized doubling geometry

### 5.0 quotients with prescribed classical cuspidal support

For a nonarchimedean local field F of characteristic zero, one of the split groups G_c=Sp_c, SO_c or GSpin_c of Layer 0 with c>1, supercuspidal representations σ_i of GL_(β_i)(F) (1≤i≤d, β₁+…+β_d=l, 2l≤c) and a supercuspidal π₀ of G_(c−2l)(F), prove that every irreducible subquotient π of the normalized induction (σ₁×…×σ_d)⋊π₀ is a quotient of (σ′₁×…×σ′_d)⋊π₀ for a datum obtained from (σ_i) by a Weyl-group element, that is, a permutation of the blocks together with the replacement of some σ_i by χ_π⊗σ_i∨, where χ_π is the central character of π restricted along e₀∨ for GSpin_c and is trivial for Sp_c and SO_c (Jacquet-module exactness and the geometric lemma of SR.2.2–SR.2.3, cuspidal support of SR.3.1 and second adjointness of SR.2a.1; CFK Corollary 4.11 and proof, p.42; CFK line 1823).

**Checks.**

- For GL₂, ν^(1/2)×ν^(−1/2) has the trivial representation as quotient and Steinberg as subrepresentation; reversing the two characters supplies the other quotient. The supports both have two entries.
- For SO₂, the Weyl group of the torus is trivial and the parabolic is G; its character μ is its own induced quotient, with no replacement of μ forced.
- For a single GSpin GL₁ block with σ=1 and χ_π(ϖ)=−1, the dual-twisted block has value −1 at ϖ, whereas the untwisted dual has value 1.

*Needs:* §0.3; SmoothRepresentationsOfLocalGroups SR.2.2–SR.2.3, SR.2a.1 and SR.3.1.

### 5.1 the (k,c) unipotent character

For k,c≥1, let U_(c^k) be the upper block-unipotent subgroup of GL_(kc) with k diagonal identity blocks of size c. Given a nontrivial additive character ψ of F, set ψ_(k,c)(u)=ψ(Σ_(i=1)^(k−1) tr(u_(i,i+1))). This is a group character. Its stabilizer in the block Levi GL_c^k is the diagonal GL_c. For k=1 the unipotent group and character are trivial; for c=1 this is the usual nondegenerate Whittaker character. The orbit label is the partition (k^c), rather than (c^k); it is called the rectangular orbit below.

Assume Characteristic-zero local field; k,c≥1; fixed nontrivial continuous ψ. (CFK, §3.1, pp.11–12; CFK line 419; MODELS, §2.1, (2.1) and Definition 1, pp.2–3; MODELS line 44.)

Prove the following basic properties of this construction.

- ψ_(k,c)(uv)=ψ_(k,c)(u)ψ_(k,c)(v).

- A Levi tuple stabilizes ψ precisely when all its blocks agree.

- At c=1 the character is the ordinary GL_k Whittaker character.

- The identity has zero adjacent trace, so its character value is 1.

- Replacing ψ(x) by ψ(bx) evaluates the same adjacent-block trace against the scaled additive character.

**Checks.**

- For k=1 the sum is empty and the character is 1.

- For k=2,c=2 and upper-right block diag(x,y), its value is ψ(x+y).

- For k=3, changing the (1,3) block leaves the character unchanged, including the cross term in a product.

Additional normalization checks:

- For k=1, the adjacent trace is 0 and ψ(0)=1; for c=1,k=2,u₁₂=x it is ψ(x).
- For k=c=2 and u₁₂=diag(1,2), the trace is 3, so ψ(3), not ψ(1), is required.
- For k=3,c=1, x=1,z=2,x′=3,z′=4 gives trace 10 after multiplication, and top-right cross term 4 does not enter it.

A proof can proceed as follows: Use the parabolic radical and matrix blocks supplied by the group roadmap. Multiply two upper unipotent block matrices and compute the adjacent blocks. Use nondegeneracy of the trace pairing to identify the Levi stabilizer.

*Needs:* `Matrix.trace`; `AddChar`; ReductiveGroups Layer 7 (parabolics and Levi theory); SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 (induction, Jacquet functors, geometric lemma and pairings) and §SR.0.4 (admissible duals and matrix coefficients).

### 5.1a rectangular support and derivative comparisons

On the archimedean side construct the wave-front and generalized-Whittaker carriers used below, their associated-variety comparison, and the mirabolic (pre-)derivative functors in the normalization of MODELS §1. Use twisted coinvariants for the mirabolic functors and the neutral Schwartz-induced model for generalized Whittaker functionals; retain the smooth locally convex topologies and the continuous dual. Their source categories are the finite-length smooth mirabolic restrictions of the Casselman–Wallach representations below, and the successive full derivatives take values in representations of GL_(l−r). The orbit, induction, derivative and exactness comparisons below are the API of these constructions (MODELS pp.3–5; MODELS line 108 and line 194; GGS17 Theorems E–F and Corollary G, pp.5–6; GGS17 line 219 and line 241).

For a nonarchimedean characteristic-zero local field F, k,c≥1 and a nonzero finite-length admissible complex representation ρ of GL_(kc)(F), assume that each of the c successive highest Bernstein–Zelevinsky derivatives has order k; identify Hom_(U_(c^k))(ρ,ψ_(k,c)) with the linear dual of the terminal GL₀ derivative space, with the determinant-normalization conversion between SR.5.1 mirabolic-derivatives and SR.5.3 highest-derivative-adapter made explicit, and prove vanishing of Hom_(V(σ))(ρ,ψ′) for every partition σ greater than or incomparable with (k^c) and every generic ψ′ (MODELS Proposition 2 and proof, pp.3–4, MODELS lines 108–128; GGS17 Theorems E–F, pp.5–6, GGS17 lines 219–238).

For a Casselman–Wallach representation ϑ of GL_l(F), F=ℝ or ℂ, and a nilpotent orbit O with a generic character of its unipotent subgroup, prove that the generalized Whittaker model of ϑ along O is nonzero when O is maximal in the wave-front set of ϑ and vanishes when O is greater than or incomparable with every orbit of that wave-front set (MODELS, proof of Theorem 4, p.5; MODELS lines 194–203).

For Casselman–Wallach representations ϑ_i of the blocks of a standard Levi of GL_l(F), F archimedean, prove that the maximal orbits of the wave-front set of the normalized induction ×_iϑ_i are the orbits induced from the maximal orbits of the ϑ_i, with associated cycles additive over the constituents of a reducible induced representation (MODELS lines 196–200).

For a Casselman–Wallach representation ϑ of GL_(kc)(F), F archimedean, whose highest (pre-)derivative is its k-th one and stays so through c successive steps, prove that Hom_(U_(c^k))(ϑ,ψ_(k,c)) is isomorphic to the dual of the vector space reached after these c derivatives and that the generalized Whittaker models along orbits greater than or incomparable with (k^c) vanish (MODELS, Proposition 2 and proof, pp.3–4; MODELS lines 108–128).

For quasi-characters χ_1,…,χ_k of F× with F archimedean, prove that the highest (pre-)derivative of the normalized induction ×_(i=1)^k χ_i∘det_(GL_c) from the block parabolic with k blocks of size c is its k-th derivative, equal to ×_(i=1)^k χ_i∘det_(GL_(c−1)) in the derivative normalization of MODELS §1 (MODELS lines 119–125).

For F=ℝ or ℂ, k,c≥1 and O=(k^c), let M≤O be the finite-length Casselman–Wallach representations of GL_(kc)(F) whose wave-front set is contained in the closure of O, and M<O its Serre subcategory with no O in that set; prove that the continuous generalized-Whittaker functional functor descends to an exact contravariant functor on M≤O/M<O, so 0→A→B→C→0 in M≤O gives 0→W_O(C)→W_O(B)→W_O(A)→0, using W_O(ρ)=Hom_cont,U_(c^k)(ρ,ψ_(k,c)), choosing the neutral Schwartz model induced from ψ_(k,c)⁻¹ to match the continuous-dual convention, and W_O(ρ)≃(E_k^cρ)* (GGS17 Corollary G and proof, pp.6,27–28, GGS17 lines 241–252 and 1310–1326; MODELS lines 219–222).

**Checks.**

- For k=1,c=2 a determinant character has derivative orders 1,1, terminal dimension 1 and ordinary GL₂ Whittaker dimension 0; this separates rectangular and generic support.
- For k=2,c=2 the derivative orders 2,2 reach GL₀ and the orbit prefix sums are 2,4. A generic GL₄ representation has first order 4, exceeding 2, so it fails the rectangular hypothesis.
- For the exact sequence of two copies of the same rectangular model, inclusion in their direct sum and projection to the second copy give functional dimensions 1,2,1; the contravariant maps run from the quotient dual into the middle dual and then onto the submodule dual.
- For c=1 the terminal derivative is the ordinary highest derivative. For a generic GL₂ representation its order is 2 and terminal dimension is 1; for a GL₂ determinant character its order is 1, so it cannot satisfy the (2,1) hypothesis.

*Needs:* §5.1; SmoothRepresentationsOfLocalGroups SR.5.1 and SR.5.3; AutomorphicFormsOnReductiveGroups §§2.1–2.7.

### 5.2 (k,c) models and the local generalized Speh comparison

A (k,c) representation ρ of GL_(kc)(F) is an admissible representation (smooth admissible at finite places, admissible Fréchet of moderate growth at infinity) such that the generalized Whittaker models Hom_(V(σ))(ρ,ψ′) vanish for every partition σ of kc greater than or incomparable with the rectangular orbit (k^c) and every generic character ψ′ of V(σ), and Hom_(U_(c^k))(ρ,ψ_(k,c)) has dimension one. Vanishing for strictly larger or incomparable orbits is part of the condition, not a consequence of the single Hom dimension, and finite length is not part of it. A nonzero element λ of that Hom space is a (k,c) functional, and the (k,c) model of ρ is the quotient image W_λ={g↦λ(ρ(g)ξ)} with right translation. Construct the local generalized Speh representation ρ_c(τ) from the supplied segment/Langlands data. For unitary generic τ it is the unique irreducible quotient of normalized induction τ⊗…⊗τ twisted by δ_(k^c)^(1/(2k)); for general generic τ=×|det|^a_iτ_i with tempered τ_i, use ×|det|^a_iρ_c(τ_i). This latter representation can be reducible; it has finite length, a central character and a unique irreducible subquotient of type (k,c) (MODELS p.6; MODELS line 219). This comparison uses the existing GL segment and multisegment constructors; its additional assertions are the all-local-field quotient comparison and the (k,c) property of ρ_c(τ).

Assume τ irreducible generic of GL_k; actual smooth/Casselman–Wallach category; ordered Langlands data; nonzero continuous λ in the archimedean case. (MODELS, Definition 1, Theorem 4, Claim 6 and (2.3)–(2.6), pp.2–6; Lemma 12, p.11; MODELS line 94; CFK, §3.1, pp.11–12; CFK line 424.)

Prove the following basic properties of this construction.

- W_ξ(g)=λ(ρ(g)ξ), and W_ξ(ug)=ψ_(k,c)(u)W_ξ(g).

- The diagonal GL_c acts on the functional by χ_τ∘det.

- Rescaling nonzero λ rescales the image functions and gives the canonical scalar comparison of models.

- The coefficient map v↦(g↦λ(ρ(g)v)) is equivariant and has kernel ⋂_g ker(λ∘ρ(g)); every linear map killing this kernel factors uniquely through the image model.

- Two elements of the image model agree iff their values agree at every group element; no faithfulness of the coefficient map is assumed for reducible ρ.

- For irreducible generic τ, ρ_c(τ) is of type (k,c), has finite length and has exactly one irreducible subquotient of type (k,c).

**Checks.**

- At c=1, ρ₁(τ)=τ and the model is the usual Whittaker model.

- For τ a GL₁ character, the model of ρ_c(τ)=τ∘det is one-dimensional, with orbit (1^c).

- For k=1,c=2, τ∘det is not generic for GL₂; replacing the (k,c) condition by ordinary genericity fails.

- Over ℚ₂ take k=2,c=1, an irreducible generic π of GL₂ and one character χ_n of ℚ₂× of exact conductor n for each n≥2. Such characters exist on ℤ₂×/(1+2ⁿℤ₂), whereas the conductor-one quotient is trivial. For K(m)=1+2ᵐMat₂(ℤ₂), m≥1, the sum π⊕⊕_(n≥2)χ_n∘det has fixed dimension dim π^K(m)+max(m−1,0), hence is admissible; every compact open contains some K(m). Its Whittaker dimension is 1+0=1, and (2) is the largest GL₂ orbit. It is of type (2,1) and has infinite length.

- For GL₄ with requested rectangle (2,2), successive highest derivative orders (2,2) terminate at GL₀ and satisfy the rectangular-support hypothesis of §5.1a. A generic GL₄ representation has first highest derivative 4, so fails it; its orbit prefix sum 4 exceeds the rectangular bound 2. At infinity (2,2) has prefix sums 2,4, whereas (4) fails the first bound, so the latter is excluded from M≤(2,2).

Additional normalization checks:

- At c=1, ρ₁(τ)=τ and the chosen functional is Whittaker; for k=1,c=2, ρ₂(τ)=τ∘det.
- For trivial τ on GL₁ and c=2, the orbit is (1,1), functional dimension 1, and the ordinary GL₂ Whittaker dimension is 0.
- For the image construction alone, the coefficient map of 1⊕σ with λ on the trivial factor, the σ summand is in the kernel; image-model equality cannot imply equality of its preimages.

A proof can proceed as follows: Apply the supplied GL segment and Langlands-quotient constructors, prove the unitary quotient identification and the ordered tempered-product extension, and retain possible reducibility. Prove maximal-support and one-dimensional-functional assertions by induction and generalized Jacquet exactness, as in MODELS Theorem 4: at finite places through iterated highest derivatives (the comparison of §5.1a); at infinity through the wave-front set of ρ_c(τ) (the wave-front and derivative comparisons of §5.1a) and, for the uniqueness bound, by realizing each block ρ_c(τ_i) with τ_i of GL₂ as a quotient of a degenerate principal series ρ_c(χ₁)×ρ_c(χ₂) of characters composed with determinants (MODELS lines 204–206), whose (k,c) functionals are counted by the wave-front and derivative comparisons of §5.1a. The unique (k,c) subquotient uses exactness of the generalized Whittaker functor: at infinity first place ρ_c(τ) and all constituents in M≤(k^c) using the wave-front bound just proved, and apply the contravariant exactness of the comparison of §5.1a on that Serre category; at finite places use Jacquet exactness. Form the equivariant image and identify its diagonal stabilizer character λ(ρ_c(τ)(g△)ξ)=χ_τ(det g)λ(ξ).

*Needs:* §5.1; EndoscopicTransferAndUnitaryTraceComparison §10.29 (canonical nongeneric GL factors); §5.1a (rectangular support and derivative comparisons); SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 (induction, Jacquet functors, geometric lemma and pairings) and §SR.0.4 (admissible duals and matrix coefficients); SmoothRepresentationsOfLocalGroups §SR.5.2 (*segment-representations*) and §SR.5.3 (*highest-derivative-adapter*); AutomorphicFormsOnReductiveGroups §§2.1–2.7 (real representations and globalizations).

### 5.3 generalized doubling geometric datum

For G=G_c and k≥1 set H=G_(2kc), Q with Levi GL_c^(k−1)×G_(2c), and U=Rad_u Q. Choose its character ψ_U for the orbit ((2k−1)^c 1^c) and e:G×G→Stab_(M_Q)(ψ_U), injective for Sp and SO, with kernel the diagonal distinguished central torus for GSpin. For k=1 take U=1. Fix the Siegel P, P′=j^(kc)P (j is trivial outside even orthogonal/spin H), δ=δ₀δ₁ and an involution ι of G with δe(g,ιg)δ⁻¹∈M_P. Set U₀=U∩U_(P′) and U=V⋊U₀; conjugation by δ identifies V with U_(c^k) and transports ψ_U to ψ_(k,c)⁻¹. The datum includes actual matrices/root coordinates and proofs of all these identities. For Sp_(2n), ψ_U is ψ_(k−1,c) on the repeated blocks times ψ(tr u₁₁+tr u₂₂) on the final c rows adjoining the middle 2c block; e repeats g₁ on the outer blocks and embeds g₁ and g₂ in the complementary middle symplectic subspaces. Odd orthogonal and spin lifts require their separate coordinates, not that even symplectic example.

Assume the five split characteristic-zero families of Layer 0; c>1; k≥1; ψ fixed; compatible standard parabolics and pinnings. (CFK, §3.3, Example 3.1, pp.12–13; CFK line 491; GK, §1.5, pp.12–16; GK line 556.)

Prove the following basic properties of this construction.

- e is a homomorphism with exactly the stated kernel.

- δ transports the V character to ψ_(k,c)⁻¹.

- δe(g,ιg)δ⁻¹ lies in the Siegel Levi, giving the invariance of the U₀ integral.

- Conjugate P,Q,U,e,δ and ψ_U together; conjugation preserves the defining relations and transports the local integral with the pushed-forward measures.

**Checks.**

- At k=1 the U₀ integral is over the trivial group.

- For a distinguished central z, e(z,z)=1 in GSpin; an asserted injective product embedding fails.

- For G=Sp₂ and k=2 the middle character is ψ(u₁₁+u₂₂) on the two scalar entries, rather than a character of only one entry.

Additional normalization checks:

- At k=1, U=U₀=1 and the inner measure has mass 1.
- In GSpin, e(z,z)=1 for every distinguished-central z; a nonidentity z gives a nontrivial kernel pair.
- For Sp₂,k=2, scalar entries 1 and 2 give ψ(3), whereas using the first entry alone gives ψ(1).
- For GSpin₂, dim(center)=2, dim(C_G^•)=1 and dim(G/C_G^•)=1. Quotienting by the whole connected center would instead give dimension 0 and would change the integral.
- At g=1 the transported diagonal element is δ·1·δ⁻¹=1∈M_P; the product δ·1=δ need not be in M_P. In the Sp₂,k=2 coordinates δ₀δ₁ has a nonzero off-Levi block, so it is not a Levi element.

A proof can proceed as follows: Use the existing group/root-data carriers to build the parabolics and root subgroups. Verify the character stabilizer and embedding, including the spin central kernel. Choose δ₀,δ₁ and ι and verify the transported character, semidirect decomposition and diagonal Levi identity. Verify the spin coordinates and Clifford lifts in the same construction.

*Needs:* §0.3; §5.1; ReductiveGroups Layer 7 (parabolics and Levi theory); the comparison of §0.0.

### 5.4 root elimination for (k,c) functionals

For τ generic with a unitary unramified twist and 0<l<c, realize ρ_c(τ) inside normalized induction of (ρ_l(τ)⊗ρ_(c−l)(τ))δ_(kl,k(c−l))^(−1/(2k)). Split each c×c unipotent block into l and c−l coordinates, let V consist of the lower-left subblocks, and let κ_(l,c−l) be the permutation grouping all l coordinates before all c−l coordinates. The integral ξ↦∫_V ξ(κv)dv converges, is continuous at infinity, defines a (k,c) functional and is nonzero on every subrepresentation. The pole reduction uses a second, classical-group transform with a smaller rank range. Fix a split classical group G_c of Layer 0, the doubling datum of §5.3, and a standard parabolic R=M_R U_R of G_c with M_R≅GL_l×G_(c−2l), so 1≤l≤⌊c/2⌋ and the tail G_(c−2l) may have rank zero; take τ unitary generic. For W∈W_ψ(ρ_c(τ)) and μ in the Schwartz space S_lin(U_R) of the linear coordinates of U_R, set T(W,μ)=∫_(U_R)W(r_z)μ(z)dz, where r_z∈GL_kc is the Levi element attached to z∈U_R by the coordinates of §5.3 (CFK (3.23), p.21; CFK line 845). Its target is the restriction space R_l(τ) of all functions a↦W_l(diag(a,I_((k−1)l))) on GL_l, with W_l in the twisted model |det|^((kc−kl−c+l)/2)W_ψ(ρ_l(τ)): the integral converges absolutely and W⊗μ↦(a↦T(diag(a,I_(kc−l))·W,μ)) is a surjection onto R_l(τ). Neither injectivity of the restriction W_l↦W_l|GL_l nor an identification of R_l(τ) with the complete (k,l) model is asserted. If the functional is built by splitting k instead, auxiliary ordered complex twists give a convergent Jacquet integral and a nonzero continued functional; its range is the one in MODELS Lemma 7, not an arbitrary subquotient.

Assume, for the c-splitting functional, 0<l<c, the fixed permutation and compatible self-dual measures, and τ generic with a unitary norm twist; for the classical transform, additionally a split classical G_c with standard parabolic of Levi GL_l×G_(c−2l), 1≤l≤⌊c/2⌋, and τ unitary generic. (MODELS, §3.1, Lemma 7, pp.6–7; §3.2, Lemma 9 and proof, pp.7–9; MODELS line 234; CFK, Lemma 3.16, pp.21–24; CFK lines 852–858.)

Prove the following basic properties of this construction.

- The c-split functional is the displayed integral on the specified induced carrier.

- Its restriction to any nonzero subrepresentation is nonzero.

- For a classical parabolic with Levi GL_l×G_(c−2l), the transform W⊗μ↦(a↦T(diag(a,I_(kc−l))·W,μ)) converges absolutely and surjects onto the restriction space R_l(τ).

- The functions in R_l(τ) carry the displayed determinant twist |det|^((kc−kl−c+l)/2), so they are not untwisted restrictions of the original function.

**Checks.**

- For c=2,l=1 the two block sizes are equal, but κ still rearranges the interleaved coordinates when k>1.

- For k=1 the integration group is trivial, and the construction is evaluation.

- For k=2,c=3,l=1 the determinant exponent is (6−2−3+1)/2=1; omitting the modulus gives a different character.

Additional normalization checks:

- For c=2,l=1,k=2 the interleaved order (1,2,3,4) changes to (1,3,2,4), despite equal block sizes.
- For k=1 the integration group is {1}, so its normalized integral is evaluation, of value 1 on the unit vector.
- For k=2,c=3,l=1 the determinant exponent is 1; at determinant norm 1/2 the twist is 1/2, not 1.
- For c=3 and l=2 the c-splitting functional exists, splitting the GL coordinates into sizes 2 and 1, but the classical transform does not: c−2l=−1, so G_3 has no standard Levi GL_2×G_(−1).
- The restriction map is not injective. Over ℚ₃ with ψ of conductor ℤ₃ and ψ(1/3)=ζ₃, take k=3, l=1, τ an unramified unitary principal series of GL₃ and its spherical Whittaker function W with W(1)=1, and put W′(g)=W(g·u₂₃(1/3))−ζ₃W(g). Since diag(a,1,1) commutes with u₂₃(1/3), W′ vanishes on every diag(a,1,1), whereas at the spherical diagonal diag(1,2,1) the root coordinate becomes 2/3 and W′(diag(1,2,1))=ζ₃²−ζ₃≠0.

A proof can proceed as follows: Define the permutation from the explicit ordering of coordinates. Exchange the paired root subgroups and use Fourier inversion to eliminate each off-diagonal block. Prove convergence and nonvanishing on subrepresentations. For the classical transform, realize ρ_c(τ) inductively for the composition (l,c−2l,l) of c, eliminate the roots of U_R in the lower model, and compute the determinant exponent of the restriction space (CFK Lemma 3.16 and proof, pp.21–24).

*Needs:* §5.2; §5.3 (doubling coordinates r_z, for the classical transform only); AutomorphicLFunctionsAndLocalFactors Layer AL.0 (vector-space Fourier analysis); SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 (induction, Jacquet functors, geometric lemma and pairings) and §SR.0.4 (admissible duals and matrix coefficients); AutomorphicFormsOnReductiveGroups §§2.1–2.7 (real representations and globalizations).

### 5.5 generalized doubling section family

For τ generic of GL_k and π of G_c, let V(s,τ,c)=i_P^H((|det|^(s−1/2)χ_π W_ψ(ρ_c(τ))⊗χ_π)∘i_(M_P)). Here χ_π on the GL factor means χ_π∘det, with the Levi identification of CFK §1. Entire sections are entire maps to the fixed compact picture, weakly holomorphic and continuous in the Casselman–Wallach topology at infinity. At finite places distinguish arbitrary entire sections from polynomial sections, which are finite Laurent sums in q^(−s). Standard sections are parameter independent in the compact picture. Intertwining operators act on continued sections, not necessarily entire sections at their poles.

Assume local char zero; τ generic; π admissible irreducible; specified Levi and compact subgroup with e(K_G×K_G)⊂K_H. (CFK, §3.3 and its footnote 2, pp.13–14; CFK line 530.)

Prove the following basic properties of this construction.

- Left covariance includes the true half-modulus and the displayed model action.

- The compact-picture carrier is independent of s.

- At finite places, polynomial sections are generated by standard sections over C[q^s,q^(−s)].

- Extend an inducing-model-valued compact-picture function with P∩K covariance to the normalized induced section.

- Two sections in the same parameter fiber are equal exactly when their compact-picture functions are equal.

**Checks.**

- At s=1/2 the extra determinant norm twist is trivial.

- For Sp or SO both χ_π factors are trivial.

- A compact-picture constant family evaluates to a standard section; multiplying it by 1/(1−q^(−s)) yields a meromorphic family that need not be entire.

Additional normalization checks:

- At s=1/2, |det|^(s−1/2)=1 for every nonzero determinant.
- For Sp or SO, both χ_π factors have value 1; a nontrivial spin χ cannot be omitted.
- The compact-picture constant vector gives an entire standard section, while multiplying by (1−q⁻ˢ)⁻¹ gives a pole at s=0.

A proof can proceed as follows: Apply the existing normalized induction functor to the (k,c) model. Identify the fixed compact-picture carrier using Iwasawa decomposition. Define entire, polynomial and standard families and record their evaluation maps.

*Needs:* §5.3; §5.2; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 (induction, Jacquet functors, geometric lemma and pairings) and §SR.0.4 (admissible duals and matrix coefficients); AutomorphicFormsOnReductiveGroups §§2.1–2.7 (real representations and globalizations).

### 5.6 Schwartz and seminorm bounds for (k,c) models

For k>1 and generic τ there is d₀>0 such that every W in the (k,c) model satisfies |W(diag(g,I))|≤|det g|^(−d₀)Φ(g) for a Schwartz majorant Φ on Mat_c. At infinity a fixed continuous seminorm controls |λ(ρ_c(τ)(ugo)ξ)| by |χ_τ(det g_k)|∏_(i<k)|det(g_k⁻¹g_i)|^(−d₀), for g=diag(g₁,…,g_k), u∈U_(c^k), o∈K. Each individual ξ also admits Schwartz factors Φ_i(g_(i+1)⁻¹g_i) in this estimate. The differentiated character relation supplies polynomial decay in the adjacent ratios. At infinity the comparison of §5.6 makes the opposite-unipotent integrals absolutely convergent and continuous in the positive Langlands chamber. Uniform seminorms, not just vector-dependent pointwise bounds, are needed for archimedean continuation and Fubini.

Assume actual smooth/Casselman–Wallach topology; fixed nonzero (k,c) functional; positive Langlands chamber for opposite-unipotent convergence. (CFK, Lemmas 3.13–3.14, (3.19)–(3.22), pp.19–21; Lemma 3.22, pp.32–33; CFK line 779.)

For a real or complex reductive group G, a standard parabolic R=M_R U_R with opposite unipotent radical U_R⁻, an irreducible tempered representation σ of M_R with an invariant inner product on its smooth space V_σ, and ν∈𝔞_R,ℂ* with Re ν in the open positive chamber, prove that ∫_(U_R⁻)|⟨φ(u),w⟩_σ|du is finite for every φ in the smooth normalized induction from σ⊗exp⟨ν,H_R(·)⟩ and every w∈V_σ, and that (φ,w)↦∫_(U_R⁻)⟨φ(u),w⟩_σ du is continuous (CFK Lemma 3.22, pp.32–33; CFK line 1455).

A proof can proceed as follows: Exploit adjacent-root ψ equivariance to control support and convert polynomial coordinate multiplication into differentiated representation operators. Apply moderate growth and Dixmier–Malliavin to obtain Schwartz factors and continuous seminorm estimates. Combine the imported Harish–Chandra Xi and Iwasawa estimates with the positive Langlands exponents for the opposite unipotent.

*Needs:* §5.2; AutomorphicLFunctionsAndLocalFactors Layer AL.0 (vector-space Fourier analysis); AutomorphicFormsOnReductiveGroups §§2.1–2.7 (real representations and globalizations); SmoothRepresentationsOfLocalGroups §SR.3.3 (tempered support and Langlands quotients).

### Examples

For k=3,c=1, write u=(x,y,z) with adjacent coordinates x,z and top-right coordinate y. The product has adjacent coordinates x+x′ and z+z′, and top-right coordinate y+y′+xz′. Thus the character is ψ(x+z), independent of that cross term. Taking x=1,z=2,x′=3,z′=4 gives adjacent trace 10 and ψ(10)=ψ(3)ψ(7). For k=2,c=3,l=1 the root-transform exponent is 1. For k=1,c=2 the local generalized Speh representation is τ∘det, with orbit (1,1) and no ordinary Whittaker model.

### Dependencies

This layer follows Layer 0. The direct supplier inputs are `Matrix.trace`; `AddChar`; ReductiveGroups Layer 7 (parabolics and Levi theory); SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 (induction, Jacquet functors, geometric lemma and pairings) and §SR.0.4 (admissible duals and matrix coefficients); EndoscopicTransferAndUnitaryTraceComparison §10.29 (canonical nongeneric GL factors); §5.2 (local generalized Speh comparison); SmoothRepresentationsOfLocalGroups §SR.5.2 (*segment-representations*) and §SR.5.3 (*highest-derivative-adapter*); AutomorphicFormsOnReductiveGroups §§2.1–2.7 (real representations and globalizations); AutomorphicLFunctionsAndLocalFactors Layer AL.0 (vector-space Fourier analysis); SmoothRepresentationsOfLocalGroups §SR.3.3 (tempered support and Langlands quotients).

## Layer 6: generalized local factors

### 6.1 generalized local doubling integral

For a matrix coefficient ω of π∨ and an entire section f∈V(τ,c), define Z(s,ω,f)=∫_(C_G^•⧸G)∫_(U₀) ω(g)f(s,δu e₂(ιg))ψ_U(u)du dg in its convergence half-plane. The distinguished central quotient is omitted when trivial. The spin central-character cancellation must be proved so that the integrand descends. Retain the underlying trilinear functional on section, π-vector and the appropriate smooth dual vector. Haar measures, ψ and the geometric datum are part of the normalization.

Assume π irreducible admissible of G_c; τ irreducible generic of GL_k; exact geometry and section family of Layer 5. (CFK, §3.3, local integral and Lemma 3.3, p.14; CFK line 550.)

Prove the following basic properties of this construction.

- The continued integral is trilinear in section and matrix-coefficient vectors.

- The spin integrand is invariant under C_G^•.

- Scaling either Haar measure scales Z by the same scalar.

- Intertwining isomorphisms of π and its dual, with the evaluation pairing transported, preserve Z for the same model section.

**Checks.**

- A zero matrix coefficient or zero section gives zero.

- At k=1, U₀=1 and the inner integral is evaluation at δe₂(ιg).

- Changing g by a distinguished central element leaves the complete integrand invariant, although its individual factors can change.

Additional normalization checks:

- The sign of ψ_U is fixed by descent from U to U₀. For u=vu₀ with v∈V, the section's (k,c)-model covariance gives f(s,δvu₀x)=ψ_(k,c)(δvδ⁻¹)f(s,δu₀x), and §5.3 gives ψ_U(v)=ψ_(k,c)(δvδ⁻¹)⁻¹, so the integrand f(s,δu e₂(ιg))ψ_U(u) is left V-invariant and only U₀ is integrated. Over ℚ₃ with ψ(1/3)=ζ₃, k=c=2 and δvδ⁻¹ with upper-right block diag(1/3,0), the opposite convention ψ_U⁻¹ would multiply the integrand by ψ_(2,2)(δvδ⁻¹)²=ζ₃²≠1, so it would not descend to U₀.
- For a distinguished-central z, a coefficient multiplier a and section multiplier a⁻¹ have product 1. Omitting the coefficient multiplier leaves a⁻¹ and omitting the section multiplier leaves a; with a=2 these are 1/2 and 2, both different from 1.
- For GSpin₂, dim(center)=2, dim(C_G^•)=1 and dim(G/C_G^•)=1. Quotienting by the whole connected center would instead give dimension 0 and would change the integral.

A proof can proceed as follows: Prove central descent and diagonal invariance using the geometric datum and the model stabilizer character. Define the integral where the absolute integral is finite. Prove central descent and trilinearity on the absolute-convergence chamber; the continuation is the subsequent theorem of §6.2.

*Needs:* §5.5; §5.3; §5.2; AdelicAlgebraicGroups §§0.1–0.4 and 2.2–2.3 (restricted products and quotient measures).

### 6.2 continuation and nonzero local data

For fixed π and τ as in §6.1, Z converges absolutely in a right half-plane independent of the vectors and section. It continues meromorphically to C, rationally in q^(−s) for polynomial finite-place sections, and continuously as a trilinear functional at archimedean places. For every s₀ there are a matrix coefficient and a K_H-finite entire section whose integral is finite and nonzero on a neighborhood of s₀. This does not assert that Z/L is holomorphic for all sections.

Assume local characteristic zero; actual smooth models, polynomial sections for the finite rationality assertion. (CFK, Theorem 3.2, p.14; CFK line 561.)

A proof can proceed as follows: Use Cartan/Iwasawa bounds for matrix coefficients and (k,c) models to establish absolute convergence. Continue the equivariant functional by Bernstein theory at finite places and the archimedean continuation theorem. Use sections supported near the open orbit to obtain data avoiding zeros at a prescribed point; prove the continuation on these actual smooth carriers, rather than assuming continuation of arbitrary coefficients gives a continuous family.

*Needs:* §6.1; §5.6; SmoothRepresentationsOfLocalGroups §SR.3.3 (tempered support and Langlands quotients); AutomorphicFormsOnReductiveGroups §§2.1–2.7 (real representations and globalizations).

### 6.3 generic multiplicity one for doubling

Outside finitely many values of q^(−s) at finite places, and outside a discrete subset of C at infinity, dim Hom_(U⋊e(G×G))(V(s,τ,c),ψ_U⁻¹⊗π∨⊗π^ι)≤1. More generally the bound for π₁⊗π₂ is dim Hom_G(π₁∨,π₂^ι), with the corresponding admissible models. The proof must handle the infinitely many small-group orbits: use the larger algebraic-group orbit stratification and the distribution-vanishing theorem, including its conormal conditions in every normal derivative order. Merely asserting finitely many G×G double cosets is false.

Assume π irreducible admissible; τ generic; finite-length (k,c) model of ρ_c(τ); s outside the exceptional locus. (GK, Theorem A, pp.2–3; Theorem 1.4, pp.10–11; Theorem 2.1, p.17; GK line 88; CFK, §3.4, (3.4), pp.14–15; CFK line 549.)

A proof can proceed as follows: Translate equivariant functionals into invariant distributions on the flag variety. For nonopen strata apply GK Theorem 1.4 with its finite larger-group orbit cover, generalized Jacquet central exponents and all-order conormal character exclusions. On the open orbit identify the residual Hom_G space. The distribution-vanishing target and its hypotheses are specified below.

For the archimedean proof, the equivariant-distribution target uses a real algebraic manifold X, a larger Lie group A containing the acting group C normally, a closed union Z of finitely many locally closed A-orbits and a smooth Fréchet coefficient representation extending to A. For every z∈Z require the stabilizer-character orbit condition and vanishing of the stabilizer-character-isotypic part of (E tensor Sym^ν(conormal_z) tensor δ) dual, where δ is the C-to-stabilizer modular ratio for every integer ν≥0. Prove that the distributions supported on Z vanish and verify these hypotheses for each nonopen doubling stratum (GK Theorem 1.4, pp.10–11; GK line 446). The finite-place argument uses its algebraic orbit/Jacquet counterpart. Conormal degree zero alone does not control derivatives of delta distributions.

*Needs:* §5.3; §5.5; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 (induction, Jacquet functors, geometric lemma and pairings) and §SR.0.4 (admissible duals and matrix coefficients); AutomorphicFormsOnReductiveGroups §§2.1–2.7 (real representations and globalizations).

### 6.4 degenerate-Whittaker normalized intertwiner

Let M(s):V(s,τ,c)→V(1−s,χ_π⁻¹τ∨,c) be the standard Siegel intertwiner, using jP when kc is odd and H is even orthogonal or general spin (j is trivial in the symplectic case). Construct the unique degenerate Whittaker functional λ(s) on this induced family with the chosen δ₀,δ₁ and measures. Define C(s) through λ(s)=C(s)λ(1−s)∘M(s), and put M*(s)=C(s)M(s). Specify the odd-kc target and its Levi character independently. This is degenerate-Whittaker normalization, not an unspecified choice of a nonzero scalar intertwiner.

Assume Layer 5 geometric coordinates fixed; generic s for the functional comparison; all identities then meromorphic. (CFK, §3.4, (3.5), pp.15–16; CFK line 601.)

Prove the following basic properties of this construction.

- The target has parameter 1−s and character χ_π⁻¹τ∨, with its specified odd-case parabolic.

- λ(s)=λ(1−s)∘M*(s).

- C(s) is the meromorphic ratio determined by the nonzero degenerate Whittaker functionals.

- Among meromorphic scalar multiples of the fixed raw operator, the degenerate-Whittaker functional equation determines M* uniquely wherever the functional is nonzero, hence meromorphically.

- Intertwining isomorphisms of the inducing model commute with the normalized operator when both Whittaker functionals are transported.

**Checks.**

- Applying the parameter/character transformation twice recovers τ and s.

- When χ_π=1 the transformed GL data are τ∨.

- Replacing λ(s) by a(s)λ(s) changes C(s) by a(s)/a(1−s); the original C cannot be retained.

Additional normalization checks:

- At s=1/4 the reflected parameter is 3/4, and reflection twice returns 1/4.
- With χ_π=1, the transformed τ is τ∨ and the twice-transformed data are τ.
- Rescale λ(s) by exp(s); the normalization scalar changes by exp(2s−1), which at s=0 is exp(−1), not 1.

A proof can proceed as follows: Construct the unipotent integral for λ and prove its uniqueness in the induced family. Compare λ with its standard-intertwiner transform on a nonzero test vector. Continue C and M* and verify their transformed inducing data. Compute this normalization in the same fixed root coordinates.

*Needs:* §5.5; §6.3; AutomorphicSpectralTheory §§2.1–2.6 (meromorphic induction, intertwiners and ordered residues).

### 6.5 generalized doubling gamma-factor

Define γ(s,π×τ,ψ) by γZ(s,ω,f)=ω_π(i_G)^k·[γ(s,τ,ψ) for Sp only]·θ(s)·Z(1−s,ω,M*(s)f), where n=⌊c/2⌋ and θ(s)=χ_π(2)^(−kn)χ_τ(−1)^nχ_τ(2)^(−2n)|2|^(−2kn(s−1/2)). Here ω_π is the central character of π and i_G is the central element (−1)^(c+1)1_G, except for even GSpin, where i_G=i_M⁻¹(−I_(c/2),−1). Nonzero local data and multiplicity one give a unique meromorphic scalar. For the rank-zero tails set γ(Sp₀×τ)=γ(τ) and γ(GSpin_c×τ)=1 when c≤1. The theta scalar is tied to the chosen root coordinates and measures; a change of coordinates can introduce an entire nowhere-zero scalar. For the trivial SO₀ and SO₁ tails all three local factors are 1.

Assume π admissible irreducible; τ generic; fixed ψ and all doubling data; γ(s,τ,ψ) is the GL_k×GL₁ factor with trivial GL₁ character. (CFK, §3.4, equations (3.6)–(3.7), Remark 3.4, pp.15–16; CFK line 613.)

Prove the following basic properties of this construction.

- The displayed identity holds for every matrix coefficient and entire section, meromorphically.

- Any scalar satisfying the same identity for all data equals γ.

- The Sp₀ and small-spin tail conventions are exactly the stated GL or trivial factors.

- Isomorphic π and τ give the same meromorphic gamma-factor; the equality is determined on any common nonempty regular parameter set.

**Checks.**

- The Sp₀ tail contributes γ(s,τ,ψ), so deleting the Sp correction changes the factor.

- For c=2,k=1, θ=χ_π(2)⁻¹χ_τ(−1)χ_τ(2)⁻²|2|^(1−2s).

- For ψ_b the factor changes by χ_π(b)^(k⌊c/2⌋)χ_τ(b)^N|b|^(kN(s−1/2)), detecting a lost central or degree term.

Additional normalization checks:

- For c=2,k=1,s=1 and trivial characters, θ=2 over ℚ₂ and θ=1 over ℚ₃.
- For s=1/2 the |2| exponent is zero and the norm contribution is 1.
- For Sp₀ and trivial GL₁ data, γ(s)=(1−q⁻ˢ)/(1−q^(s−1)), which is not the constant 1.

A proof can proceed as follows: Compare the two equivariant continued integrals at generic s. Use pointwise nonzero data to define and continue their ratio. Compute the central, power-of-two and Sp-only factors with the fixed coordinates.

*Needs:* §6.2; §6.3; §6.4; §0.3; AutomorphicLFunctionsAndLocalFactors Layer AL.3 (Rankin–Selberg factors).

### 6.6 local gamma-factor identities

The factor is compatible with norm twists: outside GSpin, twisting τ by |det|^u sends s to s+u; in GSpin, simultaneously twisting π by |Υ|^t and τ by |det|^u sends s to s+t+u. It is multiplicative for a classical-group quotient (σ₁×…×σ_d)⋊π′ via γ(π′×τ)∏γ(σ_i×τ)γ(σ_i∨×χ_πτ), and multiplicative for generic GL_k inducing factors of τ. It obeys γ(s,π∨×τ,ψ)=γ(s,π×χ_π⁻¹τ,ψ), γ(s,π×τ,ψ)γ(1−s,π∨×τ∨,ψ⁻¹)=1, and γ(s,π×τ,ψ_b)/γ(s,π×τ,ψ)=χ_π(b)^(k⌊c/2⌋)χ_τ(b)^N|b|^(kN(s−1/2)). In the unramified setting γ=L(1−s,π∨×τ∨)/L(s,π×τ). Over an archimedean field it equals the GL_N×GL_k factor of the standard local transfer T(π).

Assume the admissibility, genericity and quotient hypotheses of CFK Theorem 3.5; twists use the fixed GSpin similitude character; ψ_b(x)=ψ(bx). (CFK, Theorem 3.5, (3.8)–(3.14), pp.16–17; CFK line 634.)

A proof can proceed as follows: Compute the normalized intertwiners in stages and compare (k,c) functionals. Track determinant characters under duality and ψ change. Use the spherical calculation or archimedean standard transfer in the stated comparison range, proving the normalized intertwiner identities on these actual model spaces.

*Needs:* §0.4 (archimedean standard transfer); §6.5; AutomorphicLFunctionsAndLocalFactors Layer AL.3 (Rankin–Selberg factors); AutomorphicLFunctionsAndLocalFactors Layer AL.4 (Satake Euler factors and convergence); AutomorphicFormsOnReductiveGroups §§2.1–2.7 (real representations and globalizations); SmoothRepresentationsOfLocalGroups Layer SR.4 (Satake theory); AutomorphicSpectralTheory §§2.1–2.6 (meromorphic induction, intertwiners and ordered residues).

### 6.7 L- and epsilon-factors from tempered data

For tempered π and τ at a finite place, regard γ(s,π×τ,ψ) as a rational function of X=q^(−s), take its zero divisor on ℂ×, with multiplicities, and let P∈C[X] with P(0)=1 be the polynomial with exactly that divisor on ℂ×; the order of γ at X=0 is ignored, since powers of X are units in C[X,X⁻¹]. Equivalently P(q^(−s)) and γ(s) have the same zeros in the s-plane. Set L=P(q^(−s))⁻¹ and ε=γL(s)/L(1−s,π∨×τ∨); it is a Laurent unit. Extend to essentially tempered data by norm shifts. For the split tori G=SO₂ and GSpin₂, with the split-torus pair (α,β) of §0.3 and no unitarity or sign condition on their exponents, define L(s,π×τ)=L(s,α×τ)L(s,β×τ) and ε(s,π×τ,ψ)=ε(s,α×τ,ψ)ε(s,β×τ,ψ) with the GL₁×GL_k Rankin–Selberg factors; §6.11 proves that their gamma quotient is the γ of §6.5 and that this agrees with the tempered and Langlands-quotient definitions wherever those apply. The chamber condition below concerns the root directions of a proper parabolic; a torus has none, and a common norm shift of τ cannot make both α×τ and β×τ tempered when their exponents differ. For general π the Langlands quotient of (×σ_i)⋊π′ and generic τ=×τ_j with essentially tempered τ_j, set L(π×τ)=L(σ×τ)L(σ∨×χ_πτ)∏_jL(π′×τ_j), with the analogous product for ε. Use the normalized Langlands classification and the nongeneric GL pair factors from SmoothRepresentationsOfLocalGroups §SR.3.3 and EndoscopicTransferAndUnitaryTraceComparison §10.29. Use the positive-exponent chamber a_d>r when |Υ|^(−r)π′ is tempered. At infinity use the standard-transfer GL factors. Allow an empty GL block l=0, with π′ essentially tempered, so generic nonessentially-tempered τ is still covered. The SO₀ and SO₁ tail factors are all 1.

Assume actual ordered Langlands data; τ generic; canonical normalization P(0)=1; character conventions of CFK Remark 3.6. (CFK, §3.4, (3.15)–(3.17), Remark 3.6, p.17; CFK line 671.)

Prove the following basic properties of this construction.

- L is the reciprocal normalized gamma-zero polynomial at a finite tempered place.

- The displayed classical and GL Langlands product holds with the specified central twist.

- γ=εL(1−s,π∨×τ∨)/L(s,π×τ).

- Transport of the tempered or Langlands data through a representation isomorphism preserves L and ε, including their normalized finite-place polynomial.

**Checks.**

- P(0)=1 removes the ambiguity of multiplying P by a nonzero constant.

- A completely exhausted Sp Langlands datum retains L(s,τ).

- For tempered π and τ=|det|^bχ×|det|^(−b)χ with 0<b<1/2, the empty GL-block formula is the product of the two shifted tempered factors.

Additional normalization checks:

- For P(X)=1−2X, P(0)=1 and L=(1−2q⁻ˢ)⁻¹; multiplying P by 3 changes its constant term to 3.
- For the empty classical GL block in Sp, the remaining Sp₀ factor is L(s,τ), rather than 1.
- For exponents b=1/4 and −b, τ contributes L(s+1/4)L(s−1/4), including when the classical GL block is empty.
- For SO₂ over ℚ₃, π trivial, τ the ramified quadratic character with τ(3)=1 and ψ of conductor ℤ₃, γ=ε(s,τ,ψ)²=τ(−1)·3X²=−3X². It has no zeros on ℂ×, so P=1 and L=1, agreeing with the two ramified Tate factors; counting the double zero at X=0 would contradict P(0)=1, while an unramified factor 1−aX still contributes its nonzero root a⁻¹.

A proof can proceed as follows: Separate zeros of the rational gamma numerator in the tempered case and prove independence of ψ. Prove the Laurent-unit epsilon identity. Use uniqueness of Langlands data and multiplicativity to establish independence of presentations and dual compatibility.

*Needs:* §6.6; §0.3 (split-torus pair); SmoothRepresentationsOfLocalGroups §SR.3.3 (tempered support and Langlands quotients); EndoscopicTransferAndUnitaryTraceComparison §10.29 (canonical nongeneric GL factors); §5.2 (local generalized Speh comparison); AutomorphicLFunctionsAndLocalFactors Layer AL.3 (Rankin–Selberg factors); AutomorphicFormsOnReductiveGroups §§2.1–2.7 (real representations and globalizations).

### 6.8 spherical integral and doubling denominator

For normalized unramified data, Z=L(s,π×τ)/b(s,c,τ⊗χ_π). If c is even, b=[L(s+c/2,τ), for Sp only]∏_(j=1)^(c/2)L(2s+2j−2,τ,Sym²⊗χ_π)L(2s+2j−1,τ,∧²⊗χ_π). If c is odd, b=∏_(j=1)^⌊c/2⌋L(2s+2j−1,τ,Sym²⊗χ_π)∏_(j=1)^⌈c/2⌉L(2s+2j−2,τ,∧²⊗χ_π). Here K_G=G(O) and K_H=H(O) are the integral points of the split models in the coordinates of §0.3 and §5.3 (CFK line 568), the spherical vectors and section are fixed by them, and Haar measures give volume 1 to U₀∩K_H and K_G; as in §2.3, the identity refers to this compatible pair and not to an arbitrary hyperspecial subgroup of H containing the image of K_G×K_G. The local γ,L,ε agree with those of T(π)×τ when π is finite-place unramified, with arbitrary generic τ, and at every archimedean place.

Assume Spherical Z formula: π,τ,ψ,sections all unramified. Factor comparison: only π unramified at finite places; τ need not be unramified. (CFK, Equations (3.2)–(3.3), p.14; Theorem 3.7, p.17; CFK line 567.)

A proof can proceed as follows: Use Satake parameters and the spherical vector of the (k,c) model to sum the integral. Identify symmetric/exterior-square Euler polynomials and the extra Sp factor. Apply local multiplicativity and the standard-transfer comparison for the stated range.

*Needs:* §0.4 (archimedean standard transfer); §6.1; §6.7; §5.3; AutomorphicLFunctionsAndLocalFactors Layer AL.4 (Satake Euler factors and convergence); SmoothRepresentationsOfLocalGroups Layer SR.4 (Satake theory); AutomorphicFormsOnReductiveGroups §§2.1–2.7 (real representations and globalizations).

### 6.9 tempered holomorphy and Langlands pole comparison

When π is tempered and finite-place unramified or archimedean, L(s,π×τ) is holomorphic for Re(s)>0 if τ is tempered, and for Re(s)≥1/2 if τ is unitary generic. More generally, if χ_π and τ are unitary and π is finite-place unramified or archimedean with Langlands datum σ⋊π′ and positive GL exponents, then L(s,π×τ)/L(s,σ∨×χ_πτ) is holomorphic and nowhere zero on Re(s)≥1/2. The quotient statement refers to the continued meromorphic ratio, including at poles of its denominator.

Assume exactly the unramified/archimedean range above; positive Langlands chamber; unitary χ_π for the ratio statement. (CFK, Theorem 3.8 and Corollary 3.9, p.18; CFK line 711.)

A proof can proceed as follows: Compare to standard GL factors. Use the unitary generic exponent bound and tempered GL holomorphy. Apply the Langlands product to isolate σ∨×χ_πτ, observing that π′ is tempered because χ_π is unitary.

*Needs:* §6.8; §6.7; AutomorphicLFunctionsAndLocalFactors Layer AL.3 (Rankin–Selberg factors); AutomorphicFormsOnReductiveGroups §§2.1–2.7 (real representations and globalizations); SmoothRepresentationsOfLocalGroups §SR.3.3 (tempered support and Langlands quotients).

### 6.10 highly ramified stability

At a finite place let π∈Irr(G_c) and Π∈Irr(GL_N) have central character det r_G(π), namely 1 for Sp/SO and χ_π^(N/2) for GSpin. For every sufficiently ramified character η of F×, depending on π and Π, and every unramified generic τ of GL_k, the γ,L,ε factors of π×ητ and Π×ητ agree, and both L-factors equal 1. Π need not be generic or unramified. Reduce a nongeneric Π through its GL Langlands factors, not by asserting Π is determined by its gamma-factors.

Assume Nonarchimedean characteristic-zero local field; the central characters match; generic unramified τ. (CFK, Theorem 3.10 and Remark 3.11, p.18; CFK line 725.)

A proof can proceed as follows: For generic Π the statement is CFK Theorem 3.10, whose proof is CFK22 Lemma 7.3, cited by its locator (CFK line 725). The two extensions recorded in CFK Remark 3.11 (CFK lines 730–737) belong to this target: for GSpin the argument of CFK22 Lemma 7.3 is carried out without the unramified hypothesis on Π imposed there, which CFK record as unused, and a nongeneric Π is reduced to the generic constituent Π′ of the same product ×σ_i of essentially tempered representations, because γ(s,Π×ητ,ψ)=γ(s,Π′×ητ,ψ) by the canonical factors of EndoscopicTransferAndUnitaryTraceComparison §10.29, and L(s,Π×ητ)=∏_iL(s,σ_i×ητ)=1 once η is so ramified that every L(s,σ_i×ητ) is 1.

*Needs:* §6.6; §6.7; EndoscopicTransferAndUnitaryTraceComparison §10.29 (canonical nongeneric GL factors); §5.2 (local generalized Speh comparison); AutomorphicLFunctionsAndLocalFactors Layer AL.3 (Rankin–Selberg factors); §0.3.

### 6.11 split-torus local factors

Let F be a local field of characteristic zero, τ an irreducible generic representation of GL_k(F) with k≥1, and G=SO₂ or GSpin₂. With the identifications of §0.3, an irreducible π is a character of G, and (α,β) is its split-torus pair of §0.3, so αβ=χ_π, with χ_π=1 for SO₂, and α⊕β is the standard transfer of the parameter of π. Prove that at every place, finite or archimedean, ramified or unramified, and for characters α, β of arbitrary exponents, the Layer 6 factors are products of two GL₁×GL_k Rankin–Selberg factors of AutomorphicLFunctionsAndLocalFactors AL.3, which are Tate factors when k=1. For γ this is a theorem about the §6.5 definition; for L and ε, which §6.7 defines on the split tori by these products, it is the statement that the products satisfy the γ-identity of §6.7 and agree with the gamma-zero, essentially tempered and archimedean definitions of §6.7 wherever those apply:

    γ(s,π×τ,ψ) = γ(s,α×τ,ψ)·γ(s,β×τ,ψ)
    L(s,π×τ)   = L(s,α×τ)·L(s,β×τ)
    ε(s,π×τ,ψ) = ε(s,α×τ,ψ)·ε(s,β×τ,ψ)

Since the pair is unordered (§0.3), each product is unchanged when μ and μ⁻¹ are exchanged.

Assume local characteristic-zero field; π an irreducible representation, hence a character, of the split torus G; τ irreducible generic; fixed ψ and the doubling data of Layer 5. (CFK, §1, pp.6–7, CFK lines 250–267 and 279–282; CFK Theorem 3.5, multiplicativity (3.9) and archimedean property (3.13), p.16, CFK lines 638–645 and 659–660; definitions (3.15)–(3.17), p.17, CFK lines 671–697.)

**Checks.**

- Unramified SO₂ over ℚ₂ with μ=τ=1, k=1 and s=1: L(s,π×τ)=(1−2⁻¹)⁻²=4. The §6.8 denominator is b=L(2s,τ²)=L(2)=4/3, the exterior-square factor of GL₁ being 1, so Z=3 and bZ=4 agrees. A model keeping only the factor of μτ gives 2.

- Ramified π and τ with an unramified product: at an odd prime p let μ be the ramified quadratic character and τ=μ with k=1. Then μτ=μ⁻¹τ=1 and L(s,π×τ)=(1−p^(−s))⁻², so the rule that L is 1 whenever π is ramified is false; §9.4 assumes L_v=1 at ramified places instead of inferring it.

- Real place, μ=sgn, τ=1: L(s,π×τ)=Γ_ℝ(s+1)² with Γ_ℝ(s)=π^(−s/2)Γ(s/2), the factor of the parameter sgn⊕sgn; ignoring the sign gives Γ_ℝ(s)².

- GSpin₂ at a place with q=3, σ=1, χ_π unramified with χ_π(ϖ)=−1, τ=1 and s=1: L(s,π×τ)=(1−3⁻¹)⁻¹(1+3⁻¹)⁻¹=9/8. The pair (σ,σ⁻¹), which forgets χ_π, gives (3/2)²=9/4.

- Nonunitary ramified data: over ℚ₃ let χ be a ramified quadratic character, μ=χ|·|⁻¹ and τ=χ with k=1. The two exponents are −1 and +1, so no common shift of τ makes both factors tempered; the torus factors give L(s,π×τ)=L(s−1,1)L(s+1,1), which at s=2 is (1−3⁻¹)⁻¹(1−3⁻³)⁻¹=(3/2)(27/26)=81/52.

- Dependence on ψ: replacing ψ by ψ_b multiplies the right side by (αβ)(b)^k χ_τ(b)² |b|^(2k(s−1/2)) = χ_π(b)^k χ_τ(b)² |b|^(2k(s−1/2)), the §6.6 rule with c=2 and N=2. A pair whose product is not χ_π, such as (σ,σ⁻¹) for GSpin₂, contradicts that rule whenever χ_π(b)^k≠1.

A proof can proceed as follows, place by place. At an archimedean place, the archimedean property of §6.6 and the definitions of §6.7 give the factors of T(π), whose parameter is α⊕β, and the GL₂ factors of a sum of two characters are the products. At a finite place where π is unramified this is §6.8. At a finite place where π is ramified, regard π as the representation α⋊π₀ of the standard Levi GL₁×G₀=G, whose parabolic is G itself, with G₀=SO₀ and π₀ trivial for SO₂, and G₀=GSpin₀=GL₁ and π₀=χ_π for GSpin₂. Prove the §6.6 multiplicativity identity in this case, which CFK Theorem 3.5 states without a properness condition on the parabolic: its GL₁-block factor is γ(s,α×τ,ψ)γ(s,α∨×χ_πτ,ψ) and the tail factor of §6.5 is 1. Then obtain L and ε from §6.7. Together with the GL₁×GL_k identity γ=εL(1−s)/L(s) for each of α×τ and β×τ, this gives γ(s,π×τ,ψ)=ε(s,π×τ,ψ)L(1−s,π∨×τ∨)/L(s,π×τ) for the torus factors defined in §6.7, for all characters α, β of any exponents. It remains to compare with the other definitions of §6.7 where they apply. A unitary character of a torus is tempered; for tempered α, β and τ the poles of L(s,α×τ)L(s,β×τ) lie in Re(s)≤0 and those of the dual factors at 1−s in Re(s)≥1, so the zeros of γ on ℂ× are exactly the poles of that product and the gamma-zero definition gives the same L. For generic nontempered τ=×τ_j both sides are multiplicative in τ by §6.6 and by the GL₁×GL_k factors. When the GSpin₂ datum is essentially tempered, π=|Υ|^(r₀)π₀, the shift of §6.7 moves α and β by the same r₀, because Υ(e₁∨(y)e₀∨(x))=yx² (CFK line 292), and so agrees with the product. The torus factors are needed because, for SO₂ and π=μ of negative exponent, there is no Langlands datum with positive exponent in the fixed coordinates and no norm twist of π.

*Needs:* §6.5; §6.6; §6.7; §6.8; §0.3; AutomorphicLFunctionsAndLocalFactors Layer AL.1 (Tate factors and canonical archimedean factors); AutomorphicLFunctionsAndLocalFactors Layer AL.3 (Rankin–Selberg factors); EndoscopicTransferAndUnitaryTraceComparison §10.29 (canonical nongeneric GL factors); AutomorphicFormsOnReductiveGroups §§2.1–2.7 (real representations and globalizations).

### Examples

For c=2,k=1, θ(s)=χ_π(2)⁻¹χ_τ(−1)χ_τ(2)⁻²|2|^(1−2s). With trivial characters and s=1 this is 2 over ℚ₂ and 1 over ℚ₃. At s=1/2 both norm factors are 1. The involution on inducing data sends (s,τ) to (1−s,χ_π⁻¹τ∨); doing it twice gives (s,τ). With χ_π=1 and rank c=2, the spherical denominator is L(2s,Sym²τ)L(2s+1,∧²τ), with the extra L(s+1,τ) precisely for Sp₂. For rank-one τ, ∧²τ=0 and that factor is 1. For SO₂ with μ unramified, μ(ϖ)=2 and τ=1 at q=3, §6.11 gives L(s,π×τ)=(1−2·3^(−s))⁻¹(1−3^(−s)/2)⁻¹, whose value at s=1 is 3·(6/5)=18/5.

### Dependencies

This layer follows Layer 0, Layer 5. The direct supplier inputs are AdelicAlgebraicGroups §§0.1–0.4 and 2.2–2.3 (restricted products and quotient measures); SmoothRepresentationsOfLocalGroups §SR.3.3 (tempered support and Langlands quotients); AutomorphicFormsOnReductiveGroups §§2.1–2.7 (real representations and globalizations); SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 (induction, Jacquet functors, geometric lemma and pairings) and §SR.0.4 (admissible duals and matrix coefficients); AutomorphicSpectralTheory §§2.1–2.6 (meromorphic induction, intertwiners and ordered residues); AutomorphicLFunctionsAndLocalFactors Layer AL.3 (Rankin–Selberg factors); AutomorphicLFunctionsAndLocalFactors Layer AL.4 (Satake Euler factors and convergence); SmoothRepresentationsOfLocalGroups Layer SR.4 (Satake theory); EndoscopicTransferAndUnitaryTraceComparison §10.29 (canonical nongeneric GL factors); §5.2 (local generalized Speh comparison); AutomorphicLFunctionsAndLocalFactors Layer AL.1 (Tate factors and canonical archimedean factors).

## Layer 7: auxiliary GL integrals and pole attainment

### 7.1 auxiliary GL_c × GL_k integral

Let π∈Irr(GL_c), τ∈Irr_gen(GL_k), H=GL_(kc), e₁(g)=diag(g,I_((k−1)c)) and e₂(g)=diag(I_c,g,…,g). For a matrix coefficient ω of π, W∈W_ψ(ρ_c(τ)) and Φ∈Schwartz(Mat_c), define Z_GL(s,ω,W,Φ)=∫_(GL_c)W(e₁(g))Φ(g)ω(g)|det g|^(s−(kc−2c+1)/2)dg. For k>1, convolution in the first adjacent unipotent block absorbs Φ and gives the family Z_GL(s,ω,W). At k=1 keep Φ: this is the Godement–Jacquet integral; at c=1 it is the GL_k×GL₁ Rankin–Selberg integral. The sign of the matrix-coefficient dual is distinct from the classical G integral.

Assume Characteristic-zero local field; π irreducible admissible; τ irreducible generic; fixed measures. The archimedean continuation and pole statements use unitary generic τ and the hypotheses of §§7.2–7.4. (CFK, Appendix A, pp.42–43; CFK line 1832.)

Prove the following basic properties of this construction.

- Expose the displayed determinant integral and its multilinearity.

- For k>1 the family generated after convolution equals the family without Φ.

- At k=1 recover GJ with Φ, and at c=1 recover GL_k×GL₁ RS after the stated conventions.

- Transport σ, its dual coefficient and the (k,c)-model realization together; the determinant integral is unchanged.

**Checks.**

- At k=1 the exponent is s+(c−1)/2 and ρ_c(τ)=τ∘det, the GJ convention.

- At c=1 the exponent is s−(k−1)/2, the GL_k×GL₁ RS convention.

- For k=1 and a trivial GL₁ coefficient, removing Φ makes ∫_(F×)|g|^s dg divergent at one end for every s.

Additional normalization checks:

- At k=1,c=2 the exponent is s+1/2; at k=2,c=1 it is s−1/2.
- For k=c=1, without Φ the shell sum has tails q^(−ms), m∈ℤ, requiring simultaneously Re(s)>0 and Re(s)<0.
- For k>1, Φ=0 gives the zero integral; Fourier convolution absorbs nonzero Φ into the model vector, not by dropping its value.

A proof can proceed as follows: Define the integral using growth and Schwartz estimates for (k,c) models. Use ψ-equivariance and Fourier convolution to absorb Φ when k>1. Compare the two boundary cases to the existing GJ and RS conventions.

*Needs:* §5.2; §5.6; AutomorphicLFunctionsAndLocalFactors Layer AL.0 (vector-space Fourier analysis); AutomorphicLFunctionsAndLocalFactors Layer AL.2 (Godement–Jacquet theory); AutomorphicLFunctionsAndLocalFactors Layer AL.3 (Rankin–Selberg factors).

### 7.2 auxiliary functional equation and multiplicativity

For k>1 and π∈Irr(GL_c) with central character ω_π, construct Z_GL*(s,ω,W)=∫_(GL_c)∫_(U⁻_((k−2)c,c)) W(diag(I_((k−1)c),g)diag(I_c,z)w_((k−1)c,c))ω(g)|det g|^(s−1+(kc−2c+1)/2)dz dg. For k=2 the z group is trivial. Its initial domain is a left half-plane. Part of this target is the generic uniqueness of the equivariance space in (A.2): outside finitely many values of q^(−s) at a finite place, and outside a discrete set of s at infinity, the continuous trilinear forms B on π×π∨×ρ_c(τ) with B(π(g)φ,ω_τ(det g′)⁻¹π∨(g′)φ∨,ρ_c(τ)(u e₁(g)e₂(g′))ξ)=ψ_(k,c)(u)|det gg′⁻¹|^(−s+(kc−2c+1)/2)B(φ,φ∨,ξ), for g,g′∈GL_c and u in the subgroup of U_(c^k) whose (1,2) block vanishes, ω_τ being the central character of τ, form a space of dimension at most one (CFK Theorem A.1, p.43; CFK line 1882; CFK attribute its proof, valid for general linear groups over every characteristic-zero local field, to KAP23 Theorem 25, cited by its locator). Both integral families lie in this space, which gives γ_GL Z_GL=ω_π(−1)^(k−1)Z_GL* (CFK (A.3), p.44; CFK line 1910). With unitary τ and π embedded in normalized induction π₁×π₂, γ_GL(π×τ)=γ_GL(π₁×τ)γ_GL(π₂×τ). It agrees with γ_RS if π is finite-place unramified or the field is archimedean. In this range both integral families have meromorphic continuation and at infinity continuous continuation on the smooth data. A general archimedean nongeneric continuation is not obtained merely by invoking Bernstein’s finite-place argument.

Assume k>1; unitary generic τ for multiplicativity and the pole analysis; π finite-place unramified or archimedean for the asserted comparison/continuous continuation. (CFK, Theorems A.1–A.2 and (A.2)–(A.17), pp.43–50; CFK line 1882.)

**Checks.**

- For c=1, k=2 and π the sign character of ℝ×, ω_π(−1)=−1, so γ_GL Z_GL=−Z_GL*; the classical-group character χ_π, which is 1 here, would give +Z_GL* instead.

- For k=3 the sign is ω_π(−1)²=1 for every π, so only even k detects the central character.

- For c=2, k=2 and π=sgn∘det on GL₂(ℝ), ω_π(−1)=π(−I₂)=sgn(det(−I₂))=sgn(1)=1, so γ_GL Z_GL=+Z_GL*; evaluating the determinant character itself at −1 would give −1. The sign is the central character at −I_c.

A proof can proceed as follows: Prove the uniqueness bound for (A.2), following the proof that CFK attributes to KAP23 Theorem 25 (cited by its locator), and deduce the functional equation from the membership of Z_GL and Z_GL* in that space. Split the c coordinate and apply the root-elimination transforms to the two integrals. Justify each Fourier exchange with Schwartz convolution and Dixmier–Malliavin, then reduce to GL₁×GL_k RS integrals with compact outer integration.

*Needs:* §7.1; §5.4; AutomorphicLFunctionsAndLocalFactors Layer AL.0 (vector-space Fourier analysis); AutomorphicLFunctionsAndLocalFactors Layer AL.3 (Rankin–Selberg factors); AutomorphicFormsOnReductiveGroups §§2.1–2.7 (real representations and globalizations).

### 7.3 common pole divisor of the auxiliary integrals

Assume τ unitary generic, k>1, and π finite-place unramified or archimedean. Define 𝔏(s,π×τ) by requiring every Z_GL/𝔏 to be entire and that for every s₀ some such quotient be nonzero at s₀. At a finite place it is the normalized gcd generator P(q^(−s))⁻¹, P(0)=1, for polynomial data over C[q^s,q^(−s)]. At infinity it is a meromorphic function with no zeros, specified up to an entire nowhere-vanishing factor by its pole divisor including multiplicities. Under π⊂π₁×π₂, 𝔏(π×τ)=A(s)𝔏(π₁×τ)𝔏(π₂×τ) for an entire A, which may vanish. The pole divisor is independent of ψ and translates under norm twists.

Assume k>1; τ irreducible unitary generic; π irreducible admissible and unramified if the field is nonarchimedean; at infinity use its Casselman–Wallach realization and retain divisor equality as the invariant assertion. (CFK, Theorem A.6 and (A.19), pp.50–51; CFK line 2336.)

Prove the following basic properties of this construction.

- For every datum, Z_GL/𝔏 is entire.

- At every point a quotient Z_GL/𝔏 is nonzero.

- The product formula includes an entire defect A; no assertion A∈O× is made.

- Representatives with the same entire-quotient and local-attainment properties differ by a nowhere-vanishing entire factor; the finite-place normalized inverse polynomial removes that ambiguity.

**Checks.**

- For a hypothetical finite family {P(X)⁻¹,X·P(X)⁻¹} with P(0)=1, its normalized gcd is P⁻¹, not P.

- Multiplying an archimedean representative by exp(s) leaves its divisor unchanged.

- A simple pole and a double pole at s₀ force a divisor of order two; recording just the set of poles fails.

Additional normalization checks:

- For P(X)=1−X/2, the family {P⁻¹,XP⁻¹} has pole order 1 at X=2 and normalized inverse-polynomial gcd P⁻¹.
- Multiplication by exp(s) has order 0 everywhere and changes no archimedean pole order.
- For {t⁻¹,t⁻²}, the common pole divisor has order 2, and t²·t⁻²=1 attains it.

A proof can proceed as follows: Use the continued families and their relation to reflected companion integrals to bound pole orders locally. Construct the maximal common pole divisor and use convolution to realize its order at every point. Normalize the finite-place generator and prove the entire multiplicativity defect, additive-character independence and norm-shift property.

*Needs:* §7.2; AutomorphicLFunctionsAndLocalFactors Layer AL.0 (vector-space Fourier analysis); AutomorphicLFunctionsAndLocalFactors Layer AL.3 (Rankin–Selberg factors).

### 7.4 auxiliary attainment of Rankin–Selberg poles

In the unitary-τ and unramified-finite/archimedean π range, L_RS(s,π×τ)/𝔏(s,π×τ) is entire. Consequently, for every s₀ there are ω,W with Z_GL(s,ω,W)/L_RS(s,π×τ) nonzero at s₀, possibly with a pole; archimedean data can be chosen K-finite. The quotient direction is essential: the auxiliary family has at least the RS pole orders. For the Langlands-quotient tail π′ obtained by deleting the first inducing block, 𝔏(π′×τ)=P(s)𝔏(π×τ) with P entire, as proved by the tail-surjectivity argument.

Assume k>1; τ unitary generic; π unramified at a finite place or arbitrary irreducible admissible at infinity; ordered essentially tempered GL Langlands quotient data. (CFK, Lemma A.8, pp.51–54; Proposition A.10 and Theorem A.11, pp.54–55; CFK line 2382.)

A proof can proceed as follows: Use the quotient-to-induced matrix-coefficient realization to reach the tail integrals with arbitrary lower data. Combine the entire product defect and dual functional equation, separating the pole half-planes of the extreme essentially tempered factors. Induct on the number of Langlands blocks and use divisor attainment; continuous continuation permits compact-type projection.

*Needs:* §7.3; §7.2; SmoothRepresentationsOfLocalGroups §SR.3.3 (tempered support and Langlands quotients); AutomorphicFormsOnReductiveGroups §§2.1–2.7 (real representations and globalizations); EndoscopicTransferAndUnitaryTraceComparison §10.29 (canonical nongeneric GL factors); §5.2 (local generalized Speh comparison).

### 7.5 open-chart reduction to the auxiliary GL integral

For π finite-place unramified or archimedean with unitary χ_π and a nontrivial positive Langlands block σ of GL_l, the local doubling integrals can be reduced by suitable sections and matrix-coefficient vectors to the auxiliary GL_l×GL_k family for σ∨×χ_πτ. The open-cell coordinate map of CFK (3.41) is a homeomorphism, a diffeomorphism at infinity, onto the relevant open subset of P⧸H. Its Jacobian and model transform produce exactly the local integral shift. The reduction reaches every function of the restriction space of §5.4, that is every restriction a↦W_l(diag(a,I_((k−1)l))) of the twisted lower model, which is all that the auxiliary integral of §7.1 evaluates. Compact support and Fourier convolution justify the integrations at finite places; at infinity one needs the continuous meromorphic Fubini assertion and the comparison of §5.6. The unitary χ_π hypothesis is carried through each reduction.

Assume τ unitary generic; k>1; π in the indicated range; unitary χ_π; nonempty GL_l block and fixed open-cell coordinates. (CFK, Propositions 3.17–3.19, Lemma 3.20, Corollary 3.21 and (3.32), (3.35)–(3.41), pp.24–32; CFK line 987.)

A proof can proceed as follows: Insert the induced-model matrix-coefficient formula and isolate the inner Z₁ integral. Use the explicit open chart, sections supported there, and Lemma 3.20 to move the integrations. Apply root elimination to Z₂, including the determinant exponent, to obtain arbitrary auxiliary GL_l data.

*Needs:* §5.4; §6.1; §7.1; §5.6; AutomorphicFormsOnReductiveGroups §§2.1–2.7 (real representations and globalizations); SmoothRepresentationsOfLocalGroups §SR.3.3 (tempered support and Langlands quotients).

### 7.6 attainment of the doubling L-factor poles

Let τ be unitary generic and π have unitary χ_π, with π unramified at a finite place or arbitrary admissible irreducible at infinity. For every s₀ with Re(s₀)≥1/2, some matrix coefficient ω of π∨ and K_H-finite entire section f have Z(s,ω,f)/L(s,π×τ) nonzero at s₀, allowing a pole. Equivalently, for those data ord_(s₀) Z≤ord_(s₀) L. If π is tempered the holomorphic nonzero L and local nonzero-data theorem suffice. Otherwise isolate σ∨×χ_πτ by §6.9 and reach the auxiliary integral. For k=1, where τ is a unitary character of F× and Z is the classical doubling integral, the same attainment is part of this target (CFK §3.6, p.19; CFK line 773, which derives it from the proof of YAM14 Theorem 7.1 with adjustments for SO_c and GSpin_c). For Sp_c and SO_c the input is MetaplecticAutomorphicForms §6.10a: at finite places its good-section gcd, whose normalized generator is L_v(s+1/2,π⊗χ) in that supplier's variable s=s_G−1/2, together with Yamana's comparison of good and holomorphic sections on Re s≥0, that is Re s_G≥1/2; at archimedean places its normalized-quotient and nonzero-test assertions. Proved here are the identification of that supplier's factor with the k=1 factor of §6.7, the passage from the isometry group of the supplier's orthogonal datum to SO_c, and the GSpin_c case, which that supplier does not cover.

Assume exactly the unitary central-character, unitary generic τ, and unramified-finite/archimedean π hypotheses; Re(s₀)≥1/2. (CFK, Theorem 3.12 and proof summary, p.19; proof completed after Corollary 3.21, pp.31–32; CFK line 760.)

A proof can proceed as follows: If there is no positive Langlands GL block, combine nonzero local data with tempered holomorphy. For k>1 use the open-chart reduction and the auxiliary RS pole theorem. Divide by the holomorphic nowhere-zero complementary L-factor and transport K-finite data by continuity; for k=1 use the MetaplecticAutomorphicForms §6.10a gcd and nonzero-test inputs as stated above.

*Needs:* §6.2; §6.9; §7.4; §7.5; MetaplecticAutomorphicForms §6.10a (classical doubling gcd and nonzero tests, for k=1); the comparison of §0.0.

### Examples

For k=1,c=2 the auxiliary exponent is s+1/2; for k=2,c=1 it is s−1/2. At k=2 the reflected inner unipotent is trivial. For P(X)=1−X/2, the two functions P⁻¹ and XP⁻¹ generate the same Laurent ideal as P⁻¹; at X=2 the pole order is one. At infinity exp(s) changes no pole divisor. Writing t=s−s₀, if L=t⁻¹ and an attained integral is t⁻², then Z/L=t⁻¹ and ord Z=−2≤−1=ord L. A pole is allowed by the attainment theorem. For k=1 the supplier variable of MetaplecticAutomorphicForms §6.10a is s=s_G−1/2, so the attainment range Re s_G≥1/2 is Re s≥0 there; reading Yamana's half-plane in the s_G variable would wrongly start at Re s_G≥0.

### Dependencies

This layer follows Layer 5, Layer 6. The direct supplier inputs are AutomorphicLFunctionsAndLocalFactors Layer AL.0 (vector-space Fourier analysis); AutomorphicLFunctionsAndLocalFactors Layer AL.2 (Godement–Jacquet theory); AutomorphicLFunctionsAndLocalFactors Layer AL.3 (Rankin–Selberg factors); AutomorphicFormsOnReductiveGroups §§2.1–2.7 (real representations and globalizations); SmoothRepresentationsOfLocalGroups §SR.3.3 (tempered support and Langlands quotients); EndoscopicTransferAndUnitaryTraceComparison §10.29 (canonical nongeneric GL factors); §5.2 (local generalized Speh comparison); MetaplecticAutomorphicForms §6.10a (classical doubling gcd and nonzero tests, for k=1).

## Layer 8: holomorphy of Speh doubling Eisenstein series

### 8.0 constant-term pole detection and Hermitian support

For an Eisenstein family of AutomorphicSpectralTheory §2.4 induced from discrete unitary data whose cuspidal support is carried by a single standard Levi M₀ up to association, prove that every pole of the family, with its order, is a pole of the same order of its constant term along the standard parabolic with Levi M₀ (CFK proof of Theorem 4.1, p.36; CFK lines 1600–1603).

For a nonzero square-integrable automorphic form whose cuspidal support lies in the Weyl orbit of a cuspidal datum (M,σ,λ), prove that this orbit also contains the Hermitian dual datum (M, conjugate contragredient of σ, −λ̄) (CFK proof of Theorem 4.1, p.37; CFK lines 1632–1638).

**Checks.**

- A meromorphic coefficient t⁻²A+t⁻¹B has pole order 2; a nonzero constant-term image of A keeps order 2, while one killing A would leave at most order 1 and must be ruled out by pole detection.
- For spectral exponent λ=1/4+i, the Hermitian-dual exponent is −λ̄=−1/4+i; using −λ gives −1/4−i and changes the imaginary part.
- For the c=2 residual bound at Re(s₀)=1/4 the prefix sums are at most −3/4 and −1/2. At Re(s₀)=0 the final bound is 0, so strict square-integrability cannot prove unitary-axis regularity.

*Needs:* AutomorphicSpectralTheory §§2.4–2.4a, Layer 4 and §5.12.

### 8.1 global Speh doubling Eisenstein series

For unitary cuspidal τ of GL_k(A_F), import the discrete global Speh representation E_τ of GL_(kc)(A_F) with local components ρ_c(τ_v). The Siegel Levi of H=G_(2kc) is GL_(kc)×G₀, where G₀=GSpin₀=GL₁ when H=GSpin_(2kc) and G₀ is trivial when H=Sp_(2kc) or SO_(2kc). When H=GSpin_(2kc), let θ be a unitary Hecke character of A_F×/F×, acting on the G₀=GL₁ factor; when H=Sp_(2kc) or SO_(2kc) there is no such factor and θ=1. Form the normalized induced family i_P^H(|det|^s E_τ⊗θ), using the adopted spin Levi map, and its Eisenstein sum E_(τ,θ,c)(s,h). The parameter here is unshifted: the global integral for π×τ uses E_(χ_πτ,χ_π,c)(s−1/2,h), with θ=χ_π, which is 1 outside GSpin by §0.3. Define standard and finite K-type sections and the meromorphic family through the imported discrete-data Eisenstein continuation. Its poles are part of the analytic problem, not omitted by definition.

Assume number field; c≥1; τ unitary cuspidal; θ unitary when H is a general spin group and θ=1 when H is symplectic or special orthogonal; coherent quotient measures and standard parabolic. (CFK, §4.2, equations (4.1)–(4.3), pp.34–35; CFK lines 1490 and 1503–1507.)

Prove the following basic properties of this construction.

- In its convergence region E is the P(F)⧸H(F) sum of the section.

- The local inducing representation matches the Layer 5 family under the stated twist and shift.

- At a local doubling variable s_G, the global series is evaluated at s_E=s_G−1/2; its own inducing exponent is s_E.

- The series is linear and right-translation equivariant in its section in the convergence region and after meromorphic continuation.

**Checks.**

- At c=1 the Speh datum is τ itself.

- The local central point s=1/2 corresponds to the global unshifted exponent 0.

- For τ=θτ∨ the holomorphy hypothesis below fails; continuation alone does not assert holomorphy.

- Negative control for the domain of θ: take H=Sp₂=SL₂, k=c=1, τ=1 over F=ℚ and θ the quadratic Hecke character of conductor 5. The Siegel Levi is GL₁ with no further GL₁ factor, so θ has nothing to act on. The exclusion |det|^(it)τ≄θτ∨ would hold for it, because at a 5-adic unit u with θ(u)=−1 every |u|^(it) equals 1. Yet the series is the spherical SL₂ series: its section has covariance |a|^(s+1) on diag(a,a⁻¹), the classical parameter is (s+1)/2, and the classical residue 3/π at parameter 1 becomes a pole at s=1 with residue 6/π, inside Re(s)≥0. With the required θ=1, τ=1 is θ-self-dual at t=0 and is excluded, so this pole does not contradict §8.4.

Additional normalization checks:

- At c=1, ρ₁(τ)=τ; at s_G=1/2 the global exponent is s_E=0.
- For τ=θτ∨, the exclusion is false at t=0, so no holomorphy theorem is obtained from this hypothesis.
- Multiplying the inducing section by 3 multiplies each convergent Eisenstein summand, and hence the series, by 3.

A proof can proceed as follows: Import the global residual Speh construction and its local components from AutomorphicSpectralTheory §4.14a. Apply the AutomorphicSpectralTheory §§2.1–2.6 discrete-data induction and meromorphic Eisenstein theorem. Match its local family to Layer 5 at the shifted parameter, checking both spin characters.

*Needs:* AutomorphicSpectralTheory §4.14a (number-field residual Speh blocks); AutomorphicSpectralTheory §§2.1–2.6 (meromorphic induction, intertwiners and ordered residues); §5.5.

### 8.2 two-term Speh constant term and intertwiner bounds

Let θ be the §8.1 datum, so θ=1 unless H=GSpin_(2kc). Assume |det|^(it)τ≄θτ∨ for every real t. The relevant maximal constant term of E_(τ,θ,c) has the two induced contributions with smaller Speh size c−1 and parameters s+1/2 and s−1/2, the latter composed with the appropriate standard intertwiners M₁(s),M₂(s). Retain the j_P-conjugate alternatives for H=SO_(2kc) or GSpin_(2kc) when k is odd. M₁ is holomorphic for Re(s)>−(c−1)/2 and M₂ for Re(s)≥1/2. Their GL normalizing ratios use L(2s,τ×θ⁻¹τ) as a holomorphic numerator under nonessential self-duality and L(2s+c−1,τ×θ⁻¹τ) as a nonzero denominator on its right boundary. These roles must not be interchanged. More precisely M₂(s)=[L(2s)/L(2s+c−1)]N₂(s), where N₂ is holomorphic for Re(s)>(2−c)/4.

Assume τ unitary; θ unitary on the GSpin factor and θ=1 for symplectic and special orthogonal H, as in §8.1; c>1 for the recursion; no essentially θ-self-dual τ. (CFK, (4.5), Lemma 4.3, pp.35–36; even orthogonal/spin ambient H with odd k, (4.8)–(4.9), pp.37–38; CFK line 1530.)

For a characteristic-zero local field, a unitary generic τ of GL_k, a unitary character θ and c′≥1, prove that the standard intertwiner M₂(s) from |det|^(s−1/2)ρ_(c′)(τ)×|det|^(−s−c′/2)θτ∨ to the induced representation in the opposite order, multiplied by L(2s+c′,τ×θ⁻¹τ)/L(2s,τ×θ⁻¹τ), is holomorphic for Re(s)>(1−c′)/4, extending the AutomorphicSpectralTheory §2.3a normalized GL estimates to a Speh inducing block (CFK Lemma 4.3 and proof, pp.35–36; CFK lines 1576–1583).

A proof can proceed as follows: Apply the constant-term formula to the residual Speh datum, retaining the two surviving Weyl terms. Factor the intertwiners into GL rank-one operators with the explicit RS normalizing ratios. Use global RS holomorphy/nonvanishing, the local–global factorization of AutomorphicSpectralTheory §2.5 and the normalized operator comparison proved in this subsection.

*Needs:* §8.1; AutomorphicSpectralTheory §§2.1–2.6 (meromorphic induction, intertwiners and ordered residues); AutomorphicLFunctionsAndLocalFactors Layer AL.3 (Rankin–Selberg factors).

### 8.3 residual exponents and the hermitian-support obstruction

Let e(s,c) be the real parts of the cuspidal exponents of the leading Laurent coefficient, in the ordered GL_k^c coordinates; the extra GSpin central coordinate is zero for unitary θ. Every e∈e(s,c) has the form e=Re(s)(a₁,…,a_c)+(b₁,…,b_c), with a_i∈{−1,1} and Σ_(i≤j)b_i≤0 for every 1≤j≤c. For a supposed pole s₀ with 0<Re(s₀)<1/2, only the second constant-term contribution survives, so e=(−Re(s₀)−(c−1)/2,e′), e′∈e(s₀−1/2,c−1). Hence Σ_(i≤j)e_i≤−j Re(s₀)−(c−j)/2≤−j Re(s₀)<0 for every j, including j=c. The residue is square-integrable. Its hermitian cuspidal support forces |det|^(s₀−s̄₀)τ≅θτ∨, contradicting the nonessential-self-duality hypothesis. The conjugate-parabolic alternatives for even orthogonal/spin H with odd k obey the same bounds. Square-integrability alone does not supply the support conclusion; §8.0 proves that additional comparison.

Assume the two-term recursion; θ as in §8.1, trivial outside GSpin; no essential θ-self-duality; the precise ordered exponent convention of AutomorphicSpectralTheory §§2.1–2.6/AutomorphicSpectralTheory Layer 4. (CFK, Lemma 4.4 and proof of Theorem 4.1, (4.6)–(4.8), pp.36–38; CFK line 1592.)

A proof can proceed as follows: Induct using the two half-unit-shifted exponent sets in Lemma 4.4. At a pole retain only the negative first coordinate and bound each signed tail coordinate by 1/2−Re(s₀); include the last partial sum. Apply the Langlands square-integrability criterion to the proposed residue. Use the hermitian cuspidal-support theorem to force the forbidden duality.

*Needs:* §8.0 (Hermitian support); §8.2; AutomorphicSpectralTheory §§2.1–2.6 (meromorphic induction, intertwiners and ordered residues); AutomorphicSpectralTheory Layer 4 (residual spectrum and cuspidal support).

### 8.4 holomorphy without essential self-duality

If τ is unitary cuspidal and θ is the §8.1 datum, a unitary Hecke character when H=GSpin_(2kc) and θ=1 when H=Sp_(2kc) or SO_(2kc), with |det|^(it)τ≄θτ∨ for every t∈R, then E_(τ,θ,c)(s,h) is holomorphic on Re(s)≥0 for every holomorphic finite-K-type section family and every h. The boundary is included. Prove the c=1 case from the normalized rank-one series, then induct using the two-term constant term, the intertwiner half-planes, the boundary analysis and the residual-exponent obstruction in the remaining strip. The same assertion is stated with all necessary j_P alternatives for H=SO_(2kc) and GSpin_(2kc) when k is odd.

Assume the five split groups, with θ=1 unless H is a general spin group, and the precise unitary/nonessential-self-duality hypotheses above. (CFK, Theorem 4.1 and proof, pp.34–38; CFK lines 1516–1518.)

A proof can proceed as follows: Establish the c=1 base case with the normalizer and residual support criterion; outside GSpin this base series is induced from |det|^sτ alone and its hypothesis reads |det|^(it)τ≄τ∨. Induct on c using the two surviving constant-term contributions and their holomorphy. Exclude interior residual poles using §8.3 and take the Re(s)=0 boundary from AutomorphicSpectralTheory §2.4 (CFK line 1600). Regularity on Re(s)=0 is the unitary-axis assertion of AutomorphicSpectralTheory §2.4 for the discrete unitary datum E_τ⊗θ; detection of a pole by the constant term along the parabolic of the cuspidal support is the comparison of §8.0. Neither follows from formal meromorphic continuation.

*Needs:* §8.0 (pole detection); §8.2; §8.3; AutomorphicSpectralTheory §§2.1–2.6 (meromorphic induction, intertwiners and ordered residues); AutomorphicSpectralTheory Layer 4 (residual spectrum and cuspidal support).

### 8.5 right-half-plane holomorphy of the normalizer

For the partial unramified Euler product b^S(s,c,τ⊗χ_π) of §6.8, with τ unitary cuspidal and χ_π unitary, the continued normalizing product is holomorphic on Re(s)≥1/2 when τ is not essentially χ_π⁻¹-self-dual. The proof uses the comparison proved here for L^S(u,τ,Sym²⊗χ_π) and L^S(u,τ,∧²⊗χ_π): both are holomorphic on Re(u)≥0 if |det|^(it)(τ⊗(χ_π∘det))≇τ∨ for every real t, as well as the Sp-only standard factor. In §6.8 the smallest square-factor argument is 2s, with real part at least 1 on Re(s)≥1/2; every other argument is shifted further right. For Sp, s+c/2 has real part at least 3/2 because c≥2. This subsection proves the required square-factor holomorphy using the supplied Eisenstein normalizing-factor theory; Euler-polynomial definitions and right convergence alone do not establish the boundary statement.

Assume S contains ramification and infinity; unitary τ and χ_π; the no-essential-duality condition. (CFK, Proof of Theorem 4.8, p.40; formula (3.3), p.14; CFK line 1719.)

For a number field M, unitary cuspidal τ of GL_k(𝔸_M), unitary Hecke character χ and finite S containing infinity and all ramification, assume |det|^(it)(τ⊗(χ∘det))≇τ∨ for every real t; prove that both partial factors L^S(u,τ,Sym²⊗χ) and L^S(u,τ,∧²⊗χ) are holomorphic on Re(u)≥0, with ∧² of GL₁ interpreted as the zero representation and its L-factor as 1 (CFK proof of Theorem 4.8, p.40; CFK lines 1725–1729).

A proof can proceed as follows: Write the b product with every parity-dependent shift. Apply that precise twisted-square holomorphy statement at each parity-dependent shifted argument. Use the standard GL_k factor for Sp and remove the finitely many good local normalizers.

*Needs:* §6.8; AutomorphicSpectralTheory §§2.1–2.6 (meromorphic induction, intertwiners and ordered residues); AutomorphicLFunctionsAndLocalFactors Layer AL.4 (Satake Euler factors and convergence); AutomorphicLFunctionsAndLocalFactors Layer AL.3 (Rankin–Selberg factors).

### Examples

At c=2 and Re(s₀)=1/4, the first residual exponent is −3/4, and the largest possible tail exponent is 1/4. The partial sums are at most −3/4 and −1/2. At the forbidden endpoint Re(s₀)=0 the final bound is zero, so the strict square-integrability argument cannot replace unitary-axis regularity. For τ=1 on GL₁ and χ_π=1 the no-essential-duality hypothesis fails and L^S(u,τ,Sym²⊗χ_π)=ζ_M^S(u) has a pole at u=1; ∧² has factor 1. For a ramified nontrivial unitary χ_π, its nontrivial restriction to units excludes every norm twist of τ from χ_π⁻¹-self-duality, so the symmetric-square factor is L^S(u,χ_π), not the zeta pole. At c=2,s=1/2 the square arguments are 1 and 2 and the Sp standard argument is 3/2. At s_G=1/2 the inducing parameter of the global series is s_E=0.

### Dependencies

This layer follows Layer 5, Layer 6. The direct supplier inputs are AutomorphicSpectralTheory §4.14a (number-field residual Speh blocks); AutomorphicSpectralTheory §§2.1–2.6 (meromorphic induction, intertwiners and ordered residues); AutomorphicLFunctionsAndLocalFactors Layer AL.3 (Rankin–Selberg factors); AutomorphicSpectralTheory Layer 4 (residual spectrum and cuspidal support); AutomorphicLFunctionsAndLocalFactors Layer AL.4 (Satake Euler factors and convergence).

## Layer 9: completed generalized doubling L-functions

### 9.1 generalized global doubling period and unfolding

Let G=G_c be Sp_c (c≥2 even), SO_c (c≥3) or GSpin_c (c≥3); these are exactly the groups of Layer 0 that are not split tori modulo C_G^•, so C_G^•(A)G(F)⧸G(A) has finite volume. For unitary cuspidal π of G(A_F), unitary cuspidal τ of GL_k(A_F), cusp vectors φ₁∈π and φ₂∈π∨, and a section of E_(χ_πτ,χ_π,c)(s−1/2), form E^(U,ψ_U)(h;s_E)=∫_(U(F)⧸U(A))E(uh;s_E)ψ_U(u)du and integrate φ₁(g₁)φ₂(ι(g₂))E^(U,ψ_U)(e(g₁,g₂);s−1/2) over (C_G^•(A)G(F)⧸G(A))². Here ι is the Layer 5 involution of G, written as conjugation in CFK. Retain the inducing χ_π twists: together with the contragredient pair and ι they make the full integrand descend through each distinguished central quotient. Outside GSpin this distinguished central torus is trivial. In a right half-plane the global integral unfolds to the local matrix-coefficient doubling integral. For factorizable data with the global Petersson evaluation pairing and normalized good vectors, b^S(s)Z_global(s)=L^S(s,π×τ)∏_(v∈S)Z_v(s). The sum over rational orbits, Fourier expansion, cusp-form pairings and measure factorization are justified before meromorphic continuation. For the split-torus cases SO₂ and GSpin₂ the same integral need not converge absolutely even for Re(s) sufficiently large. For every k≥1, choose factorizable data with a nonzero inner local-integral product in that half-plane. If the double integral were absolutely convergent, Fubini and the inner unfolding would give that nonzero constant on the infinite-volume outer quotient, a contradiction. For k=1 the positive-kernel Check below exhibits divergence directly. Section 9.5 supplies their global theory.

Assume number field; G not SO₂ or GSpin₂, which is the standing assumption that G has a nontrivial unipotent subgroup (GK p.72; GK lines 4161–4163); cuspidal π,τ; fixed automorphic embeddings and nondegenerate Petersson pairing; S includes infinity and all ramification. (GK, §3.2, Corollary 3.7 and equation (3.8), pp.70–73; GK line 4043; CFK, §4.3, (4.10), pp.38–39; CFK line 1653.)

Prove the following basic properties of this construction.

- On the initial half-plane, the global period equals its open-orbit matrix-coefficient integral.

- For factorizable data its normalized Euler identity is exactly b^S Z=L^S∏_S Z_v.

- Changing one local quotient measure changes the global factorization by the corresponding explicitly tracked scalar.

- The continued global period is trilinear in the section and the two cusp vectors in their chosen automorphic realizations.

**Checks.**

- Adding a good v to S leaves the identity unchanged because b_vZ_v=L_v.

- A zero cusp vector yields a zero period, so nonzero data are required before division.

- For k=1 the Fourier coefficient has trivial U and the kernel is the classical doubling Eisenstein series.

- Replacing φ₂ by φ₂∘ι twice recovers φ₂; unfolding uses φ₂∘ι and the local point e₂(ι(g)). Omitting only one of these involutions changes the pairing.

Additional normalization checks:

- At a good place b_vZ_v=L_v, so removing v from the Euler product and inserting Z_v/b_v⁻¹ restores the same factor.
- A zero cusp vector makes every summand of the period 0.
- At k=1, U={1}; pulling back φ₂ by ι twice gives φ₂, and the matched local involution also squares to 1.
- Divergence control for the excluded split torus: take F=ℚ, G=SO₂, k=1 and π=τ=1, so U=1 and the kernel is the spherical Siegel Eisenstein series of SO₄ induced from |det|^(s−1/2) on GL₂. Use the algebraic isogeny SL₂×SL₂→SO₄ acting on 2×2 matrices by X↦AXB⁻¹, with the determinant as quadratic form. The Siegel parabolic contains one of the two SL₂ factors, so the kernel does not depend on that factor. The doubled SO₂×SO₂ is the image of the diagonal tori A=diag(a,a⁻¹), B=diag(b,b⁻¹), acting on the two hyperbolic planes spanned by the diagonal and by the antidiagonal matrices with coordinates t₁=a/b and t₂=ab. For real s large the kernel is positive and constant along the archimedean one-parameter subgroup b∈ℝ_(>0) of this doubled torus with a fixed; this subgroup lies in the image of SL₂(ℝ)×SL₂(ℝ). That subgroup injects into the quotient, so the integral truncated to 1≤r≤R along it is at least C·log R with C>0, and the period diverges for every such s.

A proof can proceed as follows: Construct the Fourier coefficient with the displayed character, pull the second cusp vector back by ι, and verify each distinguished-central invariance before integrating. Classify the relevant P(F)⧸H(F) orbits after Fourier expansion; show the nonopen terms vanish using the vanishing of generalized Whittaker models along orbits above (k^c) and cuspidality. Identify the open-orbit stabilizer and matrix coefficient, then factor the absolutely convergent integral using restricted-product measures.

*Needs:* §5.3; §5.2; §6.1; §6.8; §8.1; AdelicAlgebraicGroups §§0.1–0.4 and 2.2–2.3 (restricted products and quotient measures); AutomorphicFormsOnReductiveGroups §§4.1–4.3 (globalization, cuspidality and pairings).

### 9.2 completed doubling L-function

For cuspidal π of G_c(A_F) and cuspidal τ of GL_k(A_F), define L(s,π×τ)=L^S(s,π×τ)∏_(v∈S)L(s,π_v×τ_v) on a common right half-plane, using the local factors of Layer 6 including the archimedean ones. Define ε(s,π×τ)=∏_v ε(s,π_v×τ_v,ψ_v); almost all factors are 1. The product formula and central-character identities make this independent of the chosen nontrivial character of A_F/F. This definition applies to every G_c of Layer 0. When G is not SO₂ or GSpin₂, the analytic continuation is obtained from the Euler identity of §9.1 and local nonzero data; the split-torus cases are continued in §9.5. Changing S gives the same meromorphic function.

Assume Factorizable cuspidal representations; standard dual degree N; unitary representations after extracting norm twists; global additive character; G not SO₂ or GSpin₂ for the continuation through §9.1. (CFK, §4.3, pp.38–39; CFK line 1710.)

Prove the following basic properties of this construction.

- The complete product is the partial product times the local factors in S.

- Enlarging S does not change L or its continued function.

- The global epsilon product is invariant under ψ↦ψ_b for b∈F× by the product formula and global central characters.

- Two meromorphic continuations agreeing with the same convergent Euler product on a right half-plane coincide on C.

**Checks.**

- For F=Q, the real gamma-factor is included and cannot be dropped from the functional equation.

- Moving one good prime into S multiplies the partial product by L_v⁻¹ and the finite correction by L_v.

- For b∈F× the product of the local character-change scalars is 1; an arbitrary idele need not have that property.

Additional normalization checks:

- For a good local factor L_v=2, enlarging S scales L^S by 1/2 and its correction by 2, giving total multiplier 1.
- For F=ℚ,b=2, |2|∞|2|₂=2·1/2=1; the other finite norm factors are 1.
- An idele with real component 2 and every finite component 1 has norm 2, so rational rescaling cannot be replaced by arbitrary idele rescaling.

A proof can proceed as follows: Use imported partial-product right convergence and good Satake comparison. Attach the finite set of bad and infinite local factors. Continue through the period identity with pointwise nonzero local data and use overlaps to prove independence of all auxiliary choices.

*Needs:* §6.7; §6.2; §9.1; AutomorphicLFunctionsAndLocalFactors Layer AL.4 (Satake Euler factors and convergence); AdelicAlgebraicGroups §§0.1–0.4 and 2.2–2.3 (restricted products and quotient measures).

### 9.3 global functional equation and strip bounds

For G=G_c not SO₂ or GSpin₂ and the completed doubling function, L(s,π×τ)=ε(s,π×τ)L(1−s,π∨×τ∨). The corresponding crude partial equation is L^S(s)=∏_(v∈S)γ(s,π_v×τ_v,ψ_v)L^S(1−s,π∨×τ∨). If both completed L-functions are entire, they are bounded on each vertical strip of finite width. The strip-boundedness assertion uses uniform Eisenstein/intertwiner and local archimedean estimates and is an additional theorem; it does not follow from the functional equation alone.

Assume G not SO₂ or GSpin₂, whose functional equation is that of §9.5; cuspidal unitary π and τ, with extracted norm twists permitted; fixed normalizations of Layers 6 and 9. (CFK, Theorems 4.6–4.7, p.39; Theorem 3.5, (3.14), p.16; CFK line 1713.)

A proof can proceed as follows: Apply the global Eisenstein functional equation to the doubled period and factor its local intertwiners. Use the complete local functional equations to obtain the completed and partial identities. Under entireness use the growth estimates and strip argument of the local/global theory. Prove these strip estimates for the continued doubling family with its specified local normalization.

More precisely, if both completions are entire, for every real a≤b there is C≥0 such that both absolute values are at most C whenever a≤Re(s)≤b. The bound is uniform in Im(s) for the fixed representations. Establish the smooth Eisenstein and archimedean seminorm estimates required by the strip argument; no claim of uniformity over all cuspidal representations is made.

*Needs:* §9.2; §6.6; §6.4; AutomorphicSpectralTheory §§2.1–2.6 (meromorphic induction, intertwiners and ordered residues).

### 9.4 entireness for highly ramified twists

Let G=G_c be Sp_c (c≥2 even), SO_c (c≥3) or GSpin_c (c≥3), and let π and τ be unitary cuspidal of G(A_F) and GL_k(A_F). Suppose |det|^(it)τ≄χ_π⁻¹τ∨ for every real t, and at every finite place where π_v is ramified both L(s,π_v×τ_v) and L(s,π_v∨×τ_v∨) are 1. Then both completed global L-functions are entire and bounded on finite vertical strips. For Re(s₀)≥1/2 write b^S Z_global=L(s,π×τ)Q(s), Q=∏_(v∈S)Z_v/L_v. At unramified finite and infinite places choose pole-attaining data with ord_(s₀)Q_v≤0; at ramified π places use L_v=1 and nonzero finite data. Holomorphy of the left side implies ord L≥−ord Q≥0. This order argument permits Q to have poles. Apply the dual argument and functional equation to obtain the other half-plane and then the strip bounds. These hypotheses do not suffice for SO₂ or GSpin₂: §9.5 gives a cuspidal pair satisfying both of them whose completed function has a pole at s=1, and states the correct entireness criterion for those groups.

Assume G not SO₂ or GSpin₂; all unitary, no-essential-duality and trivial bad-local-factor hypotheses above; K_H-finite sections. (CFK, Theorem 4.8 and (4.11), pp.39–40; CFK line 1719.)

A proof can proceed as follows: Use Layer 8 holomorphy at the shifted parameter and the holomorphic b normalizer. Choose local data at each s₀ using §7.6 or §6.2. Apply the order inequality, then duality and the completed functional equation, and finally the strip theorem.

*Needs:* §8.4; §8.5; §9.1; §9.3; §7.6.

### 9.5 the split-torus branch: SO₂ and GSpin₂

Let F be a number field, G=SO₂ or GSpin₂ split over F, π a cuspidal representation of G(A_F), that is an automorphic character, and τ a unitary cuspidal representation of GL_k(A_F) with k≥1. Through the identifications of §6.11, π gives Hecke characters α,β of A_F×/F× with αβ=χ_π: (μ,μ⁻¹) for SO₂ and (σ,σ⁻¹χ_π) for GSpin₂; the contragredient π∨ gives (α⁻¹,β⁻¹). Prove that the completed function of §9.2 is L(s,π×τ)=Λ(s,α×τ)Λ(s,β×τ) and that ε(s,π×τ)=ε(s,α×τ)ε(s,β×τ), where Λ(s,α×τ) is the completed GL₁×GL_k Rankin–Selberg function of AutomorphicLFunctionsAndLocalFactors AL.3, the standard function of τ twisted by α. Consequently L(s,π×τ) continues meromorphically to ℂ and satisfies L(s,π×τ)=ε(s,π×τ)L(1−s,π∨×τ∨). If π is unitary, L(s,π×τ) is entire exactly when k≥2, or k=1 and neither ατ nor βτ equals |·|^(it) for a real t; when it is entire, both L(s,π×τ) and L(s,π∨×τ∨) are bounded on every vertical strip of finite width. For k=1 it suffices that ατ and βτ are each ramified at some finite place, since norm characters are unramified everywhere. No global period enters: the period of §9.1 diverges for these groups.

Assume number field; G=SO₂ or GSpin₂, split; π cuspidal, and unitary for the entireness criterion; τ unitary cuspidal; the identifications and normalizations of §6.11. (CFK, §1, p.7, CFK lines 264–267; CFK Theorems 4.6–4.8, pp.39–40, CFK lines 1713–1723, whose global-integral proof needs the period excluded in §9.1; GK p.72, GK lines 4161–4163.)

**Checks.**

- Over F=ℚ with G=SO₂ and π=τ=1: L(s,π×τ)=Λ_ℚ(s)², with double poles at s=0 and s=1, ε=1 and Λ_ℚ(s)²=Λ_ℚ(1−s)². The local factor at q=2 and s=1 is 4. For the same data the period of §9.1 diverges logarithmically and is given no finite value.

- §9.4's hypotheses fail to give entireness for SO₂. Over F=ℚ(√−23), whose class number is 3, let π=μ be a class-group character of order 3, unramified at every finite place and trivial at the complex place, and τ=μ⁻¹ on GL₁. Here χ_π=1, and |det|^(it)τ≅χ_π⁻¹τ∨ would mean μ²=|·|^(it), impossible because μ² has order 3 and is nontrivial on norm-one ideles; there is no ramified place to test. Yet L(s,π×τ)=Λ_F(s)Λ(s,μ⁻²) has a pole at s=1, since Λ(1,μ⁻²)≠0. The criterion here excludes this pair because μτ=1.

- The same failure for GSpin₂: over ℚ(√−23) take (α,β)=(μ,1), so χ_π=μ, and τ=μ⁻¹. The §9.4 exclusion reads μ⁻¹≠|·|^(−it), which holds, but L(s,π×τ)=Λ_F(s)Λ(s,μ⁻¹) has a pole at s=1. Replacing τ by μ⁻¹ν, with ν ramified at one prime beyond the conductors of α and β there, makes both ατ and βτ ramified, and the function is entire.

A proof can proceed as follows: Apply §6.11 at every place, so the completed product of §9.2 and the global ε-product split into the two GL₁×GL_k products. Import their continuation, functional equations, pole criterion, nonvanishing on Re(s)=1 and vertical-strip bounds from AutomorphicLFunctionsAndLocalFactors AL.3: the Hecke datum when k=1 and the Rankin–Selberg datum of unequal ranks when k≥2. The product of the two functional equations is the stated one, because (α⁻¹τ∨,β⁻¹τ∨) are the reflected data. For the converse half of the entireness criterion, a pole of Λ(s,ατ) at s=1−it is not cancelled: Λ(s,βτ) at that point either has a pole or is finite and nonzero, by nonvanishing on Re(s)=1 together with the nonzero archimedean and bad finite factors; the point s=−it follows by the functional equation.

*Needs:* §6.11; §9.2; AutomorphicLFunctionsAndLocalFactors Layer AL.1 (Tate factors and canonical archimedean factors); AutomorphicLFunctionsAndLocalFactors Layer AL.3 (Rankin–Selberg factors, pole criterion, boundary nonvanishing and vertical-strip bounds).

### Examples

Moving a good place v into S replaces L^S by L^S/L_v and restores L_v in the finite correction; both products agree. For F=ℚ and b=2, |2|∞=2 and |2|₂=1/2, so their product is 1; for a=χ_τ a global idele-class character, a(2)=1. The local additive-character changes therefore cancel globally. At t=s−s₀, ord Q=−1 and ord(b^S Z)=0 force ord L=1; assuming Q holomorphic would lose this valid case. The paired global pullback φ₂∘ι and local e₂(ιg) both square to the original datum. For SO₂ over ℚ with π=τ=1 the period of §9.1 diverges like log R, while §9.5 gives the completed function Λ_ℚ(s)², with double poles at 0 and 1 and a factor 4 at q=2, s=1.

### Dependencies

This layer follows Layer 5, Layer 6, Layer 7, Layer 8. The direct supplier inputs are AdelicAlgebraicGroups §§0.1–0.4 and 2.2–2.3 (restricted products and quotient measures); AutomorphicFormsOnReductiveGroups §§4.1–4.3 (globalization, cuspidality and pairings); AutomorphicLFunctionsAndLocalFactors Layer AL.4 (Satake Euler factors and convergence); AutomorphicSpectralTheory §§2.1–2.6 (meromorphic induction, intertwiners and ordered residues); AutomorphicLFunctionsAndLocalFactors Layer AL.1 (Tate factors and canonical archimedean factors); AutomorphicLFunctionsAndLocalFactors Layer AL.3 (Rankin–Selberg factors, pole criterion, boundary nonvanishing and vertical-strip bounds).

## Layer 10: weak and coarse standard transfer

### 10.0 globalization and support comparisons

From the AutomorphicSpectralTheory §5.12 cuspidal-support decomposition, prove that every irreducible automorphic representation of a split connected reductive group over a number field is an irreducible subquotient of a normalized induction I_P(σ,λ) from a cuspidal representation σ of a standard Levi, with Re λ in the closed positive chamber (CFK Introduction, p.2; CFK lines 63–66).

For a nonarchimedean characteristic-zero local field f and an irreducible supercuspidal σ of a split classical group G in §10.6, fix a positive norm character ζ making σᵘ=σ⊗ζ unitary, choose a number field M and finite v₀ with M_v₀≃f and a unitary automorphic character Ω of Z_G(M)\Z_G(𝔸_M) restricting to ω_(σᵘ) at v₀, and construct a unitary cuspidal πᵘ of G(𝔸_M) with πᵘ_v₀≃σᵘ and ω_(πᵘ)=Ω, together with the global norm character extending ζ so that twisting back globalizes σ (CFK Corollary 4.11 and proof, p.42; CFK lines 1818–1823).

For a number field M, a finite place v₀, a finite set T of other finite places, l≥1 and a unitary supercuspidal σ of GL_l(M_v₀), choose a unitary Hecke character Ω with Ω_v₀=ω_σ and Ω_v unramified for v∈T, and construct a unitary cuspidal Σ of GL_l(𝔸_M) with Σ_v₀≃σ, ω_Σ=Ω and Σ_v unramified for every v∈T; additional finite ramification is permitted only outside T∪{v₀}, where both fixed comparison representations π and Π of §10.5 are required to be unramified, with T containing all their other bad places (CFK proof of Theorem 4.10, p.41; CFK lines 1804–1814).

**Checks.**

- For a unitary supercuspidal input the unitarizing exponent is zero; twisting back multiplies each central character by 1 and returns the same local representation.
- For T={v₁} and auxiliary test ramification w outside T∪{v₀}, stability cancels the v₁ ratio to 1 and spherical comparison cancels the w ratio to 1; zero factors away from v₀ remain. Test ramification at v₁ would leave one uncontrolled ratio.
- For induction from one GL₁ block and a classical tail of standard degree N₀, the standard degree is N₀+2; a missing dual block gives N₀+1. With no GL blocks the degree is N₀ and the inducing cuspidal representation itself supplies the support.

*Needs:* §0.3; AutomorphicFormsOnReductiveGroups §§4.1–4.3; AutomorphicSpectralTheory §5.12; GL2AutomorphicRepresentationsAndTransfer R16.1.8.

### 10.1 weak functorial transfer

For automorphic π of G_c(A_F), a weak transfer is an irreducible automorphic Π of GL_N(A_F) whose Satake conjugacy class equals r_G(t_(π_v)) at almost all unramified finite places and whose infinitesimal character at every archimedean place is the one induced by r_G. This definition does not require equality of the entire archimedean local representations. The constructed transfer in §10.4 will satisfy that stronger archimedean comparison. The global GL isobaric-sum constructor is imported from AutomorphicLFunctionsAndLocalFactors, Representation prerequisites, GLₙ isobaric sums, and nongeneric almost-everywhere support uniqueness from AutomorphicLFunctionsAndLocalFactors AL.3.

Assume number field; the standard degree and central data of Layer 0; automorphic representations with fixed central characters. (CFK, Definition 2.2, p.9; Remark 4.9, p.41; CFK line 356.)

Prove the following basic properties of this construction.

- At every place outside some finite set, the Satake classes match through r_G.

- At infinity the induced infinitesimal characters match.

- The predicate is invariant under isomorphism of both automorphic representations.

- A finite exceptional set, compatible unramified Satake classes outside it and the required archimedean infinitesimal characters give a weak-transfer witness.

**Checks.**

- For G=Sp₂ the receiving group is GL₃.

- Adding a finite set of good places to the excluded set preserves the predicate.

- The definition allows an automorphic GL_N representation that is not cuspidal; replacing automorphic by cuspidal changes the target.

Additional normalization checks:

- For Sp₂, N=3, so the weak-transfer target is GL₃, not GL₂.
- If equality holds outside S, it holds outside S∪{v}, since the latter indexing set is smaller.
- Two GL₁ isobaric summands on GL₂ produce polynomial 1−(a+b)T+abT² and an automorphic noncuspidal possibility; cuspidality is not in the predicate.

A proof can proceed as follows: Use the imported Satake and infinitesimal-character carriers to state the comparison predicates. Prove invariance under isomorphism and change of good finite set. Keep the definition separate from the stronger construction theorem and coarse gamma comparison.

*Needs:* §0.3; SmoothRepresentationsOfLocalGroups Layer SR.4 (Satake theory); AutomorphicFormsOnReductiveGroups §§2.1–2.7 (real representations and globalizations); AutomorphicSpectralTheory §§2.1–2.6 (meromorphic induction, intertwiners and ordered residues); AutomorphicLFunctionsAndLocalFactors Layer AL.3 (Rankin–Selberg factors).

### 10.2 coarse local transfer

For π∈Irr(G_c(F)), a coarse transfer is Π∈Irr(GL_N(F)) such that γ(s,π×τ,ψ)=γ_RS(s,Π×τ,ψ) for every k≥1 and every irreducible generic τ of GL_k(F). It suffices to test supercuspidal τ, by multiplicativity; the phrase all irreducible τ in CFK (3.18) is restricted to the generic domain actually defined on the classical side. At a finite place the gamma comparisons determine the supercuspidal support of Π, and any irreducible representation with that support is again a coarse transfer. They do not determine an arbitrary nongeneric irreducible Π up to isomorphism.

Assume local char zero; fixed ψ and standard degree N; nongeneric GL pair factors imported from EndoscopicTransferAndUnitaryTraceComparison §10.29. (CFK, §3.5, (3.18), pp.18–19; CFK line 738; support statements CFK lines 746–748 and HEN02, Proposition 1.9, p.592, HEN02 line 216.)

Prove the following basic properties of this construction.

- It is equality of gamma-factors against all generic GL tests.

- Testing only supercuspidal twists is equivalent.

- At finite places it is invariant within a GL supercuspidal-support class, and two coarse transfers have the same support.

- Isomorphisms of π and Π preserve every gamma test and hence the coarse-transfer predicate.

**Checks.**

- An unramified π has T(π) as a coarse transfer.

- For GL₂, the trivial representation and the normalized Steinberg representation have the same supercuspidal support { |·|^(1/2), |·|^(−1/2) } and the same full family of GL gamma-factors, although they are not isomorphic.

- A nongeneric τ cannot be inserted into the classical-side integral before a further extension is defined; the definition explicitly quantifies over generic τ.

Additional normalization checks:

- For the GL₂ trivial and Steinberg representations, both supports are {ν^(1/2),ν^(−1/2)} but their standard L-functions differ by L(s−1/2).
- Their GL₁ gamma tests agree because (1−q^(1/2−s))/(1−q^(s−1/2))=−q^(1/2−s) meromorphically.
- For a nongeneric GL₂ test the ordinary Whittaker dimension is 0, so the classical integral supplies no generic test vector.

For irreducible Π,Π′ of GL_N(F), F nonarchimedean of characteristic zero and N≥2, with the canonical pair factors of EndoscopicTransferAndUnitaryTraceComparison §10.29, prove that γ(s,Π×ρ,ψ)=γ(s,Π′×ρ,ψ) for every supercuspidal ρ of GL_r(F), 1≤r≤N−1, implies that Π and Π′ have the same supercuspidal support (HEN02 Proposition 1.9, p.592, and its proof in §§5.2–5.3; HEN02 line 216).

A proof can proceed as follows: Define the gamma comparison on the actual generic testing domain. Reduce general generic tests to supercuspidal data by local multiplicativity. Obtain support invariance from the segment formula of EndoscopicTransferAndUnitaryTraceComparison §10.29, which writes γ(s,Π×τ,ψ) for supercuspidal τ as the product of γ(s,ρ×τ,ψ) over the supercuspidal support of Π (HEN02 §5.1(b), p.601), and the converse from the support theorem proved here, rather than a false nongeneric local converse theorem.

*Needs:* §6.6; EndoscopicTransferAndUnitaryTraceComparison §10.29 (canonical nongeneric GL factors); §5.2 (local generalized Speh comparison); AutomorphicLFunctionsAndLocalFactors Layer AL.3 (Rankin–Selberg factors); SmoothRepresentationsOfLocalGroups §SR.3.3 (tempered support and Langlands quotients).

### 10.3 twisted converse theorem for GL_N

Let N≥2, let S be a nonempty finite set of finite places, η a unitary Hecke character, and Π=⊗′Π_v an irreducible admissible representation of GL_N(A_F) whose central character is trivial on F× and whose standard Euler product converges absolutely sufficiently far right. Suppose for every τ=ητ′, where τ′ is unitary cuspidal on GL_k for 1≤k≤N−1 and unramified at S, both completed L(s,Π×τ) and L(s,Π∨×τ∨) are entire, bounded on finite vertical strips and satisfy the standard completed functional equation. Then an irreducible automorphic Π′ exists with Π′_v≅Π_v at every v∉S, including infinity. At a place where Π_v is not generic its local factors are the canonical factors of EndoscopicTransferAndUnitaryTraceComparison §10.29, which are those of the standard module whose Langlands quotient is Π_v (CKPSS01 §2, p.9; CKPSS01 line 174). Part of this target are the two facts that make the hypotheses meaningful (CPS94 Lemmas 2.1–2.3, pp.161–165; CPS94 lines 186, 272–283 and 298–311). First, if ∏_vL(s,Π_v) converges absolutely for Re(s)>σ₀, every Satake parameter α of an unramified Π_v satisfies |α|≤q_v^σ₀, so for τ as above the product ∏_vL(s,Π_v×τ_v) converges absolutely for Re(s)>σ₀+3/2 by the Jacquet–Shalika bound |β|<q_v^(1/2) for the Satake parameters of τ_v; after a norm twist making ω_Π unitary, |α⁻¹|≤q_v^((N−1)σ₀), so ∏_vL(s,Π_v∨×τ_v∨) also converges absolutely in a right half-plane. Second, ε(s,Π×τ)=∏_vε(s,Π_v×τ_v,ψ_v) is unchanged when ψ is replaced by ψ_b with b∈F×: the local factors change by ω_(Π_v)(b)^k ω_(τ_v)(b)^N |b|_v^(Nk(s−1/2)) (the character-change theorem below at finite places, the explicit canonical archimedean factors of AutomorphicLFunctionsAndLocalFactors AL.1 at infinity), and these scalars multiply to 1 by the product formula and the triviality of ω_Π and ω_τ on F×. This specialized converse theorem is a new proof input here; neither AutomorphicLFunctionsAndLocalFactors AL.4 right convergence nor strong multiplicity one supplies automorphy.


Assume all displayed hypotheses; complete archimedean factors; irreducible admissible restricted tensor product and central-character descent. (CFK, §2, Theorem 2.1, pp.8–9; CFK line 320; CKPSS01, §2, Converse Theorem and proof, pp.8–10; CKPSS01 line 141.)

For irreducible Π of GL_N(F), F nonarchimedean of characteristic zero, generic τ of GL_k(F), b∈F× and ψ_b(x)=ψ(bx), prove that the canonical pair ε-factors of EndoscopicTransferAndUnitaryTraceComparison §10.29 satisfy ε(s,Π×τ,ψ_b)=ω_Π(b)^k ω_τ(b)^N |b|^(Nk(s−1/2)) ε(s,Π×τ,ψ), where ω denotes central characters (CPS94 Lemma 2.1 and proof, pp.161–163, for induced representations of Whittaker type; CPS94 line 249).

A proof can proceed as follows, after CKPSS01 §2: replace each nongeneric Π_v by its standard module Ξ_v, which has the same local factors, and form Ξ=⊗′Ξ_v with Whittaker functions W_ξ. Compare the two mirabolic sums U_ξ and V_ξ of W_ξ over the mirabolic subgroup and its transpose: the niceness of the twisted family gives U_ξ=V_ξ on the open subgroup K_(0,S)(𝔫)G^S for vectors fixed at S by deep congruence subgroups, the two rational mirabolic subgroups meeting that subgroup generate the congruence subgroup Γ₀(𝔫), and strong approximation embeds Ξ^S into automorphic forms on GL_N(𝔸). An irreducible constituent with the components of Π outside S is Π′. The fixed twist η is absorbed by applying this argument to Π⊗(η∘det), since L(s,Π×ητ′)=L(s,(Π⊗(η∘det))×τ′) and Π⊗(η∘det) again has central character trivial on F× and an absolutely convergent standard product (CKPSS01 line 228). The analytic inputs are the Rankin–Selberg integral representations and their unfolding (AutomorphicLFunctionsAndLocalFactors AL.3).

The conclusion permits an automorphic, noncuspidal output and prescribes no equality at a place of S. The proof must treat every rank 1,…,N−1 in the fixed family and all archimedean factors; the generic and reduced-rank converse theorems supplied by AL.3 do not imply this statement by a change of labels.

*Needs:* AutomorphicLFunctionsAndLocalFactors Layer AL.1 (Tate factors and canonical archimedean factors); AutomorphicLFunctionsAndLocalFactors Layer AL.2 (the Jacquet–Shalika Satake bound); AutomorphicLFunctionsAndLocalFactors Layer AL.3 (Rankin–Selberg factors); AutomorphicLFunctionsAndLocalFactors Layer AL.4 (Satake Euler factors and convergence); AutomorphicFormsOnReductiveGroups §§3.4–3.5 (restricted tensor realizations); AdelicAlgebraicGroups §§0.1–0.4 and 2.2–2.3 (restricted products and quotient measures); EndoscopicTransferAndUnitaryTraceComparison §10.29 (canonical nongeneric GL factors, with the character-change theorem proved here).

### 10.4 weak transfer of nongeneric cusp forms

Every irreducible cuspidal automorphic representation π of a split Sp_(2n), SO_(2n), SO_(2n+1), GSpin_(2n) or GSpin_(2n+1) over a number field, in the stated nontrivial ranks c>1, has a weak transfer to GL_N. It can be chosen with Π_v=T(π_v) at every archimedean place. No global genericity hypothesis is imposed on π. For the split-torus cases SO₂ and GSpin₂, with the Hecke characters α,β of §9.5, the transfer is the isobaric sum α⊞β of AutomorphicLFunctionsAndLocalFactors, Representation prerequisites, GLₙ isobaric sums: its unramified Satake polynomial (1−α_v(ϖ_v)T)(1−β_v(ϖ_v)T) is det(1−r_G(t_(π_v))T), its archimedean components are the representations T(π_v) with parameter α_v⊕β_v, and no converse theorem is used. For the other groups the construction chooses good Satake transfers, archimedean standard transfers, and arbitrary bad local GL_N data with the required central character. A highly ramified unitary Hecke character η at a nonempty bad set can be chosen so that η_v₀²χ_(π_v₀) is nontrivial on O_v₀× at one place, excluding every essential self-duality for ητ′ with τ′ unramified there: choose finite-order local components of large conductor at the bad places, with that unit condition at v₀, and extend them by GL2AutomorphicRepresentationsAndTransfer R16.1.8. Stability supplies trivial bad local L-factors and equality with the candidate; entireness and the twisted converse theorem then give automorphy.

Assume split characteristic-zero number-field groups; cuspidal π, unitary after a norm twist; all analytic and central-character inputs above. (CFK, Theorem 0.1, pp.1–3; §4.4, proof, pp.40–41; CFK line 1749.)

A proof can proceed as follows: Construct the restricted-tensor candidate and verify its central character on F× and right Euler convergence. Choose the local components of η (finite order, conductor beyond the stability thresholds of §6.10 at every bad place, and η_v₀²χ_(π_v₀) ramified, which holds once the conductor m of η_v₀ is large because η_v₀² then has conductor m for odd residue characteristic and at least m−v(2)−1 in general), then extend them to a finite-image idele-class character by GL2AutomorphicRepresentationsAndTransfer R16.1.8. Identify completed candidate factors with doubling factors, prove all converse hypotheses uniformly in the prescribed τ′ family, and apply §10.3.

*Needs:* §0.4 (archimedean transfer); §10.1; §10.3; §9.4; §9.5; §6.10; §6.8; AutomorphicLFunctionsAndLocalFactors Representation prerequisites (GLₙ isobaric sums); AdelicAlgebraicGroups §§0.1–0.4 and 2.2–2.3 (restricted products and quotient measures); GL2AutomorphicRepresentationsAndTransfer R16.1.8 (finite Hecke characters with prescribed local components); AutomorphicFormsOnReductiveGroups §§2.1–2.7 (real representations and globalizations); AutomorphicLFunctionsAndLocalFactors Layer AL.4 (Satake Euler factors and convergence).

### 10.5 every weak transfer is coarse at every place

For cuspidal π and any automorphic weak transfer Π, every Π_v is a coarse transfer of π_v. First compare the isobaric cuspidal support of Π with the constructed transfer through AutomorphicLFunctionsAndLocalFactors, Representation prerequisites, GLₙ isobaric sums and AutomorphicLFunctionsAndLocalFactors AL.3, Strong multiplicity one for isobaric sums; this permits replacement by the transfer with full archimedean matching, without claiming arbitrary automorphic GL_N representations are globally generic. Match the global central character of Π with det r_G(π) from agreement at almost all places before using stability. To isolate a bad place v₀, unitarize an arbitrary local supercuspidal GL_l test by a norm twist and use the controlled globalization of §10.0 with T containing every other finite place where π or Π is ramified; choose its compatible Hecke central character as in §10.0. The test is unramified on T, and any extra ramification lies where π and Π are both unramified. Choose η_v₀=1 and sufficiently ramified η on T, then cancel the local factors away from v₀ in the two global functional equations. Multiplicativity extends the equality to all generic tests. For SO₂ and GSpin₂ the doubling-side global functional equation is that of §9.5.

Assume π cuspidal; Π weak automorphic transfer; fixed global ψ; the comparison of §10.0 and GL2AutomorphicRepresentationsAndTransfer R16.1.8 for the twisting character, trivial on all of F_v₀×. (CFK, Theorem 4.10 and (4.12)–(4.14), p.41; CFK line 1792.)

A proof can proceed as follows: Use global isobaric support uniqueness and GL support-invariance of gamma-factors to reduce to the constructed infinity components. Prove equality of the Hecke central characters from almost-everywhere local equality. Globalize each unitary supercuspidal test with the stated unramified components on T and allow extra ramification only at common good places. Apply stability at T only after ω_(Π_v)=det r_G(π_v) has been proved, and use §6.8 for arbitrary generic tests at all common good places, including the auxiliary ramification places; use full archimedean matching at infinity. Thus no factor away from v₀ remains uncontrolled. Apply the completed/partial functional equations, then undo the local test norm twist and extend by multiplicativity.

*Needs:* §10.0 (controlled test globalization); §10.4; §10.2; §9.3; §9.5; §6.10; GL2AutomorphicRepresentationsAndTransfer R16.1.8 (finite Hecke characters with prescribed local components); AutomorphicSpectralTheory §§2.1–2.6 (meromorphic induction, intertwiners and ordered residues); AutomorphicLFunctionsAndLocalFactors Layer AL.3 (Rankin–Selberg factors); AutomorphicFormsOnReductiveGroups §§4.1–4.3 (globalization, cuspidality and pairings); AdelicAlgebraicGroups §§0.1–0.4 and 2.2–2.3 (restricted products and quotient measures).

### 10.6 existence of coarse local transfers

For every irreducible admissible π of one of the five split groups over a characteristic-zero local field, a coarse GL_N transfer exists. At infinity and at unramified finite places use T(π). For SO₂ and GSpin₂, whose irreducible representations are characters, §6.11 gives the transfer directly at every place: at a finite place every irreducible constituent of α×β has pair γ-factors γ(s,α×τ,ψ)γ(s,β×τ,ψ) by the segment formula of EndoscopicTransferAndUnitaryTraceComparison §10.29. For finite-place supercuspidal π of the other groups use the supercuspidal globalization of §10.0 to a cuspidal number-field representation with the specified compatible central character, the global weak-transfer theorem and all-place coarse compatibility. For general π use supercuspidal support (×σ_i)⋊π₀ and a coarse transfer Π₀ of π₀; any irreducible GL_N constituent of (×σ_i)×Π₀×(×χ_πσ_i∨) has the required gamma comparisons. To apply quotient multiplicativity to a constituent π, first use Jacquet exactness and the geometric lemma to realize it as a quotient for Weyl-conjugate supercuspidal data; the product is invariant under these permutations and dual twists.

Assume Characteristic-zero local field; admissible irreducible π; distinguished-central-torus convention; fixed ψ. (CFK, Corollary 4.11 and proof, p.42; CFK line 1817.)

A proof can proceed as follows: Use the comparison of §10.0 with a compatible automorphic character of the full center, after a unitarizing norm twist, and undo that twist in the resulting transfer. Apply the global existence and coarse-compatibility theorems. Reduce general π through a quotient with Weyl-conjugate supercuspidal data and apply both multiplicativity formulas.

*Needs:* §5.0 (quotients with Weyl-conjugate support); §10.0 (supercuspidal globalization); §10.5; §10.2; §6.6; §6.11; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 (induction, Jacquet functors, geometric lemma and pairings) and §SR.0.4 (admissible duals and matrix coefficients); SmoothRepresentationsOfLocalGroups §SR.3.3 (tempered support and Langlands quotients); AutomorphicFormsOnReductiveGroups §§4.1–4.3 (globalization, cuspidality and pairings); EndoscopicTransferAndUnitaryTraceComparison §10.29 (canonical nongeneric GL factors); §5.2 (local generalized Speh comparison).

### 10.7 weak transfer for general automorphic representations

Every irreducible automorphic representation π of the split groups in §10.4 has a weak GL_N transfer, without a cuspidality hypothesis. Using AutomorphicSpectralTheory §5.12 and the comparison of §10.0, prove that π occurs as a constituent of normalized induction from cuspidal automorphic data on a Levi GL_(β₁)×…×GL_(β_d)×G_(c−2l). Transfer its classical cuspidal factor by §10.4, through the split-torus case when that factor lives on SO₂ or GSpin₂, and form the GL isobaric sum of the GL blocks, that transfer and their χ_π-twisted dual blocks. At good places the Satake classes and at infinity the infinitesimal characters are those of r_G applied to π. Low-rank tails use the explicit conventions of Layer 6.

Assume Irreducible automorphic π; the exact global cuspidal-support theorem and isobaric-sum existence; extracted norm twists and spin central character. (CFK, Introduction, p.2, consequence of Theorem 0.1; CFK lines 61–66.)

A proof can proceed as follows: Apply the comparison of §10.0, retaining the inducing exponents. Apply §10.4 to the classical cusp factor and use the GL isobaric constructor. Compare Satake and infinitesimal characters through parabolic induction and the standard dual representation.

*Needs:* §10.0 (automorphic constituent support); §10.4; §10.1; AutomorphicSpectralTheory §§2.1–2.6 (meromorphic induction, intertwiners and ordered residues); AutomorphicSpectralTheory Layer 4 (residual spectrum and cuspidal support); AutomorphicSpectralTheory §5.12 (cuspidal-support decomposition); AutomorphicFormsOnReductiveGroups §§3.4–3.5 (restricted tensor realizations); AutomorphicLFunctionsAndLocalFactors Layer AL.3 (Rankin–Selberg factors).

### Examples

Sp₂ transfers to GL₃ and SO₃ to GL₂. In degree two, the GL₂ trivial representation and normalized Steinberg representation share support {ν^(1/2),ν^(−1/2)} and all gamma tests, but their standard L-factors are respectively L(s+1/2)L(s−1/2) and L(s+1/2). For a GL₁ test, the quotient of the two character gamma factors yields the Steinberg epsilon monomial −q^(1/2−s), so support equality does not imply isomorphism or equality of L-factors. For the §10.5 isolation let T={v₁} and allow an auxiliary test ramification place w with π_w and Π_w unramified. The factors at v₁ cancel by stability (the test there is unramified and the central characters match), and those at w cancel by §6.8 for arbitrary generic tests. The number of uncontrolled factors away from v₀ is zero; allowing test ramification at v₁ would leave one factor outside that argument. The converse family for N=2 tests rank 1; for N=3 it tests ranks 1 and 2. If the original bad set is empty, add one finite place, so the twist prescription still has a nonempty set. Over ℚ₂ a character of 1+4ℤ₂ of conductor m≥4 has square of conductor m−1, while for odd residue characteristic the square of a character of conductor m≥2 has conductor m; in both cases η_v₀²χ_(π_v₀) is ramified once m is large, so the unit condition at v₀ is compatible with high ramification. For SO₂ the transfer of μ is μ⊞μ⁻¹; at a place where μ is unramified with μ(ϖ)=3 its Satake polynomial is (1−3T)(1−T/3)=1−(10/3)T+T², and for GSpin₂ with (α,β)=(σ,σ⁻¹χ_π) the product of the two roots is χ_π(ϖ), the determinant character of §0.3.

### Dependencies

This layer follows Layer 0, Layer 6, Layer 9. The direct supplier inputs are SmoothRepresentationsOfLocalGroups Layer SR.4 (Satake theory); GL2AutomorphicRepresentationsAndTransfer R16.1.8 (finite Hecke characters with prescribed local components); AutomorphicFormsOnReductiveGroups §§2.1–2.7 (real representations and globalizations); AutomorphicSpectralTheory §§2.1–2.6 (meromorphic induction, intertwiners and ordered residues); AutomorphicLFunctionsAndLocalFactors Layer AL.2 (the Jacquet–Shalika Satake bound); AutomorphicLFunctionsAndLocalFactors Layer AL.3 (Rankin–Selberg factors); EndoscopicTransferAndUnitaryTraceComparison §10.29 (canonical nongeneric GL factors); §5.2 (local generalized Speh comparison); SmoothRepresentationsOfLocalGroups §SR.3.3 (tempered support and Langlands quotients); AutomorphicLFunctionsAndLocalFactors Layer AL.4 (Satake Euler factors and convergence); AutomorphicFormsOnReductiveGroups §§3.4–3.5 (restricted tensor realizations); AdelicAlgebraicGroups §§0.1–0.4 and 2.2–2.3 (restricted products and quotient measures); AutomorphicFormsOnReductiveGroups §§4.1–4.3 (globalization, cuspidality and pairings); SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 (induction, Jacquet functors, geometric lemma and pairings) and §SR.0.4 (admissible duals and matrix coefficients); AutomorphicSpectralTheory Layer 4 (residual spectrum and cuspidal support); AutomorphicLFunctionsAndLocalFactors Representation prerequisites (GLₙ isobaric sums).

## Downstream consumers

The unitary pullback and critical archimedean sections are complex analytic outputs for subsequent arithmetic applications, which add their own measures, ordinary structures and integral lattices. The generalized local factors and all-place coarse comparison supply analytic standard-transfer tests to classical-group automorphic applications. The weak-transfer theorem supplies automorphy and almost-everywhere Satake comparison; its separate coarse theorem supplies all-place gamma comparisons. Neither conclusion asserts nongeneric local isomorphism uniqueness or cuspidality of a unitary base change.

## References

Page numbers refer to the particular texts below. Source keys identify the texts below, and line locators refer to their numbered extractions. The statements above use their own words and fixed normalization conventions.

- **CFK.** Yuanqing Cai, Solomon Friedberg and Eyal Kaplan, *Doubling constructions: Global functoriality for non-generic cuspidal representations*, [arXiv:1802.02637v5](https://arxiv.org/pdf/1802.02637v5), 2024 version, internal pp.1–60. Theorem 0.1, §2 Theorem 2.1, §§3–4 and Appendix A. The journal bibliographic record is Annals of Mathematics 200 (2024), 893–966; DOI 10.4007/annals.2024.200.3.2. The locators here are those of v5, not journal pagination.
- **EHLS.** Ellen Eischen, Michael Harris, Jian-Shu Li and Christopher Skinner, *p-adic L-functions for unitary groups*, Forum of Mathematics, Pi 8 (2020), e9, [published open text](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/E1D22AA60E10A5B5CA5F838EB48467D7/S2050508620000049a.pdf), DOI 10.1017/fmp.2020.4. §§4.1–4.5, pp.43–81; equation (143), p.101; Theorem 9.1.3, pp.149–150.
- **MODELS.** Yuanqing Cai, Solomon Friedberg, Dmitry Gourevitch and Eyal Kaplan, *The generalized doubling method: (k,c) models*, [arXiv:2109.11309v1](https://arxiv.org/pdf/2109.11309v1), 2021. Definition 1, Theorem 4, Claim 6 and Lemmas 7, 9, 12, internal pp.2–11. Journal record: Proceedings of the AMS 151 (2023), 2831–2845; the locators here use v1.
- **GGS17.** Raul Gomez, Dmitry Gourevitch and Siddhartha Sahi, *Generalized and degenerate Whittaker models*, [arXiv:1502.06483v5](https://arxiv.org/abs/1502.06483v5), version dated 2018 of the work published in Compositio Mathematica 153 (2017), 223–256. Theorems E–F, pp.5–6, and Corollary G with proof, pp.6,27–28; numbering and pages here are those of v5.
- **GK.** Dmitry Gourevitch and Eyal Kaplan, with appendix by Avraham Aizenbud and Dmitry Gourevitch, *Multiplicity one theorems for the generalized doubling method*, [publisher open text](https://ems.press/content/serial-article-files/32911), online-first internal pp.1–86; Journal of the EMS 25 (2023), 3007–3092. Theorem A, Theorems 1.4 and 2.1, and §3.2 Corollary 3.7 and (3.8).
- **HLS.** Michael Harris, Jian-Shu Li and Christopher Skinner, *p-adic L-functions for unitary Shimura varieties, I: Construction of the Eisenstein measure*, Documenta Mathematica Extra Volume Coates (2006), 393–464; [author text](https://webusers.imj-prg.fr/~michael.harris/padicPart1.pdf), internal pp.1–68. §§3.1–3.2.1, internal pp.43–50.
- **GARRETT.** Paul Garrett, *Archimedean Zeta Integrals for Unitary Groups*, [author preprint held by NYU](https://math.nyu.edu/~tschinke/princeton/papers/.aim05/submitted/garrett.pdf), May 18, 2006. §§1–2, pp.1–4, especially the Haar normalization and qualitative theorem on p.4.
- **HARRIS.** Michael Harris, *A simple proof of rationality of Siegel–Weil Eisenstein series*, [author text](https://webusers.imj-prg.fr/~michael.harris/SW.pdf), in the 2008 volume *Eisenstein Series and Applications*. Remark 4.4(iii)–(iv), internal pp.27–28, for the measure comparison, holomorphic theta image and nonvanishing criterion.
- **HEN02.** Guy Henniart, *Une caractérisation de la correspondance de Langlands locale pour GL(n)*, Bulletin de la Société Mathématique de France 130 (2002), 587–602, [Numdam](https://www.numdam.org/item/BSMF_2002__130_4_587_0.pdf). Proposition 1.9, p.592, and §§5.1–5.3, pp.601–602, for supercuspidal support and γ-factors.
- **CPS94.** James W. Cogdell and Ilya I. Piatetski-Shapiro, *Converse theorems for GL_n*, Publications Mathématiques de l'IHÉS 79 (1994), 157–214, [Numdam](https://www.numdam.org/item/PMIHES_1994__79__157_0.pdf). Lemmas 2.1–2.3, pp.161–165, for the formal twisted products.
- **CKPSS01.** James W. Cogdell, Henry H. Kim, Ilya I. Piatetski-Shapiro and Freydoon Shahidi, *On lifting from classical groups to GL_N*, Publications Mathématiques de l'IHÉS 93 (2001), 5–30, [Numdam](https://www.numdam.org/item/PMIHES_2001__93__5_0.pdf). §2, the converse theorem with a fixed twist and its proof, pp.8–10.
- **ADAMS14.** Jeffrey Adams, *The real Chevalley involution*, Compositio Mathematica 150 (2014), 2127–2142, DOI 10.1112/S0010437X14007374; [arXiv:1203.1901v4](https://arxiv.org/pdf/1203.1901v4). Theorem 1.2 and Corollary 1.4, p.2 of the arXiv text.
- **CFK22.** Yuanqing Cai, Solomon Friedberg and Eyal Kaplan, *The generalized doubling method: local theory*, Geometric and Functional Analysis 32 (2022), 1233–1333, DOI 10.1007/s00039-022-00609-4. Cited by its locator only (Lemma 7.3), as the source of CFK Theorem 3.10.
- **KAP23.** Eyal Kaplan, *Rankin–Selberg integrals and L-functions for covering groups of general linear groups*, International Mathematics Research Notices 2023, 13332–13386, DOI 10.1093/imrn/rnac201. Cited by its locator only (Theorem 25), as the source of CFK Theorem A.1.
- **YAM14.** Shunsuke Yamana, *L-functions and theta correspondence for classical groups*, Inventiones Mathematicae 196 (2014), 651–732, DOI 10.1007/s00222-013-0476-x. Cited by its locator only (Theorem 7.1), as the source of the k=1 case of CFK Theorem 3.12.
