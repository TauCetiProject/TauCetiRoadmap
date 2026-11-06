# Roadmap: twisted automorphic descents and cuspidal automorphic modules

**Summary.** Construct rational Bessel Fourier images of leading Eisenstein residues for special orthogonal and unitary groups over number fields. Starting with a specified relevant inclusion of classical spaces and generic global parameter data, the library unfolds Bessel–Eisenstein integrals, compares their all-place factors, proves reciprocal period nonvanishing, and recovers a prescribed cuspidal module up to its permitted even-orthogonal outer orbit. The endpoints include the period-to-central-value implication, its weak-Fourier-support converse, and regular and subregular recovery. Generic Summand, weak Fourier support and the exact local assertion on distinguished members retain their stated logical status; no conjecture is installed as an axiom (JZ2020, Theorems 5.3, 5.7, 6.10 and 7.1, pp.786–808; JZ2020 line 2067, line 2296, line 2991, line 3118).

## Scope and ownership

This roadmap owns the coordinate comparisons for prescribed rational embeddings, the particular Fourier images and tower identities, the Bessel–Eisenstein unfolding and local integrals, the residue-to-period comparison and the critical-module recovery. It treats every rational inner form and all characteristic-zero local places, including residue characteristics 2 and 3. Spherical computations are intermediate targets within an all-place theory.

The classical-group carriers, reflections and quadratic Witt theorems are already in the library in the Tau Ceti modules specified below. ReductiveGroups Layers 0, 3 and 7 and OrthogonalSpinGroups, Layers 0–2, own algebraic groups, orthogonal isometries and their local structure; Completed RestrictedProducts, Layers 0–3, owns restricted-product maps and rational diagonals. RepresentationTheory/ClassicalGroups Layer 6 concerns finite-dimensional branching, not admissible Bessel models. ClassicalGroupsPartII, Layers CG.0–CG.3, concerns rational GSp representations and their characters; it does not duplicate this descent.

GanGrossPrasadUnitaryGroups §§1.1–1.3, 2.1–2.6 and 4.1–4.4 owns unitary relevant pairs, Bessel data, local uniqueness and global period definitions. Its §§3.7 and 3.9 supply the nonarchimedean and the real tempered theorems on distinguished members and §3.11 its specified split range; §3.10 is a proposition outside the proved range. Import these without assuming a generic global period theorem. This roadmap owns the orthogonal relevant pairs and Bessel data in §§0.1–0.3 and the orthogonal local Bessel-uniqueness theorem in §1.4 because no earlier roadmap owns those relative constructions. The assertion on distinguished orthogonal members remains the explicit hypothesis of §7.2.

AutomorphicFormsOnReductiveGroups §§2.3, 2.6–2.7, 3.4–3.5 and 4.1–4.3 owns real induction, globalization, restricted tensors, constant terms and cuspidal-realization comparisons. SmoothRepresentationsOfLocalGroups SR.0–SR.4 owns the smooth category, normalized induction, Jacquet theory and Satake. AutomorphicLFunctionsAndLocalFactors AL.3–AL.4 owns general tensor factors, functional equations and factor operations: §3.5 below is their shifted-integral application, not another construction of these theories. Generic rational Fourier-support theory is a supplier continuation, whereas the special tower calculations stay here.

AutomorphicSpectralTheory §§0.15, 2.4–2.14 and 4.1–4.4 owns meromorphic operators, Eisenstein continuation, normalized intertwiners, Laurent calculus and the residual-spectrum criterion. In particular its §2.13 owns Jiang–Zhang intertwiner holomorphy; there is no second proof target here. EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.4 owns the shared carriers for unitary local and global packets and pairings. ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23–3.25 supplies parameter/classification comparisons and generic standard modules on these carriers. Its §5.4 states classical GRS descent, including split odd-orthogonal irreducibility; §§6.3 and 7.3 below retain the comparison with the specified rational coefficient and induction, not a duplicate generic descent theorem. The rank, sign and determinant verification of §5.1 specializes the shared parameter constructor to this residual family.

LieHighestWeightPartII N0 and N2, respectively nilpotent-orbit and classical-partitions, own geometric nilpotent orbits and the orthogonal partition/very-even classification. Rational descent and dominance supplements are exact supplier contracts, not repetitions of that classification. Generic Hermitian complement and Witt geometry is requested of ReductiveGroupsPartII through gap:hermitian-witt-complements; GeometryOfNumbersAndQuadraticArithmetic §2.9 supplies field-form data and adjoints, while GanGrossPrasadUnitaryGroups §1.1 supplies the field/split slot comparisons.

## Conventions

Let F be a number field. For orthogonal groups E=F; for unitary groups E/F is quadratic, with quadratic étale localization, including split E_v=F_v×F_v. Spaces are finite-dimensional, forms nondegenerate, embeddings isometric. G_V means SO(V) or U(V), and H_W means the group on W; H in a decomposition denotes a hyperbolic plane. Write d=dim_E V>0, m=dim_E W≥0 and V≃H^j orthogonal-sum Ee orthogonal-sum W, so d=m+2j+1. The actual Witt index r, label floor(d/2), and standard-dual dimension N are distinct: N=d−1 for odd SO, N=d otherwise. A nonsplit quasi-split SO_(2n) has r=n−1 (JZ2020, §2.1 pp.748–750 and §2.2 pp.750–754; JZ2020 line 408, line 490).

Hermitian forms are linear first: h(ax,by)=a c(b)h(x,y). Transport a conjugate-first supplier by swapping slots. For the local hyperbolic witness h(e,f)=h(f,e)=1, h(e,e)=h(f,f)=0. In the paper's quadratic normalization use the ordered basis (2.1) and the Gram matrix (2.2); write B for that symmetric bilinear form and Q(v)=B(v,v) for the quadratic map, so the native polar form is Q.polarBilin=2B. The paper’s two-argument q denotes B, and one-argument q denotes Q. In particular Q(e+f)=2 and Q.polarBilin(e,f)=2 when B(e,f)=1. Fix a nontrivial continuous unitary character ψ_F of F\A_F and use its local components ψ_(F_v) throughout; each of them is nontrivial, since F+F_v is dense in A_F; in the quadratic field branch fix δ∈E× of trace zero and ψ_E(x)=ψ_F(Tr_(E/F)(x/δ)/2). A split localization of δ is (t,−t), t≠0, so this character is nontrivial on both field factors. Fix rational flags, an actual anisotropic vector, the orbit, and quotient measures; geometric partitions alone supply none of these (JZ2020, §2.1, (2.1)–(2.2), p.749; (2.11)–(2.14), pp.757–759; JZ2020 line 422, line 434, line 779, line 799).

Use right translations and B_ψ f(h)=∫_[N]f(nh)ψ(n)⁻¹dn, where [N]=N(F)\N(A_F) has volume 1. The bilinear period is P_ψ(f,g)=∫_[H]B_ψ f(h)g(h)dh; the Hermitian period is Q_ψ(f,g)=∫_[H]B_ψ f(h)conj(g(h))dh. Thus a bilinear pairing against π detects π∨ in the image. Complex conjugation identifies a unitary automorphic representation with its ordinary contragredient; conjugate self-duality over E/F does not identify it with that ordinary dual (JZ2020, (4.7), (5.6), pp.766,785; JZ2020 line 1141, line 2042; the complete comparison is §4.1).

Write φ_π for the standard parameter of π: the standard transfer for orthogonal groups, which is self-dual, and the standard base change BC(π) to GL_N(A_E) for unitary groups. Base change is normalized through the first-factor identification U(V)×_F E≅GL(V): a character χ of U₁=E¹ has φ_χ(x)=χ(x/c(x)) for x∈A_E^×, and at a split place E_v=F_v×F_v the group U(V)(F_v) acts on the first factor V₁, so a character β of U₁(F_v)≅F_v^× has base change (β,β⁻¹). Hence φ_(π∨)=φ_π∨=c(φ_π). In P_a the Levi `Res_(E/F)(GL_a)` acts on the isotropic block spanned by e_1,…,e_a through g and on the dual block through the adjoint inverse of c(g). Thus at a split place an inducing character τ=(χ₁,χ₂) of GL₁(E_v) has diagonal characters (χ₁,χ₂⁻¹) in U(1,1)(F_v)≅GL₂(F_v), and the determinant of the Levi element (g,h) of GL_a(E)×U(W) is det g/c(det g)·det h.

Induction is normalized: I_s=Ind_(P_a)^(H_X),norm(τ|det|_E^s tensor σ), with section law δ_(P_a)^(1/2)|det|_E^s(τ tensor σ). Put X=H^a orthogonal-sum W. The critical data use a=N and j<a, k₀=a−j−1. The stabilizer is identified with the prescribed V, the ambient partition is [2k₀+1,1^d] of size 2a+m, and the even-SO inducing twist is t=Ad(w_q^k₀), t²=1. Inducing from σ^t gives σ in the inner period. All residual theorems require actual positive-rank inducing data and j<a; the general geometric definitions still include SO₁ and zero-dimensional W (JZ2020, (4.30)–(4.34), (5.7)–(5.9), pp.774–775,785–786; JZ2020 line 1532, line 2054).

For r_τ distinct cuspidal blocks, the residual form is the coefficient lim_(s→1/2)(s−1/2)^(r_τ)E(f_s,s). This is a single-variable Laurent coefficient. Some sections can give zero. The critical Fourier image may also vanish when the residual module is nonzero. A cuspidal Hilbert image uses a fixed unitary central character or a verified split-center quotient; quotienting by a center on which the function is not equivariant is undefined (JZ2020, Proposition 5.2, §6.1, pp.784,792; JZ2020 line 1998, line 2353; §1.1 supplies the image comparison).

All representations are complex; global inputs are unitary. Finite-place categories are smooth admissible, infinite-place categories Casselman–Wallach with continuous functionals and completed projective tensors. No algebraic representation is silently given a Hilbert or smooth topology. Vector and group universes may differ; constructions use the maxima of the supplier universes. Arithmetic and geometric Frobenius are compared by inversion before taking factors: with geometric norm q⁻¹ the eigenvalue factor is (1−αq^(−s))⁻¹; the arithmetic eigenvalue is α⁻¹. Actual finite residue sizes satisfy q≥2. All global factors are completed, including infinity; an incomplete product displays its omitted finite set S (JZ2020, §4.6 and (5.10)–(5.12), pp.780–787; JZ2020 line 1815, line 2090; AutomorphicLFunctionsAndLocalFactors AL.4.2.1, Transport of supplied local parameter comparisons).

For even SO use the determinant-one group and the rational orthogonal normalizer's outer action. Count distinct representation classes: an outer-fixed class occurs once, a two-element orbit twice. Zero modules and trivial smaller groups are admitted where the defining geometry permits; an anisotropic vector must have nonzero norm. There is no assertion in positive characteristic or for degenerate forms.

**Checks.**

- On a Hermitian line h(i,1)=i and h(1,i)=−i; slot swapping the conjugate-first form gives these values, while reusing it gives −i at (i,1). For hyperbolic e,f, h(e+f,e+f)=2 and h(e−f,e−f)=−2.
- On a volume-one anisotropic U₁, a character χ with χ² nontrivial has Q(χ,χ)=1 and P(χ,χ)=0; P(χ,χ∨)=1. Changing the second vector by i multiplies P by i and Q by −i.
- At a split place a character β of U₁(F_v) with β(ϖ)=i has base change (β,β⁻¹), with values (i,−i) at ϖ; its contragredient β⁻¹ has (−i,i), which is the Galois conjugate c(i,−i)=(−i,i), not (i,−i). The opposite normalization x↦c(x)/x would interchange these two labels.
- With N trivial, B_ψ f(h)=f(h). For a two-term C₃ character sum, ψ(1)=ζ, f=(1,i), conjugation changes the sum 1+iζ⁻¹ to 1−iζ, fixing the inverse-character convention.
- For upper B in GL₂ and |a|=4, δ_B(diag(a,1))^(1/2)=2, not 1/2. At q=2, s=1 and eigenvalues 1,−1, the determinant polynomial is (1−T)(1+T)=1−T² and its L-value is 4/3.
- For geometric Frobenius test eigenvalues 2,3 at q=7 and s=1, the determinant is (1−2/7)(1−3/7)=20/49 and the L-value is 49/20. Arithmetic eigenvalues 1/2,1/3 must be inverted before this computation; treating them as geometric gives determinant 130/147 and L-value 147/130. These are L-group test coordinates.
- The data d=5,m=2,j=1,a=4 give k₀=2 and 2a+m−2k₀−1=5. Data a=1,j=2 give truncated k₀=0 but 2a+m−1=m+1, differing from m+5; the hypothesis j<a excludes them.
- SO₁ has N=0 and an index-zero geometric coefficient, but cannot satisfy a=N>j≥0 for the residual construction. Split SO₂ has no proper parabolics, yet the constant function has ∫_(R_+)1 dt/t=∞; vacuous constant-term vanishing does not give its Hilbert carrier.
- For d=3, ℓ=1 and the trivial character ψ_F=1, the Bessel character of the flag is trivial on N_1, so its coefficient is the constant term along N_1, of geometric partition [1,1,1] rather than the regular [3]; the nontriviality of ψ_F excludes this datum. With ψ_F nontrivial and a split place E_v=F_v×F_v, δ=(t,−t) gives the factor coefficients 1/(2t) and −1/(2t), both nonzero.

## Exact supplier contracts

A contract marked gap: specifies mathematics required of its named owner before dependent theorems are proved. These contracts do not become arbitrary hypotheses containing the desired descent conclusion. The generic analytic/classification inputs precede applications to residual packets; no normalization proof uses the residual conclusion it is intended to establish.

### From Mathlib

Use `Nat.Partition` in `Mathlib/Combinatorics/Enumerative/Partition/Basic.lean`: its multiset has positive parts and prescribed sum; it carries no form, flag or rational orbit. Use `Representation.IntertwiningMap` in `Mathlib/RepresentationTheory/Intertwining.lean` only as an algebraic intertwiner carrier, with no built-in continuity, admissibility or analytic Bessel theory. Use `MeromorphicOn` in `Mathlib/Analysis/Meromorphic/Basic.lean` for normed-target meromorphic germs; it does not construct locally convex Eisenstein families. Their automorphic and locally convex comparisons are supplied below.

### From Tau Ceti

Use `TauCeti.RegularFormClass.wittDecomposition` in `TauCeti/LinearAlgebra/QuadraticForm/Witt/Decomposition.lean`, for regular finite-dimensional quadratic forms over a field with 2 invertible. It is a form-class decomposition; an isometry of a prescribed embedded complement is additional data. Use `TauCeti.QuadraticMap.specialOrthogonalGroup` and `TauCeti.QuadraticMap.det_reflection` in `TauCeti/LinearAlgebra/QuadraticForm/OrthogonalGroup/Basic.lean`: the first is the subgroup of linear equivalences preserving Q with determinant 1 (on the finite-dimensional field spaces used here, the native determinant is the usual determinant); the second requires a finite free module and a vector of invertible quadratic value and gives determinant −1. On modules that are not finite free the native determinant is 1 by convention, so this use retains finite dimension over a field. These declarations do not construct a Hermitian group or an automorphic realization.

Use `QuadraticMap.IsometryEquiv.exists_extension` in `TauCeti/LinearAlgebra/QuadraticForm/Witt/Extension.lean`, for an isometry of subspaces with nondegenerate restricted form in a finite-dimensional ambient quadratic space over a field with 2 invertible. Use `TauCeti.equivalent_of_equivalent_prod` in `TauCeti/LinearAlgebra/QuadraticForm/Witt/Cancellation.lean`: the cancelled quadratic summand is finite-dimensional and nondegenerate. The extension theorem does not require the ambient quadratic form to be nondegenerate, although this roadmap applies it to nondegenerate classical spaces. Both uses preserve the specified forms; neither replaces rational coordinates by abstract group isomorphisms.

### From TauCetiRoadmap.ReductiveGroups

Consume Layer 7 for split rational parabolic double cosets and Layer 7b for parabolics, Levi factors and their intersections. The relative nonsplit isotropic-flag classification and its residual rational orbits are the content of §2.3.

### From TauCetiRoadmap.ReductiveGroupsPartII

Consume RG2.4 for the local adjoint-modulus formula, only with its actual local-field and reductivity hypotheses. The Hermitian supplement excludes another form-carrier or adjoint construction.

What ReductiveGroupsPartII must provide (gap:hermitian-witt-complements): Supply Witt decomposition, extension and cancellation for nondegenerate finite-dimensional Hermitian spaces over every characteristic-zero field with quadratic étale coefficients, with prescribed complement isometries, arbitrary-form unitary groups and scalar-extension compatibility. The section contract is RG2.4.

### From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

Consume §2.9 field Hermitian forms and adjoints on finite-dimensional modules. The carrier and adjoint apply over any commutative field with involution; its odd-residue classification results are not used. GanGrossPrasadUnitaryGroups §1.1 performs the linear-first slot comparison and the split quadratic-étale comparison.

### From TauCetiRoadmap.LieHighestWeightPartII

Consume N0, nilpotent-orbit, and N2, classical-partitions, over their algebraically closed characteristic-zero fields. Base change to a closure does not recover rational conjugacy. Very-even O-orbits retain both SO labels.

What LieHighestWeightPartII must provide (gap:rational-nilpotent-orbits): Extend the geometric orbit carrier to rational classical nilpotent orbits and localization, distinguishing geometric, Galois-stable and rational conjugacy and retaining the two very-even SO labels. The section contract is N0, nilpotent-orbit.

What LieHighestWeightPartII must provide (gap:classical-dominance): Supply dominance and special-expansion comparisons for the regular and subregular partitions in the ranks of Section 7.4, without inferring rational or automorphic nonvanishing from geometric admissibility. The section contract is N2, classical-partitions.

### From TauCetiRoadmap.GanGrossPrasadUnitaryGroups

Consume §§1.1–1.3 for framed relevant Hermitian pairs, relative subgroups, characters and transport; §§2.1–2.6 for model spaces, continuous dual comparison and all-odd-codimension uniqueness; §§4.1–4.4 for periods, convergence and coherent parameter comparisons. The local theorem on distinguished members is nonsplit tempered: nonarchimedean in §3.7 and real in §3.9; the split theorem is §3.11 in its exact stated range. An application outside those ranges retains the §7.2 local proposition as a mathematical hypothesis. The identity Q(f,g)=P(f,conj g) uses the supplier's right action and dual convention; the U₁ witness in Conventions applies on both sides. No global GGP endpoint is a premise of recovery.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

Consume SR.0.1–SR.0.4 for smooth categories and contragredients, SR.2.1–SR.2.3 for normalized induction, Jacquet filtrations and character coinvariants, SR.3.1–SR.3.3 for support/temperedness, SR.4.1–SR.4.4 for Satake and unramified unitary groups. Restriction to a Bessel subgroup and the character quotient use these actual actions. The ordinary Jacquet filtration does not by itself compute the twisted quotient needed in §§5.4 and 5.7.

What SmoothRepresentationsOfLocalGroups must provide (gap:twisted-jacquet-filtration): Compare the geometric lemma and induction in stages with character-twisted Jacquet quotients for determinant-one orthogonal and split or nonsplit unitary groups over every finite extension of Q_p. The section contract is SR.2.2, geometric-lemma.


What SmoothRepresentationsOfLocalGroups must provide (gap:orthogonal-auxiliary-induction): For every finite extension k of Q_p, every nondegenerate quadratic space W over k, every t≥1, every irreducible admissible σ_W of SO(W)(k) and every irreducible supercuspidal τ of GL_t(k), prove that the normalized induction of τ|det|^s⊗σ_W from the parabolic of SO(W⊥H^t) stabilizing a chosen t-dimensional totally isotropic subspace of H^t, with Levi GL_t×SO(W) (the whole group when W=0 and t=1, and a non-maximal parabolic when W is a hyperbolic plane) is irreducible for s outside a finite subset of C/(2πi/log q)Z, and that for each irreducible π_V of SO(V)(k), V⊂W⊥H^t of codimension one, τ can be chosen so that no Bernstein component of SO(V)(k) containing π_V has τ, up to unramified twist, in its GL_t cuspidal support. The section contract is SR.3.1, generic-irreducibility.

What SmoothRepresentationsOfLocalGroups must provide (gap:spherical-whittaker-normalization): Supply hyperspecial Satake, spherical Whittaker and Cartan-volume formulas with normalized induction and specified Haar measures for every residue characteristic, including split unitary GL groups and unramified nonsplit forms. The section contract is SR.4.1–SR.4.4.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

Consume §§2.3, 2.6 and 2.7 for real normalized induction, the archimedean generic unitary-dual theorem, Casselman–Wallach globalization and Dixmier–Malliavin; §§3.4–3.5 for restricted tensors and spherical lines; §§4.1–4.3 for constant-term transitivity, cuspidal realizations, Petersson pairings and GL Whittaker models. Its §4.2 adapters retain the supplied fixed-central-character or split-center-quotient spectrum. This roadmap must show its own images lie there; split SO₂ is the negative control in §1.1.

What AutomorphicFormsOnReductiveGroups must provide (gap:rational-fourier-support): Supply generalized rational-nilpotent Fourier maps, root exchange, support and maximal-support carriers on actual automorphic realizations, with continuous constant-term comparisons and the topology for a verified cuspidal Hilbert closure. The section contract is 4.1–4.2, rational Fourier continuation.

What AutomorphicFormsOnReductiveGroups must provide (gap:bessel-restriction-growth): Supply absolute convergence and continuity of Bessel periods when the form on the ambient group is cuspidal and the form on the stabilizer has moderate growth, and when the stabilizer form is cuspidal and the stabilizer has trivial F-split centre, and restriction estimates into fixed-central-character or split-center-quotient Hilbert carriers, with all archimedean cases. The section contract is 4.1–4.2, restriction and cuspidal realization.

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

Consume AL.3.1.2, The Whittaker realization; AL.3.6.1, Continuation and the Rankin–Selberg pole criterion; AL.3.6.2, The global Rankin–Selberg functional equation; AL.3.6.3, Rankin–Selberg nonvanishing on the boundary; and AL.3.7.2, Strong multiplicity one for isobaric sums; in particular distinct required-type blocks have regular nonzero cross factors at 1 by the pole criterion and boundary nonvanishing, with the finite-place and archimedean factors restored using §3.5; AL.4.1.1, The unramified L-group Euler factor; AL.4.2.1, Transport of supplied local parameter comparisons; and AL.4.2.2, Functorial operations on unramified factors. GL tensor and supplied parameter equalities retain the source hypotheses. A general Satake determinant is not ramified LLC. For ρ=∧², the pair (x,y) gives xy; for ρ=Sym² it gives x²,xy,y². The local signed-Asai and completed-type supplements below supply exactly the additional all-place assertions. No arbitrary functorial transfer is inferred from a factor identity.

What AutomorphicLFunctionsAndLocalFactors must provide (gap:all-place-signed-factors): Supply all-place tensor and signed Asai factors, tempered positive-half-plane regularity and standard-module multiplicativity with archimedean Gamma shifts and the actual unipotent-radical L-representation for the induction used here. The section contract is AL.4.2.1, Transport of supplied local parameter comparisons.

What AutomorphicLFunctionsAndLocalFactors must provide (gap:type-poles-and-cross-factor): Supply the conjugate-self-dual signed-Asai type-pole dichotomy and the completed signed-factor identity comparing the actual unipotent-radical normalizer with the bilinear dictionary of Section 4.1. The section contract is AL.3–AL.4, poles and factor operations.

### From TauCetiRoadmap.AutomorphicSpectralTheory

Consume §0.15 continuous Laurent coefficient operators after common-denominator regularization; §§1.1–1.5 for induced Hilbert data; §§2.4–2.7 for continued Eisenstein families and constant terms, with §2.4a supplying holomorphic smooth sections; §2.8 Shahidi normalization; §§2.9–2.13 generic standard-module and normalized-intertwiner results, including holomorphic nonzero operators on Re(s)≥1/2 for every characteristic-zero local field and nongeneric members of pure inner forms in §2.13's stated generic-global-parameter scope; §2.14 isobaric realization; §§4.1–4.4 residual-spectrum and square-integrability criteria. In §2.8 the convention is N_v=β_v M_v with β_v=L_v(1+s,τ×σ)L_v(1+2s,τ,ρ)ε_v(s,τ×σ)ε_v(2s,τ,ρ)/(L_v(s,τ×σ)L_v(2s,τ,ρ)). Both epsilon factors multiply in the numerator. The unitary convention of §2.8 includes quadratic étale coefficients; at a split place its group is GL, so no additional split-place holomorphy theorem is requested. At unramified SO₃ with q=2, trivial GL₁ data and s=1/2, M's spherical scalar is 3/2 and β=2/3, hence N has scalar 1. In the unitary case the symbolic τ×σ of §2.8 is evaluated on the actual cross representation of the dual Levi, which §4.1 identifies with τ×φ_σ∨ in the normalization of Conventions. Nonzero individual factors of an operator composition are insufficient: diag(1,0) and diag(0,1) have zero product.

What AutomorphicSpectralTheory must provide (gap:isobaric-eisenstein-continuation): Extend Eisenstein continuation and constant-term formulas to the moderate-growth noncuspidal smaller datum sigma permitted by Section 2.1, with holomorphic smooth sections and specified central character. The section contract is 2.4, 2.4a and 2.14.

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

Consume §§11.2–11.4 for tempered and positive-exponent local unitary packets with inner-twist pairings and the interface for generic global packets. Keep every classification-input and Whittaker-normalization premise. The generic global theorem there is for CM extensions and pure inner twists; it does not prove an all-number-field or nongeneric statement. The extended local construction retains the actual induced module, possibly reducible, until a separate irreducibility theorem applies. At split places the ordinary pure-inner forms used here are split GL groups; no division-algebra form is inserted into a Hermitian pair. GanGrossPrasadUnitaryGroups makes the relative normalization comparison; ModularityAndLanglandsExtensions supplies its stated classification theorems and the additional residual/general-field contract below. No second carrier for these packets is constructed here.

### From TauCetiRoadmap.ModularityAndLanglandsExtensions

Consume §§3.3–3.4, self-dual-cuspidal-type, for the self-dual type dichotomy, §3.8 actual global Arthur parameters, §§3.12 and 3.16 unitary classification, §3.15 local packets, §3.17 quasi-split multiplicity, §3.18 orthogonal Vogan packets, §3.23 generic inner-form multiplicity and §3.25 generic standard modules. Every classification premise, local intertwining condition and coherent inner form is retained. Consume §5.4 classical GRS descent with its exact group and genericity scope. Comparing that module with this normalized residual coefficient is a new comparison, not an invocation of almost-everywhere transfer as a concrete-module proof.

What ModularityAndLanglandsExtensions must provide (gap:quasisplit-residual-packets-membership): For quasi-split special orthogonal and unitary groups, identify the Arthur packets of the discrete constituents with the prescribed residual Langlands-quotient data for the parameter formed from the distinct two-dimensional SL2 blocks and the smaller generic parameter. The section contract is 3.8, 3.12, 3.15–3.17.

What ModularityAndLanglandsExtensions must provide (gap:residual-irreducibility): Prove irreducibility of the residual representation for distinct required-type blocks and a cuspidal generic-parameter smaller datum, within the applicable classification scope and, on non-quasi-split forms, under the inner-form classification hypothesis of Section 5.2. The section contract is 3.8, 3.12, 3.15–3.18, 3.23–3.25.

What ModularityAndLanglandsExtensions must provide (gap:all-member-residual-support): Classify the cuspidal supports of every discrete member of the residual Arthur packets formed from distinct two-dimensional SL2 blocks and the smaller generic parameter, retaining the Levi, inducing blocks and exponents, within the classification scope of Section 5.2. The section contract is 3.8, 3.12, 3.15–3.18, 3.23–3.25.

What ModularityAndLanglandsExtensions must provide (gap:coherent-packets-comparison): Compare the coherent generic global packets on the shared carriers with the quasi-split classification and, under the inner-form classification hypothesis of Section 5.2, with the specified rational inner forms, preserving relevance, duals and even-orthogonal outer labels. The section contract is 3.8, 3.12, 3.15–3.18, 3.23.

What ModularityAndLanglandsExtensions must provide (gap:generic-discrete-member-cuspidality): Prove that discrete automorphic members of relevant generic global Arthur packets are cuspidal within the quasi-split classification scope and, under the inner-form classification hypothesis of Section 5.2, on the specified rational inner forms. The section contract is 3.8, 3.12, 3.16–3.18, 3.23.

What ModularityAndLanglandsExtensions must provide (gap:standard-base-change-uniqueness): Identify the standard isobaric base change of each generic-parameter discrete automorphic member, with uniqueness of the GL isobaric target from its almost-everywhere standard Satake parameters, retaining even-orthogonal outer labels on the source and the classification scope of Section 5.2. The section contract is 3.8, 3.12, 3.15–3.18, 3.23.

What ModularityAndLanglandsExtensions must provide (gap:oriented-even-orthogonal-packets): For special orthogonal groups of even-dimensional quadratic spaces, within the classification scope of Section 5.2, refine the outer-orbit packets to oriented local packets of SO-conjugacy classes of parameters, with every member of the oriented local fibre of an outer-stable parameter isomorphic to its outer conjugate, and prove that every discrete automorphic member with a given outer orbit of generic global parameters lies in the restricted tensor product of the localized oriented packets of one of its at most two coherent global orientations, which the rational outer action exchanges. The section contract is 3.13, 3.15 and 3.17.

## How to read the build

Layer 0 identifies the rational form, flag, orbit and prescribed embedding. Layer 1 constructs the actual Fourier images and proves their first-occurrence and multiplicity properties. Layer 2 unfolds both index regimes; Layer 3 constructs all-place local integrals and establishes their Euler and spherical formulas. Layer 4 applies the exact dual dictionary and single-variable Laurent theory to reciprocal periods and central values. Layer 5 constructs the critical descent and proves its conditional cuspidal structure; Layer 6 supplies support witnesses and period existence; Layer 7 recovers the specified cuspidal module under Generic Summand and the exact local hypothesis on distinguished members. Suggested.lean records only headline theorems statable on the pinned carriers, with missing carriers identified in its module docstring. Arithmetic dimension identities and the Checks below belong to this roadmap's specification, not to that acceptance file.

## Layer 0: Rational Bessel coordinates

### 0.1 Classical-group coordinate comparison

For V=H^r ⊥ V_an of dimension d over E, identify the paper’s matrix group with SO(V) or U(V) from the shared relevant-pair interface. Here r is the actual Witt index, n=floor(d/2) is only a label, and the standard-dual dimension is N=d−1 for odd SO and N=d otherwise. Transport two kinds of parabolics, with their Levi factors and normalized induction moduli: the parabolic stabilizing the j-dimensional isotropic subspace span(e_1,…,e_j), with Levi `Res_(E/F)(GL_j) x Isom(V_(j))^0`, and the parabolic stabilizing every member of the complete isotropic flag span(e_1)⊂…⊂span(e_1,…,e_j), with Levi `Res_(E/F)(GL_1)^j x Isom(V_(j))^0`. They coincide for j≤1. The Bessel unipotent N_j is the unipotent radical of the complete-flag parabolic; the Eisenstein parabolic P_a of §2.1 is the stabilizer of an a-dimensional isotropic subspace. The quasi-split nonsplit even orthogonal group has r=n−1. All group identifications are over F and commute with localization. (JZ2020, §2.1, pp.748–750; (2.12), p.758; §4.1, pp.764–765; JZ2020 line 408, line 454, line 814).

For the orthogonal branch define a framed relevant pair to be the actual isometric embedding W→V together with an isometry of its perpendicular to H^j orthogonal-sum Ee, q(e)≠0. Use SO(V) rather than O(V). The unitary framed pair and these transport operations are imported from GanGrossPrasadUnitaryGroups §1.1. The orthogonal framed pair has the following API.

- Forgetting the frame retains the actual isometric embedding and the odd-dimensional complement condition.
- Scalar extension sends both the embedding and its chosen complement isometry to the corresponding local pair, including dimension zero on W.
- A specified isometry of pairs intertwines the two stabilizer embeddings; equality of dimensions alone supplies no transport.

For the orthogonal branch define also an orthogonal Bessel datum of index ℓ on V: an isotropic flag span(e_1)⊂…⊂span(e_1,…,e_ℓ) with chosen isotropic vectors e_(−1),…,e_(−ℓ) satisfying q(e_i,e_(−k))=δ_(ik), together with an anisotropic vector w of the middle space V_(ℓ)=(span(e_(±1),…,e_(±ℓ)))⊥. The unitary datum is imported from GanGrossPrasadUnitaryGroups §§1.2–1.3. The orthogonal datum has the following API.

- A datum of index ℓ exists exactly when ℓ≤r and 2ℓ+1≤d: the flag needs ℓ≤r, and a nondegenerate middle space of dimension d−2ℓ≥1 contains an anisotropic vector because 2 is invertible.
- An isometry of V carries a datum of index ℓ to a datum of index ℓ, and scalar extension to F_v carries it to a local datum of the same index.
- Forgetting w leaves the flag, whose stabilizer is the complete-flag parabolic transported above, with Levi `Res_(E/F)(GL_1)^ell x Isom(V_(ell))^0`.

A proof route is as follows. Use the supplied quadratic Witt decomposition and the supplied hermitian analogue, with the specified linear-first/antilinear-first conversion. Write the block isometry equations in a dual isotropic basis and compare to the determinant-one quadratic group. At finite places compute the modulus using the action on the unipotent Lie algebra and the nonarchimedean adjoint-modulus formula of ReductiveGroupsPartII RG2.4. At infinity use the real normalized-induction and modulus comparison of AutomorphicFormsOnReductiveGroups §2.3.

*Needs:* ReductiveGroups Layer 7b (parabolics and Levi factors); ReductiveGroupsPartII RG2.4 (nonarchimedean adjoint modulus); AutomorphicFormsOnReductiveGroups §2.3 (real induction and modulus); GanGrossPrasadUnitaryGroups §§1.1–1.3 (unitary); `TauCeti.RegularFormClass.wittDecomposition`; `TauCeti.QuadraticMap.specialOrthogonalGroup`; GeometryOfNumbersAndQuadraticArithmetic §2.9 (field-form data); ReductiveGroupsPartII RG2.4 (gap:hermitian-witt-complements); GanGrossPrasadUnitaryGroups §1.1 (slot and split comparison).

**Checks.**

- A quasi-split nonsplit SO₄ has Witt index 1, not 2.
- For SO₅ the standard transfer is to GL₄; for U₅ it is to GL₅.
- For a split rank-zero smaller space, dim W=0 and H_W is trivial; a relevant line has d=1 and j=0. A zero-dimensional V cannot contain the required anisotropic vector.
- In split SO₇ with j=2 the complete-flag parabolic of span(e_1)⊂span(e_1,e_2) has Levi GL₁×GL₁×SO₃, of dimension 1+1+3=5, while the stabilizer of the plane span(e_1,e_2) has Levi GL₂×SO₃, of dimension 4+3=7; the element of GL₂ exchanging e_1 and e_2 lies in the second Levi and moves span(e_1). For j=1 both Levis are GL₁×SO₅.
- For split SO₄ (d=4, r=2) a flag of length 2 exists but its middle space is 0, so no Bessel datum of index 2 exists; at index 1 the hyperbolic middle plane contains e_2+e_(−2) of quadratic value q(e_2+e_(−2),e_2+e_(−2))=2≠0.

### 0.2 Bessel partition

For natural numbers d, ℓ with 2ℓ+1≤d, set p_ℓ(d)=[2ℓ+1,1^(d−2ℓ−1)] as a Nat.Partition d. Its admissibility for a chosen classical form additionally requires a Bessel datum of index ℓ, that is, a flag of length ℓ and an anisotropic vector in its nonzero middle space (§0.1 in the orthogonal case). These data are not inferred from floor(d/2). For ℓ=0 the partition is [1^d]; the chosen Bessel subgroup remains the orthogonal complement of the chosen anisotropic vector. (JZ2020, §2.3, equation (2.9), pp.755–756; §2.4, pp.757–759; JZ2020 line 694).

The construction has the following API.

- The parts multiset is {2ℓ+1} plus d−2ℓ−1 ones.
- The sum of the parts is d.
- The number of parts is d−2ℓ.
- At ℓ=0 the partition is the existing partition of d into ones; the geometric Bessel coefficient is separately restriction to the chosen subgroup.

A proof route is as follows. Construct the multiset with one odd part and d−2ℓ−1 copies of 1. Its sum is d and every part is positive. Use the shared flag and anisotropic-vector datum for relevance; do not equate an orbit’s full Levi stabilizer with the chosen Bessel subgroup.

*Needs:* `Nat.Partition`; §0.1 (orthogonal Bessel datum, for admissibility); GanGrossPrasadUnitaryGroups §§1.1–1.3 (unitary).

**Checks.**

- Validity excludes ℓ=d/2 in split even dimension.
- d=5, ℓ=1 gives [3,1,1], of size 5 and length 3.
- d=3, ℓ=0 gives [1,1,1]; its stabilizer defining space has dimension 2, although the nilpotent is zero. The algebraic group SO₂ has dimension 1 and U₂ has dimension 4.
- d=4, ℓ=2 is not admissible: the proposed leading part 5 exceeds 4.

### 0.3 Rational Bessel orbit comparison

For each Bessel datum (isotropic flag, anisotropic w in the middle space), compare its explicit unipotent character with the generalized Fourier character attached to a rational nilpotent orbit of geometric partition p_ℓ(d). Give the F-rational conjugacy equivalence and its localization; distinguish a geometric orbit, a Galois-stable geometric orbit and an orbit of G(F). On unitary groups use `psi_E(x) = psi_F(Tr_(E/F)(x/delta)/2)` for E=F(δ), δ²∈F× and Tr(δ)=0, as in (2.12) and the chosen Hermitian convention. At ℓ=0 the general nilpotent coefficient is restriction of the form before restricting its group action to Isom(w⊥)°. (JZ2020, §2.3, pp.754–756; §2.4, (2.11)–(2.13), pp.757–758; JZ2020 line 775).

For the orthogonal branch, starting from a Bessel datum of §0.1, form the flag-fixing unipotent N_ℓ and its character from the adjacent flag coordinates and the final pairing with w, evaluated by ψ_F; at ℓ=0 put N₀=1 and use restriction. The corresponding unitary datum and character transport are imported from GanGrossPrasadUnitaryGroups §§1.2–1.3. The geometric orbit of zero has the full ambient stabilizer, while the chosen index-zero Bessel subgroup is an additional restriction; they are distinct constructions. The orthogonal datum has the following API.

- Its pointwise flag-and-vector stabilizer acts on the coefficient through its specified embedding in the middle classical group.
- An actual rational conjugation transports the unipotent, character and stabilizer action together.
- Localization preserves the embedding, character and rational orbit map, including index zero.

A proof route is as follows. Use the supplied rational nilpotent/generalized Fourier interface, not the algebraically closed classification alone. Write the character as the sum of adjacent flag coordinates and the last pairing with w, evaluated by the specified additive character. Verify compatibility with the generalized-character construction and conjugation.

*Needs:* §0.1 (orthogonal Bessel datum); §0.2; GanGrossPrasadUnitaryGroups §§1.1–1.3 (unitary); LieHighestWeightPartII N0, nilpotent-orbit (gap:rational-nilpotent-orbits); LieHighestWeightPartII N2, classical-partitions; AutomorphicFormsOnReductiveGroups §§4.1–4.2 (gap:rational-fourier-support; gap:bessel-restriction-growth).

**Checks.**

- A single partition can have several rational orbits.
- The two very-even SO geometric orbits are not silently merged, nor assumed individually F-stable.
- For E=F(δ), x=δ gives Tr(x/δ)/2=1, whereas x=1 gives trace 0. Thus ψ_E(δ)=ψ_F(1)=1 globally, and on a local coefficient tδ its value is ψ_F(t); the untwisted trace would interchange these coordinates.
- For d=4,ℓ=1 with fixed hyperbolic middle plane q(x,y)=2xy, vectors (1,1/2) and (1,−1/2) have values 1 and −1; over R their perpendicular lines have opposite signatures even though the ambient partition [3,1] is the same.

### 0.4 Anisotropic-vector normal form

For ℓ<r, every anisotropic w in V_(ℓ) is carried by an F-rational isometry of V_(ℓ) to `e_r + (-1)^(d+1) kappa/2 * e_(-r)` for some κ∈F×, using the basis (2.1) and Gram matrix (2.2). In the SO case the isometry can be chosen proper by composing with a reflection in a nonisotropic vector perpendicular to the image. The image has the same form value as w; the assertion does not choose a square root in F. The boundary ℓ=r uses the actual anisotropic kernel instead of this hyperbolic normal form. (JZ2020, Lemma 2.4 and its proof, pp.758–759; JZ2020 line 848).

A proof route is as follows. Extend the isometry between the nondegenerate lines by Witt extension; the Hermitian extension is supplied under gap:hermitian-witt-complements by ReductiveGroupsPartII RG2.4. In the quadratic case adjust determinant using a reflection fixing the image vector. The middle space has dimension at least 2 here, so its nondegenerate perpendicular contains such a vector.

*Needs:* §0.1; `QuadraticMap.IsometryEquiv.exists_extension`; `TauCeti.QuadraticMap.det_reflection`; GeometryOfNumbersAndQuadraticArithmetic §2.9 (field-form data); ReductiveGroupsPartII RG2.4 (gap:hermitian-witt-complements); GanGrossPrasadUnitaryGroups §1.1 (slot and split comparison).

**Checks.**

- Over Q in the sign-+ branch with q(x,y)=2xy, the vectors w=(2,3/4) and y₃=(1,3/2) both have value 3. The determinant-one isometry diag(1/2,2) sends w to y₃, so the normal form with κ=3 is reached over Q without adjoining √3. The normal form keeps the value: no isometry sends w to e+f/2, of value 1, although 3 and 1 lie in one square class over Q(√3).
- In the sign-+ branch on a hyperbolic plane with q(xe+yf)=2xy, y_κ=e+(κ/2)f has q(y_κ)=κ and its perpendicular generator e−(κ/2)f has value −κ. For κ=2 these values are 2 and −2.
- For the anisotropic real line q(x)=x² there is no hyperbolic pair; ℓ=r=0 must use the kernel, not the displayed hyperbolic normal form.

### 0.5 Bessel stabilizer and Witt index

For V=H^ℓ ⊥ V_(ℓ) and anisotropic w∈V_(ℓ), the chosen Bessel subgroup is H=Isom(V_(ℓ)∩w⊥)°, embedded by fixing the flag and w; its defining space has dimension d−2ℓ−1. If ℓ<r and w=y_κ in the normal form, the new anisotropic part is the anisotropic part of V_an ⊥ `E y_(-kappa)`. Its Witt index is r−ℓ when E y_κ is represented in V_an and r−ℓ−1 otherwise. At ℓ=r it is the corresponding perpendicular in V_an. For U(V) this H is the subgroup fixing the flag vectors, not the full character stabilizer inside the Levi, which also has a norm-one central torus. (JZ2020, §2.4, (2.13)–(2.14), Proposition 2.5, pp.758–759; JZ2020 line 856).

A proof route is as follows. Split off the hyperbolic planes and the line Ew and apply Witt cancellation. For the Witt index increase, V_an ⊥ `E y_(-kappa)` is isotropic exactly when V_an represents the value of y_κ. Check the sign by the equation `q(v) + q(y_(-kappa)) = 0`. Compare the pointwise flag-and-vector stabilizer with the matrix embedding; retain the extra unitary central stabilizer rather than identifying it with H.

*Needs:* §0.4; GanGrossPrasadUnitaryGroups §§1.1–1.3 (unitary); §§0.1–0.3 (orthogonal); `TauCeti.equivalent_of_equivalent_prod`; GeometryOfNumbersAndQuadraticArithmetic §2.9 (field-form data); ReductiveGroupsPartII RG2.4 (gap:hermitian-witt-complements); GanGrossPrasadUnitaryGroups §1.1 (slot and split comparison).

**Checks.**

- For V_(ℓ) a hyperbolic plane, its anisotropic-line perpendicular has Witt index 0.
- With real anisotropic kernel <1> and κ=1, <1> orthogonal-sum <−1> has Witt index 1; with κ=−1 the sum <1,1> has index 0. This rejects the reversed representation sign.
- For unitary flag length 1, scalar −1 centralizes every unipotent element but sends its flag vector e to −e; full character stabilization does not imply pointwise flag fixation.

### 0.6 Ambient datum for a prescribed relevant pair

Given a specified relevant pair W⊂V with V≅H^j ⊥ Ee ⊥ W, choose a>j and set X=H^a ⊥ W and k=a−j−1. Construct a rational Bessel datum of index k in Isom(X)° and an F-isometry of its stabilizer space with V, compatible with the given inclusion W⊂V. Its dimension is 2a+dim W−2k−1=dim V. Export the induced coordinate maps, the rational orbit, localizations and the even-SO normalizer action t=Ad(w_q^k), with w_q²=1. The chosen input on W is σ^t, so that the unfolded inner period has σ. (JZ2020, Proposition 2.6, p.759; §4.4, (4.30)–(4.34), pp.774–775; §5.2, (5.7)–(5.9), pp.785–786; JZ2020 line 867).

The construction has the following API.

- The specified stabilizer-space isometry intertwines its W-inclusion with the original one.
- Localization gives the same relevant-pair datum over each F_v, with the same character and normalizer.
- t² acts trivially on representation isomorphism classes and the inner-period datum from σ^t has σ.

A proof route is as follows. Use k hyperbolic planes of X for the flag and the remaining j+1 planes to place a line whose perpendicular is H^j ⊥ Ee. Supply a coordinate isometry realizing the original embedding. Record the normalizer element in that coordinate isometry; transport σ only once by t. Proposition 2.6 alone gives occurrence, so the compatibility with a prescribed embedding must be checked as part of this construction.

*Needs:* §0.5; GanGrossPrasadUnitaryGroups §§1.1–1.3 (unitary); §§0.1–0.3 (orthogonal).

**Checks.**

- Composing the outer twist twice restores the original datum.
- d=5,m=2,j=1,a=4 gives ambient dimension 10, k=2 and leading part 5.
- a=j+1 gives k=0 and ambient dimension d+1, with the stabilizer its prescribed anisotropic-line complement.
- An isomorphism of abstract stabilizer groups without matching W⊂V does not satisfy the constructor contract.

### Examples

Dimensions d=5,m=2,j=1,a=4 give ambient size 10, critical index 2 and partition [5,1^5]. At a=j+1 the index is 0 and the ambient dimension is d+1; the complement is the specified line, not a canonically chosen group.

### Dependencies

This layer uses ReductiveGroups Layer 7b (parabolics and Levi factors); ReductiveGroupsPartII RG2.4 (nonarchimedean adjoint modulus); AutomorphicFormsOnReductiveGroups §2.3 (real induction and modulus); GanGrossPrasadUnitaryGroups §§1.1–1.3 (unitary); `TauCeti.RegularFormClass.wittDecomposition`; `TauCeti.QuadraticMap.specialOrthogonalGroup`; GeometryOfNumbersAndQuadraticArithmetic §2.9 (field-form data); ReductiveGroupsPartII RG2.4 (gap:hermitian-witt-complements); GanGrossPrasadUnitaryGroups §1.1 (slot and split comparison); `Nat.Partition`; LieHighestWeightPartII N0, nilpotent-orbit (gap:rational-nilpotent-orbits); LieHighestWeightPartII N2, classical-partitions; AutomorphicFormsOnReductiveGroups §§4.1–4.2 (gap:rational-fourier-support; gap:bessel-restriction-growth); `QuadraticMap.IsometryEquiv.exists_extension`; `TauCeti.QuadraticMap.det_reflection`; `TauCeti.equivalent_of_equivalent_prod`. The individual Needs lines separate the statement inputs from the indicated proof route.

## Layer 1: Fourier images and first occurrence

### 1.1 Bessel Fourier module

For a specified automorphic embedding C_π of an irreducible representation and a rational Bessel datum O, let B_O(C_π) be the image of C_π under the shared Fourier map f↦[h↦∫_[N] f(nh)ψ(n)^(−1)dn], with its right H(A)-action. Its algebraic span is a right H(A)-module of smooth, left H(F)-invariant functions of moderate growth. Central equivariance and finiteness under the center of the archimedean enveloping algebra are additional properties to prove when a consumer requires them. When the image is cuspidal and lies in a specified cuspidal L² carrier, also form its Hilbert closure there (the following image/carrier comparison specifies the central-character issue); distinguish this closure from the smooth image. Record Fourier support p(C_π) by existence of a nonzero rational-orbit coefficient of each relevant geometric partition, and its maximal elements p^m(C_π) in dominance order, using the supplied general Fourier-support interface. (JZ2020, §2.3, (2.8)–(2.10), pp.754–756; §6.2, (6.9), p.802; JZ2020 line 664).

The image/carrier comparison has a precise target: prove central equivariance and square integrability for every image to which the discrete decomposition is applied. For a split-torus stabilizer, if one central character does not contain the whole image, construct its direct integral and the Mellin transform on a specified dense smooth test domain. Prove that the convergent period is evaluation at the prescribed unitary character and is continuous for that test topology; a singleton of the continuous spectrum is not asserted to have a nonzero orthogonal projection. Prove that these character evaluations suffice for the period-witness steps, and independently place every critical image used for module recovery in a verified fixed-character carrier or a justified sum of such carriers. No assertion of a discrete sum for a non-equivariant unrestricted image follows from vanishing constant terms. A positive split-center direction uses dt/t, so the constant function has infinite squared norm.

The global Bessel periods of the datum are defined here, independently of any Eisenstein family. For f an automorphic form on G and g an automorphic form on H such that h↦B_O(f)(h)g(h) is absolutely integrable on [H], put P_O(f,g)=∫_[H] B_O(f)(h)g(h)dh and Q_O(f,g)=∫_[H] B_O(f)(h)conj(g(h))dh; these ordinary periods are defined exactly on that domain. Absolute integrability holds in two cases, supplied under gap:bessel-restriction-growth: (i) f is cuspidal on G and g has moderate growth, since the Bessel coefficient of a form rapidly decreasing on Siegel sets of G is rapidly decreasing on Siegel sets of H; (ii) g is cuspidal on H, f has moderate growth, and the F-split part of the centre of H is trivial, which holds for every H except the special orthogonal group of a hyperbolic plane. In the remaining case H≅G_m is a split SO₂; for g a Hecke character and f only of moderate growth, cuspidality of g is vacuous and gives no decay along the split centre, and the ordinary integral can diverge, so this pair lies outside the period domain. No theorem below needs it: L²_cusp(H)=L²(F^×\A_F^×) has no irreducible closed invariant subspace, because the factor R_(>0) with dt/t has purely continuous spectrum, and no Hecke character of a split SO₂ has a generic discrete global parameter. Indeed its standard parameter χ⊞χ⁻¹ is a sum of distinct self-dual blocks only if χ²=1 and χ≠χ⁻¹, which is impossible; an elliptic two-dimensional orthogonal parameter of trivial determinant would be η₁⊞η₂ with distinct quadratic η₁,η₂ and η₁η₂=1, which is impossible, or a cuspidal two-dimensional τ of orthogonal type, whose central character ω_τ is a nontrivial quadratic character. Every period in Layers 4–7 is therefore in case (i) or case (ii). The unitary periods are those of GanGrossPrasadUnitaryGroups §§4.1–4.4. The Eisenstein zeta integral of §2.1 is the specialization of P to a Bessel coefficient of an Eisenstein series (JZ2020, (4.7)–(4.8), p.766; JZ2020 line 1132, line 1135, line 1139).

The construction has the following API.

- The Fourier map C_π→B_O(C_π) is surjective onto the smooth image.
- For h∈H(A), B_O(R(h)f)=R(h)B_O(f).
- B_O(C_π)=0 exactly when every coefficient of vectors in that realization is zero.
- In a verified cuspidal L² carrier, the smooth image is dense in its Hilbert closure with the inherited right unitary action; a central quotient requires actual equivariance.
- P_O is bilinear and Q_O is linear in f and conjugate-linear in g; Q_O(f,g)=P_O(f,conj g), and both are invariant under simultaneous right translation by H(A).

A proof route is as follows. Take the image of the specified equivariant linear map; transport its action through the explicit stabilizer identification. Use the supplied support/dominance interface for arbitrary partitions. Take the Hilbert closure only after cuspidality and square-integrability are established.

*Needs:* GanGrossPrasadUnitaryGroups §§4.1–4.4 (unitary); §0.3; AutomorphicFormsOnReductiveGroups §§4.1–4.2 (gap:rational-fourier-support; gap:bessel-restriction-growth).

**Checks.**

- The module depends on its realization when a representation has multiple automorphic copies.
- Changing a rational orbit requires a specified conjugation map, not just equality of partitions.
- At ℓ=0, N=1 and B_O(f) is f restricted to H(A); it is not an integral over the whole ambient group.
- Replacing ψ by ψ^(−1) gives `B_(psi^(-1))(conj f) = conj(B_psi(f))`.
- Two embeddings of the same abstract π are retained as different inputs; equality of π alone cannot identify their support.
- At ℓ=0 on a volume-one anisotropic U₁ with f restricted to the character χ and g=χ, Q_O(f,g)=1 while P_O(f,g)=∫χ²=0 when χ² is nontrivial; the two periods are different functionals.

### 1.2 First occurrence index

For a nonzero irreducible cuspidal realization C_π⊂L²_cusp(G), define ℓ₀(C_π) to be the largest valid Bessel index ℓ for which some rational datum has B_O(C_π)≠0. Valid means the datum exists, in particular 2ℓ+1≤d and ℓ≤r. The set is nonempty: at ℓ=0 a right translate of a nonzero form has nonzero restriction to the chosen H. Select the index, not a canonical rational orbit. Keep every rational first-occurrence datum as a separate argument. (JZ2020, Proposition 2.2, pp.756–757; JZ2020 line 715).

The construction has the following API.

- There exists a rational datum at ℓ₀ with a nonzero coefficient.
- For every valid ℓ>ℓ₀ and every rational datum at ℓ, B_O(C_π)=0.
- An intertwining equality of the actual automorphic embeddings and orbit data preserves ℓ₀; an abstract isomorphism alone is insufficient.

A proof route is as follows. The finite valid-index set contains 0 by right translation of a nonzero form. Take its maximum. This construction uses no genericity of π, and does not assert a realization-independent index.

*Needs:* §1.1; §0.2.

**Checks.**

- The zero automorphic subspace has empty nonzero support and no largest supported index; the nonzero irreducible realization hypothesis excludes it.
- If r=0 and d>0 then ℓ₀=0.
- A support set of Bessel indices {0,2} gives ℓ₀=2, not 0.
- For a split 4-dimensional quadratic space, ℓ=2 cannot occur even though its Witt index is 2.

### 1.3 First-occurrence cuspidality

For any cuspidal realization C_π and every rational first-occurrence Bessel datum O at ℓ₀(C_π), B_O(C_π) is cuspidal on its chosen H: each constant term along every proper F-parabolic of H vanishes. If the image lies in the required L² carrier, its Hilbert closure is nonzero for a datum witnessing first occurrence. Section 1.1 supplies the required image/carrier comparison, including the split-center case. This assertion includes inner forms and unitary groups with the given character conventions. (JZ2020, Proposition 2.2, p.756, citing Ginzburg–Rallis–Soudry Theorem 7.3; JZ2020 line 715).

A proof route is as follows. Expand every proper rational constant term by the supplied root-exchange and Fourier-expansion comparisons. Identify the resulting terms as higher-index coefficients or ambient cuspidal constant terms, hence zero. Prove this tower calculation on every inner form and at index zero, with the smooth archimedean topology. The general template is GRS2011, Theorem 7.3; the inner-form and unitary calculation is part of this theorem.

*Needs:* §1.2; AutomorphicFormsOnReductiveGroups §4.1 (constant-term comparison); AutomorphicFormsOnReductiveGroups §4.2 (cuspidal realization and supplied decay); gap:bessel-restriction-growth; AutomorphicFormsOnReductiveGroups §§4.1–4.2 (gap:rational-fourier-support; gap:bessel-restriction-growth).

**Checks.**

- A nonmaximal Bessel coefficient need not be cuspidal.
- Every proper rational parabolic is covered, not just the Siegel parabolic.
- For a torus, the family of proper parabolics is empty, so every constant-term condition is vacuous; the split SO₂ constant function has infinite dt/t norm.

### 1.4 Multiplicity-free Bessel decomposition

If a Bessel image of a single irreducible automorphic realization lies in the supplied discrete cuspidal Hilbert spectrum with compatible central-character data, its Hilbert closure is a Hilbert direct sum of irreducible cuspidal H(A)-representations with each isomorphism class occurring at most once. The smooth module embeds densely in this decomposition. The statement concerns the image, not all copies of those constituents in L²_cusp(H). (JZ2020, §2.3, equation (2.10), p.756; Theorem 6.6, pp.799–800; JZ2020 line 731).

For a split SO₂ stabilizer, apply the central-character and discrete-spectrum comparison of §1.1; constant-term cuspidality alone does not supply it.

**Orthogonal local Bessel uniqueness.** Let k be a characteristic-zero local field, V,W nondegenerate quadratic spaces with a specified relevant embedding W⊂V and W⊥≃H^j⊥ke, q(e)≠0, j≥0. Fix the rational flag and its generic unitary Bessel character ψ_B, and put R=N⋊SO(W) in SO(V)×SO(W). For irreducible admissible complex representations π of SO(V)(k) and σ of SO(W)(k), prove dim_C Hom_R(π tensor σ,ψ_B)≤1. At finite places these are smooth representations; at infinity they are Casselman–Wallach representations, with completed projective tensor and continuous Hom. This is a local theorem independent of global automorphic realization and of the assertion on distinguished members of packets in §7.2. (AGRS2010, Theorem 1′, PDF p.2, AGRS2010 line 50, line 59, for O in codimension one; Waldspurger2012, Théorème 1, p.313, Waldspurger2012 line 44, and SunZhu2012, arXiv v2 Theorem B, PDF p.2, SunZhu2012 line 66, for SO in codimension one; GGP2012, published Theorem 14.1(i), p.57, Theorem 15.1, pp.59–62, Corollary 15.3 and following remark, pp.62–63, GGP2012 line 2287, line 2351, line 2476; JSZ2010, arXiv v2 Theorem A, PDF p.1, JSZ2010 line 12, line 24.)

A proof route uses the codimension-one O theorem of AGRS2010 with the SO codimension-one theorem of Waldspurger2012 Théorème 1 at finite places and SunZhu2012 Theorem B at infinity, as collected in GGP2012 Theorem 14.1(i), then the published GGP2012 Theorem 15.1 reduction. Retain its auxiliary choice used in Corollary 15.3 (GGP2012 line 2480): a supercuspidal τ of GL_(j+1)(k) outside the Bernstein components of π_V named in Theorem 15.1, twisted by an unramified character so that the induction of τ⊗σ_W to SO(W⊥H^(j+1)) is irreducible. Since σ_W is an arbitrary irreducible representation, not a cuspidal one, this irreducibility is the contract gap:orthogonal-auxiliary-induction, not the generic irreducibility of cuspidal inducing data. At infinity JSZ2010 Theorem A applies to O(p,q) for p≥j, q≥j+1 and O_d(C) for d≥2j+1. Swapping the sign of the real form covers the opposite anisotropic-line sign. Prove the determinant-one version through the SO codimension-one input and the continuous integral reduction recorded after GGP2012 Corollary 15.3; the O bound alone does not identify Hom spaces on SO. Transport the complete flag, character and smooth dual in every comparison.

*Needs:* §§0.1–0.3 (orthogonal relevant pair and character); SmoothRepresentationsOfLocalGroups SR.0.1–SR.0.4 (smooth contragredients), SR.2.2 (induction) and SR.3.1–SR.3.2 (supercuspidal and Bernstein support); SmoothRepresentationsOfLocalGroups SR.3.1, generic-irreducibility (gap:orthogonal-auxiliary-induction); AutomorphicFormsOnReductiveGroups §2.7 (Casselman–Wallach globalization and continuous tensors).

**Checks.**

- For j=0, N=1, so the assertion is the adjacent restriction bound, with no nontrivial unipotent character. For V=k, W=0 both SO groups are trivial, and the irreducible trivial pair has Hom dimension 1.
- For real O(p,q), j=1 requires p≥1 and q≥2 in the negative-line convention; (p,q)=(1,2) is admitted, while (1,1) has dimension 2<3 and is excluded.
- If an element n of N has ψ_B(n)=−1 and both representations act trivially on n, equivariance gives b=−b, hence b=0 over C; replacing ψ_B by the trivial character would lose this exclusion.
- For j=1, W=0 and σ_W trivial, the auxiliary induction is from GL₂×SO₀ to SO(H²), a cuspidal datum; for W of dimension 3 and σ_W an irreducible principal series of SO₃, τ⊗σ_W is not cuspidal on GL₂×SO₃, so the generic irreducibility of cuspidal inducing data does not supply the irreducibility the reduction needs.
- In the auxiliary contract, W=0 and t=1 give SO(H)≅G_m, whose stabilizer of an isotropic line is the whole group, so the induction is τ|·|^s itself; W a hyperbolic plane and t=1 give split SO₄, where the stabilizer of an isotropic line has Levi GL₁×SO(H)≅GL₁×GL₁ and is a Borel subgroup, not a maximal parabolic.
- Two copies of the trivial SO₁ representation have Hom dimension 2, whereas a single copy has dimension 1; irreducibility is necessary. The O-to-SO route retains the determinant-one group throughout.

**Multiplicity-free global image.** A proof route for the global assertion is as follows. Apply the imported discrete cuspidal spectral decomposition to the closed image. A repeated constituent would give two independent global Bessel maps. Factor at one place using fixed vectors elsewhere and local uniqueness, with the continuous archimedean tensor product topology.

*Needs:* §1.1; GanGrossPrasadUnitaryGroups §§2.1–2.6 (unitary); SmoothRepresentationsOfLocalGroups SR.2.2; GanGrossPrasadUnitaryGroups §§4.1–4.4 (unitary); the orthogonal local Bessel-uniqueness target above; gap:bessel-restriction-growth; AutomorphicFormsOnReductiveGroups §4.2 (fixed-central-character discrete carrier); §1.1 (image comparison); AutomorphicFormsOnReductiveGroups §§3.4–3.5 (restricted tensors).

**Checks.**

- The sum is a Hilbert sum, not an asserted finite algebraic sum.
- No multiplicity-one assertion for the full even-SO automorphic spectrum is used.
- If a putative closed image is σ⊕σ, its two coordinate projections give two independent Bessel maps, contradicting dimension at most 1; σ⊕ρ with σ not isomorphic to ρ has one map to each and is allowed.

### 1.5 Generic Summand proposition

For a cuspidal isomorphism class π with a G-relevant generic discrete global parameter φ, the Generic Summand proposition for π is the proposition that there exist an automorphic realization C_π, a rational first-occurrence datum O at ℓ₀(C_π), a cuspidal σ on H_O with a relevant generic discrete global parameter, a realization C_σ, and vectors f∈C_π,g∈C_σ with Q_O(f,g)=∫_[H_O] B_O(f)(h)conj(g(h))dh≠0. It is an existence proposition (Conjecture 2.3), not an axiom or a theorem for all generic packets. (JZ2020, Conjecture 2.3, pp.756–757; §7.1, pp.807–808; JZ2020 line 743).

The construction has the following API.

- A proof supplies C_π,O,σ,C_σ,f,g with the stated first-occurrence and nonvanishing properties.
- Using first-occurrence cuspidality and the verified discrete Hilbert carrier of the image/carrier comparison in §1.1, a witness gives a nonzero projection onto the σ-isotypic subspace.
- Q_O(f,g)=P_O(f,conj g), so its local bilinear models involve σ∨, not automatically σ.

A proof route is as follows. Form the quantified proposition using the actual automorphic embeddings and Hermitian branch of the shared period. Theorems proving particular cases must supply these witnesses. Relating it to the paper’s bilinear unfolding requires the pairing dictionary in Layer 4.

*Needs:* §1.2; GanGrossPrasadUnitaryGroups §§4.1–4.4 (unitary); §1.1 (orthogonal Bessel periods); gap:bessel-restriction-growth; ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23 (gap:coherent-packets-comparison; gap:generic-discrete-member-cuspidality; gap:standard-base-change-uniqueness); GanGrossPrasadUnitaryGroups §§4.3–4.4 (unitary comparison).

**Checks.**

- Generic parameter does not mean the representation has a Whittaker model.
- The choice is existential in C_π; no assertion is made for every copy.
- For a nonquadratic character χ of an anisotropic U₁, ∫χ·conjχ is its positive volume, while ∫χ·χ=0.
- A generic constituent at an index strictly below ℓ₀ is not a witness.
- One witnessing realization suffices even when the cuspidal multiplicity is two; the definition is not universal in realizations.

### Examples

An anisotropic input has r=0, first occurrence 0 and restriction as its coefficient. An abstract support set {0,2} has maximal index 2; it selects no rational orbit. On a volume-one U₁ character the Hermitian projection has value 1 while its self-bilinear period is 0.

### Dependencies

This layer uses GanGrossPrasadUnitaryGroups §§4.1–4.4 (unitary); §1.1 (orthogonal Bessel periods); gap:bessel-restriction-growth; §0.3; AutomorphicFormsOnReductiveGroups §§4.1–4.2 (gap:rational-fourier-support; gap:bessel-restriction-growth); §0.2; AutomorphicFormsOnReductiveGroups §4.1 (constant-term comparison); AutomorphicFormsOnReductiveGroups §4.2 (cuspidal realization and supplied decay); gap:bessel-restriction-growth; GanGrossPrasadUnitaryGroups §§2.1–2.6 (unitary); §1.4 (orthogonal); SmoothRepresentationsOfLocalGroups SR.2.2; AutomorphicFormsOnReductiveGroups §4.2 (fixed-central-character discrete carrier); §1.1 (image comparison); AutomorphicFormsOnReductiveGroups §§3.4–3.5 (restricted tensors); ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23 (gap:coherent-packets-comparison; gap:generic-discrete-member-cuspidality; gap:standard-base-change-uniqueness); GanGrossPrasadUnitaryGroups §§4.3–4.4 (unitary comparison). The orthogonal local target also uses SmoothRepresentationsOfLocalGroups SR.0.1–SR.0.4 and SR.3.1–SR.3.2, SmoothRepresentationsOfLocalGroups SR.3.1, generic-irreducibility (gap:orthogonal-auxiliary-induction), and AutomorphicFormsOnReductiveGroups §2.7. The individual Needs lines separate the statement inputs from the indicated proof route.

## Layer 2: Bessel–Eisenstein unfolding

### 2.1 Bessel–Eisenstein zeta integral

Let X=H^a⊥W with dim W=m, H_X=Isom(X)°, and P_a the parabolic stabilizing the a-dimensional isotropic subspace span(e_1,…,e_a), with Levi `Res_(E/F)(GL_a) x H_W` (§0.1). For an irreducible unitary generic isobaric τ on GL_a(A_E) and an irreducible automorphic σ on H_W with a specified realization, use normalized induction `I_s = Ind_(P_a(A))^(H_X(A))(tau |det|_E^s tensor sigma)`, including `delta_(P_a)^(1/2)`. Let E(f_s,s) be the meromorphic Eisenstein family, defined from the isobaric inducing data through the imported continuation theory. For a valid rational Bessel datum of index ℓ on H_X, with stabilizer G and cuspidal realization C_π on G, put `Z(s,f_s,v) = P_ell(E(f_s,s),v) = integral_[G] B_ell(E(f_s,s))(g) v(g) dg`. This is the bilinear period. G is required to have trivial F-split centre, which excludes only the special orthogonal group of a hyperbolic plane; that group carries no cuspidal realization (§1.1). Then Z converges absolutely away from the poles of E by case (ii) of §1.1. Normalize the compact unipotent quotient to volume 1 and retain a compatible Haar measure on [G]. (JZ2020, §4.1, (4.1)–(4.10), pp.764–767; JZ2020 line 1092, line 1135).

The construction has the following API.

- For fixed s in the convergence region, Z is linear in both the section and the cuspidal vector.
- The global map belongs to `Hom_(G semidirect N)(I_s, pi^vee tensor psi)` with the bilinear convention.
- For holomorphic sections Z is meromorphic; since G has trivial F-split centre, it is holomorphic wherever this Eisenstein family is holomorphic.

A proof route is as follows. Use the existing normalized induced representation and Eisenstein family; σ need not be cuspidal for the geometric unfolding, but the applications in Layers 4–7 impose cuspidality. Compose the Eisenstein Fourier map with the period functional of §1.1: since G has trivial F-split centre, the rapid decay of v on [G] and the locally uniform moderate growth of E give holomorphy wherever E is holomorphic.

*Needs:* §0.6; AutomorphicSpectralTheory §§1.1–1.5 and §2.4 (normalized induced family); AutomorphicSpectralTheory §2.14 (isobaric automorphic realization); AutomorphicSpectralTheory §§2.4, 2.4a and 2.14 (isobaric continuation with smooth sections; gap:isobaric-eisenstein-continuation only for noncuspidal σ); GanGrossPrasadUnitaryGroups §§4.1–4.4 (unitary); §1.1 and gap:bessel-restriction-growth; AutomorphicSpectralTheory §§2.4, 2.4a and 2.14 (isobaric continuation with smooth sections).

**Checks.**

- The π argument is not conjugated in Z.
- Restriction to a Bessel subgroup has its own decay theorem; ambient rapid decay is not by itself its proof.
- The excluded split-SO₂ stabilizer is not a removable technicality: on SO₃≅PGL₂ over Q with a=1, W a line, ℓ=0 and G the split stabilizer, take E(z,u)=Σ Im(γz)^u, which is regular at u=0 with E(z,0)=1, and v=1. The truncation-regularized torus integral of E(iy,u) against dy/y is Λ(u)Λ(1−u)/Λ(2u)=Λ(u)²/Λ(2u) with Λ(u)=π^(−u/2)Γ(u/2)ζ(u); since Λ(u)∼−1/u and Λ(2u)∼−1/(2u), it behaves like −2/u at u=0, a pole where E is holomorphic, caused by the exponent u of the constant term reaching 0.
- Removing δ_P^(1/2) changes the s-shift in the Euler factor, so does not give this integral.
- At ℓ=0 the Fourier map is restriction and Z is the bilinear integral of restricted E times v.
- Multiplying v by i multiplies Z by i, whereas replacing the bilinear period by a Hermitian pairing in that argument gives −i.

### 2.2 Bessel functional factorization

For factorizable global data and s where each relevant local induced module is irreducible, the local spaces `Hom_(G_v semidirect N_v)(I_(s,v), pi_v^vee tensor psi_v)` have dimension at most 1. If Z is nonzero, fix nonzero local functionals and normalized unramified vectors. Then `Z = c * product_v l_v(f_(s,v),v_v)` for one nonzero scalar c depending on those choices. The explicit Euler integrals give its meromorphic continuation in s. Absorbing c into one ramified functional is permitted only when recorded. No uniqueness assertion for every reducible `I_(s,v)` is made. (JZ2020, §4.1, (4.11)–(4.13), pp.766–767; §4.3, pp.769–770; JZ2020 line 1165).

A proof route is as follows. Use local uniqueness at generic irreducible parameters and restricted tensor product factorization. Evaluate the global functional on a reference pure tensor to identify c; compare the explicit unfolded factors on the common convergence chamber and continue the resulting identity.

*Needs:* §2.1; GanGrossPrasadUnitaryGroups §§2.1–2.6 (unitary); §1.4 (orthogonal); SmoothRepresentationsOfLocalGroups SR.2.2; GanGrossPrasadUnitaryGroups §§4.1–4.4 (unitary); §1.1 (orthogonal Bessel periods); gap:bessel-restriction-growth; AutomorphicFormsOnReductiveGroups §§3.4–3.5 (restricted tensors); SmoothRepresentationsOfLocalGroups SR.2.1–SR.2.3 (gap:twisted-jacquet-filtration).

**Checks.**

- A zero global functional is not normalized to a nonzero product.
- The scalar cannot disappear merely because the local Hom spaces have dimension one.
- For local scalar values 2 and 3 and global value 30, the factorization scalar is 5; uniqueness alone gives no reason to replace 30 by 6.

### 2.3 Relative Bruhat cells

For the subspace parabolic P_a of §2.1 and the complete-flag parabolic of index ℓ of H_X, whose unipotent radical is N_ℓ (§0.1), construct the relative Bruhat decomposition needed for P_a(F)\H_X(F)/(G(F)N_ℓ(F)). Its coarse Weyl representatives `epsilon_(alpha,beta)` have 0≤α≤β≤a and a≤ℓ+β−α≤a+r_W; refine each coarse cell by its residual rational stabilizer orbits. Give the actual block permutation, the intersection unipotents and the compatible quotient measures. In type D retain the determinant-one exceptional Weyl branches; the inequalities alone are not a complete uniform indexing theorem for SO. (JZ2020, §4.2, pp.767–769, especially Proposition 4.1, pp.768–769, and (4.14)–(4.16), pp.768–769; §4.7, pp.781–782; JZ2020 line 1190, line 1235).

A proof route is as follows. Compute relative isotropic intersection dimensions and choose adapted bases to obtain the block representatives. Compute the stabilizer in each representative and separate SO from O; ReductiveGroups Layer 7 supplies the split parabolic double cosets, while this target proves the relative nonsplit isotropic-flag classification, residual rational orbit refinement and determinant-one comparisons.

*Needs:* §0.1; §0.3; ReductiveGroups Layer 7 (split rational parabolic double cosets).

**Checks.**

- The inequalities filter valid cells but do not replace the residual orbit quotient.
- The a=ℓ and a=ℓ+1 boundaries give the indicated open representatives.
- For a=1,ℓ=0,r_W=0 the inequalities give only (α,β)=(0,1); for a=1,ℓ=1,r_W=0 they give (0,0) and (1,1). The open representative changes from β=1 to β=0.

### 2.4 Open-cell reduction

In the absolute-convergence chamber, expansion of B_ell(E(f_s,s)) followed by the cuspidal π-period kills every α>0 cell by its nontrivial character, and every remaining nonopen stabilizer cell by a proper constant term of π. The surviving coarse representative has α=0, β=max(a−ℓ,0), with the residual open representative η and its explicit stabilizer. Hence Z(s,f_s,v) equals the single open-cell integral attached to η and its stabilizer, with the outer character and every quotient measure transported through the representative. This target stops at that surviving open-cell integral; its identification with an inner Bessel period is §2.6. (JZ2020, §§4.2–4.5, pp.768–779; JZ2020 line 1256).

A proof route is as follows. First integrate a character-nontrivial root subgroup in α>0 cells. For the other nonopen terms identify a proper F-parabolic in G whose constant term occurs. Cuspidality kills it. Identify the surviving η-stabilizer and its character, using the block representatives, intersection unipotents and quotient measures of §2.3.

*Needs:* §2.3; §2.1; AutomorphicFormsOnReductiveGroups §4.1 (constant-term transitivity).

**Checks.**

- The case a≤ℓ is included, although the residue application uses a>ℓ.
- For a=1 and r_W=0, the surviving representative is (α,β)=(0,1) at ℓ=0 and (0,0) at ℓ=1, matching β=max(a−ℓ,0)=1 and 0; the remaining cell (1,1) at ℓ=1 has α=1>0 and is killed by its character.
- On a volume-one C₂ root quotient, the nontrivial-character integral is (1−1)/2=0 and the trivial-character integral is 1; deleting the character would retain a forbidden cell.

### 2.5 Whittaker induction transform

For a>ℓ, β=a−ℓ, put τ in its Whittaker model with the character determined by the open cell. On a convergent section f_s define `J_s(f_s)(g) = integral_(U^-_(a,eta)(A)) f_s(u epsilon_beta eta g) psi_(a+m+ell,a-ell)(u) du`. The root subgroup `U^-_(a,eta)` is the intersection appearing in (4.32); its coordinate-free definition is the open-cell unipotent quotient of §2.3 (Relative Bruhat cells). The value is in `sigma^(Ad(w_q^ell))` and the resulting function transforms under `R_(beta-1)` by `psi_(beta-1,y_(-kappa))` and that representation, as in Proposition 4.2 (JZ2020 line 1566). Provide the local transform on smooth nonarchimedean and Casselman–Wallach archimedean sections, and its meromorphic continuation as an operator-valued family. (JZ2020, §4.4, (4.28)–(4.39), pp.774–776; Appendix A (A.4)–(A.5), pp.811–812; JZ2020 line 1520).

The construction has the following API.

- J_s is a G-equivariant map to the smooth induced `R_(beta-1)`-model with the specified character ψ_(β−1,y_(−κ)) and σ-twist.
- With compatible measures, the global transform of a pure section factors into its local transforms in the convergence chamber.
- A section supported compactly in the open cell is evaluated by precisely the displayed U^- integral, retaining the inducing modulus.

A proof route is as follows. Take the GL_a Whittaker coefficient, then the indicated open-cell unipotent integral. Its source is the smooth normalized I_(s,v); its target is the smooth induced R_(β−1)-model with σ^t-valued functions, using continuous Casselman–Wallach spaces at infinity. Prove equivariance by changes of variables, retaining the character ψ_(β−1,y_(−κ)), twist and modulus. Supply the cell-integral estimates for meromorphic continuation as a continuous operator family, both nonarchimedean and archimedean; continuation is a theorem about this constructed operator.

*Needs:* §2.4; AutomorphicLFunctionsAndLocalFactors AL.3.1.2, The Whittaker realization; AutomorphicFormsOnReductiveGroups §2.7 (Casselman–Wallach globalization); AutomorphicSpectralTheory §0.15 (common-denominator Laurent operators).

**Checks.**

- The representation in the target is the twisted σ, not a scalar.
- At β=1 the inner Bessel index β−1 is 0 and the transformation law becomes restriction.
- a=ℓ+1 gives an index-zero inner model, not an index-one Fourier coefficient.
- Replacing inducing σ by `sigma^(Ad(w_q^ell))` makes the output inner coefficient take values in σ because the normalizer has square 1.
- A scalar-valued Fourier transform cannot replace J_s when σ has dimension greater than 1.
- Pairing the ψ-equivariant transform with the inner functional of character ψ⁻¹ gives ψ(n)ψ(n)⁻¹=1. For ψ(n)=i, using ψ⁻¹ on both sides gives ψ(n)⁻²=−1, so the integrand would fail to descend.

### 2.6 Inner Bessel datum and period comparison

Start from the surviving open-cell integral of §2.4. In the a>ℓ open cell, identify the unipotent subgroup `N_ell^eta`, its reductive stabilizer `H_W^(Ad(w_q^ell))` and its inverse character with the shared Bessel datum of index β−1 on G, β=a−ℓ. The stabilizer space is the given W with the transported embedding, not an abstract group of the same dimension. For a≤ℓ identify the corresponding datum of index ℓ−a on H_W and its character. Thus the two inner integrals are exactly P(π,σ^t) and P(σ,π), respectively, with no extra dual suppressed; for a>ℓ, Z(s,f_s,v) is the integral over R_(β−1)(A)\G(A) of the inner period, with inverse character, of R(g)v against the transform J_s(f_s)(g) of §2.5. Consequently, if the relevant inner period vanishes identically, Z vanishes for all data. The special application induces from σ^t so that the first inner period is P(π,σ). (JZ2020, Propositions 4.2–4.3, (4.30)–(4.36), pp.774–776; Corollaries 4.4 and 4.6, pp.776,779; (4.42)–(4.46), pp.778–779; §4.7, pp.781–782; JZ2020 line 1610, line 1627, line 1769).

A proof route is as follows. Compute the open-cell stabilizer’s action on the middle form and character. Use the explicit isometry of §0.6 (Ambient datum for a prescribed relevant pair) to match the relevant pair and compare its Hermitian convention before identifying functionals. Insert the transform of §2.5 in the a>ℓ cell and unfold the inner integral.

*Needs:* §2.4; §2.5; §0.6; GanGrossPrasadUnitaryGroups §§2.1–2.6 (unitary); §1.4 (orthogonal); SmoothRepresentationsOfLocalGroups SR.2.2.

**Checks.**

- Vanishing of the appropriate inner period forces Z=0 for all data; the a>ℓ and a≤ℓ cases use the inner periods of (π,σ^t) and (σ,π), respectively.
- The exponent of the outer twist is the ambient Bessel index.
- The a>ℓ inner index is a−ℓ−1, with no off-by-one shift.
- For a=3,ℓ=2, β−1=0; for a=ℓ=2, ℓ−a=0. The two formulas meet different ambient models even though both inner indices are zero.
- If t exchanges two labels σ₁,σ₂, inducing σ₁ gives inner σ₂ and inducing σ₂ gives inner σ₁; applying t twice gives the original label.
- Replacing the norm-one torus SO₂ over R by the split torus R^×, which is isomorphic to it only after extending scalars to C, matches dimensions but changes the real split rank from 0 to 1 and compactness, and fails the prescribed-embedding contract.

### Examples

At a=ℓ+1 the inner index is 0; at a=ℓ the second branch also has index 0. For a=1,ℓ=0,r_W=0 the only coarse cell is (0,1), but residual rational data are still part of the cell label.

### Dependencies

This layer uses §0.6; AutomorphicSpectralTheory §§1.1–1.5 and §2.4 (normalized induced family); AutomorphicSpectralTheory §2.14 (isobaric automorphic realization); AutomorphicSpectralTheory §§2.4, 2.4a and 2.14 (isobaric continuation with smooth sections; gap:isobaric-eisenstein-continuation only for noncuspidal σ); GanGrossPrasadUnitaryGroups §§4.1–4.4 (unitary); §1.1 (orthogonal Bessel periods); gap:bessel-restriction-growth; AutomorphicSpectralTheory §§2.4, 2.4a and 2.14 (isobaric continuation with smooth sections); GanGrossPrasadUnitaryGroups §§2.1–2.6 (unitary); §1.4 (orthogonal); SmoothRepresentationsOfLocalGroups SR.2.2; AutomorphicFormsOnReductiveGroups §§3.4–3.5 (restricted tensors); SmoothRepresentationsOfLocalGroups SR.2.1–SR.2.3 (gap:twisted-jacquet-filtration); §0.1; §0.3; ReductiveGroups Layer 7 (split rational parabolic double cosets); AutomorphicFormsOnReductiveGroups §4.1 (constant-term transitivity); AutomorphicLFunctionsAndLocalFactors AL.3.1.2, The Whittaker realization; AutomorphicFormsOnReductiveGroups §2.7 (Casselman–Wallach globalization); AutomorphicSpectralTheory §0.15 (common-denominator Laurent operators). The individual Needs lines separate the statement inputs from the indicated proof route.

## Layer 3: Local integrals and Euler factors

### 3.1 Local Bessel zeta integral

Over k=F_v fix a nonzero continuous local Bessel functional b_v for the inner datum. If a>ℓ define `Z_v(s,f_s,v) = integral_(R_(beta-1)(k)\G(k)) b_v(pi_v(g)v,J_(s,v)(f_s)(g)) dg` with β=a−ℓ and inducing σ^t. If a≤ℓ define `Z_v = integral_(N_ell^eta(k)\N_ell(k)) b_v(R(n)f_s,v) psi_ell(n)^(-1) dn`, where b_v is the functional on the GL_a-Whittaker realization with the (ℓ−a)-Bessel functional of σ as in (4.45). Define these first in an absolute-convergence half-plane and then by meromorphic continuation. At archimedean v use jointly continuous functionals on the completed smooth tensor product; algebraic Jacquet coinvariants alone do not define this integral. (JZ2020, §4.4, (4.40)–(4.41), pp.776–777; §4.5, (4.45)–(4.46), p.779; Appendix A (A.1)–(A.3), pp.810–811; JZ2020 line 1650).

The construction has the following API.

- Z_v is linear in the section and π-vector and in the chosen inner functional.
- The integrand descends to R\G in the first case by cancellation of the ψ-equivariant transform with the ψ⁻¹ inner functional of (A.2), and to N^η\N in the second by the corresponding character cancellation.
- For a holomorphic smooth section, Z_v is a meromorphic scalar function of s; no holomorphy at all s is asserted.

A proof route is as follows. Check quotient invariance using the two equivariance laws, including the inverse outer character. Use decay estimates for the Whittaker section and the inner functional to prove convergence. For a>ℓ continue Z_v through the operator-valued meromorphic continuation of the transform in §2.5; for a≤ℓ prove the continuation of the unipotent integral directly. The Euler, spherical and nonvanishing targets of this layer use this continuation.

*Needs:* §2.6; §2.5; GanGrossPrasadUnitaryGroups §§2.1–2.6 (unitary); §1.4 (orthogonal); SmoothRepresentationsOfLocalGroups SR.2.2; SmoothRepresentationsOfLocalGroups SR.2.1–SR.2.3 (gap:twisted-jacquet-filtration); AutomorphicFormsOnReductiveGroups §2.7 (Casselman–Wallach globalization).

**Checks.**

- In the normalized split U(1,1)⊃U₁ spherical fixture of §3.4 at s=1/2 with trivial characters, X=Y=1/q gives Z_v=(1−q⁻²)/(1−q⁻¹)², equal to 3 at q=2 and to 2 at q=3; rescaling the inner functional by 2 at q=2 gives 6, so the local integral is not independent of the normalization of b_v.
- If a quotient translation n has ψ(n)=i, the ψ-equivariant transform and the ψ⁻¹-equivariant inner functional contribute i and −i, with product 1, so the integrand descends; using ψ on both sides gives i·i=−1 and the integrand is not invariant.
- For (a,ℓ)=(1,1) the second formula applies with inner index ℓ−a=0, whereas (a,ℓ)=(2,1) uses the first quotient R_0\G with inner index a−ℓ−1=0; the two index-zero functionals live on different groups.

### 3.2 Euler product of the zeta integral

On factorizable data and for Re(s) sufficiently large, Z=c∏_v Z_v, provided the appropriate inner global period is nonzero. For a>ℓ the inner pair is (π,σ^t), and for a≤ℓ it is (σ,π); zero inner period implies Z≡0 for all data. The identity continues meromorphically wherever the local integrals do. The scalar c is determined by the global-to-local period normalization; normalize one factor explicitly to make c=1 if desired. (JZ2020, Theorems 4.5 and 4.7, Corollaries 4.4 and 4.6, pp.775–779; JZ2020 line 1670).

A proof route is as follows. Insert the identified inner period into the open-cell formula. Factor the Whittaker transform and inner Bessel functional; use absolute convergence for Fubini in the chamber. Use uniqueness of meromorphic continuation, keeping the same fixed normalization scalar.

*Needs:* §2.2; §2.4; §2.6; §3.1.

**Checks.**

- A global zero-period case is stated separately.
- The formula includes the case a≤ℓ and its actual character.
- For local values 2 and 3 with scalar 5, Z=30; if the inner global functional is zero, Z=0 for all sections, and division by it cannot define normalized local data.

### 3.3 Standard local L-ratio

For π,σ with relevant generic global parameters, define this roadmap's local ratio ℒ_v(s;τ,π,σ)=L_v(s+1/2,τ×φ_π)/(L_v(s+1,τ×φ_σ∨)L_v(2s+1,τ,ρ)), with the standard parameters normalized as in Conventions and π the representation against which the bilinear integral of §2.1 is taken. Here ρ=∧² if H_X is even orthogonal, ρ=Sym² if it is odd orthogonal, and `rho = Asai^((-1)^m)` for U(X), where m=dim_E W. Orthogonal standard parameters are self-dual, so for orthogonal groups ℒ_v is the published ratio. In the unitary case the two placements of duals are fixed by computations made here, not read from printed notation. The cross factor is the L-function of the dual Levi acting on the Lie algebra of the unipotent radical of the dual parabolic, whose GL_a×U(W) block has the weights of τ×φ_σ∨. The numerator is fixed by the determinant-twist invariance in the API below, already in the case m=0, which has no cross factor. Both published displays (4.47) and (5.13) print the unmarked arguments τ×π and τ×σ, and the paper forms its zeta integral (4.9) with the Hermitian inner product (4.8); the unitary labels of ℒ_v are not transcribed from those displays. Use standard local parameters for ramified and archimedean factors, not a gcd definition. (JZ2020, §4.1, (4.8)–(4.9), p.766; §4.6, (4.47), p.780; (4.48), p.781; §5.1, (5.3)–(5.4), p.783; §5.3, (5.13), p.787; JZ2020 line 1145, line 1826, line 2130).

The construction has the following API.

- At a spherical place these parameter factors agree with the Satake determinant factors.
- Tensor factors multiply over τ=⊞τ_i; the ρ factor also includes the cross terms prescribed by ρ.
- O-conjugate even-SO standard parameters yield equal meromorphic ratios.
- For a character η of E¹ and η′(x)=η(x/c(x)), the unitary ratio is unchanged under (τ,σ,π)↦(τ⊗η′∘det,σ⊗η∘det,π⊗η⁻¹∘det), the twist that leaves the bilinear integrand of §2.1 unchanged: φ_π and φ_σ∨ are both multiplied by η′⁻¹∘det, and η′ is trivial on A_F^×, so the Asai factor is unchanged.

A proof route is as follows. Apply tensor, exterior, symmetric and signed-Asai operations to the imported local parameters. Define the meromorphic quotient after identifying the absolute-value and local reciprocity conventions. The missing ramified Asai/tempered-factor exports are requested from AutomorphicLFunctionsAndLocalFactors AL.4.

*Needs:* AutomorphicLFunctionsAndLocalFactors AL.4.1.1, The unramified L-group Euler factor; AutomorphicLFunctionsAndLocalFactors AL.4.2.1, Transport of supplied local parameter comparisons; ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23 (gap:coherent-packets-comparison; gap:generic-discrete-member-cuspidality; gap:standard-base-change-uniqueness); GanGrossPrasadUnitaryGroups §§4.3–4.4 (unitary comparison); ModularityAndLanglandsExtensions §3.15; ModularityAndLanglandsExtensions §3.12; ModularityAndLanglandsExtensions §3.16; AutomorphicLFunctionsAndLocalFactors AL.4.2.1, Transport of supplied local parameter comparisons (gap:all-place-signed-factors); EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.4 (shared unitary packets and normalization premises).

**Checks.**

- Outer-conjugating even-SO σ preserves the standard parameter up to O-conjugacy and hence this ratio.
- A two-eigenvalue parameter (x,y) contributes xy to ∧² and x²,xy,y² to Sym²; these cannot be interchanged.
- For m=1 use the negative Asai sign and for m=2 the positive sign; using floor(m/2) gives the wrong sign at m=1.
- Split U(1,1), a=1, m=0, ℓ=0, q=2, s=1/2, T=q^(−s−1/2)=1/2: for τ=(1,1) and φ_π=(1,1) the ratio is (1−T)⁻²/(1−T²)⁻¹=4/(4/3)=3. The twist with η(ϖ)=i gives τ=(i,−i) and φ_π=(−i,i) with an unchanged integrand; the numerator weights χ₁β=1 and χ₂β⁻¹=1 keep the ratio 3, whereas τ×φ_π∨ would have weights −1,−1, factor (1+T)⁻²=4/9 and ratio 1/3.
- Split U₃, a=1, m=1: for τ=(χ₁,χ₂) and φ_σ=(μ,μ⁻¹) the dual Levi has diagonal characters (χ₁,μ,χ₂⁻¹) and cross roots χ₁μ⁻¹ and μχ₂, the weights of τ×φ_σ∨. The L-group test coordinates (χ₁,χ₂,μ)=(2,3,5) give 2/5 and 15, whereas τ×φ_σ would give 10 and 3/5; for χ₁=μ=i and χ₂=−i the weights are 1,1 with factor (1−T)⁻²=4 at T=1/2, against 4/9 for the undualized weights −1,−1.
- For a conjugate-self-dual U₁ base change φ_π=χ with χ² nontrivial, the numerator weight is χ⁻¹χ=1 at τ=χ⁻¹=φ_π∨ and χ² at τ=χ; conjugate self-duality alone does not make τ=φ_π a self-pair.

### 3.4 Unramified Bessel integral calculation

At each unramified finite place with a hyperspecial fixed vector, conductor-zero additive character, hyperspecial mass 1, spherical Whittaker value 1, normalized section and inner Bessel value 1, prove Z_v(s)=ℒ_v(s). Include every unramified orthogonal form and split and nonsplit unitary groups in both index regimes; no spherical assertion is made for a ramified form without the specified hyperspecial datum. In the unitary case the argument labels are those of §3.3 under the base-change normalization of Conventions: τ×φ_π in the numerator and τ×φ_σ∨ in the cross factor. (JZ2020, Theorem 4.8 and (4.48), p.781; [43], bibliography p.823; Zhang2022, Theorem 1.1, PDF pp.2–3; §§3–5, PDF pp.4–7; JZ2020 line 1869).

A proof route is as follows. Use the supplied spherical Whittaker and Cartan-volume formulas to evaluate the Weyl-character series. Compare with the descent-integral and Whittaker–Shintani route of Zhang2022, Theorem 1.1, PDF pp.2–3, and §§3–5, PDF pp.4–7, Zhang2022 line 87, line 166. Establish all needed cell estimates and the split GL calculation directly: a statement restricted to nonsplit places does not supply this uniform evaluation.

*Needs:* §3.3; §3.1; SmoothRepresentationsOfLocalGroups SR.4.1–SR.4.4 (gap:spherical-whittaker-normalization).

**Checks.**

- The normalization of b_v is an extra choice, not a consequence of a spherical vector value.
- The leading term in the Euler series is 1.
- In a two-eigenvalue factor with x=1,y=−1 and T=1/2, the determinant denominator is 3/4 and the L-factor 4/3; its constant coefficient is 1.
- A ramified representation with zero hyperspecial fixed space has no vector with spherical Bessel value 1, so it does not meet the hypotheses.
- Split U(1,1)⊃U₁ with a=1, m=0, ℓ=0, odd residue characteristic, κ=2, τ=(χ₁,χ₂) and π=β: the open orbit of the embedded split torus U₁(F_v)≅F_v^×, x↦(x,x⁻¹), fixing the chosen nonisotropic line, has trivial stabilizer, and the Iwasawa decomposition of its elements gives Z_v=Σ_(n≥0)X^n+Σ_(n≥1)Y^n=(1−XY)/((1−X)(1−Y)) with X=χ₁(ϖ)β(ϖ)T, Y=χ₂(ϖ)β(ϖ)⁻¹T and T=q^(−s−1/2). This is L(s+1/2,τ×φ_π)/L(2s+1,τ,Asai⁺) for φ_π=(β,β⁻¹). At q=3, s=1/2 and trivial characters it equals (8/9)/(4/9)=2; the dual reading τ×φ_π∨ would give 1/2 after the twist with η(ϖ)=i.

### 3.5 Tempered local factors and ramified normalizers

For the standard modules of the actual generic unitary global inputs to §3.3, apply the supplied tempered-factor regularity and strict complementary-exponent theorem to prove that the shifted local numerator L_v(1,τ×φ_π) and denominators L_v(3/2,τ×φ_σ∨)L_v(2,τ,ρ) are finite and nonzero at s=1/2. Include all archimedean Gamma shifts, ramified factors and split unitary parameters. This is the shifted-integral comparison; the general tempered theorem and unitary-dual classification are supplied, not constructed here. (JZ2020, §5.3, proof of Proposition 5.6, pp.789–790; Appendix B (B.5)–(B.7), p.819; JZ2020 line 2223).

A proof route is as follows. For every factor in the supplied standard-module decomposition list its shifted tempered argument. With paired exponents α,β strictly less than 1/2, the smallest numerator argument 1−α−β is strictly positive; the denominator arguments are at least 3/2−α−β and 2−2α. Apply the supplied all-place regularity at these exact arguments; a boundary theorem valid only in an open half-plane is never applied at zero.

*Needs:* §3.3; ModularityAndLanglandsExtensions §3.25; AutomorphicFormsOnReductiveGroups §2.6 (archimedean generic unitary dual); AutomorphicLFunctionsAndLocalFactors AL.4.2.1, Transport of supplied local parameter comparisons (gap:all-place-signed-factors); AutomorphicSpectralTheory §2.9 (generic standard modules and strict GL exponents).

**Checks.**

- A theorem for Re(z)>0 cannot be used at z=0.
- Strict exponents α<1/2 are retained at the boundary s=1/2.
- With α=1/3,β=1/4 the smallest numerator argument is 5/12, the cross-denominator argument is 11/12 and the type-denominator argument is 4/3; all are positive. At α=β=1/2 the first becomes 0, outside the supplied regularity range.

### 3.6 Open-cell local nonvanishing

Let a>ℓ and b_v be a nonzero admissible local inner Bessel functional with b_v(v_π,v_σ)≠0. For every s₀∈C there exists a holomorphic smooth section f_s in the Whittaker induction from σ^t such that Z_v(s,f_s,v_π) is regular and nonzero at s₀. It may be chosen with compact support modulo P_a inside the open cell, using smooth archimedean rather than necessarily K-finite sections. Prove this for all characteristic-zero local fields, including split unitary groups. This asserts regularity for the constructed section, not for every local integral. (JZ2020, Proposition A.1, pp.811–817; (A.6), p.812; Proposition 5.5, pp.788–789; JZ2020 line 3292).

A proof route is as follows. Construct a compactly supported open-cell section with inducing value W_τ tensor v_σ. Since b_v(v_π,v_σ)≠0, choosing W_τ(1)=1/b_v(v_π,v_σ) is legitimate. In (A.12)–(A.14), type every rectangular block and carry the corrected identity C E₂=(I−g)E₁+YY′E₂ through the quotient parameterization, its Jacobian and the open-cell section evaluation. Here C is the upper-right coefficient before g*. The term need not vanish even on actual isometries fixing the chosen vector; it cannot be discarded merely by the displayed slice choice. At finite places use small compact-open supports. Over R,C prove continuity and use smooth approximate identities and Dixmier–Malliavin, retaining the prescribed vectors. Treat split GL cells separately. These steps establish regularity for the selected section at the prescribed s₀, not universal holomorphy.

*Needs:* §3.1; §2.5; AutomorphicFormsOnReductiveGroups §2.7 (Dixmier–Malliavin); AutomorphicFormsOnReductiveGroups §2.7 (Casselman–Wallach globalization); AutomorphicLFunctionsAndLocalFactors AL.3.1.2, The Whittaker realization.

**Checks.**

- The prescribed v_π and v_σ are retained.
- Nonzero at s₀ means the constructed meromorphic integral is actually regular there.
- For b_v(v_π,v_σ)=2, the chosen Whittaker value is 1/2, giving pairing value 1; a zero inner functional admits no such choice.
- Over Q let J=[[0,0,1],[0,1,0],[1,0,0]], p=[[1/2,1,−1],[0,1,−2],[0,0,2]], and u=[[1,0,0],[1,1,0],[−1/2,−1,1]]. Both have determinant 1 and preserve J, and pu fixes w=(1,0,1) of norm 2. Their blocks have g=1/2, Y=−1, Y′=1, E₁=E₂=1 and C=−1/2. The corrected equation gives −1/2=1/2−1; dropping YY′E₂ gives the false −1/2=1/2. This is an actual orthogonal-group negative control, not arbitrary rectangular data.

### Examples

For two eigenvalues x=1,y=−1, exterior weight −1 differs from symmetric weights 1,−1,1. At q=2 the two nontrivial signs give different Euler denominators. A ramified local integral is retained even where no spherical vector exists.

### Dependencies

This layer uses §2.6; §2.5; GanGrossPrasadUnitaryGroups §§2.1–2.6 (unitary); §1.4 (orthogonal); SmoothRepresentationsOfLocalGroups SR.2.2; SmoothRepresentationsOfLocalGroups SR.2.1–SR.2.3 (gap:twisted-jacquet-filtration); AutomorphicFormsOnReductiveGroups §2.7 (Casselman–Wallach globalization); §2.2; §2.4; AutomorphicLFunctionsAndLocalFactors AL.4.1.1, The unramified L-group Euler factor; AutomorphicLFunctionsAndLocalFactors AL.4.2.1, Transport of supplied local parameter comparisons; ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23 (gap:coherent-packets-comparison; gap:generic-discrete-member-cuspidality; gap:standard-base-change-uniqueness); GanGrossPrasadUnitaryGroups §§4.3–4.4 (unitary comparison); ModularityAndLanglandsExtensions §3.15; ModularityAndLanglandsExtensions §3.12; ModularityAndLanglandsExtensions §3.16; AutomorphicLFunctionsAndLocalFactors AL.4.2.1, Transport of supplied local parameter comparisons (gap:all-place-signed-factors); SmoothRepresentationsOfLocalGroups SR.4.1–SR.4.4 (gap:spherical-whittaker-normalization); ModularityAndLanglandsExtensions §3.25; AutomorphicFormsOnReductiveGroups §2.6 (archimedean generic unitary dual); AutomorphicSpectralTheory §2.9 (generic standard modules and strict GL exponents); AutomorphicFormsOnReductiveGroups §2.7 (Dixmier–Malliavin); AutomorphicLFunctionsAndLocalFactors AL.3.1.2, The Whittaker realization. EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.4 supplies the carriers for unitary packets used by the indicated targets. The individual Needs lines separate the statement inputs from the indicated proof route.

## Layer 4: Leading residues and reciprocal periods

### 4.1 Pairing and contragredient dictionary

For every relevant pair prove Q_ψ(f,g)=P_ψ(f,conj g), `conj(P_psi(f,g)) = P_(psi^(-1))(conj f,conj g)`, and the corresponding local Hom identifications with smooth contragredients. For the Eisenstein induction of §2.1 prove that the scalar normalizer of its long intertwining operator has cross factor L(s,τ×φ_σ∨) and type factor L(2s,τ,ρ), the labels of §3.3, by computing the action of the dual Levi on the Lie algebra of the dual unipotent radical. Then prove three transports, with the parameters normalized as in Conventions. Self-pair: let τ=⊞_(i=1)^r τ_i have pairwise distinct cuspidal blocks and let π′ be cuspidal with a generic discrete global parameter, so that φ_(π′) is a multiplicity-free isobaric sum of cuspidal blocks. The numerator L(s+1/2,τ×φ_(π′)) of a bilinear test against π′ has at s=1/2 a pole whose order is the number of i for which τ_i∨ occurs in φ_(π′). The order is r exactly when every τ_i∨ occurs; when moreover a equals the standard dimension N of the group of π′, this holds exactly when τ≅φ_(π′)∨=φ_(π′∨). Output: a nonzero bilinear period against π′ on a module of cuspidal forms lying in a verified cuspidal carrier is a nonzero projection to the conjugate realization of π′, hence gives a π′∨-constituent; for the critical module of a residue R_(τ,σ) in the self-pair case this constituent has parameter φ_(π′∨)=τ. Recovery: to obtain π itself with τ=φ_π, test against π∨; a Hermitian witness Q_ψ(f,g)≠0 with f∈C_π and g∈C_σ gives P_(ψ⁻¹)(conj f,g)≠0, a bilinear period of the realization conj C_π of π∨ against the same σ, with the inverse character. Orthogonal standard parameters are self-dual, with representation duality retained up to the appropriate even-SO outer action. Conjugate self-duality is never replaced by ordinary self-duality: φ_π∨=c(φ_π) need not be isomorphic to φ_π. (JZ2020, §4.1, (4.7)–(4.12), pp.766–767; (4.47), p.780; (5.6), p.785; Theorem 5.3, p.786; (5.13), p.787; §5.5 and Theorem 5.7, p.791; §6.2, pp.801–803; §7.1, pp.807–808; JZ2020 line 2042).

The proof of Proposition 5.4 asserts an r-fold pole of the numerator when π has parameter φ_τ (JZ2020 line 2150). The paper's period (4.9) pairs a cusp form of π with the Fourier coefficient through the inner product (4.8), which is conjugate-linear in one argument, so its nonvanishing is the nonvanishing of a bilinear test against the conjugate realization of π∨; by the self-pair transport with a=N the pole then occurs at τ≅φ_π, as asserted there. With the bilinear integral of §2.1 tested against π itself the self-pair is τ≅φ_π∨, and the module produced contains π∨ rather than π.

In the smallest unitary case U(1,1)⊃U₁ (a=N=1, m=0, j=k₀=0) the transports are explicit. A conjugate-self-dual Hecke character τ of A_E^× that is trivial on A_F^× has the Asai pole and equals φ_ξ for a character ξ of U₁(A), by Hilbert's Theorem 90. The residue at s=1/2 is a multiple of ξ∘det, and its index-zero descent, the restriction to the anisotropic U₁, is ξ, of parameter τ. Its bilinear period against π′ is a multiple of ∫_[U₁]ξπ′, nonzero exactly for π′=ξ⁻¹=ξ∨.

A proof route is as follows. Derive the two scalar period identities directly using conjugation of the defining integral and unitarity of ψ. Identify complex conjugate unitary automorphic representations with their contragredients. For the normalizer compute the root spaces of the dual Levi, as in the split U₃ computation of §3.3. For the self-pair transport apply the Rankin–Selberg pole criterion blockwise: the completed L(s,τ_i×π′_k) has a simple pole at s=1 when π′_k≅τ_i∨ and is holomorphic and nonzero there otherwise, and the degrees then force equality when a=N; for the output transport use that a nonzero bilinear functional against π′ on a module of cuspidal forms detects a π′∨-constituent; for recovery conjugate the Hermitian witness.

*Needs:* §3.3; §2.1; GanGrossPrasadUnitaryGroups §§4.1–4.4 (unitary); §1.1 (orthogonal Bessel periods); gap:bessel-restriction-growth; AutomorphicSpectralTheory §2.8 (Shahidi normalization); ModularityAndLanglandsExtensions §3.15; ModularityAndLanglandsExtensions §3.12; AutomorphicLFunctionsAndLocalFactors AL.4.2.1, Transport of supplied local parameter comparisons (gap:all-place-signed-factors); EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.4 (shared unitary packets and normalization premises).

**Checks.**

- The printed unmarked notation does not fix the unitary labels; the base-change normalization and the bilinear integral of §2.1 do.
- The L-function of a nonselfdual character with itself is not its self-pair L-function.
- For a volume-one U₁ character χ with χ² nontrivial, P(χ,χ)=0, Q(χ,χ)=1, P(χ,χ∨)=1; the comparison requires conjugating the second argument.
- For split U₃ with (χ₁,χ₂,μ)=(2,3,5) the normalizer cross weights are 2/5 and 15, the weights of τ×φ_σ∨ fixed in §3.3; the undualized τ×φ_σ would give 10 and 3/5.
- For split SO₅ and π′ with endoscopic generic parameter μ₁⊞μ₂, two distinct symplectic cuspidal blocks on GL₂, take a=2 and τ=μ₁: the numerator L(s+1/2,μ₁×μ₁)L(s+1/2,μ₁×μ₂) has a pole of order 1=r at s=1/2, although τ has degree 2 and φ_(π′) degree 4; the equality τ≅φ_(π′)∨ needs a=N=4.
- For a bilinear test against π′ with φ_(π′)=z=i, the numerator weight is 1 at τ=z⁻¹ and −1 at τ=z; at T=1/2 the factors are (1−T)⁻¹=2 and (1+T)⁻¹=2/3.
- In the U(1,1) case, if ξ(ϖ_w)=i at a split place w, the descent ξ has local parameter (i,−i)=τ_w, while the test representation ξ⁻¹ has (−i,i)=c(τ_w); assigning the output the parameter of the test representation would give τ∨ instead of τ.
- Recovery of π with φ_π=χ uses the test representation π∨: the self-pair numerator weight is χ·χ⁻¹=1, whereas testing against π itself with τ=φ_π gives χ².

### 4.2 Leading Eisenstein residue

Let `tau = boxplus_(i=1)^r tau_i` with pairwise distinct irreducible unitary cuspidal blocks of the required self-dual or conjugate-self-dual type, and let σ be cuspidal with relevant generic parameter of opposite parity. With the normalized family E(f_s,s), define `R_(tau,sigma)` as the automorphic module spanned by `R(f) = lim_(s -> 1/2) (s-1/2)^r E(f_s,s)`, after proving pole order at most r. Retain the chosen realization of σ, the inducing section and the ambient form. The one-variable leading Laurent coefficient is zero when the actual pole order is less than r. This definition is not a successive one-variable residue and does not assert nonzero for every section. (JZ2020, §5.1, Proposition 5.2, pp.782–784; §6.1, p.792; JZ2020 line 1998).

The construction has the following API.

- A holomorphic section gives its order-r Laurent coefficient as an automorphic form.
- The coefficient map commutes with right H_X(A)-translation.
- If the family has pole order less than r for every section, `R_(tau,sigma)`=0.
- The residual module remembers the ambient form and the actual automorphic realization of σ.

A proof route is as follows. Apply the supplied normalized-intertwiner and completed type-factor theorems to bound the order by r_τ. AutomorphicSpectralTheory §0.15 gives continuous coefficient operators after a common-denominator regularization; its Eisenstein continuation supplies the automorphic setting. Take this coefficient and its right-translation span in the specified inducing realization.

*Needs:* §2.1; AutomorphicSpectralTheory §0.15 (common-denominator Laurent operators); AutomorphicSpectralTheory §§2.4–2.7 (automorphic Laurent calculus); AutomorphicSpectralTheory §2.13 (jiang_zhang_holomorphy, with its stated hypotheses); AutomorphicLFunctionsAndLocalFactors AL.3.6.1, Continuation and the Rankin–Selberg pole criterion; AutomorphicLFunctionsAndLocalFactors AL.3–AL.4 (gap:type-poles-and-cross-factor); AutomorphicLFunctionsAndLocalFactors AL.4.2.1, Transport of supplied local parameter comparisons (gap:all-place-signed-factors).

**Checks.**

- One variable with an order-r pole is not r successive residues in that variable.
- For E(s)=A/(s−1/2)^2+B/(s−1/2)+C and r=2, the coefficient is A, not B.
- For an order-one pole and r=2, the coefficient is zero.
- A section in the kernel of the coefficient map can give zero even when the residual module is nonzero.

### 4.3 Maximal pole and central L-value

With the distinct-block data of §4.2, suppose every type factor L(s,τ_i,ρ) has a simple pole at 1. Use the holomorphic nonzero normalized local operators of AutomorphicSpectralTheory §§2.4–2.14. Then E has pole order at most r; it has order r for some section, equivalently `R_(tau,sigma)`≠0, exactly when the cross L-function L(s,τ×φ_σ∨) of its scalar normalizer, identified in §4.1, is nonzero at 1/2. For orthogonal groups φ_σ∨≅φ_σ, giving L(1/2,τ×φ_σ); in the unitary case φ_σ∨=c(φ_σ) is not replaced by φ_σ. (JZ2020, Proposition 5.2 and its preceding calculation (5.1)–(5.4), pp.782–784; JZ2020 line 1998).

A proof route is as follows. Apply ModularityAndLanglandsExtensions §3.4, self-dual-cuspidal-type, and the signed-Asai supplement for the type factors. Derive regular nonzero distinct-block cross factors from AutomorphicLFunctionsAndLocalFactors AL.3.6.1, Continuation and the Rankin–Selberg pole criterion and AL.3.6.3, Rankin–Selberg nonvanishing on the boundary, restoring the omitted local factors with §3.5. The completed normalizing denominator is regular and nonzero at s=1/2 by these factor comparisons at 3/2 and 2; it is not a separate hypothesis. Thus the r_τ distinct type poles give order r_τ (JZ2020 line 1986, line 2159). The normalized operator has a nonzero value, and a pure tensor section detects it; prove the global operator is nonzero using compatible spherical tails. Compare the leading constant term with the Eisenstein Laurent coefficient. The analytic normalization proof is AutomorphicSpectralTheory §2.13 with its generic-global-parameter and normalization hypotheses; it does not use this conclusion about residual packets.

*Needs:* §4.2; §4.1; AutomorphicSpectralTheory §§2.4–2.7 (Eisenstein constant terms); AutomorphicSpectralTheory §2.13 (jiang_zhang_holomorphy, with its stated hypotheses); AutomorphicLFunctionsAndLocalFactors AL.3.6.1, Continuation and the Rankin–Selberg pole criterion; AutomorphicLFunctionsAndLocalFactors AL.3.6.3, Rankin–Selberg nonvanishing on the boundary; §3.5; ModularityAndLanglandsExtensions §3.3–3.4; AutomorphicLFunctionsAndLocalFactors AL.3, Poles, functional equations and the closed boundary (gap:type-poles-and-cross-factor); AutomorphicSpectralTheory §§2.4, 2.4a and 2.14 (isobaric continuation with smooth sections).

**Checks.**

- Repeated τ_i are excluded.
- The criterion concerns the actual cross factor. For split U₃ with χ₁=μ=i and χ₂=−i its local weights are 1,1 and its factor at T=1/2 is (1−T)⁻²=4; the undualized τ×φ_σ has weights −1,−1 and factor 4/9.
- With t=s−1/2, type numerator t⁻² and cross factor 3 give leading coefficient 3 and order 2; cross factor t gives order 1 and leading coefficient 0 at order 2.

### 4.4 Normalized bad-place zeta product

Let S contain all archimedean and ramified places of the datum. Put Z_v^*(s)=Z_v(s)/ℒ_v(s) as a meromorphic quotient and `Z_S^*(s) = product_(v in S) Z_v^*(s)`. With the spherical calculation and the chosen global scalar c, the identity is Z=c·Z_S^*(s)ℒ(s), where ℒ is the complete product of the stated local ratios, with the unitary convention comparison required. A meromorphic quotient is defined even at an apparent zero or pole by its meromorphic germ; its regular value is asserted only by an analytic theorem. (JZ2020, §4.6, (4.49), p.781; §5.3, (5.10)–(5.12), pp.786–787; JZ2020 line 2090).

The construction has the following API.

- Z=c·Z_S^*·ℒ on the chamber, then as meromorphic families.
- Adding a spherical place with Z_v=ℒ_v multiplies Z_S^* by 1.
- The quotient is the meromorphic germ; pointwise division by a zero is not its definition.

A proof route is as follows. Divide each local meromorphic integral by its nonzero meromorphic standard ratio. Separate the finite bad-place product and keep the global normalization scalar.

*Needs:* §3.2; §3.4; §3.3.

**Checks.**

- Holomorphy of a finite product does not prove holomorphy of each factor.
- Changing S across a normalized spherical place leaves Z_S^* unchanged.
- If Z_v=1/(s−1/2) and ℒ_v=2/(s−1/2), then Z_v^*(1/2)=1/2 after removing the singularity.
- If every place in S is normalized spherical, Z_S^*=1.
- The product of s and 1/s is regular at 0 although one factor is not; product regularity cannot be assigned to both factors.

### 4.5 Holomorphy at the critical point

Assume a=N, k=a−j−1 for the prescribed relevant pair, τ=⊞τ_i distinct, a nonzero inner bilinear period P(π,σ), and the self-pair pole condition that L(s+1/2,τ×φ_π) has order r at s=1/2. By the self-pair transport of §4.1, since a=N, this condition holds exactly when τ≅φ_π∨, which is φ_(π∨)=c(φ_π) in the unitary case and the standard transfer of π in the orthogonal case. Then for factorizable holomorphic smooth sections, Z_S^*(s) is holomorphic at s=1/2. There exist such data, retaining prescribed nonzero inner-period vectors after the allowed local choices, for which Z_S^*(1/2)≠0 and the inner global period is nonzero. (JZ2020, Propositions 5.4–5.6, pp.787–790; (5.11)–(5.19); JZ2020 line 2112).

A proof route is as follows. Compare the order bound r for Z from E with the exact order r of ℒ to prove holomorphy of the finite product. Factor the given nonzero inner period, choose local sections with nonzero Z_v at 1/2, and use finite nonzero normalizing factors to retain nonzero normalized factors. At archimedean places keep the holomorphic smooth section class and the continuous functional throughout.

*Needs:* §4.4; §4.3; §4.1; §3.6; §3.5; GanGrossPrasadUnitaryGroups §§4.1–4.4 (unitary); §1.1 (orthogonal Bessel periods); gap:bessel-restriction-growth.

**Checks.**

- For the numerator convention of §3.3, the second tensor argument is φ_π and the full self-pair choice is τ=φ_π∨. For φ_π=χ with χ² nontrivial, τ=χ⁻¹ gives weight 1 and the pole, while τ=χ gives weight χ²≠1 and no pole.
- The local choices produce a single global restricted tensor section and a nonzero inner period.
- For r_τ=2, Z=6t⁻²+3t⁻¹ and ℒ=2t⁻², the quotient is 3+(3/2)t and its central value is 3. If the L-ratio had only order 1 while Z retained order 2, their quotient would instead have a pole; the exact self-pair order is essential.

### 4.6 Reciprocal nonvanishing of Bessel periods

For a prescribed relevant pair (G,H), cuspidal realizations C_π,C_σ with generic parameters, j=(d−m−1)/2, a=N, and k=a−j−1≥0, induce from τ⊗σ^t with t=Ad(w_q^k). Suppose τ has the required distinct blocks and type, `R_(tau,sigma^t)`≠0, and the numerator self-pair pole condition of §4.5 (Holomorphy at the critical point). Assume the actual local/global integral and normalizer comparisons of Layers 3–4. Then there are vectors with `P_k(R_(tau,sigma^t),pi)`≠0 if and only if there are vectors with P_j(π,σ)≠0, with the explicitly transported characters. The self-pair choice is τ≅φ_π∨: the standard transfer of π in the orthogonal case and φ_(π∨)=c(φ_π) in the unitary case. A nonzero period `P_k(R_(tau,sigma^t),pi)` puts a π∨-constituent, of parameter τ, into the critical module whenever that module lies in a verified cuspidal carrier, by the output transport of §4.1. The forward implication does not need the self-pair pole condition; the reverse uses it and proves a nonzero residual coefficient as well. (JZ2020, Theorem 5.3, p.786; proof in §5.4, p.790; JZ2020 line 2067).

A proof route is as follows. A nonzero leading-coefficient period implies the meromorphic global Z is not identically zero; unfolding gives the inner period. For the reverse choose normalized data with nonzero critical product. The self-pair L-pole and the complete zeta identity force an order-r pole, whose leading period is nonzero. Keep bilinear and Hermitian versions separate via the dictionary; in a bilinear pairing the residual module is detected against π and contains its dual.

*Needs:* §0.6; §4.5; §4.2; §2.4; §2.6; §4.1.

**Checks.**

- Do not remove the stated R≠0 hypothesis when citing the equivalence; the stronger reverse-direction construction explains how it can be obtained.
- The even-SO input twist is k, not the smaller index j.
- In Z=c Z_S* ℒ with c=2, Z_S*(1/2)=3 and leading ℒ coefficient 5, the leading period is 30, hence nonzero; replacing any one of these three nonzero scalar factors by 0 kills this inference.
- In the unitary case with φ_π=χ and χ² nontrivial, the induction uses τ=χ⁻¹; inducing from τ=χ gives numerator weight χ², no order-r pole, and no reverse implication.

### 4.7 Nonzero period implies nonzero central value

For cuspidal π,σ on a coherent relevant inner-form pair with generic discrete global parameters, a nonzero bilinear Bessel period P(π,σ) implies that the corresponding standard tensor L(s,φ_π×φ_σ) is holomorphic and nonzero at 1/2. Equivalently the Hermitian period Q(π,σ) gives the dual-second-parameter value L(1/2,φ_π×φ_σ∨)≠0. This extends the adjacent unitary implication of GanGrossPrasadUnitaryGroups §7.1 to all the orthogonal and unitary odd-codimension data here; its residue/period comparison is the construction-specific assertion. No Whittaker genericity or cuspidal multiplicity-one hypothesis is imposed. Prove both specializations through the residue construction with the labels of §§3.3 and 4.1; the unitary case is not a consequence of identifying φ_σ with φ_σ∨. (JZ2020, Theorem 5.7 and proof, pp.790–791; JZ2020 line 2296).

A proof route is as follows. Apply the reverse direction of §4.6 to (π,σ) with the self-pair choice τ=φ_π∨. The resulting nonzero residue forces its cross factor to be holomorphic and nonzero at 1/2 by §4.3, that is, L(1/2,φ_π∨×φ_σ∨)≠0. The tensor functional equation at the center, with its nonzero epsilon factor, converts this into the stated value L(1/2,φ_π×φ_σ)≠0 and its holomorphy. For the Hermitian form apply the same argument to (π,σ∨) through Q(f,g)=P(f,conj g).

*Needs:* §4.6; §4.3; §4.1; AutomorphicLFunctionsAndLocalFactors AL.3.6.2, The global Rankin–Selberg functional equation; GanGrossPrasadUnitaryGroups §§4.1–4.4 (unitary); §1.1 (orthogonal Bessel periods); gap:bessel-restriction-growth.

**Checks.**

- For a Hermitian period the second parameter is dualized.
- Even-SO multiplicity two is handled by specifying C_π and C_σ.
- The U₁ witness gives Q(χ,χ)=1 but P(χ,χ)=0, so the Hermitian tensor uses χ×χ∨, with weight 1, rather than χ×χ, with a nontrivial squared weight.
- For conjugate-self-dual Hecke characters χ=φ_π and μ=φ_σ, χ∨μ∨=c(χμ) has the same completed L-function as χμ, while χμ∨=χ·c(μ) is neither χμ nor c(χμ) unless μ² or χ² is trivial; the residue route therefore reaches the bilinear value L(1/2,χμ), and the Hermitian value is L(1/2,χμ∨).

### Examples

For E(s)=A/t²+B/t+C, t=s−1/2, the order-two leading coefficient is A. Choosing A=0 makes it 0 despite a nonzero order-one residue. With c=2, normalized product value 3 and leading complete L-ratio coefficient 5, the residual period is 30.

### Dependencies

This layer uses §3.3; GanGrossPrasadUnitaryGroups §§4.1–4.4 (unitary); §1.1 (orthogonal Bessel periods); gap:bessel-restriction-growth; AutomorphicSpectralTheory §2.8 (Shahidi normalization); ModularityAndLanglandsExtensions §3.15; ModularityAndLanglandsExtensions §3.12; AutomorphicLFunctionsAndLocalFactors AL.4.2.1, Transport of supplied local parameter comparisons (gap:all-place-signed-factors); §2.1; AutomorphicSpectralTheory §0.15 (common-denominator Laurent operators); AutomorphicSpectralTheory §§2.4–2.7 (automorphic Laurent calculus); AutomorphicSpectralTheory §2.13 (jiang_zhang_holomorphy, with its stated hypotheses); AutomorphicLFunctionsAndLocalFactors AL.3.6.1, Continuation and the Rankin–Selberg pole criterion; AutomorphicSpectralTheory §§2.4–2.7 (Eisenstein constant terms); AutomorphicLFunctionsAndLocalFactors AL.3.6.3, Rankin–Selberg nonvanishing on the boundary; §3.5; ModularityAndLanglandsExtensions §3.3–3.4; AutomorphicLFunctionsAndLocalFactors AL.3, Poles, functional equations and the closed boundary (gap:type-poles-and-cross-factor); AutomorphicSpectralTheory §§2.4, 2.4a and 2.14 (isobaric continuation with smooth sections); §3.2; §3.4; §3.6; §0.6; §2.4; §2.6; AutomorphicLFunctionsAndLocalFactors AL.3.6.2, The global Rankin–Selberg functional equation. EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.4 supplies the carriers for unitary packets used by the indicated targets. The individual Needs lines separate the statement inputs from the indicated proof route.

## Layer 5: Critical descent and its cuspidal structure

### 5.1 Residual Arthur parameter

For the compatible ambient datum with a=N, cuspidal σ of generic parameter φ_σ and τ=⊞τ_i of the opposite required parity, form `psi_(tau,sigma) = boxplus_i (tau_i boxtimes nu_2) boxplus phi_sigma` for H_X. Verify the dimension of its standard representation, its self-dual or conjugate-self-dual sign after tensoring by the 2-dimensional SL₂ representation, and the determinant character of H_X. Here ν_2 is the irreducible 2-dimensional SL₂ representation, not two copies of a trivial representation. If the data fail a parameter condition, the constructor is not available. Membership of an actual residue in the corresponding Arthur packets is a separate theorem. (JZ2020, §6.1, p.792; (6.3), p.795; §6.3, pp.803–804; JZ2020 line 2353).

The construction has the following API.

- The standard dimension is 2a plus the standard-dual dimension of H_W.
- Tensoring the form of τ_i with the alternating form of ν_2 gives the required ambient sign.
- Conjugating even-SO σ transports ψ by the corresponding outer action, retaining its determinant data.

A proof route is as follows. Specialize the global parameter constructor of ModularityAndLanglandsExtensions §3.8 after checking the rank, form sign and determinant conditions. For odd SO the standard dimension is one less than the form dimension. This comparison does not construct another parameter carrier.

*Needs:* ModularityAndLanglandsExtensions §3.8; ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23 (gap:coherent-packets-comparison; gap:generic-discrete-member-cuspidality; gap:standard-base-change-uniqueness); GanGrossPrasadUnitaryGroups §§4.3–4.4 (unitary comparison); §4.2; AutomorphicLFunctionsAndLocalFactors AL.3, Poles, functional equations and the closed boundary (gap:type-poles-and-cross-factor); EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.4 (shared unitary packets and normalization premises).

**Checks.**

- In odd ambient SO the dimension is 2a+(m−1).
- The two-dimensional SL₂ factor reverses the sign of the corresponding form.
- For a=6 and H_W=SO₃, the form dimension is 15 and ψ has standard dimension 12+2=14.
- Replacing τ_i⊠ν_2 by two copies of τ_i⊠ν_1 has the same dimension but a different SL₂ action and is not the parameter.
- A choice with the wrong ambient quadratic determinant character is rejected even if dimensions match.

### 5.2 Residual square integrability and membership in Arthur packets

If `R_(tau,sigma)`≠0 in the special data, it is square-integrable and its irreducible constituents belong to the Arthur packets associated with `psi_(tau,sigma)`, with the actual inner form and automorphic realization. The negative-exponent criterion and the residual constituent’s local Langlands quotients must be proved. Retain every hypothesis of the quasi-split classification. On a non-quasi-split group assume the inner-form classification hypothesis defined below; the outline of inner-form classification is not an unconditional theorem for every orthogonal and unitary form (JZ2020 line 81, line 87). The nonzero nongeneric residue is not assigned to inner-form Arthur packets by the generic multiplicity formula alone. Irreducibility of R, as used in the source via Mœglin, is a distinct required input when needed, not a consequence of square integrability. (JZ2020, Proposition 6.1, pp.792–793; §6.3, p.804, citing Mœglin Theorem B; JZ2020 line 2366).

The inner-form classification hypothesis for the groups in a datum means the following independent spectral input on the shared carriers for parameters and packets: for every relevant discrete Arthur parameter, the summand of the discrete spectrum attached to that parameter is the sum of its coherent restricted-tensor members of packets with the multiplicities of the applicable Arthur multiplicity formula, including the even-SO multiplicity factor and the global component-group character constraint; the local pairings for packets satisfy the normalized local intertwining relations. The hypothesis includes compatibility of that classification with the cuspidal-support classification used in gap:all-member-residual-support. For generic parameters it additionally requires that discrete members are cuspidal and that their standard isobaric base change is identified by the almost-everywhere standard parameters. This premise concerns the spectrum before constructing any Bessel image, period or descent, and implies no such nonvanishing. It is required explicitly in §§5.5, 5.8, 6.4 and 7.2 whenever non-quasi-split forms occur. (JZ2020, Introduction, pp.740–741, JZ2020 line 81, line 87; §6.3, p.804; ModularityAndLanglandsExtensions §§3.12, 3.16–3.18 and 3.23 with their stated classification hypotheses.)

Its input interface retains the following information.

- Each member has a specified rational inner form and local labels in packets, rather than merely a standard transfer.
- The multiplicity formula concerns the whole discrete spectrum, and the support classification concerns every residual member individually.
- Dual and even-SO outer transport preserve these labels and multiplicities, without identifying different rational forms.

A proof route is as follows. Compute the exponents of this Laurent coefficient and apply the supplied square-integrability criterion. Identify its local Langlands constituents and parameter within the exact classification scope. Quasi-split membership, residual irreducibility and all-member support are the separate contracts gap:quasisplit-residual-packets-membership, gap:residual-irreducibility and gap:all-member-residual-support; none asserts an unconditional inner-form classification. Prove the application to the constructed residue separately from the assertion for every member of the residual packets.

*Needs:* §5.1; §4.3; AutomorphicSpectralTheory §§4.1–4.4 (residual spectrum and square-integrability criterion); ModularityAndLanglandsExtensions §3.17 and 3.23; ModularityAndLanglandsExtensions §3.12; ModularityAndLanglandsExtensions §3.16; ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23–3.25 (gap:quasisplit-residual-packets-membership; gap:residual-irreducibility; gap:all-member-residual-support; gap:coherent-packets-comparison; gap:generic-discrete-member-cuspidality; gap:standard-base-change-uniqueness); EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.4 (shared unitary packets and normalization premises).

**Checks.**

- A nonzero Eisenstein Laurent coefficient is not automatically in L².
- Generic parameter cuspidality cannot be applied to `psi_(tau,sigma)`, which has nontrivial ν_2 blocks.
- For an exponent t^λ on a positive split-center direction with measure dt/t, ∫₁∞t^(2λ)dt/t=−1/(2λ) when λ<0; λ=−1/2 gives 1, λ=0 gives divergence. A Laurent coefficient alone supplies no negative exponent.
- A generic SL₂ factor ν₁ has dimension 1, whereas ν₂ has dimension 2; generic-member cuspidality cannot be used for a parameter containing ν₂.
- Two hypothetical discrete members Σ₁,Σ₂ with support records on Levis M₁,M₂ require two records; a calculation for Σ₁ yields zero information about the second record.
- For multiplicity 2 of one labelled spectral member the spectral sum has two copies, while its transfer parameter has one label; a parameter alone is not the required multiplicity formula.

### 5.3 Critical descent index

For a relevant pair of dimensions d,m with d=m+2j+1, a=N and j<a, define k₀=a−j−1. Its ambient Bessel partition is [2k₀+1,1^d], of size 2a+m; its chosen stabilizer is the prescribed G of dimension d. For comparison with the paper’s p^1, 2k₀+1=a+m−1 when H_W is even SO and 2k₀+1=a+m otherwise. The flag and rational orbit are the ones constructed for the prescribed pair, not chosen from dimension alone. (JZ2020, §5.2, (5.8)–(5.9), p.785; §6.2, (6.9), p.802; §6.3, p.804; JZ2020 line 2054).

The construction has the following API.

- The critical stabilizer dimension is 2a+m−2k₀−1=d.
- The critical Nat.Partition is [2k₀+1,1^d], with total 2a+m.
- If a=j+1 then k₀=0; the original d-dimensional form is a line complement in dimension d+1.

A proof route is as follows. Calculate 2a+m−2(a−j−1)−1=m+2j+1=d using j<a to justify natural-number subtraction. Use a=d−1 for odd SO and a=d otherwise to compare with the p^1 leading part.

*Needs:* §0.6; §0.2.

**Checks.**

- d=5,m=2,j=1,a=4 gives k₀=2 and the ambient partition [5,1,1,1,1,1].
- d=6,m=1,j=2,a=6 gives k₀=3 and partition [7,1,1,1,1,1,1].
- a=1,j=2 is outside the domain; truncated natural subtraction must not manufacture a critical-index identity.

### 5.4 Vanishing above the critical index

Let Σ be an actual discrete automorphic member of `psi_(tau,sigma)` on H_X, within the classification scope in §5.2. Every Bessel coefficient of Σ at a valid index k>k₀ vanishes, for every rational orbit of that index. To prove it, identify one unramified finite local component at which the corresponding twisted Jacquet module is zero. Include inert and split unitary places and the determinant-one orthogonal cases; no global period is assumed. (JZ2020, Proposition 6.2 and proof, pp.793–794; JZ2020 line 2386).

A proof route is as follows. Use the geometric lemma and character coinvariants to compute the unramified residual constituent at one appropriate finite place for each rational datum. List every surviving term, with the determinant-one branches and both split and inert unitary calculations. Above k₀ each term has an incompatible rank or a nontrivial character acting on a trivial quotient. The resulting local Hom space is zero, so a global nonzero coefficient would contradict localization. GRS2011, Theorems 5.1, 5.4 and 5.6, gives the classical calculation template; the complete comparison on these forms is proved here.

*Needs:* §5.3; §5.2; GanGrossPrasadUnitaryGroups §§2.1–2.6 (unitary); §1.4 (orthogonal); SmoothRepresentationsOfLocalGroups SR.2.2; SmoothRepresentationsOfLocalGroups SR.2.1–SR.2.3 (gap:twisted-jacquet-filtration); SmoothRepresentationsOfLocalGroups SR.4.1–SR.4.4 (gap:spherical-whittaker-normalization).

**Checks.**

- The vanishing is for all rational orbits, not one selected orbit.
- A single verified good local place suffices for each global coefficient.
- If a local quotient acts trivially and the character takes value −1, its coinvariant relation is v=−v, hence v=0 over C; in characteristic 2 the relation would give no vanishing, explaining the coefficient choice.

### 5.5 Cuspidality at the critical index

Assume the classification scope of §5.2, explicitly its inner-form classification hypothesis on non-quasi-split groups. For `R_(tau,sigma)`≠0 the critical module `B_(k_0,O)(R_(tau,sigma))` is cuspidal for every rational critical datum. Prove each constant term is zero using the tower calculation, higher-index vanishing and the cuspidal support of this specific residue. The stronger source assertion for every discrete `Sigma in Pi_(psi_(tau,sigma))` is a separate target: it requires the residual-support argument for every such Σ, not just the minimal support of `R_(tau,sigma)`. Neither assertion claims the critical module is nonzero. (JZ2020, Proposition 6.3, pp.794–795; JZ2020 line 2426).

The constructed-residue theorem uses only the actual cuspidal support of that residue. The all-member theorem requires support for every discrete Σ in the relevant packets, including noncuspidal Σ; gap:quasisplit-residual-packets-membership; gap:residual-irreducibility; gap:all-member-residual-support states that export. The two quantifiers are separate and the zero Fourier image satisfies constant-term cuspidality.

A proof route is as follows. Expand every proper constant term using §1.3 and the supplied constant-term comparisons. Higher Fourier terms vanish by §5.4; eliminate the other terms using the actual cuspidal support of the constructed residue. For arbitrary discrete members of those packets first apply the independent all-member support theorem of gap:quasisplit-residual-packets-membership; gap:residual-irreducibility; gap:all-member-residual-support and then prove the same vanishing calculation.

*Needs:* §5.2 (inner-form classification hypothesis on non-quasi-split forms); §5.4; §1.3 (tower calculation); AutomorphicFormsOnReductiveGroups §4.1 (constant-term transitivity); AutomorphicFormsOnReductiveGroups §§4.1–4.2 (gap:rational-fourier-support; gap:bessel-restriction-growth); ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23–3.25 (gap:quasisplit-residual-packets-membership; gap:residual-irreducibility; gap:all-member-residual-support; gap:coherent-packets-comparison; gap:generic-discrete-member-cuspidality; gap:standard-base-change-uniqueness).

**Checks.**

- Zero critical modules are allowed.
- The proof for one constructed residue is not silently generalized to all residual members.
- A zero critical image has every constant term 0 even if the residue contains a nonzero vector; nonzero residue is therefore insufficient for the nonvanishing conclusion.

### 5.6 Outer stability of critical Bessel modules

For an actual discrete automorphic realization C_Σ, the critical Bessel module is invariant up to the transported action of the rational outer normalizer of its SO stabilizer: if π occurs, so does π^⋆ with the same image multiplicity. In the other classical cases the relevant outer orbit in this statement is a singleton. Prove the action on the actual realization without assuming its discrete multiplicity is one. The normalizer may send w to −w; compensate on the isotropic flag so that it preserves the Fourier character. In the odd ambient SO case extend to the corresponding O action by letting central −I act trivially as required by the construction. (JZ2020, Proposition 6.4, pp.795–797; JZ2020 line 2503).

A proof route is as follows. Construct the rational isometry normalizing the Bessel subgroup and compute its action on every character coordinate. Use rational left invariance to express its effect as right translation of C_Σ; that preserves the chosen realization even when the ambient spectrum has multiple copies.

*Needs:* §5.3; §1.1; §0.6.

**Checks.**

- Fixing the anisotropic line is different from fixing its vector.
- An orbit of size two is not replaced by a single constituent.
- For a two-element orbit {π,π⋆}, the involution exchanges the basis labels and squares to the identity; on a fixed orbit {π} its cardinal is 1.
- On a hyperbolic plane diag(−1,−1) sends e+(κ/2)f to its negative; a second sign change in the flag character is needed to recover the same ψ.

### 5.7 Unramified parameter of the critical module

At each good finite place, every irreducible unramified constituent of the critical twisted Jacquet module of Σ has standard Satake parameter equal to that of τ_v, up to the even-SO outer orbit. In the orthogonal case retain the determinant constraint and the corrected torus index k₀=a/2+r_W when W is split odd orthogonal and the output G is split orthogonal. For unitary groups compute both inert and split places; at a split place the two GL_a inducing factors must be handled separately. The result is equality of standard parameters, normalized as in Conventions, not uniqueness of an SO conjugacy class. (JZ2020, Lemma 6.5, pp.797–799, especially (6.6); Proposition 6.2, pp.793–794; JZ2020 line 2563).

A proof route is as follows. Compute the surviving Jacquet term and all its torus weights using the supplied geometric lemma. Correct the orthogonal index by the dimension equation and retain the final unitary weight in (6.6). At split unitary places compute both GL_a inducing factors, rather than inferring them from inert places. Prove the equality at every good place needed for the almost-everywhere standard transfer. Compare the classical cases with GRS2011, Theorems 5.1, 5.4 and 5.6.

*Needs:* §5.4; §5.3; SmoothRepresentationsOfLocalGroups SR.2.1–SR.2.3 (gap:twisted-jacquet-filtration); SmoothRepresentationsOfLocalGroups SR.4.1–SR.4.4 (gap:spherical-whittaker-normalization); ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23 (gap:coherent-packets-comparison; gap:generic-discrete-member-cuspidality; gap:standard-base-change-uniqueness); GanGrossPrasadUnitaryGroups §§4.3–4.4 (unitary comparison).

**Checks.**

- The full list of a unitary inducing characters is retained.
- Even-SO standard transfer determines only the relevant outer orbit.
- For d=a=6 and split W of dimension 1, r_W=0 gives k₀=a/2+r_W=3 and 2a+m−2k₀−1=6; k₀=2 would give 8.
- Two unitary torus coordinates μ₁=2,μ₂=3 give (1−2T)(1−3T)=1−5T+6T²; omitting μ₂ drops the degree to 1. These are L-group test coordinates, not bounded unitary Frobenius eigenvalues.
- With odd-unitary W of dimension 1 and a=4, j=1 gives k₀=2 and the output has dimension 2a+1−2k₀−1=4, so it is U₄ rather than U₅. With a=5,m=0 the five standard weights are μ₁,μ₂,1,μ₂⁻¹,μ₁⁻¹; retaining μ₂ keeps degree 5.
- For a=6,m=1 the same dimension equation forces k₀=3 for either split or nonsplit even-orthogonal output. A nonsplit orbit with determinant character −1 cannot occur when the transferred determinant is 1.
- In the U(1,1) case of §4.1 with τ_w=(i,−i) at a split place w, the critical module ξ has local parameter (ξ_w,ξ_w⁻¹)=(i,−i)=τ_w; the opposite base-change normalization would label it (−i,i)=τ_w∨.

### 5.8 Structure of the critical cuspidal module

Assuming the inner-form classification hypothesis of §5.2 on non-quasi-split groups, for every nonzero critical Bessel module of an irreducible actual Σ in the scoped Arthur packets associated with `psi_(tau,sigma)`, assuming §5.5 and the compatible discrete cuspidal Hilbert carrier of the image/carrier comparison in §1.1 for that Σ, its Hilbert closure is an outer-stable multiplicity-free Hilbert direct sum of cuspidal representations whose generic global standard parameter is φ_τ, up to even-SO outer orbit. Apply this in particular to `R_(tau,sigma)` after proving the irreducibility required in §5.2, or the separate cross-constituent multiplicity comparison. This retains the reducible-residue assertion as an explicit additional target. Genericity of the parameter is deduced from the full good-place calculation and the applicable classification; it is not deduced from local Bessel nonvanishing. This theorem does not assert global nonvanishing. (JZ2020, Theorem 6.6, pp.799–800; JZ2020 line 2702).

A proof route is as follows. For an irreducible actual Σ use critical cuspidality and §1.4 to decompose the verified closed image. Identify its global parameter from every good-place standard parameter and the supplied almost-everywhere transfer uniqueness. Apply the rational normalizer to obtain the complete outer orbit. For a reducible residual realization apply this argument constituent by constituent; asserting multiplicity freeness for their sum additionally requires the irreducibility or cross-constituent comparison in §5.2.

*Needs:* §5.2 (inner-form classification hypothesis on non-quasi-split forms); §5.5; §5.6; §5.7; §1.4; ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23 (gap:coherent-packets-comparison; gap:generic-discrete-member-cuspidality; gap:standard-base-change-uniqueness); GanGrossPrasadUnitaryGroups §§4.3–4.4 (unitary comparison).

**Checks.**

- Nonzero R does not imply nonzero critical Bessel module.
- There is no claim of strong multiplicity one for classical groups.
- An outer-fixed constituent has orbit cardinal 1 and multiplicity 1; two inequivalent outer conjugates give two summands, each of multiplicity 1. A zero image gives no constituent at all.

### 5.9 Twisted automorphic descent

For the specified residual datum, rational critical orbit O, stabilizer isometry with G and actual realization of σ, define `D_O(tau;sigma) = B_(k_0,O)(R_(tau,sigma))` with its smooth image and, when it lies in the verified cuspidal L² carrier, its Hilbert closure. The normalizer twist of σ is part of the datum and is displayed whenever comparing an inner period. No irreducibility or nonvanishing is included in the definition. A bilinear functional against π detects a π∨ constituent in this module, by the output transport of §4.1; the Hermitian formulation uses the dictionary explicitly. (JZ2020, §6.2, diagrams (6.7)–(6.8), p.801, definition (6.9), p.802, and Conjecture 6.7, pp.802–803; JZ2020 line 2833).

The construction has the following API.

- Each residual section has its critical Fourier coefficient in D_O(τ;σ).
- D_O=0 exactly when the critical coefficient of every residual vector vanishes.
- A specified rational conjugacy and stabilizer isometry transport D equivariantly, with the character and inducing realization.
- Section 5.5 and the verified carrier of the image/carrier comparison in §1.1 place the Hilbert closure in L²_cusp(G); neither is built into the definition.

A proof route is as follows. Compose the leading-residue map with the critical Bessel map and the specified stabilizer transport. Keep the induced action, image topology and realization dependence from the two component constructions.

*Needs:* §4.2; §5.3; §1.1; §4.1 (output transport).

**Checks.**

- The same τ may have descents on different rational inner forms.
- A zero module is a valid value of the construction.
- R=0 gives D=0.
- For d=5,m=2,a=4,j=1 the coefficient used is the [5,1^5] coefficient on the 10-dimensional ambient form.
- Equality of geometric partitions without a rational stabilizer isometry does not identify two descents.
- For d=2, m=1, j=0, a=N=2, X=H²⊥W of dimension 5 and τ=η₁⊞η₂ with distinct quadratic Hecke characters, take a critical datum whose stabilizer V is a split SO₂ (k₀=1). By §5.7 an unramified constituent χ_v would satisfy χ_v⊞χ_v⁻¹=η_(1,v)⊞η_(2,v), hence η_(1,v)=η_(2,v) at almost all v and η₁=η₂; so the descent on this datum is zero, consistent with the absence of generic discrete parameters on a split SO₂ (§1.1).

### Examples

For a=6 and W=SO₃ the ambient form has dimension 15 and the residual standard parameter has dimension 14. For d=6,m=1,j=2,a=6 the critical partition is [7,1^6] of size 13. A nonzero residual coefficient can have zero critical image.

### Dependencies

This layer uses ModularityAndLanglandsExtensions §3.8; ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23 (gap:coherent-packets-comparison; gap:generic-discrete-member-cuspidality; gap:standard-base-change-uniqueness); GanGrossPrasadUnitaryGroups §§4.3–4.4 (unitary comparison); §4.2; AutomorphicLFunctionsAndLocalFactors AL.3, Poles, functional equations and the closed boundary (gap:type-poles-and-cross-factor); §4.3; AutomorphicSpectralTheory §§4.1–4.4 (residual spectrum and square-integrability criterion); ModularityAndLanglandsExtensions §3.17 and 3.23; ModularityAndLanglandsExtensions §3.12; ModularityAndLanglandsExtensions §3.16; ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23–3.25 (gap:quasisplit-residual-packets-membership; gap:residual-irreducibility; gap:all-member-residual-support; gap:coherent-packets-comparison; gap:generic-discrete-member-cuspidality; gap:standard-base-change-uniqueness); §0.6; §0.2; GanGrossPrasadUnitaryGroups §§2.1–2.6 (unitary); §1.4 (orthogonal); SmoothRepresentationsOfLocalGroups SR.2.2; SmoothRepresentationsOfLocalGroups SR.2.1–SR.2.3 (gap:twisted-jacquet-filtration); SmoothRepresentationsOfLocalGroups SR.4.1–SR.4.4 (gap:spherical-whittaker-normalization); AutomorphicFormsOnReductiveGroups §4.1 (constant-term transitivity); AutomorphicFormsOnReductiveGroups §§4.1–4.2 (gap:rational-fourier-support; gap:bessel-restriction-growth); §1.1; §1.3 (tower calculation); §1.4; §4.1 (output transport). EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.4 supplies the carriers for unitary packets used by the indicated targets. The individual Needs lines separate the statement inputs from the indicated proof route.

## Layer 6: Fourier support and period existence

### 6.1 Residual Fourier-support partitions

For a=N≥1 and a relevant parameter pair with smaller form dimension m, define `p_(phi,phi_prime)` as the partition with parts (a+m−1,a+1) for even SO H_W, (a+m,a−1,1) for odd SO H_W, and (a+m,a) for unitary H_W. Define `p^1_(phi,phi_prime)` as (a+m−1,1^(a+1)) in the even-SO branch and (a+m,1^a) otherwise. Reorder the multisets if necessary; every total is 2a+m. Keep admissibility and existence of rational Fourier data separate. Under the critical dimension relations p^1 is exactly `p_(k_0)(2a+m)`. In the orthogonal branches a=N is even and at least 2 (a=0 would need SO₁, excluded by a=N>j≥0); a=1 occurs only for G=U₁, W=0, j=k₀=0, where p=p^1=[1,1]. The stronger upper-support statement that every support partition of every such residue is ≤`p_(phi,phi_prime)` is a separately named conjectural proposition, not a theorem used by the weak-support argument. (JZ2020, §6.3, pp.803–804, definitions preceding Conjecture 6.8; JZ2020 line 2907).

The construction has the following API.

- Each of p and p^1 has total 2a+m.
- For the special relevant pair, p^1 equals [2k₀+1,1^d].
- The upper-support proposition for (φ,φ′) quantifies over every relevant σ and every support partition; it asserts a dominance upper bound, not nonvanishing.

A proof route is as follows. Build the finite multisets and check their sums, positivity and parity in the relevant cases. Substitute d=m+2j+1 and the standard-dual dimension a to compare the critical partition. The general support and dominance constructions are supplied under the exact contracts above.

*Needs:* §5.3; §0.2; `Nat.Partition`; §1.1; LieHighestWeightPartII N2, classical-partitions; LieHighestWeightPartII N2, classical-partitions (gap:classical-dominance).

**Checks.**

- The two partitions need not differ. They coincide exactly in two cases: the odd-SO H_W branch at a=2, which forces m=1, d=2, j=0 and k₀=1 and gives p=p^1=[3,1,1] of size 5; and the unitary branch at a=1, which forces m=0, d=1, j=k₀=0 and gives p=p^1=[1,1] of size 2. In every other case the part counts differ (2 or 3 against a+1 or a+2), as for a=6, m=1 below.
- For G=U₁ and τ=φ_ξ on GL₁(A_E), the residue on U(1,1) is a multiple of ξ∘det (§4.1), and its [1,1] coefficient is the index-zero Bessel coefficient, restriction to the anisotropic U₁, which is ξ≠0; with a≥2 imposed this positive-rank datum would have no p^1 at all.
- Geometric admissibility alone does not produce a rational orbit on every inner form.
- a=4,m=2 gives p=[5,5] and p^1=[5,1,1,1,1,1], both of size 10.
- a=6,m=1 gives p=[7,5,1] and p^1=[7,1,1,1,1,1,1], both of size 13.
- An empty support set satisfies the universal upper-bound condition but does not satisfy membership of p^1.

### 6.2 Weak Fourier-support proposition

Fix relevant generic discrete parameters (φ,φ′), τ attached to φ, a=N, the ambient type and the central nonzero hypothesis L(1/2,φ×φ′∨)≠0, which is the cross value L(1/2,τ×φ_σ∨) of §4.3 at every σ of parameter φ′. For orthogonal groups φ′∨≅φ′ and this is the printed hypothesis L(1/2,φ×φ′)≠0 of Conjecture 6.8. The weak Fourier-support proposition for (φ,φ′) is the proposition that there exist a coherent relevant inner form H_W, a cuspidal σ with parameter φ′, its realization C_σ, and a rational nilpotent datum of partition `p^1_(phi,phi_prime)` such that its coefficient on `R_(tau,sigma)` is nonzero. It quantifies over σ and its inner form, rather than asserting this for every σ. It is the explicit hypothesis of Conjecture 6.8. In the unitary case the printed hypothesis L(1/2,φ×φ′)≠0 is not the cross value and is not substituted for it. (JZ2020, Conjecture 6.8 and preceding hypotheses, pp.803–804; JZ2020 line 2976).

The construction has the following API.

- A proof supplies H_W,σ,C_σ and a nonzero rational coefficient of p^1.
- The partition comparison transports the witness to a nonzero critical descent on its stabilizer inner form.
- The quantifier is existential over automorphic members of the coherent global packets.

A proof route is as follows. Form the stated existential proposition with the actual residue and rational Fourier coefficient. Separate it from the stronger universal upper-support conjecture; neither proposition is introduced as an axiom.

*Needs:* §6.1; §5.2; ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23 (gap:coherent-packets-comparison; gap:generic-discrete-member-cuspidality; gap:standard-base-change-uniqueness); GanGrossPrasadUnitaryGroups §§4.3–4.4 (unitary comparison); §4.1.

**Checks.**

- The central nonzero hypothesis is part of its scope.
- The witness includes a global coherent form, not an arbitrary collection of local forms.
- One witnessing automorphic σ suffices even when a different member of those packets has zero coefficient.
- Knowing all support is bounded by p does not supply a p^1 witness.
- The zero residual module has no witness; a tuple of merely local members of the packets does not circumvent this.

### 6.3 Known Fourier-support cases

Prove the comparison of the supplied classical m=0 GRS descent witness with the rational p¹ coefficient and normalized residue used here, for every group and parameter parity in the supplier theorem. For simple φ, so that τ is cuspidal on GL_(2n), prove the anisotropic SO₂ support case with actual smaller form dimension 2 and ambient form H^(2n)⊥W, of dimension 4n+2 and global Witt index 2n, with its special orthogonal group. JLXXZ2016, arXiv v2 Theorem 1.2(3),(6), PDF p.5, assumes cuspidal τ on GL_(2n) and gives the nonzero coefficient; the distinct-isobaric extension required by JZ2020 Proposition 6.9 is the separately named proposition below, not a consequence of that theorem. No unspecified unitary analogue is asserted. (JZ2020, Proposition 6.9, p.805, citing [23] and [40]; §7.2, p.809; JZ2020 line 2985).

A proof route is as follows. Import ModularityAndLanglandsExtensions §5.4 for the classical generic descent itself and compare its rational orbit, character, section and group embedding with §§0.6 and 5.9. For anisotropic SO₂ use the actual witness in JLXXZ2016 Theorem 1.2(3),(6), JLXXZ2016 line 189, line 1025, and compare its residual and Fourier normalizations. A theorem assuming cuspidal τ alone does not imply the distinct-isobaric proposition.

*Needs:* §6.2; §5.8; §4.6; ModularityAndLanglandsExtensions §5.4 (classical GRS descent); §5.2 (classification scope for the explicit support proposition below).

**Checks.**

- The label m=1 in the paper is not form dimension 1.
- For n=1 the ambient form H²⊥W has dimension 6 and global Witt index 2. At a real place its signature is (4,2), (2,4) or (3,3) according as W is positive definite, negative definite or split there; over Q, W=⟨1,1⟩, ⟨−1,−1⟩ and ⟨1,−2⟩ are anisotropic and realize the three cases. In each case a=2, k₀=1 and the critical partition is [3,1,1,1], of size 6.
- An isobaric GL₄ input τ₁ boxplus τ₂ is not a cuspidal GL₄ input; the cuspidal premise of JLXXZ2016 Theorem 1.2 does not hold for it.

**Distinct-isobaric anisotropic-SO₂ support proposition.** For every n≥1, every anisotropic SO₂ over F, every τ=⊞_i τ_i on GL_(2n)(A_F) with at least two pairwise distinct unitary cuspidal symplectic-type blocks, and a unitary automorphic character σ of that torus with L(1/2,τ×φ_σ)≠0, the proposition asserts that the normalized residue on the ambient form H^(2n)⊥W has a nonzero rational critical coefficient of partition [2n+1,1^(2n+1)]. The residual realization, character and measures are those of §§4.2 and 5.9. This is a support hypothesis for the general isobaric case of §6.5; no existing contract for membership in packets or support classification supplies it. It is the extension needed to apply JZ2020 Proposition 6.9, p.805, JZ2020 line 2985, beyond JLXXZ2016 Theorem 1.2, JLXXZ2016 line 189.

Its witness interface has the following API.

- A proof supplies a rational critical orbit and a residual vector with nonzero coefficient.
- The critical stabilizer has dimension 2n+1 and inherits its rational form from that orbit.
- With such a witness, the weak Fourier-support premise of §6.2 holds for this isobaric pair and the specified σ.

*Needs:* §§4.2, 5.3 and 5.9; §5.2 (classification scope); §6.2. An explicit residual-support proof is required to discharge this proposition; the cited cuspidal theorem supplies only its single-block counterpart.

**Checks.**

- For n=2, two distinct symplectic GL₂ blocks give a=4, m=2, j=1, k₀=2 and critical [5,1^5] of size 10; their isobaric GL₄ sum is not cuspidal, so JLXXZ2016 Theorem 1.2 does not discharge the premise.
- For n=1, two positive even block degrees cannot sum to 2; the at-least-two-block proposition has no input in this case, whereas the single cuspidal GL₂ theorem does.
- The zero residual module has all coefficients 0, so it is not a witness even though its empty support satisfies every universal upper bound.

### 6.4 Central value produces a global period

For a coherent relevant parameter pair (φ,φ′), with a=N and L(1/2,φ×φ′)≠0 in the bilinear convention, suppose the weak Fourier-support proposition of §6.2 holds for (φ∨,φ′), with the prescribed even-SO normalizer twist on φ′. Its central hypothesis L(1/2,φ∨×φ′∨)≠0 is the given one, because φ∨×φ′∨=c(φ×φ′) in the unitary case and φ∨=φ, φ′∨=φ′ for orthogonal groups. Assume the scoped inputs for residual packets, critical structure and the pairing dictionary, explicitly the inner-form classification hypothesis of §5.2 on any non-quasi-split group used by the witness. Then some coherent relevant inner-form pair has cuspidal realizations (π,σ) with parameters φ and φ′ and a nonzero bilinear Bessel period. In the Hermitian formulation dualize the second parameter and the corresponding support input. The assertion is existence, not global uniqueness, and does not assume local GGP. (JZ2020, Theorem 6.10 and proof, pp.805–806; JZ2020 line 2991).

A proof route is as follows. Choose the weak-support witness for (φ∨,φ′) and identify its partition with the critical Bessel partition. Take a nonzero irreducible cuspidal summand π₀ of the critical module, of parameter φ∨ up to outer orbit by §5.8, and put π=π₀∨, of parameter φ. Pairing a vector of the module with the complex conjugate of its π₀-projection gives a nonzero bilinear critical period against π (§4.1), and the forward unfolded-period implication of §4.6 gives P(π,σ)≠0. Undo the normalizer twist to return to φ′.

*Needs:* §5.2 (inner-form classification hypothesis on non-quasi-split forms); §6.2; §6.1; §5.8; §4.6; §4.1; ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23 (gap:coherent-packets-comparison; gap:generic-discrete-member-cuspidality; gap:standard-base-change-uniqueness); GanGrossPrasadUnitaryGroups §§4.3–4.4 (unitary comparison).

**Checks.**

- The chosen inner forms come from a single rational relevant datum.
- Local uniqueness is not used to invent an automorphic member of arbitrary coherent local packets.
- For conjugate-self-dual characters φ=χ and φ′=μ, the support input for (φ∨,φ′) has central hypothesis L(1/2,χ∨μ∨)=L(1/2,c(χμ))=L(1/2,χμ), the given value; an input for (φ,φ′) would instead require L(1/2,χμ∨).
- A support witness of size 10 with critical [5,1^5] has stabilizer dimension 5; a tuple of local groups lacking a global rational orbit supplies no such 5-dimensional coherent embedding.

### 6.5 Odd orthogonal–torus period criterion

Let n≥1, let `G* = SO_(2n+1)` be F-split and let H* be an anisotropic SO₂ over F, with relevant generic parameters φ,φ′ and simple φ, so its standard transfer τ on GL_(2n) is cuspidal. Among the pairs in their global coherent Vogan packets there exists a cuspidal pair with nonzero Bessel period exactly when L(1/2,φ×φ′)≠0, using the bilinear convention (equivalently the corresponding dual-second-parameter Hermitian convention). The weak-support hypothesis is discharged by the cuspidal anisotropic SO₂ case of §6.3, while the analytic and source-comparison obligations of the construction remain. For a distinct-isobaric φ the same criterion is conditional on the distinct-isobaric anisotropic-SO₂ support proposition of §6.3; it is not asserted unconditionally for that input. This does not assert that the selected π lies on the split inner form itself. (JZ2020, Corollary 6.11, pp.806–807; JZ2020 line 3077).

A proof route is as follows. Use the rank-one orthogonal weak-support witness for the forward construction. Apply the period-to-central-value theorem for the converse, with the actual dual convention if the pairing is Hermitian.

*Needs:* §6.3 (cuspidal anisotropic SO₂ witness; the distinct-isobaric support proposition is an additional hypothesis in the isobaric variant); §6.4; §4.7.

**Checks.**

- Anisotropic SO₂ has a compact automorphic quotient; split SO₂ needs a separate central quotient.
- The conclusion is over the coherent packets, not over all inner forms independently.
- A transfer τ=τ₁⊞τ₂ with distinct cuspidal blocks has two summands and is not simple; it satisfies no unconditional conclusion here without the distinct-isobaric support proposition.
- For the norm-one torus of C/R, |z|=1; for split SO₂ the positive component has norm parameter t>0 and ∫₁∞dt/t=∞. The compact-quotient assertion uses F-anisotropy.

### Examples

At a=4,m=2, the upper-support partition [5,5] and critical [5,1^5] both have size 10. At a=6,m=1 they are [7,5,1] and [7,1^6], both of size 13. The empty support set satisfies every universal upper bound and supplies no existential witness.

### Dependencies

This layer uses §5.3; §0.2; `Nat.Partition`; §1.1; LieHighestWeightPartII N2, classical-partitions; LieHighestWeightPartII N2, classical-partitions (gap:classical-dominance); §5.2; ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23 (gap:coherent-packets-comparison; gap:generic-discrete-member-cuspidality; gap:standard-base-change-uniqueness); GanGrossPrasadUnitaryGroups §§4.3–4.4 (unitary comparison); §4.1; §5.8; §4.6; §4.7. The individual Needs lines separate the statement inputs from the indicated proof route.

## Layer 7: Recovery of cuspidal modules

### 7.1 Cuspidal module recovery proposition

For cuspidal π of a G-relevant generic discrete global parameter φ_τ, the concrete-module proposition for π is the proposition that there exist a smaller relevant group H, a cuspidal σ of generic parameter, chosen automorphic realizations, an ambient residual datum (τ,σ) whose isobaric τ has parameter φ_τ=φ_π, and a rational critical orbit with stabilizer identified with the specified G, for which the Hilbert twisted descent is isomorphic to the direct sum of the distinct isomorphism classes in the allowed outer orbit of π, each once. This is π for a singleton orbit and π⊕π^⋆ for a two-element even-SO orbit. Every conjugation and dual transport follows the pairing dictionary, and σ is displayed with the required normalizer twist. Principle 1.1 motivates this precise proposition; it is not an unconditional construction principle. (JZ2020, Principle 1.1, pp.743–744; Conjecture 6.7, pp.801–803; §7.1, p.807; JZ2020 line 2865).

The construction has the following API.

- A proof supplies σ, its realization, the ambient datum, rational orbit and equivariant module isomorphism.
- For an outer-fixed π the conclusion is one copy of π.
- For π not isomorphic to π^⋆ in the even-SO case the conclusion has exactly these two summands, each once.

A proof route is as follows. Form an existential proposition about actual residual and Fourier modules and a G(A)-equivariant Hilbert isomorphism. Keep one copy per distinct outer isomorphism class; an outer-fixed π must not be counted twice.

*Needs:* §5.9; §5.6; §4.1; ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23 (gap:coherent-packets-comparison; gap:generic-discrete-member-cuspidality; gap:standard-base-change-uniqueness); GanGrossPrasadUnitaryGroups §§4.3–4.4 (unitary comparison).

**Checks.**

- The result concerns the specified inner form G.
- A stable parameter alone is not a concrete module.
- If π≅π^⋆, π⊕π is not the required module.
- If π≇π^⋆, a lone π is not the required outer-stable module.
- In the unitary case the datum uses τ=φ_π, and the module is detected by bilinear tests against π∨; inducing from τ=φ_π∨ instead would produce a module containing π∨, of parameter c(φ_π), not π.
- A module on a different rational inner form with the same transfer parameter is not a witness without a stabilizer isometry to G.

### 7.2 Cuspidal module recovery theorem

Let π be cuspidal of a G-relevant generic discrete global parameter. Assume the Generic Summand proposition for π, and assume the exact local GGP proposition on distinguished members, for the character ψ of the witness, at every localization of the relevant parameter pair (φ_π,φ_σ∨) of (π,σ∨), where σ is the smaller witness; for even SO it is assumed for the localizations of both coherent global orientations of gap:oriented-even-orthogonal-packets. Assume the analytic, convention, classification, spectral and tower inputs specified in Layers 0–5, explicitly the inner-form classification hypothesis of §5.2 on every non-quasi-split group in the construction. Then the concrete-module proposition for π holds. There is one summand when its allowed outer orbit is a singleton and two distinct summands in the even-SO two-element case. No Whittaker genericity or global cuspidal multiplicity-one hypothesis is imposed. (JZ2020, Theorem 7.1 and proof, pp.807–808; JZ2020 line 3118).

Define the exact local proposition on distinguished members as follows: for each localization of the relevant generic parameter pair, over the disjoint union of its relevant pure inner forms, the set of pairs in its Vogan fibre (the pairs of representations of these forms whose parameters are the given pair) with nonzero Bessel Hom consists of exactly one pair. For even SO the fibre is the oriented local fibre obtained by localizing one coherent global orientation, with its enhancement labels, and no quotient by outer conjugation is taken; when the localized parameter is outer-stable, every member of the oriented fibre is isomorphic to its outer conjugate (gap:oriented-even-orthogonal-packets), so nothing is lost. Its labels for packets, enhancements, characters, duals and relevance are those of this datum. Its API is the following.

- A proof supplies a nonzero local Bessel model for one distinguished relevant pair.
- Every other nonzero-model pair in the same Vogan fibre, oriented in the even-SO case, is isomorphic to the distinguished pair.
- Transport of the entire framed pair, character and enhancement carries the distinguished orbit to the corresponding transported orbit.

In a proved range import the supplier theorem with those labels; otherwise this is the explicit local hypothesis, not an assertion of a correspondence for arbitrary unlabelled representations. Generic Summand remains the existential proposition of §1.5. Neither premise contains the desired concrete residual module.

A proof route is as follows. Choose the Generic Summand witnesses and build the ambient datum with the prescribed stabilizer G. By the recovery transport of §4.1 the Hermitian witness Q_ψ(f,g)≠0 gives P_(ψ⁻¹)(conj f,g)≠0, a bilinear period of the realization conj C_π of π∨ against the same σ, with the inverse character. Apply the reverse direction of §4.6 to (π∨,σ) with τ=φ_π, the self-pair choice for the test representation π∨; the resulting nonzero critical module contains (π∨)∨=π. Every constituent π₁ has parameter φ_π up to outer orbit and, by the forward unfolded implication, P_(ψ⁻¹)(π₁∨,σ)≠0, so (π₁,σ∨) is a pair with nonzero local Bessel models for ψ at every place, as is (π,σ∨). In the even-SO case π₁ lies in the coherent oriented global set of one of the two orientations of φ_π (gap:oriented-even-orthogonal-packets), which the rational outer action exchanges; replace π₁ by π₁^⋆ if necessary, so that π₁ and π lie in the same orientation. At every place exact local uniqueness in that oriented fibre gives π₁,v≅π_v, and restricted tensor factorization gives π₁≅π, respectively π₁≅π^⋆ before the replacement. Local uniqueness modulo outer conjugation at each place separately would not suffice: it allows the local outer labels to be chosen independently at different places. Multiplicity-free decomposition (§1.4) and outer stability (§5.6) give exactly the stated orbit module.

*Needs:* §5.2 (inner-form classification hypothesis on non-quasi-split forms); §7.1; §1.5; §4.6; §5.8; §0.6; §4.1 (recovery transport); §1.4 (multiplicity-free decomposition); §5.6 (outer stability); ModularityAndLanglandsExtensions §§3.13, 3.15 and 3.17 (gap:oriented-even-orthogonal-packets); GanGrossPrasadUnitaryGroups §§3.7, 3.9 and 3.11 (proved unitary ranges); GanGrossPrasadUnitaryGroups §§4.1–4.4 (unitary); §1.1 (orthogonal Bessel periods); gap:bessel-restriction-growth; EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.4 (shared unitary packets and normalization premises).

**Checks.**

- For distinguished local class sets {a_v} at every v, any surviving constituent must have exactly those labels modulo the allowed outer orbit; allowing {a_v,b_v} at even one place destroys that identification.
- If the allowed outer action fixes π, the sum over distinct classes has one copy; a forced second copy contradicts the multiplicity bound of §1.4.
- At two places u,v where π_u≇π_u^⋆ and π_v≇π_v^⋆, choosing an outer label independently at each place gives the four tuples (π_u,π_v), (π_u^⋆,π_v), (π_u,π_v^⋆), (π_u^⋆,π_v^⋆), whereas the rational outer involution relates only the first and the last; equality of local outer orbits leaves four candidates, and the coherent orientation of the hypothesis leaves two.

### 7.3 Recovery from a regular Fourier coefficient

For a quasi-split classical G and a Whittaker-generic cuspidal π with relevant generic parameter, construct the Generic Summand witnesses at the maximal Bessel index and deduce the concrete-module proposition for π under the same exact local GGP hypotheses and scoped analytic inputs. For SO_(2n+1), U_(2n+1) and SO_(2n) the regular partition ([2n+1], [2n+1] and [2n−1,1]) is the maximal Bessel partition, and the Whittaker coefficient is that Bessel coefficient. For U_(2n) the regular partition [2n] is not a Bessel partition, and the maximal Bessel partition [2n−1,1] is subregular; the two are not identified. Prove the comparison: a cuspidal realization of U_(2n) with nonzero Whittaker coefficient has a nonzero [2n−1,1] Bessel coefficient for some rational datum of index n−1, and since U₁=U(w⊥) is F-anisotropic with compact automorphic quotient, some character χ of U₁ has nonzero projection. Pin the smaller form: odd SO and odd U use dimension 0; even SO uses dimension 1 with trivial SO₁; even U uses dimension 1 with that character χ. Thus the even-unitary ambient form has dimension 2N+1 and its inducing character is not an empty datum. The comparison with ModularityAndLanglandsExtensions §5.4 identifies its actual GRS module with this rational critical coefficient; the supplier theorem retains its exact group and parameter scope. (JZ2020, §7.2 and Corollary 7.2, p.809; §6.2, (6.8), pp.801–802; JZ2020 line 3190).

A proof route is as follows. Compute the maximal Bessel partition and stabilizer in each type. For U_(2n) compare the Whittaker coefficient with the [2n−1,1] coefficients through the Fourier expansion of the coefficient along the index-(n−1) unipotent radical over the vectors of the middle hyperbolic plane: the zero vector gives a constant term, which cuspidality removes, the anisotropic vectors give the [2n−1,1] Bessel coefficients, and the isotropic vectors carry the Whittaker coefficient. Then choose the actual nonzero U₁ character projection; do not replace its rank-one datum by an empty group. Import ModularityAndLanglandsExtensions §5.4 for classical GRS nonvanishing in its stated scope, compare its normalized residue, character and rational stabilizer with this module, and apply §7.2. The even-unitary comparison retains the nonempty inducing character and ambient dimension 2N+1.

*Needs:* §7.2; §1.5; §6.3; GanGrossPrasadUnitaryGroups §§1.1–1.3 (unitary); §§0.1–0.3 (orthogonal); AutomorphicFormsOnReductiveGroups §§4.1–4.2 (gap:rational-fourier-support; gap:bessel-restriction-growth); AutomorphicLFunctionsAndLocalFactors AL.3.1.2, The Whittaker realization; ModularityAndLanglandsExtensions §5.4 (classical GRS descent and its irreducibility scope).

**Checks.**

- For U₄, the smaller group is U₁ and the ambient form dimension is 9, not 8.
- For SO₄, the regular partition is [3,1], since [4] has an even part of odd multiplicity and is not orthogonal; its Bessel stabilizer is the trivial SO₁.
- For U₃ the regular partition [3] is the maximal Bessel partition, with smaller dimension 0. For U₄ the regular partition is [4], with power ranks (3,2,1,0) on the standard representation, while the maximal Bessel partition [3,1] has ranks (2,1,0,0); the [3,1] datum has smaller dimension 1 and ambient dimension 9.
- For U₂ the maximal Bessel index is 0 and the [1,1] coefficient is restriction to an anisotropic U₁; a nonzero form has a right translate with nonzero restriction, so the comparison holds there without root exchange.
- SO₅ has regular [5], smaller dimension 0 and standard-dual dimension 4; SO₄ has regular [3,1], smaller dimension 1 and trivial SO₁.

### 7.4 Generic summand from subregular support

Let C_π be a cuspidal realization with relevant generic parameter and p^m(C_π)={p_subregular}. For SO_(2n) with n≥3 and the other displayed types with n≥1, construct a rational first-occurrence datum with a generic cuspidal summand as follows: for `SO_(2n)`, n≥3, p_subregular=[2n−3,3], j=n−2 and the smaller group is split SO₃; for `SO_(2n+1)`, p_subregular=[2n−1,1,1], j=n−1 and the smaller group is an F-anisotropic form of SO₂, under the additional hypothesis that some rational datum of index n−1 whose stabilizer SO(W) is F-anisotropic has a nonzero coefficient on C_π (a datum with W a hyperbolic plane has a split SO₂ stabilizer, which carries no cuspidal σ with a generic discrete parameter, §1.1); for `U_(2n)`, p_subregular=[2n−1,1], j=n−1 and the smaller group is U₁; for `U_(2n+1)`, p_subregular=[2n,1], j=n−1 and the smaller group is a form of U₂. Use first-occurrence cuspidality and show the smaller constituent has a generic parameter. In the SO-even and U-odd cases prove the required orbit-raising/collapse implication, rather than inferring it solely from the partition sizes. (JZ2020, Proposition 7.3 and its case analysis, pp.809–810, citing Jiang–Liu–Savin Theorem 11.2; JZ2020 line 3217).

A proof route is as follows. For an F-anisotropic torus smaller group K¹, the norm-one torus of a quadratic extension K/F (in the unitary case K=E), the automorphic quotient is compact, the image is a sum of characters, and a nonzero character projection χ has a generic discrete parameter: with χ̃(x)=χ(x/c(x)), it is η⊞ηω_K for a Hecke character η with η²=1 when χ̃²=1, and the irreducible induction of χ̃ from K to F, of determinant ω_K, otherwise; in the unitary case it is the base change of Conventions. In the odd-orthogonal case the anisotropic datum of the hypothesis supplies this torus; on a datum with W a hyperbolic plane no such witness exists. In even SO, prove that the Bessel coefficient with split SO₃ stabilizer is nonzero, then construct its generic-parameter constituent. JLS2016, arXiv v2 Theorem 11.2, PDF pp.21–22, JLS2016 line 830, line 855, gives special expansion for O, Sp and metaplectic groups; its Proposition 8.4 and rational-orbit refinements, followed by the O-to-SO comparison, are needed for the split-stabilizer claim. In odd U prove the independent unitary orbit-collapse and U₂ generic-summand statement; the orthogonal special-expansion theorem supplies neither assertion.

*Needs:* §1.5; §1.3; §0.3; §1.4; LieHighestWeightPartII N2, classical-partitions (gap:classical-dominance); ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23 (gap:coherent-packets-comparison; gap:generic-discrete-member-cuspidality; gap:standard-base-change-uniqueness); GanGrossPrasadUnitaryGroups §§4.3–4.4 (unitary comparison); §1.1 (torus carrier comparison); LieHighestWeightPartII N2, classical-partitions.

**Checks.**

- For U₅ the subregular partition [4,1] is not the Bessel partition [3,1,1].
- A nonzero smaller coefficient alone does not establish a generic parameter.
- For SO₆, [3,3] and its Bessel [3,1,1,1] both have size 6 but stabilizer extraction gives dimension 3; a split SO₃ datum needs a rational argument.
- For U₅, [4,1] and the Bessel [3,1,1] differ; both have size 5 and only the latter comes directly from index j=1 with smaller dimension 2.
- In split SO_(2n+1) the index-(n−1) data are anisotropic w in the middle space H⊥⟨c⟩, and W=w⊥ is a hyperbolic plane exactly when its determinant −c/q(w) is −1 modulo squares, that is, when c·q(w) is a square; over Q with c=1 and q(xe+yf+zg)=2xy+z², w=e+f/2 has q(w)=1 and W≅⟨1,−1⟩ is split, while w=e−f/2 has q(w)=−1 and W≅⟨1,1⟩ is anisotropic. Both rational orbits occur, so the anisotropic-datum hypothesis is not automatic.
- For SO₃ (n=1, partition [1,1,1], j=0, smaller dimension 2) the split form has no input, since every cuspidal representation of PGL₂ is generic and so has regular maximal support, while on the nonsplit form the 3-space is anisotropic and every plane w⊥ is anisotropic, so the hypothesis holds automatically.

### 7.5 Recovery from subregular support

If π has a relevant generic discrete global parameter and some cuspidal realization has p^m containing the valid subregular partition in the cases of §7.4, for `SO_(2n+1)` with the additional hypothesis of §7.4 that some rational datum of index n−1 with F-anisotropic stabilizer SO(W) has a nonzero coefficient on that realization, then the concrete-module proposition for π follows under the exact local GGP hypotheses and the scoped construction inputs. In these classical partition posets every nonregular admissible partition is dominated by the subregular one; since the latter is maximal in the support, regular support is excluded and p^m is its singleton. Prove this partition comparison, including the distinct very-even SO orbit labels, before applying the singleton-support theorem. (JZ2020, Corollary 7.4, p.810; paragraph starting §7.3, p.809; JZ2020 line 3246).

A proof route is as follows. Check dominance of the listed classical partitions: every nonregular admissible partition lies below the specified subregular one in these rank ranges. Maximality of the subregular support excludes the regular partition and any other maximal partition. Apply §7.4 and then the recovery theorem with all hypotheses retained.

*Needs:* §7.4 (with its anisotropic-datum hypothesis for `SO_(2n+1)`); §7.2; LieHighestWeightPartII N2, classical-partitions; §1.1; LieHighestWeightPartII N2, classical-partitions (gap:classical-dominance).

**Checks.**

- Contains a subregular partition in support is weaker than contains it in maximal support; the theorem needs the latter.
- For SO₈, [5,3] dominates the two very-even [4,4] labels, since prefix sums are (5,8) versus (4,8). Regular [7,1] dominates [5,3], so support containing regular cannot have subregular maximal.
- For U₅, [4,1] dominates [3,2] with prefix sums (4,5) versus (3,5), but membership of [4,1] in a set also containing [5] does not make it maximal.

### Examples

U₄ regular recovery passes from the regular [4] coefficient to the maximal Bessel [3,1] coefficient, retains a U₁ character and has ambient dimension 9. SO₆ subregular [3,3] needs the Bessel [3,1^3] and a split SO₃ comparison. U₅ subregular [4,1] needs a different Bessel [3,1,1] and a genuine U₂ generic-summand proof.

### Dependencies

This layer uses §5.9; §5.6; §4.1; ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23 (gap:coherent-packets-comparison; gap:generic-discrete-member-cuspidality; gap:standard-base-change-uniqueness); GanGrossPrasadUnitaryGroups §§4.3–4.4 (unitary comparison); §1.5; §4.6; §5.8; §0.6; §7.2 (exact local proposition on distinguished members); GanGrossPrasadUnitaryGroups §§3.7, 3.9 and 3.11 (proved unitary ranges); GanGrossPrasadUnitaryGroups §§4.1–4.4 (unitary); §1.1 (orthogonal Bessel periods); gap:bessel-restriction-growth; §6.3; GanGrossPrasadUnitaryGroups §§1.1–1.3 (unitary); §§0.1–0.3 (orthogonal); AutomorphicFormsOnReductiveGroups §§4.1–4.2 (gap:rational-fourier-support; gap:bessel-restriction-growth); AutomorphicLFunctionsAndLocalFactors AL.3.1.2, The Whittaker realization; §1.3; §0.3; §1.4; LieHighestWeightPartII N2, classical-partitions (gap:classical-dominance); LieHighestWeightPartII N2, classical-partitions; §1.1; §1.4 (multiplicity-free decomposition); §5.6 (outer stability); ModularityAndLanglandsExtensions §§3.13, 3.15 and 3.17 (gap:oriented-even-orthogonal-packets). EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.4 supplies the carriers for unitary packets used by the indicated targets. The individual Needs lines separate the statement inputs from the indicated proof route.

## Downstream consumers

The resulting library supplies concrete cuspidal models to applications requiring an actual rational inner form and a specified automorphic realization, together with their bilinear/Hermitian period transport. It supplies period-to-central-value nonvanishing without local GGP, period existence under weak Fourier support, and concrete recovery under Generic Summand and the exact local premise on distinguished members. Further GGP period formulas consume these outputs after their own analytic inputs; none of those formulas is used to construct this module.

## References

- **JZ2020.** Dihua Jiang and Lei Zhang, [Arthur parameters and cuspidal automorphic modules of classical groups](https://annals.math.princeton.edu/2020/191-3/p02), Annals of Mathematics 191 (2020), 739–827, DOI 10.4007/annals.2020.191.3.2. Locators use the published journal pages, with line numbers from its publisher-open extraction. Theorem and proof locators throughout distinguish supplied statements from the additional comparison targets.
- **Zhang2022.** Lei Zhang, [Note on the unramified computation of Rankin–Selberg integrals for quasi-split classical groups of Bessel model case](https://www.kurims.kyoto-u.ac.jp/~kyodo/kokyuroku/contents/pdf/2230-10.pdf), RIMS Kôkyûroku 2230, note on the 2022 conference. Theorem 1.1, PDF pp.2–3, Proposition 2.1, PDF p.4, §§3–5, PDF pp.4–7. This route concerns nonarchimedean unramified calculations and does not assert all-place continuation.
- **AGRS2010.** Avraham Aizenbud, Dmitry Gourevitch, Stephen Rallis and Gérard Schiffmann, [Multiplicity one theorems](https://arxiv.org/abs/0709.4215v1), arXiv v1, Theorem 1′; published Annals of Mathematics 172 (2010), 1407–1434. The cited numbering is that of the version read.
- **JSZ2010.** Dihua Jiang, Binyong Sun and Chen-Bo Zhu, [Uniqueness of Bessel models: the archimedean case](https://arxiv.org/abs/0908.1728v2), arXiv v2 (2009), Theorem A, PDF pp.1–2, JSZ2010 line 24; published Geometric and Functional Analysis 20 (2010), 690–709. The O-group statement requires the SO reduction in §1.4.
- **Waldspurger2012.** Jean-Loup Waldspurger, [Une variante d'un résultat de Aizenbud, Gourevitch, Rallis et Schiffmann](https://www.numdam.org/item/AST_2012__346__313_0/), Astérisque 346 (2012), 313–318. Théorème 1, p.313, Waldspurger2012 line 44: codimension-one multiplicity one for p-adic special orthogonal groups.
- **SunZhu2012.** Binyong Sun and Chen-Bo Zhu, [Multiplicity one theorems: the Archimedean case](https://arxiv.org/abs/0903.1413v2), arXiv v2, Theorem B, PDF p.2, SunZhu2012 line 66; published Annals of Mathematics 175 (2012), 23–44, DOI 10.4007/annals.2012.175.1.2. Codimension-one multiplicity one for Casselman–Wallach representations, including SO(p,q+1)⊃SO(p,q) and SO_(n+1)(C)⊃SO_n(C).
- **GGP2012.** Wee Teck Gan, Benedict H. Gross and Dipendra Prasad, [Symplectic local root numbers, central critical L-values, and restriction problems in the representation theory of classical groups](https://www.numdam.org/item/AST_2012__346__1_0/), Astérisque 346 (2012), 1–109. Theorem 14.1(i), p.57; Theorem 15.1, pp.59–62; Corollary 15.3 and following remark, pp.62–63, GGP2012 line 2287, line 2351, line 2476. These are the published locators; arXiv v1 has different corollary numbering and a narrower SO discussion.
- **JLXXZ2016.** Dihua Jiang, Baiying Liu, Bin Xu and Lei Zhang, [The Jacquet–Langlands correspondence via twisted descent](https://arxiv.org/abs/1501.00506v2), arXiv v2 (2015), Theorem 1.2(3),(6), PDF p.5, JLXXZ2016 line 189, and Proposition 3.3, line 1025; published International Mathematics Research Notices 2016, 5455–5492, DOI 10.1093/imrn/rnv312. The witness cited here retains its cuspidal GL input.
- **JLS2016.** Dihua Jiang, Baiying Liu and Gordan Savin, [Raising nilpotent orbits in wave-front sets](https://arxiv.org/abs/1412.8742v2), arXiv v2 (2015), Theorem 11.2, PDF pp.21–22, JLS2016 line 830, line 855, and Proposition 8.4. Orthogonal, symplectic and metaplectic special expansion is distinguished from the unitary comparison in §7.4.
- **GRS2011.** David Ginzburg, Stephen Rallis and David Soudry, [The descent map from automorphic representations of GL(n) to classical groups](https://doi.org/10.1142/9789814304993), World Scientific, 2011. This book is cited by locator alone, without certification of its proof text. Theorems 5.1, 5.4, 5.6 and 7.3 are the classical calculation and tower locators cited by JZ2020, pp.756,793–799, JZ2020 line 713, line 2399, line 2439, line 2560. The additional all-inner-form and unitary comparisons are targets here, not claims about those theorem statements.
