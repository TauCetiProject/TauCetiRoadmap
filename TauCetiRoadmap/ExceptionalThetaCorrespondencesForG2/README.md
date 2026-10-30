# Roadmap: exceptional theta correspondences for G₂

**Summary.** Build the three exceptional local theta correspondences involving split G₂ from octonion geometry, Jordan constructions and minimal representations of E₆ and E₇. The end results are finite-length big lifts, irreducible nonzero small lifts and injectivity, the division-versus-PGSp₆ dichotomy, explicit tempered and nontempered lift tables, and the discrete-series trichotomy. Quaternion relative models and exceptional global kernels then give period nonvanishing and cuspidality over number fields. The local characteristic-zero theory includes residue characteristics 2 and 3; only the separate universal division nonvanishing theorem has p≠3.

## Scope and ownership

This roadmap owns the group-level octonion comparisons, null-space orbit geometry, exceptional Jordan families, their rational forms, minimal representations, exceptional Jacquet filtrations, cubic and enhanced period comparisons, the three local correspondences and the exceptional local/global kernel comparisons. Each retained comparison is about these particular exceptional models, rather than another construction of the generic operation it uses.

The split octonions, their norm, trace, imaginary module and composition identities are already in the library, in `TauCeti.Algebra.Octonion.Basic`; the split Albert carrier is in `TauCeti.Algebra.AlbertAlgebra.Basic`. The positive real octonion and compact Albert constructions, including their complexifications, are stated by RepresentationTheory/LieHighestWeight, Layer 8, “The positive division-octonion algebra and its invariant tensors” and its compact Albert sublane. The split derivation dimension and imaginary Lie-module irreducibility are native results in `TauCeti.Algebra.Octonion.Derivation` and `TauCeti.Algebra.Octonion.Fundamental`; the group comparison uses them. Their algebraic identities are consumed here; descent over a general number field and the Koecher–Tits group comparisons belong here. The abstract group-scheme, centralizer, component and Chevalley theories are ReductiveGroups Layers 3 and 9, with dual groups in ReductiveGroupsPartII RG2.5. Spin modules and triality are RepresentationTheory/SpinRepresentations Layers 4 and 8. Compact branching is RepresentationTheory/ClassicalGroups Layer 6. The local invariant, local existence and the Weil group are ClassFieldTheory Layers 5, 8 and 9. RepresentationTheory/LieGroups Layers 2 and 7 supply the closed-subgroup theorem and real-form/complexification theory. RepresentationTheory/CompactGroups Layers 3–5 supply matrix coefficients, Schur orthogonality and Peter–Weyl; this roadmap supplies their quaternion-period application.

SmoothRepresentationsOfLocalGroups §§SR.0.2, SR.0.4, SR.2.1–SR.2.3, SR.2a.1, SR.3.1–SR.3.4 and SR.5.1 own smoothness, admissibility, induction, Jacquet functors, adjunctions, Bernstein decomposition, Langlands classification and twisted coinvariants. Its regular-isotypic quotient theorem is in SR.3.4. Its SR.3.3 Harish–Chandra tempered-support target is consumed along with the conditional standard-quotient theorem, including its stated support hypothesis. The extra generic representation-theoretic inputs are exact supplier gaps below, not new generic constructions in this roadmap. SmoothRepresentationsOfLocalGroupsPartII SRU.1–SRU.4 owns the unitary topology and isolation theory; no proof of local exceptional Howe duality here uses its Fell-topology arguments.

MetaplecticAutomorphicForms §§3.37–3.40 owns the rank-one oscillator constituents, GL₂–GSO₄ theta calculation, restricted Mp₂ × G₂ oscillator and its cuspidal injectivity, minimal orthogonal lifts and division ternary lifts. Those constructions and the corresponding finiteness/irreducibility assertions are not targets here. Section 6.1 retains the Fourier–Jacobi identification; §6.2 retains the exceptional comparison with the orthogonal model; §8.5 retains the description and exhaustion of the πρ family. The specific Saito–Kurokawa and low-rank inputs needed by these exceptional theorems are constructed in §§8.6 and 9.3 respectively.

General automorphic forms and rapid decay belong to AutomorphicFormsOnReductiveGroups; Eisenstein continuation and residual-spectrum criteria belong to AutomorphicSpectralTheory. General-linear local Langlands and Jacquet–Langlands are EndoscopicTransferAndUnitaryTraceComparison §§4.7a, 10.30–10.31. The GSp₄ Plancherel comparison is ModularityAndLanglandsExtensions §3.5. Unramified spin factors are AutomorphicLFunctionsAndLocalFactors AL.4; the ramified spin factor is a gap of its Part II. The complex split-group parameters in §0.7 extend the classical/odd-residue setting of LanglandsParameterStacks LP0.5; the WD dictionary is compared with LP1.11–LP1.12, rather than replacing its coefficient-stack construction.

The octonion and rational stabilizer comparisons are constructed in §§0.1, 2.2–2.3 and 9.1; minimal models and their local/global comparisons in §§2.4, 3.2 and 10.2; finite-field labels in §§1.8 and 8.10; triality extensions and Mackey calculations in §§4.1–4.4; disconnected coefficient fibers in §§5.5 and 7.5; Jacquet orbit twists in §§3.5, 3.7–3.8; reverse chamber and finiteness arguments in §§3.10 and 6.3–6.4; division torus distinction in §5.2; the generic supercuspidal precursor in §5.6; the spin-pole/Shalika comparison in §8.9; global residue and unfolding comparisons in §§10.2–10.5; and real central-character matching in §10.7. These are the exceptional proof obligations owned here; the generic supplier inputs are exactly the contracts below.

The complete G₂ local Langlands correspondence, enhancement bijections and endoscopic character identities are downstream conclusions, not inputs. Section 1.9 uses only the explicitly identified parameter labels needed by the theta tables.

## Conventions

Unless a subsection specifies an algebraic or real field, F is a nonarchimedean local field of characteristic zero, q is the cardinality of its residue field, and p is its residue characteristic. Thus q≥2. Fix a uniformizer ϖ with |ϖ|=q⁻¹ and a nontrivial smooth unitary additive character ψ:F→ℂˣ. All smooth representations have complex coefficients. Unipotent characters, algebraic duals and smooth contragredients are distinguished. An algebraic construction over a field has its characteristic-zero hypothesis; no characteristic-p or equal-characteristic extension is implicit.

Write G=G₂(F), H=PGSp₆(F), H₃=PGL₃(F)⋊C₂. In the E₆ division correspondence D has degree 3. In Layer 9 and the quaternion period in Layer 10 D has degree 2; GD means the pointwise stabilizer of that quaternion subalgebra. Use split octonions for the local null orbits; use positive division octonions at definite real places. Subspaces and representations live in fixed universes, allowing universe enlargement for algebraic duals; all finite-rank claims name their scalar field. The elementary octonion automorphism and null-subspace definitions in §§0.1–0.2 use an arbitrary field F in a fixed universe; their group and orbit theorems assume characteristic zero. Suggested.lean records the missing carriers for the headline theorems.

Take α short and β long. P=MN stabilizes a null plane, Q=LU a null line, and P∩Q=B for an incident flag. A bar denotes the opposite radical or parabolic. All local induction and Jacquet modules are normalized by the positive square root of the modulus, except the explicitly marked unnormalized inductions in the spin contracts, the unnormalized E₈ Jacquet quotient in §8.9, and the unnormalized coinvariants V_R used in §§3.1 and 3.12 to compare a small radical with the ambient radical attached to the same cocharacter. Thus the normalized Jacquet module along P is r_P(V)=δ_P^(−1/2)⊗V_N. Thus I_P(s,τ)=Ind_P^G(|det|^s τ), with a one-dimensional χ meaning χ∘det. A J denotes a standard Langlands quotient and δ a discrete-series submodule; statements at negative exponents follow by smooth duality, which reverses exact sequences. Temperedness and square integrability use unitary central characters. Regular compact functions use left translation f(x)↦f(a⁻¹x) and commuting right translation f(x)↦f(xb); on a rank-one operator these give χ(a)χ(b)⁻¹ for a one-dimensional representation χ.

The H Siegel Levi coordinate is its action on the three exterior-square basis vectors, not the unmodified GL₃ block coordinate. Arithmetic Frobenius has arithmetic degree 1 and |Fr|=q⁻¹. In the SL₂-to-WD dictionary put r(w)=φ(w,diag(|w|¹ᐟ²,|w|⁻¹ᐟ²)) and N=dφ([[0,1],[0,0]]), using positive real square roots, so r(w)Nr(w)⁻¹=|w|N. At q=2, Fr scales the upper nilpotent matrix by 1/2; inverse Frobenius scales it by 2. The comparison with LanglandsParameterStacks uses its geometric degree deg_LP=−deg_arithmetic and the separate LP-normalized WD conversion of §0.7: r_LP(w)=φ(w,diag(|w|⁻¹ᐟ²,|w|¹ᐟ²)), with the same N. At q=2 its Fr and inverse-Fr scaling factors are 2 and 1/2. Fourier inversion uses ψ and the ψ-self-dual Haar measure; replacing ψ by its conjugate also dualizes the oscillator. At a nonzero x with ψ(x)=ζ≠1, the two characters give ζ and ζ⁻¹, not an unchanged central action.

For a number field k use compatible local measures and a fixed Haar measure on each adelic quotient; a nonvanishing assertion is invariant under positive rescaling of these measures. The theta integral is linear in the kernel f and conjugate linear in the cuspidal vector φ: Θ(if,φ)=iΘ(f,φ) and Θ(f,iφ)=−iΘ(f,φ). Harish–Chandra parameters use λ+ρ, with the ρ of the specified positive system. These numerical and two-term normalization witnesses are retained at every use in the layers below.

## Exact supplier contracts

### From Mathlib

Use `LinearEquiv`, `Submodule`, `Submodule.map`, `Module.finrank` and `LinearMap.ker` for the octonion automorphism and null-subspace geometry. A linear equivalence is an invertible linear map; it imposes no octonion multiplication law. A submodule has additive and scalar closure; it imposes neither trace zero nor zero multiplication. `Representation` in Mathlib/RepresentationTheory/Basic.lean is a monoid homomorphism into module endomorphisms. It supplies algebraic actions, with no topology, smoothness, admissibility or unitarity. `Representation.Coinvariants` supplies the algebraic quotient used by the smooth supplier, rather than a new private quotient here.

### From Tau Ceti

`TauCeti.Octonion` in TauCeti/Algebra/Octonion/Basic.lean is the split Zorn carrier with scalar entries a,b and vector entries v,w. Consume `TauCeti.Octonion.mul_a`, `TauCeti.Octonion.mul_b`, `TauCeti.Octonion.mul_v`, `TauCeti.Octonion.mul_w`, `TauCeti.Octonion.trace`, `TauCeti.Octonion.norm`, `TauCeti.Octonion.conj_mul`, `TauCeti.Octonion.mul_self`, `TauCeti.Octonion.norm_mul`, `TauCeti.Octonion.imaginary`, and `TauCeti.Octonion.finrank_imaginary`. The carrier and identities are over commutative rings; the last dimension theorem uses the strong rank condition. The imaginary module is exactly the trace kernel. None of these declarations constructs Aut(O) as an algebraic group. On top e₁ and top e₂ the product is bottom e₃, fixing the sign used in §0.1.

Consume `TauCeti.Octonion.finrank_derivationLieAlgebra` in TauCeti/Algebra/Octonion/Derivation.lean over a commutative ring with the strong rank condition, and `TauCeti.Octonion.isIrreducible_imaginaryLieSubmodule` in TauCeti/Algebra/Octonion/Fundamental.lean over a field with 2 nonzero. These concern the derivation Lie algebra and do not identify the represented automorphism group. In characteristic 2 the scalar unit has trace 0 and gives a one-dimensional invariant subspace, so the latter hypothesis is essential.

For the algebraic spinor modules over the local field, consume `TauCeti.SpinPolarizationData`, `TauCeti.spinAction` and `TauCeti.spinRep` from TauCeti/RepresentationTheory/Spin/Polarization/Basic.lean, TauCeti/RepresentationTheory/Spin/Polarization/CliffordAction.lean and TauCeti/RepresentationTheory/Spin/Representation.lean. The action is on the exterior algebra of the chosen isotropic summand over a commutative coefficient ring; no algebraic-closure hypothesis is required once the polarization is supplied. For the split local forms choose their hyperbolic polarizations. This is an algebraic action on the orbit coordinates; the compact-function modules with complex coefficients use the smooth supplier. In dimension 7 the isotropic summand has dimension 3 and its exterior algebra has dimension 8; the central scalar −1 acts by −1, so the action does not descend to SO₇. The complex dual-group comparisons use SpinRepresentations Layers 4 and 8.

Consume `TauCeti.Algebra.IsSplittingField` in TauCeti/Algebra/CentralSimple/Splitting.lean (L splits A when L⊗A is isomorphic to a matrix algebra over L), `TauCeti.Algebra.isSplittingField_of_finrank_eq_deg` in TauCeti/Algebra/CentralSimple/Subfield.lean (a subfield of degree deg A splits the central simple A), `TauCeti.Algebra.finrank_le_deg` in the same file (a subfield has degree at most deg A) and `TauCeti.Algebra.exists_isSplittingField_finrank_eq_deg` in TauCeti/Algebra/CentralSimple/MaximalSubfield.lean (a central division algebra has a splitting subfield of degree deg D). The converse, that a splitting field of degree deg D embeds in D, is not at the pin; it is the criterion of §2.2.

Consume `TauCeti.AlbertAlgebra` and `TauCeti.AlbertAlgebra.finrank_eq_twentySeven` in TauCeti/Algebra/AlbertAlgebra/Basic.lean. Its product is the symmetrized octonion-matrix product, over a commutative ring with 2 invertible. Its dimension is 27. The Jordan identity and rational-form descent are not part of this carrier’s contract. On a diagonal frame element Eᵢ the product Eᵢ∘Eᵢ=Eᵢ, while Eᵢ∘Eⱼ=0 for i≠j; symmetrization is not ordinary associative matrix multiplication.

The native matrix group schemes `TauCeti.E7Minuscule.groupScheme`, `TauCeti.E6Minuscule.groupScheme` and `TauCeti.D4Tripled.groupScheme` are the integral Kostant toral-closure carriers in TauCeti/Algebra/Lie/E7/Minuscule/Carrier.lean:188, TauCeti/Algebra/Lie/E6/Minuscule/GroupScheme.lean:109 and TauCeti/Algebra/Lie/D4/Tripled/GroupScheme.lean:119. Their contracts do not assert reductivity or identification with the pinned Chevalley groups. `TauCeti.D4Tripled.trialityAutomorphism` in TauCeti/Algebra/Lie/D4/Tripled/Triality.lean:142 and `TauCeti.E6DoubledMinuscule.graphAutomorphism` in TauCeti/Algebra/Lie/E6/DoubledMinuscule/GraphAutomorphism.lean:468 act on those respective tripled and doubled carriers; neither supplies the rational forms or the normalized operator on a minimal representation. `TauCeti.G2ShortRoot.serreRepresentation` in TauCeti/Algebra/Lie/G2/ShortRoot/Basic.lean:173 acts on the seven-weight module, and `TauCeti.Octonion.g₂ToDerivationLieAlgebra` in TauCeti/Algebra/Octonion/Serre.lean:267 is a Lie homomorphism, not a group comparison. Sections 0.1, 2.1–2.3, 2.6 and 3.1 use LieHighestWeight Layer 8, SpinRepresentations Layers 4 and 8 and ReductiveGroups Layer 9 for their identified Lie models, triality and reductive groups: the native matrix carriers do not supply those identifications, the adjoint E₇ model, the E₆⋊C₂ and E₆^D forms, or smooth minimal representations.

Use `TauCeti.IsSmoothDiscrete` and `TauCeti.SmoothDiscreteTopRep` in TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:256,601 for discrete modules with open point stabilizers and their full subcategory of `TopRep`; give ℂ the discrete topology for this use. These supply smooth actions; admissibility, normalized parabolic induction, Jacquet functors and the exceptional minimal modules are separate requirements. For the trivial action on a countably infinite direct sum of ℂ, every stabilizer is the whole group and is open, but every compact-open fixed space is infinite-dimensional. Smoothness therefore does not supply admissibility.

### From TauCetiRoadmap.ReductiveGroups and TauCetiRoadmap.ReductiveGroupsPartII

Consume ReductiveGroups Layer 3, “Subgroups, quotients, components”, for closed subgroup schemes, components and central quotients, and Layer 3A.1 for scheme-theoretic action stabilizers; Layer 9, “Pinned Chevalley–Demazure group schemes over ℤ”, for pinned groups, root maps and scalar extension. Consume ReductiveGroupsPartII §§RG2.5.1–RG2.5.2 for dual groups, dual Levi inclusions, L-groups and centers. The exceptional identifications and rational-point descent are proved here. A central μ₂ quotient has zero Lie dimension but need not be surjective on rational points: the obstruction lies in H¹(F,μ₂)=Fˣ/Fˣ². This obstruction is retained in §2.3.

What ReductiveGroups must provide (gap:schematic-centralizers): For an affine finite-type group over a characteristic-zero field and a closed subgroup, construct the scheme-theoretic centralizer as a closed subgroup scheme and prove its test-algebra and scalar-extension characterizations. The contract extends Layer 3; Layer 3A.1 supplies the action-stabilizer interface.

### From TauCetiRoadmap.RepresentationTheory/LieHighestWeight, SpinRepresentations and ClassicalGroups

Consume LieHighestWeight Layer 8 for split exceptional Lie models, the split Albert Jordan identity, the positive real octonions and compact Albert algebra with complexification comparisons. Consume SpinRepresentations Layers 4 and 8 for the complex spin/half-spin comparisons and D₄ triality; the algebraic spin actions over the local field use the native polarized modules specified above. Consume ClassicalGroups Layer 6 for GLₙ↓GLₙ₋₁ interlacing, restricted to SU₃⊃SU₂ by complexification and Zariski density. For (a,b,c) with a≥b≥c, the interlacing weight (b,b) has SU₂ highest weight 0; it is this compact branching theorem, not the p-adic generic restriction theorem, that §9.6 uses.

### From TauCetiRoadmap.RepresentationTheory/LieGroups and CompactGroups

Consume LieGroups Layer 2 for the Lie structure on a closed subgroup of a real matrix group and Layer 7 for compact-matrix-group complexifications and their real forms, with finite-dimensionality and closedness explicit. Consume CompactGroups Layers 3–5 for continuous matrix coefficients, Schur orthogonality and Peter–Weyl with normalized Haar measure. The identity subgroup has volume 1 in its own normalized Haar measure; a fixed vector for SU₂ gives the invariant matrix coefficient used by §9.6.

### From TauCetiRoadmap.ClassFieldTheory, TauCetiRoadmap.QuadraticFormInvariants and TauCetiRoadmap.LanglandsParameterStacks

ClassFieldTheory Layer 5 supplies the local Brauer group with its invariant and Layer 6 the local class formation, whose invariant satisfies inv_E∘res=[E:F]·inv_F for every finite extension E/F; a degree-n extension therefore kills exactly the classes whose invariant is killed by n. QuadraticFormInvariants §7B supplies the comparison of the Brauer group of central simple F-algebras with H²(G_F,(F^s)ˣ), natural under field extension. These are consumed only by the embedding criterion of §2.2. ClassFieldTheory Layer 8 the local existence theorem for open subgroups of finite index, and Layer 9 the topological Weil group and degree map; the normalization of Fr and |Fr| is the one in Conventions. LanglandsParameterStacks LP0.5 supplies its classical admissible-parameter definition, and LP1.11–LP1.12 its coefficient-valued WD parameter and monodromy comparison. Its LP0.4 uses geometric degree deg_LP=−deg_arithmetic, so its arithmetic Frobenius scales N by q. Section 0.7 supplies the LP-normalized WD conversion from W_F×SL₂ parameters, with r_LP(w)=φ(w,diag(|w|⁻¹ᐟ²,|w|¹ᐟ²)) and unchanged N. Compare this pair with LP1.11–LP1.12 after fixing ℓ≠p and a field isomorphism ℂ≅Q̄ℓ; the inertia image is finite. This conversion changes the diagonal twist, and does not identify r_LP with r or invert Weil-group elements. The wild-parameter stack does not by itself provide the exceptional complex split-group specializations of §0.7.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

Consume §§SR.0.2, SR.0.4 for the abelian smooth category, smooth vectors, admissibility and smooth duals; §§SR.2.1–SR.2.3 for compact/smooth/parabolic induction, Jacquet modules, geometric lemma and Whittaker functionals; §SR.2a.1 for second adjointness over ℂ; §§SR.3.1–SR.3.4 for finite length, Bernstein decomposition, compact-center cuspidal splitting, temperedness, Langlands classification and regular-isotypic quotients; §SR.5.1 for inverse-twist coinvariants. Its Whittaker multiplicity-one theorem has GL₂ hypotheses. On a one-dimensional χ, the two-sided regular quotient acts by χ(a)/χ(b), pinning the right inverse used in all five Jacquet filtrations.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroupsPartII

The following contracts extend the base supplier’s named sections and the indicated unitary Part II layers. They are hypotheses on supply, not assumptions that the theorems have been proved.

What SmoothRepresentationsOfLocalGroupsPartII must provide (gap:quasisplit-whittaker): For every connected quasi-split reductive group over a characteristic-zero nonarchimedean local field and every Whittaker datum, the Whittaker space of an irreducible smooth complex representation has dimension at most one. The contract belongs to SRU.3, extension of generic representation inputs.

What SmoothRepresentationsOfLocalGroupsPartII must provide (gap:wavefront-all-residue): For a connected reductive group over a characteristic-zero nonarchimedean local field F of any residue characteristic, an irreducible smooth complex representation π and an F-rational nilpotent orbit O maximal among the orbits with nonzero coefficient in its Harish–Chandra–Howe local character expansion, prove that the generalized Whittaker space for O is finite-dimensional with dimension c_O, using a fixed nontrivial ψ, invariant pairing and compatible orbital-measure and Fourier normalizations. The contract belongs to SRU.3, extension of local character theory. (GS, proof of Lemma 3.4, p. 14 (GS lines 515–518); Var, main theorem, pp. 1027–1048, uncertified.)

What SmoothRepresentationsOfLocalGroupsPartII must provide (gap:steinberg-unipotent): For a split connected reductive group H over the fixed characteristic-zero nonarchimedean F and a maximal unipotent U, identify the restriction St_H|U with the left regular module C_c^∞(U(F)) and deduce (St_H)_(N,χ)≠0 for every closed subgroup N⊂U(F) and smooth character χ:N→ℂˣ. The contract belongs to SRU.4, Steinberg extensions. (LL, proof of Lemma 10.3, p. 28 (LL lines 1152–1154).)

What SmoothRepresentationsOfLocalGroupsPartII must provide (gap:rank-one-plancherel): For a connected reductive group over a characteristic-zero nonarchimedean local field, provide for a maximal parabolic of the group or of one of its Levi subgroups with unitary supercuspidal inducing data the rank-one Harish-Chandra–Silberger reducibility criterion at nonzero real exponents, with the chosen normalization of its meromorphic Plancherel scalar, and for unitary discrete-series data σ on any parabolic the Harish-Chandra commuting-algebra theorem: the commuting algebra of the normalized induction has dimension |R(σ)|, where R(σ) is the stabilizer W(σ) modulo the subgroup generated by the reflections whose rank-one Plancherel scalar vanishes at σ. The contract belongs to SRU.3, extension of reducibility inputs. The Levi-subgroup case is needed for the non-maximal P₁₃ series of §1.11, and the commuting-algebra theorem for the zero-exponent assertions of §§1.1, 1.4, 1.11 and 1.12, including the Steinberg-data Siegel induction of §1.12.

What SmoothRepresentationsOfLocalGroupsPartII must provide (gap:prime-degree-torus-distinction): For a characteristic-zero nonarchimedean local field F of residue characteristic p, a central division F-algebra D of odd prime degree ℓ≠p, and every irreducible smooth complex representation τ of D× trivial on F× of dimension greater than one, prove that τ has a nonzero vector fixed by K× for some maximal subfield K⊂D, by the admissible-pair parametrization of such τ and the zero-weight dimension formula for unramified and totally ramified K. The contract belongs to SRU.3, extension of local character theory. (LT, Theorem 1.4.2, printed pp. 6–7 (LT lines 309–330).) For ℓ=3, p=2, q=2 and conductor parameter m=1, an unramified admissible pair tested against a totally ramified K gives fixed-space dimension q^m=2. The one-dimensional representations are treated in §5.2 by the next contract and local class field theory.

What SmoothRepresentationsOfLocalGroupsPartII must provide (gap:local-division-characters): For every central division algebra D of finite dimension over a characteristic-zero nonarchimedean local field F, pullback along the reduced norm Nrd:D×→F× is a bijection from smooth complex characters of F× to smooth complex characters of D×; equivalently Nrd is surjective and its kernel SL₁(D) is the closure of the commutator subgroup of D×. The contract belongs to SRU.3, extension of local character theory. (LT, §2, printed p. 9 (LT lines 353–357).) For D of degree 3 and χ unramified of order 3, χ∘Nrd is trivial on F× since Nrd(a)=a³, while a character of D× nontrivial on SL₁(D) is what the contract excludes.

What SmoothRepresentationsOfLocalGroupsPartII must provide (gap:isotypic-parabolic): For a smooth H×M module W with maximal irreducible admissible τ-isotypic quotient τ⊗V, the maximal τ-isotypic quotient of normalized parabolic induction from M to G is τ⊗Ind_P^G V. The contract belongs to SRU.0, extension of commuting-action interfaces.

What SmoothRepresentationsOfLocalGroupsPartII must provide (gap:isotypic-compact): For closed H⊂G and a smooth H×L module W, maximal τ-isotypic quotients commute with compact induction from H to G when τ is irreducible admissible and Ext¹_L(τ,τ)=0, including Ext¹_PGL₂(F)(1,1)=0. The contract belongs to SRU.0, extension of commuting-action interfaces.

What SmoothRepresentationsOfLocalGroupsPartII must provide (gap:schwartz-ext): For a connected reductive group G over a characteristic-zero nonarchimedean local field with compact center, identify smooth Ext¹_G(δ,π) with tempered Schwartz-module Ext¹ for discrete series δ and irreducible tempered π, and prove that δ is projective in the Schwartz category. The contract belongs to SRU.2, extension of tempered representation inputs.

### From TauCetiRoadmap.MetaplecticAutomorphicForms

Consume §§0.15–0.17, 1.1 and 2.4a–2.7 for Schrödinger models, Stone–von Neumann, the double cover and its ψ convention. Consume §§3.4–3.8 for commuting-action big theta modules and finite-length small quotients, §3.34 for similitude theta, §3.37 for rank-one oscillator constituents, §3.38 for the GL₂–GSO₄ calculation, §3.38a for the restricted Mp₂ × G₂ oscillator, its Jacquet sequence, cuspidal nonvanishing/irreducibility/injectivity and the indicated tempered finite-length consequence, §3.39 for the D₅/D₆ minimal orthogonal models with its explicit tempered hypotheses, and §3.40 for the anisotropic ternary lift of a supercuspidal PGL₂ representation. In §3.38 the scalar (zI,z⁻¹I) acts on τ⊗τ by ωτ(z)ωτ(z⁻¹)=1. In a genuine oscillator the covered central element acts by −1; tensoring two genuine factors gives +1. No classical Howe theorem is applied directly to an exceptional restricted pair.

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison and TauCetiRoadmap.ModularityAndLanglandsExtensions

SmoothRepresentationsOfLocalGroups §SR.5.2, “classical-llc-normalization”, supplies the classical GLₙ Weil–Deligne correspondence; its “wd-raw-parameters” uses arithmetic degree and scales N by q^(deg_arithmetic). The linear WD input from §0.7 is therefore (r_LP,N). EndoscopicTransferAndUnitaryTraceComparison §§4.7a, 10.30–10.31 supplies its trace-map comparison and the essentially square-integrable inner-form Jacquet–Langlands comparison with its character normalization. ModularityAndLanglandsExtensions §3.5 supplies the Gan–Takeda GSp₄ correspondence, particularly part (vi), equality of Plancherel measures for the nongeneric supercuspidal and its parameter. It is used in §1.13 for τρ; its genericity indicator is 0, so a generic Shahidi theorem cannot apply directly to it. The common parameter, not a presumed generic functional on τρ, identifies the Plancherel scalar.

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors and TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactorsPartII

Consume AutomorphicLFunctionsAndLocalFactors AL.4 for unramified L-group Euler factors det(1−T r(t)) of a supplied finite-dimensional representation r; take r to be the degree-eight spin representation of Spin₇ constructed by RepresentationTheory/SpinRepresentations Layer 4 (the exterior algebra of a three-dimensional isotropic summand, of dimension 1+3+3+1=8) and compared with the exceptional inclusion in §0.6. At t=1 this r gives (1−T)⁸, whereas the trivial representation gives 1−T, so AL.4 alone does not select r; its “Central periods”, target normalized-rs-period, supplies the nonzero adjacent-rank invariant functional for generic irreducible admissible inputs with opposite Whittaker characters. Its specialization to W∨⊗V gives the generic GLₙ↓GLₙ₋₁ quotient in §5.7. The two additional spin contracts extend the Part II local-factor layer D.6 beyond its classical doubling factors.

What AutomorphicLFunctionsAndLocalFactorsPartII must provide (gap:ramified-spin-factor): For generic irreducible admissible complex σ of PGSp₆(F), with F characteristic-zero nonarchimedean, construct Shahidi’s degree-eight L(s,σ,Spin) from the Heisenberg parabolic P₄=M₄N₄ of split F₄ with M₄=GSp₆, normalized by δP₄=|sim|⁸ and I(σ,s)=Ind_P₄^F₄(σ⊗|sim|^(s+4)) in unnormalized induction, and prove for supercuspidal σ that a pole at s=0 is equivalent to reducibility of I(σ,−1). The contract belongs to D.6, extension to the exceptional Langlands–Shahidi spin factor. (SW, §5.1, Lemma 5.4, p. 38 (SW lines 1966–1982).)

What AutomorphicLFunctionsAndLocalFactorsPartII must provide (gap:bg-spin-integral): For generic irreducible admissible complex σ of GSp₆(F) with trivial central character over characteristic-zero nonarchimedean F, construct the Bump–Ginzburg–Vo local integral Z(s,W,f_s) for sections f_s in the unnormalized GL₂ series V(s)=Ind_B^GL₂(|a/d|^s), using the meromorphic intertwiner M*(s):V(s)→V(1−s) normalized by M*(s)f_s*=f*_(1−s) for f_s*=L_F(2s)f_s⁰ and f_s⁰(1)=1, and rational γ_BG(σ,s) with γ_BG(σ,s)Z(s,W,f_s)=Z(1−s,W,M*(s)f_s) and, for unramified σ and normalized spherical W, value L(s,σ,Spin) at f_s*, proving for supercuspidal σ that constant-section integrals are entire, some such integral is nonzero at each prescribed s, and γ_BG has the same zero and pole divisors as L(1−s,σ,Spin)/L(s,σ,Spin), with multiplicity. The contract belongs to D.6, extension to the Bump–Ginzburg–Vo spin integral. (SW, §§5.2–5.3, Propositions 5.7 and 5.9, pp. 43–46 (SW lines 2300, 2399, 2427)).

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups and TauCetiRoadmap.AutomorphicSpectralTheory

Consume AutomorphicFormsOnReductiveGroups §§2.1–2.7 for real smooth/globalized modules and infinitesimal characters, §§3.1–3.5 for automorphic representations and restricted tensors, and §§4.1–4.2 for constant terms and cuspidal realizations; its exact supplier contract for ArithmeticLocallySymmetricSpaces ALS.F.6 supplies cusp-form rapid decay. Consume AutomorphicSpectralTheory §§1.1–1.2 for convergence, §§2.4–2.6 for meromorphic continuation and residues, and §4.4 for the residual-spectrum criterion. These supply general analytic operations; the exceptional poles, kernel convergence estimates, unfolded coefficients and local constituent identifications are proved in Layer 10.

What AutomorphicFormsOnReductiveGroups must provide (gap:regular-real-unitarity): For each of split G₂(ℝ) and split PGSp₆(ℝ), with a fixed positive root system, prove that there exists C≥0 depending only on the group and that system such that every irreducible unitary Harish–Chandra module with real integral discrete-series infinitesimal character Λ and ⟨Λ,α∨⟩>C for every positive root α is a discrete-series module. The contract belongs to §§2.4, 5.4, extension of real unitary theory. (LL, §8.4, p. 25 (LL lines 1038–1040); HPS, infinitesimal-character correspondence, pp. 447–471, waived.)

## How to read the build

Layer 0 fixes groups, coordinates and parameter bookkeeping; Layer 1 gives every normalized inducing family used by the lift tables. Layer 2 constructs the exceptional ambient models. Layer 3 calculates their Jacquet modules and positive-exponent supports, and decomposes the division minimal model as a G₂ module. Layer 4 establishes cubic-period existence and uniqueness before exclusion. Layer 5 proves the two E₆ correspondences; Layer 6 proves independent noncuspidal finiteness and the dichotomy. Layer 7 supplies the enhanced period bound and tempered E₇ Howe theorem. Layer 8 completes all lift tables and the discrete-series trichotomy. Layer 9 produces the quaternion relative models, and Layer 10 builds the global kernels and their nonvanishing and cuspidality theorems. A Needs line names the statement carriers and the inputs for the described proof route; the route is a proof sketch, not a restriction on other proofs.


## Layer 0: octonion geometry and complex parameters

The algebraic objects are defined over a characteristic-zero field; the local Fourier data use the fixed characteristic-zero local field. The split carrier is used throughout the null geometry.

### 0.1 The octonion model of G₂

For any field F, define an octonion automorphism to be an F-linear equivalence of `TauCeti.Octonion F` preserving 1 and the ordered product. For characteristic-zero F, represent this automorphism functor by an affine smooth connected group and identify it, with a chosen pinning, with split G₂. It is both simply connected and adjoint; its standard seven-dimensional module is the trace kernel. (GS, §§2.1–2.3, pp. 6–7 (GS line 196)).

For every commutative F-algebra A, the represented functor takes A to the A-linear equivalences of O⊗_F A preserving 1 and multiplication. Compare this base change with the Zorn carrier over A; its definition includes nonreduced A. The field-valued definition above is its specialization to F itself.

The construction has the following API.

- The predicate on an F-linear equivalence g of Octonion F: g fixes 1 and g(xy) = g(x)g(y) for all x, y. The group of F-points of Aut(O) is the set of linear equivalences satisfying it.
- The composite of two octonion automorphisms is an octonion automorphism, and the identity is one.
- The inverse of an octonion automorphism is an octonion automorphism.
- An octonion automorphism preserves TauCeti.Octonion.trace.
- An octonion automorphism preserves TauCeti.Octonion.norm.
- An octonion automorphism maps TauCeti.Octonion.imaginary onto itself.
- Two octonion automorphisms that agree on a spanning set of Octonion F are equal.
- The pinned comparison of the represented group Aut(O) with the split Chevalley group of type G₂ identifies its torus, root subgroups and the 7-dimensional representation on the imaginary octonions (the represented group comparison of this subsection).

A proof route uses polynomial multiplication-preservation equations in GL₈; derive preservation of trace and norm from the quadratic identity x²=tr(x)x−N(x)1. Compare the torus and six positive root subgroups in the Zorn model with the Chevalley pinning; prove the map on groups, rather than infer a group isomorphism only from Der(O).

*Needs:* `TauCeti.Octonion`; `TauCeti.Octonion.norm_mul`; `TauCeti.Octonion.mul_self`; `TauCeti.Octonion.finrank_imaginary`; ReductiveGroups Layer 9; ReductiveGroups Layer 3; RepresentationTheory/LieHighestWeight Layer 8.

**Checks.**

- The identity linear equivalence is an octonion automorphism.
- The linear involution conjugation fixes 1 and N but fails multiplicativity on two noncommuting Zorn basis elements.
- The long-root SL₃ element diag(2,1/2,1) sends the top-right vector e₁ to 2e₁ and is an automorphism.
- For top vectors u=e₁,v=e₂, uv is bottom e₃. Conjugation gives conjugate(uv)=−bottom e₃, whereas conjugate(u)conjugate(v)=+bottom e₃, excluding conjugation from the automorphism group.
- On A=F[ε]/(ε²), a derivation D gives g=1+εD with inverse 1−εD. For the long-root diagonal derivation with D(u₁)=u₁ and D(u₂)=−u₂, the ε coefficient of g(u₁)g(u₂) is v₃−v₃=0=D(v₃). The linear choice D=id instead sends 1 to 1+ε and fails the unit law; using only F-points would miss this test.

### 0.2 Null subspaces of the imaginary octonions

Define a null subspace to be a submodule W of `TauCeti.Octonion F` with W≤ker(trace) and xy=0 for every ordered pair x,y∈W. Over every characteristic-zero field, prove that its dimension is at most two, that any two null subspaces of equal dimension are conjugate, and that any two incident null line-plane flags are conjugate. These are transitivity under unit- and product-preserving linear equivalences of this octonion algebra; thus null lines, planes and flags each have one G₂(F)-orbit. (GS, §2.4, p. 7; §13.4, p. 44 (GS line 237); HKT, Appendix A.1, pp. 22–23 (HKT line 911)).

The construction has the following API.

- A submodule W of Octonion F is null when W ≤ imaginary F and xy = 0 for all x, y in W.
- A null subspace lies in the imaginary octonions.
- The product of two elements of a null subspace is zero.
- Every element of a null subspace has norm zero (by TauCeti.Octonion.mul_self with trace zero).
- A null subspace has dimension at most two.
- The image of a null subspace under an octonion automorphism is null.
- Two null subspaces of the same dimension are conjugate by an octonion automorphism; null lines and null planes therefore form single G₂(F)-orbits.

A proof route uses the Zorn multiplication and the polar form of N to classify mutually annihilating trace-zero vectors. Reduce a nonzero null vector to a standard Zorn vector using elementary long and short root operations, then compute its annihilator to classify planes.

*Needs:* §0.1.

**Checks.**

- The zero subspace is null, and the identity automorphism conjugates the unique dimension-zero subspace to itself; transitivity includes dimension 0.
- The span of top-right e₁ and bottom-left e₂ is a two-dimensional null subspace.
- The line F·1 is not null.
- The Zorn idempotent with diagonal (1,0) has norm zero, but its line is not null because its trace is 1.
- The line spanned by the Zorn vector with top-right entry e₁ and all other entries zero is a null subspace.
- The zero subspace has dimension 0 and every ordered product 0. For top e₁ and bottom e₂ all four basis products are 0; top e₁·bottom e₁ instead has diagonal (1,0) and is nonzero.

### 0.3 The two G₂ parabolics and their radicals

Choose simple roots α short and β long. Put P=MN for the stabilizer of a null plane and Q=LU for a null line in an incident flag, so P∩Q=B. Both Levis are GL₂; δP=|det|³ and δQ=|det|⁵. N is Heisenberg of dimension 5 with center U₍₃α₊₂β₎ and N/Z=Sym³(F²)⊗det⁻¹. U has graded pieces F², det, F²⊗det and nilpotency class 3. Its center is U₍₃α₊β₎U₍₃α₊₂β₎; U/Z(U), rather than U/[U,U], is Heisenberg. (GS, §2.4, pp. 7–8; §11.2, p. 34 (GS line 237)).

The construction has the following API.

- The parabolics are the stabilizers of the indicated null plane and line, with common Borel for an incident flag.
- Their normalized Jacquet functors use δP¹ᐟ²=|det|³ᐟ² and δQ¹ᐟ²=|det|⁵ᐟ² on the specified GL₂ Levis.
- The radical N has the alternating commutator pairing of Sym³(F²)⊗det⁻¹ into its one-dimensional center; the lower central series of U has successive dimensions 2,1,2.

A proof route computes radicals as products of positive root groups and their commutators. Sum radical weights: 2ρP=3(3α+2β), 2ρQ=5(2α+β); identify Levi modules by highest weights.

*Needs:* §0.1; §0.2; ReductiveGroups Layer 9.

**Checks.**

- The P radical has graded dimensions 4+1=5 and center dimension 1; the Q radical has 2+1+2=5 and center dimension 2. Abelianizing Q gives dimension 2, whereas quotienting by its center gives dimension 3.
- For m=diag(ϖ,1), δP(m)=q⁻³ and δQ(m)=q⁻⁵; their positive square roots are q⁻³ᐟ² and q⁻⁵ᐟ².
- The Q radical has roots α, α+β, 2α+β, 3α+β, 3α+2β. Neither 3α+β nor 3α+2β can be increased by a radical root to another root, so both root groups are central; α+(α+β)=2α+β and α+(2α+β)=3α+β give nonzero commutators. This distinguishes its two-dimensional center from N’s one-dimensional center.

### 0.4 Cubic étale Fourier data

Identify generic characters of N(F) trivial on its center with nonzero-discriminant binary cubics using ψ and the dual of Sym³(F²)⊗det⁻¹. Their M(F)-orbits correspond to cubic étale F-algebras E. Choose ψE in each orbit; π_(N,ψE) is the existing twisted coinvariant quotient and W_E(π)=Hom_N(π,ψE). The choice is transported by conjugation, not made into a canonical basis. (GS, §2.4, p. 7; §3.5, p. 14; §5.4, p. 18 (GS line 237)).

The construction has the following API.

- M-conjugate characters give naturally transported coinvariant and functional spaces.
- The full algebraic dual of π_(N,ψE) identifies with W_E(π).
- Twisted coinvariants are exact for these unipotent groups over C.

A proof route uses the binary-cubic orbit correspondence and equivariance of twisted coinvariants. Pin the trace pairing and ψ so that ψ and its conjugate cannot be exchanged silently.

*Needs:* §0.3; SmoothRepresentationsOfLocalGroups §SR.5.1; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3.

**Checks.**

- The algebra F³ gives a nondegenerate split binary-cubic orbit.
- F×K for quadratic field K is distinct from a cubic field and from F³.
- The trivial character has discriminant zero and is not indexed by a cubic étale E.
- The split cubic xy(x−y) has discriminant 1 in the coefficient convention (a,b,c,d)=(0,1,−1,0), while x³ has discriminant 0. In particular a nonzero cubic need not be generic.

### 0.5 Long-root SL₃ and unitary stabilizers

The long-root subgroup in G₂ is SL₃, the pointwise stabilizer of the split quadratic subalgebra F×F⊂O. Its setwise stabilizer is SL₃⋊C₂ with pinned outer action. A quadratic field K⊂O has pointwise stabilizer the quasi-split SU₃(K/F) and setwise stabilizer SU₃(K/F)⋊C₂. (GS, §2.5, p. 8 (GS line 265)).

The construction has the following API.

- Pointwise stabilizers fix every element of the embedded quadratic algebra, and their actions on its orthogonal complement preserve the induced hermitian form and determinant.
- The split quadratic embedding gives SL₃, while a quadratic-field embedding gives the quasi-split SU₃(K/F).
- Restriction to the quadratic algebra gives the component quotient C₂ of the setwise stabilizer, with the chosen conjugation as a splitting.

A proof route uses the decomposition O=K⊕K⊥ and the induced 3-dimensional K-hermitian space; compute the determinant condition and the normalizing conjugation.

*Needs:* §0.1; ReductiveGroups Layer 9; ReductiveGroups Layer 3.

**Checks.**

- In F×F, the involution exchanges (1,0) and (0,1), so it is setwise but not pointwise stabilizing; the quotient of the two stabilizers has order 2.
- The pointwise groups have absolute dimension 8 in both the split and quadratic-field cases, while the disconnected extension has two components.
- In the split quadratic case diag(2,1/2,1)∈SL₃ fixes the two diagonal idempotents and scales the first top Zorn vector by 2 and the first bottom vector by 1/2; their product is unchanged because 2·(1/2)=1. Scalar multiplication by 2 on the whole octonion space would instead send the unit to 2 and is not this stabilizer.

### 0.6 Exceptional inclusions of complex dual groups

Using the existing dual root datum construction, identify G₂∨=G₂(C), PGL₃∨=SL₃(C), and PGSp₆∨=Spin₇(C). Construct SL₃→G₂→Spin₇ compatibly with the octonion 7-module and spin 8-module, fixing the long-root SL₃ inclusion. On its standard three-dimensional module V fix a nondegenerate symmetric bilinear form b, and define the inclusion SO(V,b)→SL(V)→G₂ by determinant-one isometries followed by that fixed inclusion. Over C this is the SO₃ subgroup used here. In G₂, the centralizers Z_G₂(SL₃)=μ₃ and Z_G₂(im(SO(V,b)→G₂))=μ₃⋊C₂=S₃; the commuting long- and short-root SL₂ factors give (SL₂,l×SL₂,s)/μ₂=SO₄. (GS, §2.6, p. 8; Theorem 15.1(v), p. 52 (GS lines 282–288, 2009)).

The construction has the following API.

- The inclusions SL₃(C)→G₂(C)→Spin₇(C) are injective algebraic homomorphisms compatible with the stated dual root data.
- Restriction of the seven-module to SL₃ is 1⊕3⊕3∨; restriction of the spin eight-module to G₂ is 1⊕7.
- The long-root SL₃ centralizer and the centralizer of the specified composite SO(V,b)→SL(V)→G₂ have the stated group structures, and the kernel of SL₂,l×SL₂,s→SO₄ is the diagonal μ₂.

A proof route is to compare weight lattices and root subgroups, compute centralizers on the octonion decomposition, and identify G₂ as a nonisotropic spinor stabilizer.

*Needs:* §0.1; §0.5; ReductiveGroupsPartII §§RG2.5.1–RG2.5.2; RepresentationTheory/SpinRepresentations Layer 8; RepresentationTheory/SpinRepresentations Layer 4; ReductiveGroups, gap schematic-centralizers.

**Checks.**

- On the seven-dimensional octonion module, restriction to SL₃ has dimensions 1+3+3=7; the eight-dimensional spin module restricts to G₂ as 1+7=8.
- The diagonal element (−1,−1) acts trivially in SO₄; dividing by either single μ₂ instead would give the wrong double covering.
- On SO(V,b) the seven-module is 1⊕3⊕3, with invariant dimension 1; its centralizer has order 6. For the principal SL₂ image in G₂ the seven-module is Sym⁶(C²), with invariant dimension 0; its centralizer has order 1. Since −I acts as (−1)⁶=1, this principal image is also isomorphic to SO₃; the specified inclusion distinguishes the two. (GS, §3.4(1)–(2), p. 13 (GS lines 452–456)).
- In μ₃⋊C₂, let ζ be a primitive cube root and c the involution. Then cζc⁻¹=ζ⁻¹=ζ²≠ζ, so this centralizer has order 6 and is nonabelian S₃; the abelian group μ₃×C₂ has order 6 but fails this test.

### 0.7 Complex local parameters

For a split connected reductive group with pinned dual Ĝ, a complex L-parameter is a Ĝ-conjugacy class of homomorphisms W_F×SL₂(C)→Ĝ(C), continuous on W_F with finite inertia image, semisimple on Frobenius and algebraic on SL₂; the two restrictions commute. Tempered means bounded Weil image; discrete means not contained in any proper Levi. Use the existing topological Weil group; |w|=q^(−deg w) for arithmetic Frobenius degree 1. This is not an integral parameter stack and is not a proof of LLC. (LL, §1, p. 2 (LL line 49); GS, §3.4, pp. 12–14 (GS line 401)).

F is a nonarchimedean characteristic-zero local field and the dual algebraic group is over C; the topological local Weil group is the imported one.

The construction has the following API.

- Temperedness and discreteness descend to Ĝ-conjugacy classes.
- An algebraic dual-group homomorphism transports a parameter when its image is Frobenius-semisimple; boundedness is preserved.
- The chosen arithmetic-Frobenius WD dictionary preserves inertia, Frobenius semisimplicity and monodromy.
- Define the LP-normalized WD conversion from representatives φ:W_F×SL₂(C)→Ĝ(C) of complex parameters to pairs (r_LP,N) by r_LP(w)=φ(w,diag(|w|⁻¹ᐟ²,|w|¹ᐟ²)) and N=dφ([[0,1],[0,0]]). It is equivariant for Ĝ-conjugation, hence induces a map on conjugacy classes. It has the same finite inertia restriction and nilpotent N as (r,N), and satisfies Ad(r_LP(w))N=|w|⁻¹N=q^(−deg_LP(w))N, with deg_LP=−deg_arithmetic. After fixing ℓ≠p and ℂ≅Q̄ℓ, transport this pair and the chosen square roots to obtain the split-group WD parameter of LanglandsParameterStacks LP1.11, to which LP1.12 applies. This is a conversion from φ, without an asserted equality r_LP=r. (LanglandsParameterStacks LP0.4, LP1.11–LP1.12.)

A proof route is to form the representation type on the imported Weil carrier and complex dual group. Prove the arithmetic dictionary with Frobenius-semisimple Weil–Deligne pairs, including r(w)Nr(w)⁻¹=|w|N. For the LP-normalized conversion, the two restrictions of φ commute and the diagonal twist is a homomorphism, so r_LP is a homomorphism. Conjugating the upper nilpotent matrix by diag(t,t⁻¹) multiplies it by t²; taking t=|w|⁻¹ᐟ² proves the LP scaling equation before the coefficient comparison.

*Needs:* ClassFieldTheory Layer 9; ReductiveGroupsPartII §§RG2.5.1–RG2.5.2; LanglandsParameterStacks LP0.4, LP1.11–LP1.12.

**Checks.**

- The trivial parameter is tempered but is not discrete for a split group of positive semisimple rank; for a torus the discreteness condition is vacuous.
- For positive semisimple rank, the parameter with trivial Weil part and principal Deligne SL₂ is discrete; erasing SL₂ gives the trivial parameter, which lies in a proper Levi. For Steinberg this SL₂ is nontrivial even though its Weil part is unramified.
- The GL₁ character w↦|w| is not tempered, unlike the trivial character.
- For arithmetic Frobenius Fr and q=2, |Fr|=1/2 and |Fr⁻¹|=2. The character |·| has unbounded image under positive and negative powers; the trivial character has image {1}.
- For q=3, trivial Weil restriction and the identity Deligne SL₂ in GL₂, N=E₁₂ and r(Fr)=diag(1/√3,√3) give Ad(r(Fr))N=N/3. The converted r_LP(Fr)=diag(√3,1/√3) gives 3N, while r_LP(Fr⁻¹) gives N/3, as required by geometric degrees −1 and 1. A coefficient-field isomorphism fixes 1/3 and 3, so it cannot make the original pair satisfy the supplier equation.
- With trivial Deligne SL₂, N=0 and r_LP(w)=r(w)=φ(w,1); both scaling laws have value 0. This case alone cannot detect the opposite twists.
- On inertia, |i|=1, so r_LP(i)=r(i)=φ(i,1), even for a parameter with nontrivial finite inertia image. For a nonabelian S₃ Weil quotient with trivial Deligne SL₂, r_LP remains that homomorphism: if a=(12), b=(123), then (ab)⁻¹=(23) but a⁻¹b⁻¹=(13). Elementwise inversion would fail multiplicativity.

### 0.8 Raw and fixed-split component groups

For a complex parameter φ put Sraw(φ)=π₀Z_Ĝ(im φ) and Ssplit(φ)=π₀(Z_Ĝ(im φ)/Z(Ĝ)). Retain the raw group and the map to the quotient. Enhancements for the split form have trivial action on the image of the dual center; a specified inner form instead imposes its Kottwitz central character on the appropriate refined centralizer. For G₂ the center is trivial; for PGSp₆ explicitly divide by Z(Spin₇)=μ₂. This definition fixes bookkeeping, not an unproved parametrization of packets for all groups. (LL, Main Theorem (vii), p. 4 (LL line 140); GS, §3.4(2), pp. 12–13 (GS line 401)).

The algebraic construction is over a characteristic-zero field unless a complex dual group is specified; orbit statements use the split octonion algebra. Local absolute values and smooth modules refer to the fixed p-adic convention.

The construction has the following API.

- The central quotient induces a homomorphism Sraw→Ssplit with its kernel explicitly computed in each use.
- For G₂ the raw and split component groups agree.
- A raw enhancement descends to the split quotient exactly when it is trivial on the image of the dual center.

A proof route is to take scheme-theoretic centralizers, then components over C; distinguish quotienting the algebraic group before taking components from an unsupported quotient of finite groups.

*Needs:* §0.7; §0.6; ReductiveGroups Layer 3; ReductiveGroups, gap schematic-centralizers.

**Checks.**

- The principal SL₂ in SL₃ has raw centralizer μ₃, while the fixed-split component group is trivial.
- For the parameter with trivial Weil part and Deligne SL₂ mapping onto the SO(V,b) subgroup of §0.6, the component group is S₃, with all three irreducible enhancements available.
- For the principal parameter in Spin₇, the raw μ₂ disappears in the split quotient; counting two split Steinberg representations is rejected.
- The centralizers for principal SL₂ in SL₃ and Spin₇ have orders 3 and 2; after dividing by the full dual center both orders are 1. For G₂ the center has order 1, so this quotient changes nothing.

### 0.9 The 15-dimensional PGSp₆ Jordan model

Let V=F⁶ with symplectic pairs (1,6),(2,5),(3,4). Put J=∧²V⊗ν⁻¹ with its Pfaffian cubic, unit e=x16+x25+x34, and reduced structure group SL₆/μ₂, meaning its cubic-norm isometry group. The unit stabilizer is PGSp₆. The stabilizers P_i of standard isotropic i-planes have M₃≅GL₃ via its action on ⟨x12,x13,x23⟩, M₂≅(GL₂×GL₂)/{(z,z⁻¹)}, M₁≅GSp₄ via its action on ⟨x12,x13,x14,x15⟩. In this coordinate a Levi element acting by t on e₁, by h of similitude ν on ⟨e₂,…,e₅⟩ and by ν/t on e₆ has GSp₄ coordinate (t/ν)h, of similitude t²/ν. The three maximal parabolics P₃, P₂, P₁ have moduli |det|², |det α det β|⁵, |ν|³ respectively; P₁₃=P₁∩P₃ has Levi M₁₃≅GL₂×GL₁. (GS, §9, pp. 29–31 (GS line 1070); GS, §13.4, p. 44 (GS line 1650)).

The construction has the following API.

- The normalized Pfaffian has N(e)=1 and is preserved by the reduced structure group SL₆/μ₂; fixing e gives PGSp₆.
- The ν⁻¹ twist makes the action factor through the scalar quotient GSp₆→PGSp₆.
- The three maximal-parabolic Levi identifications carry their displayed moduli; the M₂ action on its four-dimensional matrix module is x↦αxβᵗ with multiplier det α det β.

A proof route computes the wedge-cubic and unit stabilizers; determine Levi weights on radicals using the actual quotient torus. On V₄ identify the M₂ action as x↦αx βᵗ with multiplier det α det β.

*Needs:* ReductiveGroups Layer 9; RepresentationTheory/LieHighestWeight Layer 8; MetaplecticAutomorphicForms §§3.4–3.8, 3.34, 3.37–3.40.

**Checks.**

- A scalar z acts by z² on ∧²V and by z⁻² on ν⁻¹, so its product action is 1; omitting the twist leaves z².
- The exterior square has dimension 6·5/2=15; the Albert carrier has dimension 27 and cannot be substituted.
- At m₃=diag(ϖ,1,1) the P₃ modulus is q⁻²; at (α,β)=(diag(ϖ,1),I₂) the P₂ modulus is q⁻⁵; at ν(m₁)=ϖ the P₁ modulus is q⁻³. The P₁ radical has determinant t⁴ν⁻²·t²ν⁻¹=t⁶ν⁻³, equal to (t²/ν)³ in the ⟨x12,…,x15⟩ coordinate; the coordinate t⁻¹h on ⟨x26,…,x56⟩ has similitude ν/t², so an element with similitude ϖ there has modulus q³. The coordinate is therefore part of the convention. These are three values for three maximal parabolics, and specify no modulus for P₁₃. On a diagonal Jordan element with coordinates (1,2,3), the normalized Pfaffian is 6; at the unit it is 1.

### 0.10 The PGSp₆ Weyl chamber

On the M₃ torus, simple coroots are (1,t,t⁻¹),(t,t⁻¹,1),(1,t,t). On real characters s=(s₁,s₂,s₃), the third simple reflection is (s₁+s₂+s₃,−s₃,−s₂); the other two permute adjacent coordinates. The invariant quadratic form on characters is Σsᵢ²+(Σsᵢ)². The nine root hyperplanes are sᵢ−sⱼ=0 (i<j), sᵢ+sⱼ=0 (i<j), and sᵢ+Σsⱼ=0 (i=1,2,3); the positive chamber is s₁>s₂>|s₃|. (GS, §9, p. 30 (GS line 1107)).

The construction has the following API.

- The third reflection is an involution and, together with the first two permutations, preserves Σsᵢ²+(Σsᵢ)².
- The reflections permute the nine listed root hyperplanes, including the three additional hyperplanes sᵢ+Σsⱼ=0.
- Strict positivity on all positive coroots is equivalent to s₁>s₂>|s₃| for real characters in this coordinate system.

A proof route is to generate all coroots from the three displayed simple coroots under their reflections; distinguish characters from cocharacters and verify the quadratic form by substitution.

*Needs:* §0.9.

**Checks.**

- For s=(1,2,3), the third reflection gives (6,−3,−2); the quadratic form is 14+36=50 on the first vector and 49+1=50 on the second.
- The nine distinct hyperplanes comprise three differences, three pair sums and three sums sᵢ+Σsⱼ. At (3,2,1) their values are 1,2,1; 5,4,3; 9,8,7.
- Applying the third reflection twice sends (1,2,3)→(6,−3,−2)→(1,2,3). The alternative expression Σsᵢ²−(Σsᵢ)²/4 printed in GS §9 gives 5 and 195/4 on these two vectors, so it is not invariant under that reflection; the form used here gives 50 on both. At (3,2,−1), the simple-coroot exponents are 3,1,1, all positive, detecting a mistaken requirement s₃>0.

### Examples

Write uᵢ for the top Zorn eᵢ and vᵢ for the bottom eᵢ. Then u₁²=v₂²=u₁v₂=v₂u₁=0, so F u₁⊂F u₁+F v₂ is a null flag of dimensions 1 and 2. In contrast u₁v₁ has diagonal (1,0). For q=3 and N=E₁₂, the arithmetic WD pair scales N by 1/3 at Fr; its LP-normalized conversion scales N by 3 at Fr and 1/3 at Fr⁻¹. The subregular SO(V,b) and principal SO₃ images have seven-module invariant dimensions 1 and 0 and centralizer orders 6 and 1. For a scalar z on F⁶, z²·z⁻²=1 in the H model. At s=(1,2,3), the third H reflection gives (6,−3,−2) and both quadratic values are 50.

### Dependencies

The statement carriers and construction inputs are `TauCeti.Octonion`; `TauCeti.Octonion.norm_mul`; `TauCeti.Octonion.mul_self`; `TauCeti.Octonion.finrank_imaginary`; ReductiveGroups Layer 9; ReductiveGroups Layer 3; RepresentationTheory/LieHighestWeight Layer 8; SmoothRepresentationsOfLocalGroups §SR.5.1; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3; ReductiveGroupsPartII §§RG2.5.1–RG2.5.2; RepresentationTheory/SpinRepresentations Layer 8; RepresentationTheory/SpinRepresentations Layer 4; ClassFieldTheory Layer 9; LanglandsParameterStacks LP0.4, LP1.11–LP1.12; MetaplecticAutomorphicForms §§3.4–3.8, 3.34, 3.37–3.40. The internal inputs are §0.1, §0.2, §0.3, §0.5, §0.7, §0.6, §0.9. The exact additional supplier gaps are those on the individual Needs lines.

## Layer 1: normalized local representation theory

All inductions in this layer are normalized. A unitary character χ is a character of Fˣ; stχ means the GL₂ Steinberg representation twisted by χ∘det. The theorem statements distinguish supercuspidal, discrete-series and character inputs.

### 1.1 P-series with supercuspidal inducing data

For unitary supercuspidal τ of GL₂ and real s, I_P(s,τ) reduces precisely when τ≅τ∨ and either ωτ=1, s=±1/2, or ωτ≠1, s=0. At +1/2 there is a nonsplit sequence δP(τ)→I_P→JP with δP generic discrete series. At 0 the two constituents are a direct sum, exactly one generic. (GS, Proposition 3.1(i), pp. 8–9 (GS line 265)).

A proof route computes the normalized rank-one intertwiner and its Plancherel scalar on the two dual-radical representations; identify the generic constituent using Whittaker exactness. Negative points follow by duality.

*Needs:* §0.3; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4; EndoscopicTransferAndUnitaryTraceComparison §§4.7a, 10.30–10.31; SmoothRepresentationsOfLocalGroupsPartII, gap rank-one-plancherel.

**Checks.**

- At ωτ=1 and selfduality, the two nonzero reducibility points are −1/2 and +1/2. For a nonselfdual unitary τ the list has cardinality 0.

### 1.2 P-series with Steinberg inducing data

For τ=st⊗χ∘det and unitary χ, reducibility occurs only as follows: χ=1 at s=±3/2,±1/2; nontrivial χ²=1 or χ³=1 at s=±1/2. At +3/2 for χ=1 the submodule is St_G and quotient JP(3/2,st). At +1/2 for χ=1 the length-three series has bottom πgen[1], middle JQ(1/2,st), top JP(1/2,st). For nontrivial quadratic or cubic χ the length-two sequence has bottom generic discrete series πgen[χ] and top JP(1/2,stχ); cubic inversion gives πgen[χ]=πgen[χ⁻¹]. (GS, Proposition 3.1(ii), p. 9 (GS line 301)).

A proof route is to resolve the GL₂ Steinberg segment in its principal series, use induction in stages and compare normalized intertwining operators and Jacquet exponents.

*Needs:* §1.1; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3.

**Checks.**

- At χ=1 and s=1/2 the composition length is 3, while a nontrivial cubic χ gives length 2 and the same discrete-series label for χ and χ⁻¹.

### 1.3 P-series with one-dimensional inducing data

For unitary χ, I_P(s,χ∘det) is reducible only at χ=1,s=±3/2,±1/2 and nontrivial χ²=1 or χ³=1,s=±1/2. At +3/2 the sequence is JQ(5/2,st)→I_P→1. At +1/2 and χ=1 its bottom is πdeg[1], middle JQ(1/2,st), top JQ(1,π(1,1)). For quadratic χ the sequence is JQ(1/2,stχ)→I_P→JQ(1,π(1,χ)); for cubic χ it is JP(1/2,stχ⁻¹)→I_P→JQ(1,π(χ,χ⁻¹)). Here π(a,b) denotes normalized GL₂ principal series, and negative parameters are dual statements. (GS, Proposition 3.1(iii), p. 9 (GS line 301)).

A proof route uses the other constituent of the reducible GL₂ segment, track its Borel support, and move the exponent to the dominant Q chamber.

*Needs:* §1.2; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3.

**Checks.**

- The quadratic and cubic character series have final Q exponent 1. Inserting 1/2 changes the central real exponent by 1/2 and disagrees with induction in stages.
- At χ=1 and s=1/2 the length is 3 with one nongeneric discrete-series bottom; at s=3/2 the trivial representation is the top.

### 1.4 Q-series with supercuspidal inducing data

For unitary supercuspidal τ, I_Q(s,τ) reduces precisely when τ≅τ∨ and one of: ωτ=1,s=±1/2; ωτ≠1 with im φτ≅S₃,s=±1; ωτ≠1 with im φτ not S₃,s=0. At positive nonzero s it has generic discrete-series submodule δQ(τ) or πgen[τ] respectively, and Langlands quotient JQ. At 0 it is the direct sum of generic and nongeneric irreducibles. (GS, Proposition 3.2(i), pp. 10–11 (GS line 335)).

A proof route is to evaluate the standard and symmetric-cube factors in the dual Q radical, distinguish the S₃ dihedral parameter, and apply the rank-one reducibility criterion.

*Needs:* §0.3; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4; EndoscopicTransferAndUnitaryTraceComparison §§4.7a, 10.30–10.31; SmoothRepresentationsOfLocalGroupsPartII, gap rank-one-plancherel.

**Checks.**

- Selfdual S₃ data with nontrivial determinant reduce at s=±1, whereas selfdual determinant-trivial data reduce at s=±1/2.

### 1.5 Q-series with Steinberg or character data

For stχ, reducibility occurs at χ=1,s=±5/2,±1/2 and nontrivial quadratic χ,s=±1/2. At χ=1,+5/2 the bottom is St_G; at +1/2 the bottom is πgen[1]⊕πdeg[1] and top JQ(1/2,st). For quadratic χ the bottom is πgen[χ] and top JQ(1/2,stχ). For χ∘det the same χ,s list applies: at χ=1,+5/2 the sequence is JP(3/2,st)→I_Q→1; at χ=1,+1/2 the length-three bottom, middle and top are JQ(1/2,st), JP(1/2,st), JQ(1,π(1,1)); for quadratic χ the sequence is JP(1/2,stχ)→I_Q→JQ(1,π(1,χ)). (GS, Proposition 3.2(ii)–(iii), pp. 10–11 (GS line 335)).

A proof route is to compare Borel induction in stages through P and Q and use the segment resolution; determine submodule versus quotient using positive normalized exponents.

*Needs:* §1.4; §1.2; §1.3; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3.

**Checks.**

- For I_Q(1/2,st), the socle has two discrete-series summands and the length is 3; for I_Q(1/2,1), the socle has one irreducible summand and the length is again 3.

### 1.6 Borel series and opposite embeddings

Write χᵢ for the character values on the three long coroots with χ₁χ₂χ₃=1. Borel induction is irreducible unless some χᵢ=|·|^±1, some χᵢ/χⱼ=|·|^±1, or χ₁,χ₂,χ₃ are the three distinct nontrivial quadratics. In the last case it is generic⊕nongeneric. A Langlands quotient attached to exponents s₁≥s₂≥0 embeds in the opposite principal series; if χ₁=χ₂ and s₁=s₂+1≥1 its smaller P embedding is I_P(−s₁+1/2,χ₁⁻¹). (GS, §3.3 and Proposition 3.3, p. 11 (GS line 369)).

A proof route uses the coroot criterion and the rank-two R-group; take the contragredient of the defining Langlands quotient and the one-dimensional GL₂ submodule in the exceptional embedding.

*Needs:* §1.1; §1.2; §1.3; §1.4; §1.5; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4.

**Checks.**

- For three distinct nontrivial quadratics with product 1, the induced module has two summands and precisely one generic summand; at equal characters this exceptional case is absent.
- At s₁=2,s₂=1, the opposite P exponent is −3/2. Replacing s₁ by s₂ would give −1/2.

### 1.7 Nontempered G₂ normal forms

Every nontempered irreducible G₂ representation is uniquely a standard quotient of one of three disjoint normalized families: JQ(τ), with τ a positive unramified twist of tempered GL₂; JP(τ) with the same condition; or JP(τ) where τ is the GL₂ quotient of χ₁×χ₂, |χᵢ|=|·|^sᵢ and s₁>s₂>0. The first two families have positive central real exponent; the third uses the stated strictly ordered Borel chamber. (GS, §13.2, pp. 41–42 (GS line 1526)).

A proof route is to specialize the general Langlands classification to the two maximal parabolics and Borel; translate Borel dominance through the chosen torus coordinates.

*Needs:* §1.6; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4.

**Checks.**

- The pair s₁=2,s₂=1 lies in the strict Borel family, while (1,0) does not: 1>0>0 is false. The boundary belongs to a maximal-Levi family.

### 1.8 Unipotent depth-zero supercuspidals

Construct the G₂ depth-zero supercuspidals denoted πsc[1], πsc[ω], πsc[ω²] from cuspidal unipotent representations of the reductive quotient at a hyperspecial vertex and compact induction. Identify their Hecke eigenvalues and distinguish the three labels; the two nontrivial cubic labels are an unordered pair until an eigenvalue convention is chosen. Supply the exceptional finite-field character calculations needed to connect these labels with the subregular local parameterization of §1.9. (GS, §3.4(2), pp. 12–13; Proposition 7.1(iii), p. 23 (GS line 401)).

A proof route uses the parahoric quotient and cuspidal type criterion, compute the three unipotent cuspidal characters, and lift their matrix coefficients. Residue-characteristic restrictions of any finite-field calculation must be checked individually.

*Needs:* ReductiveGroups Layer 9; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3.

**Checks.**

- The three unipotent labels comprise one label 1 and two distinct labels ω,ω² with ω³=1 and ω≠1; inversion exchanges the last two and fixes the first.
- For each of the three cuspidal unipotent representations σ of the finite reductive quotient G₂(𝔽_q), the invariants under the unipotent radical of every proper parabolic of G₂(𝔽_q) are 0, whereas for the trivial representation they have dimension 1. Inflating the trivial representation instead would produce a compact induction with nonzero hyperspecial-fixed vectors, which is not supercuspidal.
- In c-Ind_K^G σ, with K the hyperspecial maximal compact subgroup and σ inflated from K/K⁺, the functions supported on K form a K-stable subspace mapped isomorphically onto σ by evaluation at 1, so none of the three labelled representations is zero. Since σ is a nontrivial irreducible representation, Hom_K(1,σ)=0, and every double coset KgK with g∉K contributes 0 by cuspidality, so the K-fixed space is 0 while the K⁺-fixed space contains σ.

### 1.9 The parameter labels needed by theta

Record only the established labels used here: Levi parameters for noncuspidal series; nondiscrete tempered packets of size one or two with unique generic member; principal-SL₂ Steinberg; the subregular Deligne SL₂ with image the specified SO(V,b)⊂SL(V)⊂G₂ of §0.6, with trivial Weil part and component group S₃, giving πgen[1],πdeg[1],πsc[1]; and the quadratic/cubic or dihedral labels of the reducibility nodes. Within the partial parameterization proved here, a member assigned a discrete parameter trivial on the Deligne SL₂ is supercuspidal. The completed bijection and all endoscopic identities for G₂ belong to LocalLanglandsCorrespondenceForG2, which consumes this roadmap and is never an input. (GS, §3.4, pp. 12–14 (GS lines 401, 452–460)).

A proof route is to compare the long/short-root centralizers with the explicitly constructed representations and the GL₂/GL₃ parameter maps; distinguish desiderata of a full LLC from identities actually used by the theta calculations.

*Needs:* §0.7; §0.8; §0.6; §1.8; §1.1; §1.2; §1.3; §1.4; §1.5; §1.6; EndoscopicTransferAndUnitaryTraceComparison §§4.7a, 10.30–10.31.

**Checks.**

- For the specified subregular map through SO(V,b) and trivial Weil part, S₃ has irreducible dimensions 1,2,1 and 1²+2²+1²=6; the three labels are distinct. Its seven-module invariant dimension is 1.
- For principal monodromy the seven-module is Sym⁶(C²), with invariant dimension 0, the component group has order 1 and the single label is Steinberg. Its image also has abstract group type SO₃, so that type alone cannot select the subregular labels.

### 1.10 Finite cubic models for nongeneric G₂

If π is irreducible, infinite-dimensional and nongeneric, W_E(π) is finite-dimensional for every cubic étale E and nonzero for at least one E. No such nonzero assertion is made for the trivial representation. (GS, Lemma 3.4 and proof, p. 14 (GS line 486)).

One proof route starts with a nongeneric infinite-dimensional G₂ representation, eliminates the regular wavefront orbit, shows the maximal remaining orbit is subregular, and applies the local character-expansion/generalized-Whittaker comparison to its rational cubic forms, including residue characteristics 2 and 3.

*Needs:* §0.4; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4; SmoothRepresentationsOfLocalGroupsPartII, gap wavefront-all-residue.

**Checks.**

- For π=1 and any generic cubic character ψE, choose n with ψE(n)≠1. The relation (1−ψE(n))v=0 forces the coefficient dimension to be 0; this is the excluded infinite-dimensional hypothesis.
- For an infinite-dimensional nongeneric π, a maximal subregular rational orbit O_E has c_O_E=dim W_E(π)>0, hence an integer at least 1; the regular coefficient is 0. A regular Whittaker model alone would give 0 here and miss the cubic coefficient. These conclusions use the same orbital-measure normalization as the supplier comparison at p=2 and p=3.

### 1.11 PGSp₆ P₂ and P₁₃ series

For unitary supercuspidal τ of GL₂, I₂(s,τ⊗τ) has the same reducibility cases as I_Q(s,τ): determinant-trivial at ±1/2 with generic DS δ₂(τ), S₃ dihedral at ±1 with generic DS σgen[τ], and other selfdual determinant-nontrivial at 0 with generic⊕nongeneric splitting. For τ=stχ, I₂ reduces only for χ=1 at ±5/2,±1/2 and nontrivial quadratic χ at ±1/2. At +5/2 the bottom is St_H; at χ=1,+1/2 it is I₃(St)gen; at quadratic χ,+1/2 it is DS σgen[χ], always with standard quotient on top. I₁₃(s,τ⊗1) for supercuspidal τ reduces only for selfdual τ with ωτ=1,s=±1/2 (length four, unique generic DS submodule δ₁₃(τ)), or ωτ≠1,im φτ≠S₃,s=0 (two summands). (GS, Propositions 10.1–10.2, pp. 31–32 (GS line 1147)).

A proof route is to calculate the dual radical factors and rank-one intertwining scalars; resolve the Steinberg segment and compare Jacquet exponents. Keep the anti-diagonal central quotient on M₂ explicit. For I₁₃, factor the normalized standard intertwining operators through the maximal parabolics of the Levi subgroups M₁ and M₃ containing M₁₃, where the inducing datum τ⊗1 is supercuspidal and the rank-one criterion applies. Prove here the resulting kernel, image and Jacquet-module calculation: for selfdual τ with ωτ=1 at s=1/2 it gives four constituents and a unique generic square-integrable submodule δ₁₃(τ), the exponent −1/2 following by contragredience; at s=0 the commuting-algebra theorem gives the two-summand case. The intermediate GSp₄ Siegel constituents are not supercuspidal, so the supercuspidal P₁ theorem of §1.13 is not an input here.

*Needs:* §0.9; §0.10; §1.4; §1.5; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4; EndoscopicTransferAndUnitaryTraceComparison §§4.7a, 10.30–10.31; SmoothRepresentationsOfLocalGroupsPartII, gap rank-one-plancherel.

**Checks.**

- For selfdual supercuspidal τ with ωτ=1, I₁₃(1/2,τ⊗1) has length 4, whereas I₂(1/2,τ⊗τ) has length 2.
- Induction in stages through M₁≅GSp₄ first forms the GSp₄ Siegel induction of |det|^(1/2)τ; each of its constituents has a nonzero Siegel Jacquet module, so none is supercuspidal and the hypothesis of §1.13 fails for every one of them. The four-constituent count must come from the Levi intertwining calculation above.

### 1.12 Siegel induction on PGSp₆

For a GL₃ discrete-series τ with trivial central character, I₃(τ)=I₃(τ∨) is irreducible if τ is not selfdual; for selfdual τ it is the direct sum of generic and nongeneric tempered irreducibles. For GL₃ Borel series χ₁×χ₂×χ₃ with product 1 the irreducibility exceptions are χᵢ=|·|^±1 or χᵢ/χⱼ=|·|^±1 and the distinct nontrivial quadratic triple, in which last case I₃ is generic⊕nongeneric. (GS, Proposition 10.3, pp. 32–33 (GS line 1184)). For σ a unitary discrete series of PGL₂, that is σ supercuspidal with ωσ=1 or σ=stχ with χ²=1, the Siegel induction I₃(σ×1)=I₁₃(0,σ⊗1) is irreducible. Together with the Borel case, these cover every selfdual tempered τ of PGL₃ whose parameter contains 1, since such a parameter is φ₀⊕1 with φ₀ two-dimensional, selfdual, tempered and of determinant 1. (GS, Theorem 15.2(ii), pp. 52–53 (GS lines 2021–2025), which uses this irreducibility.)

A proof route computes the Siegel R-group and normalized intertwiners; compare Tadić’s classification with the GL₃/μ₂ coordinate convention. For I₃(σ×1) the supercuspidal case is §1.11 at s=0 with ωσ=1. For σ=stχ the stabilizer of σ⊗1 is generated by the two reflections attached to the GL₂ and GL₁ blocks; the first has vanishing Plancherel scalar at 0 because the dual-radical factor L(2s,ωσ)=L(2s,1) has a pole at s=0, and the second because the PGL₂ principal series of the trivial character is irreducible. The R-group is therefore trivial, and the commuting-algebra theorem gives irreducibility.

*Needs:* §0.9; §0.10; §1.11; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4; EndoscopicTransferAndUnitaryTraceComparison §§4.7a, 10.30–10.31; SmoothRepresentationsOfLocalGroupsPartII, gap rank-one-plancherel.

**Checks.**

- A selfdual GL₃ discrete series gives two Siegel summands with generic dimensions 1 and 0; a nonselfdual discrete series gives one summand.
- Parameter centralizer for τ=st×1: composed with G₂→SO₇, the parameter of I₃(st×1) decomposes as `Sp₂ ⊗ C² ⊕ 1 ⊗ C³` (the standard two-dimensional SL₂ piece with multiplicity two, plus three trivial lines). Its centralizer in SO₇ is the product of Sp₂ acting on the multiplicity plane C² and SO₃ on C³; both factors are connected, so the component group is trivial and the tempered parameter has a single member, matching irreducibility of I₃(st×1). The discrete-series splitting rule would wrongly predict two summands, since st×1 is selfdual but not discrete series.

### 1.13 P₁ reducibility including the nongeneric SK case

Let τ be a supercuspidal representation of GSp₄ with trivial central character and parameter whose 5-dimensional standard composition contains 1. Then I₁(s,τ) reduces exactly at real s=±1/2 and at +1/2 has DS submodule δ₁(τ) and Langlands quotient J₁(1/2,τ). Prove this first for generic τ, then prove it for the nongeneric Saito–Kurokawa τρ used in Layer 8. The latter is a separate obligation: Shahidi’s generic theorem alone does not imply it. (GS, Proposition 10.4, p. 33; Proposition 15.6 and proof, pp. 54–55 (GS line 1218)).

One proof route first treats generic τ: compute the rank-one Plancherel measure of I₁(s, τ) from the standard and twisted factors of its parameter and apply the Harish-Chandra–Silberger criterion for reducibility of rank-one supercuspidal induction. For the nongeneric τ_ρ use part (vi) of the Gan–Takeda correspondence (ModularityAndLanglandsExtensions §3.5): the Plancherel measures of a nongeneric supercuspidal agree with those attached to its parameter, hence with those of the generic representation sharing that parameter; the same criterion then gives reducibility exactly at ±1/2. Shahidi’s generic local-coefficient theorem is not applied to τ_ρ directly. Apply the square-integrability criterion to the submodule at +1/2.

*Needs:* §0.9; §0.10; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4; ModularityAndLanglandsExtensions §3.5; SmoothRepresentationsOfLocalGroupsPartII, gap rank-one-plancherel.

**Checks.**

- For τρ the genericity indicator is 0, while the generic representation sharing its parameter has indicator 1; the common parameter gives the same Plancherel scalar and the same two real reducibility points ±1/2.

### Examples

I_P(1/2,st) has three constituents; I_Q(1/2,st) has two discrete-series socle summands and one top. The corresponding one-dimensional P and Q inductions both have length 3 but different bottom terms. For a nontrivial quadratic χ, the final Q exponent in the character table is 1. On det=ϖ, δP¹ᐟ²=q⁻³ᐟ² and δQ¹ᐟ²=q⁻⁵ᐟ², as in Layer 0.

### Dependencies

The statement carriers and construction inputs are SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4; EndoscopicTransferAndUnitaryTraceComparison §§4.7a, 10.30–10.31; ReductiveGroups Layer 9; ModularityAndLanglandsExtensions §3.5. The internal inputs are §0.3, §1.1, §1.2, §1.4, §1.3, §1.5, §1.6, §0.7, §0.8, §0.6, §1.8, §0.4, §0.9, §0.10. The exact additional supplier gaps are those on the individual Needs lines.

## Layer 2: exceptional groups and minimal representations

Every minimal module in this layer is constructed and proved nonzero. Its defining orbit-model operators, scalar characters and group relations determine the module rather than an arbitrary representation satisfying an unnamed minimality predicate.

### 2.1 Freudenthal–Jordan exceptional data

For J = F, a cubic étale algebra E, the Jordan algebra D⁺ of a degree-three central simple algebra D (or its split form M₃(F)⁺), or the 15-dimensional algebra H₃(B) of Hermitian 3 × 3 matrices over a quaternion algebra B, equip J with its cubic norm, adjoint and trace form; these cubic norm structures are constructed here. Form g_J = sl₃ ⊕ Lie(M_J) ⊕ (F³ ⊗ J) ⊕ (F³ ⊗ J)* with the Freudenthal bracket, and identify its type as G₂, D₄, E₆ or E₇ for dim J = 1, 3, 9, 15, compatibly with the split exceptional Lie algebras of LieHighestWeight Layer 8; the embedded g₂ is sl₃ ⊕ (F³ ⊗ 1_J) ⊕ (F³ ⊗ 1_J)*. (GS, §§4.1–4.2, pp. 15–16 (GS line 523)).

The algebraic construction is over a characteristic-zero field unless a complex dual group is specified; orbit statements use the split octonion algebra. Local absolute values and smooth modules refer to the fixed p-adic convention.

For J=F the cubic norm is x↦x³ and the adjoint is x↦x²; for a cubic étale E it is the product of the three geometric embeddings. The structure group M_J preserves this norm. Define the trace pairing by T(x,y)=dN_1(x)dN_1(y)−d²N_1(x,y) and prove it nondegenerate. The adjoint and cubic norm satisfy N(1)=1, 1#=1, (λx)#=λ²x#, (x#)#=N(x)x and x∘x#=N(x)1; the trace pairing T satisfies T(x#,y)=dN_x(y). These identities and the unit determine the cubic Jordan structure used in the bracket, including both dual tensor summands.

The construction has the following API.

- Dimensions 1,3,9,15 yield the stated four absolute types.
- The summands sl₃,(F³⊗1_J),(F³⊗1_J)* give the fixed g₂ embedding.
- Jordan isomorphisms and scalar extension transport the Lie bracket and both commuting factors.

A proof route is to construct the cubic norm, adjoint and trace of each J from the norm of E, the reduced norm of D and the quaternion norm of B, and check the Jordan adjoint identities. Define the bracket on g_J, verify the Jacobi identity from those identities, and compare root systems and dimensions with the LieHighestWeight Layer 8 models after extending scalars to an algebraic closure.

*Needs:* RepresentationTheory/LieHighestWeight Layer 8; ReductiveGroups Layer 9.

**Checks.**

- J=F yields g₂ of dimension 14, with trivial connected HJ.
- J=M₃(F)⁺ gives split E₆ and connected automorphism factor PGL₃.
- J=Herm₃(Bsplit) yields E₇ and HJ=PGSp₆, not a 27-dimensional Albert module.
- The Freudenthal dimensions are 8+0+2·3=14, 8+2+2·9=28, 8+16+2·27=78, and 8+35+2·45=133 for dimensions 1,3,9,15 respectively.
- In the scalar model x=2 has x#=4, (x#)#=16=N(x)x and x∘x#=8=N(x). Here T(1,1)=3≠0 and T(4,3)=36=dN_2(3). The zero cubic fails N(1)=1; the zero adjoint fails 1#=1. Thus an arbitrary cubic polynomial with no adjoint identities is not an input to this construction.

### 2.2 The three exceptional group dual pairs

Integrate the commuting Lie embeddings to G₂×HJ in the adjoint group GJ, and identify their mutual centralizers. For J=D⁺, HJ(F)=PD×; for J=M₃⁺, HJ=PGL₃⋊C₂ in E₆⋊C₂; for the 15-dimensional J, HJ=PGSp₆ in E₇. Construct the E₆ form attached to either cubic division algebra and the chosen split G₂ subgroup. Group embeddings and central quotients are part of this target, not consequences assumed from a Lie inclusion alone. (GS, §§4.2–4.4, pp. 15–16 (GS line 523)).

The algebraic construction is over a characteristic-zero field unless a complex dual group is specified; orbit statements use the split octonion algebra. Local absolute values and smooth modules refer to the fixed p-adic convention.

The division partners need their maximal subfields. For a field F, a central division F-algebra D of degree n and a field extension E/F of degree n, prove that E admits an F-algebra embedding into D exactly when E splits D. Over the characteristic-zero nonarchimedean local F every field extension of degree n splits D; hence every cubic field embeds in the cubic division algebra and every quadratic field in the quaternion division algebra. (Sav, §5, remark after Examples 5.5, p. 399 (Sav lines 288–290); LT, §2, printed p. 9 (LT line 353).) One direction is the pinned `TauCeti.Algebra.isSplittingField_of_finrank_eq_deg`. For the converse, if E⊗_F D≅Mₙ(E), a simple E⊗_F D-module has F-dimension n·n=n²=dim_F D, so as a left D-module it is free of rank one and the commuting E-action is an F-algebra embedding E→Dᵒᵖ; E also splits Dᵒᵖ, since E⊗_F Dᵒᵖ≅(E⊗_F D)ᵒᵖ≅Mₙ(E), and the same argument gives E→D. For the local statement, D is split by a subfield L of degree n (`TauCeti.Algebra.exists_isSplittingField_finrank_eq_deg`); transport the class of D to H²(G_F,(F^s)ˣ) by QuadraticFormInvariants §7B, so that injectivity of inv_L and inv_L∘res=n·inv_F give n·inv_F(D)=0, and then inv_E(res D)=n·inv_F(D)=0 for every E of degree n.

The construction has the following API.

- The integrated commuting maps G₂×HJ→GJ have the stated factors as mutual centralizers, with their specified connected components.
- Scalar extension and isomorphisms of cubic Jordan algebras transport the ambient group and both embeddings.
- For the split nine-dimensional J the outer component gives PGL₃⋊C₂; for division J it gives the indicated PD× form, and for the fifteen-dimensional J the partner is PGSp₆.
- A field extension of degree n embeds in a central division algebra of degree n exactly when it splits it; over the local F every degree-n field extension embeds, in particular every cubic field E in the cubic D, with E× mapping onto a maximal torus PE× of PD×.

A proof route uses root group integration, Jordan descent and the lattice maps of the adjoint forms; verify centralizers after algebraic closure and descend them.

*Needs:* §2.1; §0.1; §0.9; ReductiveGroups Layer 9; ReductiveGroups Layer 3; ReductiveGroups, gap schematic-centralizers; `TauCeti.Algebra.IsSplittingField`; `TauCeti.Algebra.isSplittingField_of_finrank_eq_deg`; `TauCeti.Algebra.exists_isSplittingField_finrank_eq_deg`; QuadraticFormInvariants §7B; ClassFieldTheory Layers 5–6.

**Checks.**

- The connected partner has dimensions 8 for J=M₃⁺ and 21 for the fifteen-dimensional J; the E₆ outer extension E₆⋊C₂ has two components (one added by the involution), not an extra Lie dimension.
- For D of invariant 1/3, Dop has invariant 2/3 but the identical Jordan product: (xy+yx)/2=(yx+xy)/2. Thus D⁺ and (Dop)⁺ give the same E₆^D and the same embedded G₂. The partner identification PD×→P(Dop)× is x↦x⁻¹; it transports JL_Dop(τ) to JL_D(τ)∨, as in §5.3 (LL lines 620–625, 658–663).
- For split J=M₃(F)⁺ the connected partner has dimension 8, whereas J=H₃(M₂(F)) has dimension 15 and partner dimension 21; their ambient groups have dimensions 78 and 133. Replacing the fifteen-dimensional Jordan model by the 27-dimensional Albert algebra gives the wrong ambient dimension.
- The cubic étale algebras F³ and F×K have dimension 3 but do not embed in the cubic division algebra D, which has no idempotent other than 0 and 1; the embedding criterion needs E to be a field, not merely of dimension n.
- For D of invariant 1/3: an unramified or a totally ramified cubic E gives inv_E(res D)=3·(1/3)=0, so both split D and embed; a quadratic field gives 2·(1/3)=2/3≠0 and does not split D, and indeed no quadratic field embeds, since the degree of a subfield of D divides 3. A degree-6 extension gives 6·(1/3)=0 and splits D, yet has no embedding, since a subfield of D has degree at most 3 (`TauCeti.Algebra.finrank_le_deg`): the degree hypothesis cannot be dropped.
- For n=2 every quadratic field splits the quaternion division algebra and embeds in it; it also embeds in M₂(F), so embedding alone does not detect division.

### 2.3 Cubic triality and the exceptional see-saw

A cubic étale E with its permutation Galois action on three embeddings defines the trialitarian Spin₈^E. For an embedding i:E→J construct HJ,E=Aut(i) and the commuting pair HJ,E×Spin₈^E inside GJ. Identify HJ,E as PE× for division D, PE×⋊C₂ for M₃, and the algebraic quotient Res_E/F SL₂/μ₂ for J of dimension 15. The resulting square with G₂×HJ gives the see-saw on the same minimal representation. Do not replace rational points of a central quotient by a quotient of rational points without checking its H¹ obstruction. (GS, §§4.3–4.4 and diagram (4.1), p. 16 (GS line 558)).

The algebraic construction is over a characteristic-zero field unless a complex dual group is specified; orbit statements use the split octonion algebra. Local absolute values and smooth modules refer to the fixed p-adic convention.

The construction has the following API.

- The trialitarian group depends on the cubic étale algebra and its permutation torsor, and is transported by cubic-algebra isomorphisms.
- An embedding i:E→J gives its pointwise stabilizer HJ,E in HJ and the commuting map HJ,E×Spin₈^E→GJ with the indicated central quotients.
- The two pairs restrict the same minimal module, and passage from a central quotient to rational points retains its connecting map into H¹(F,μ₂).

A proof route is to descend the pinned D₄ triality action along the étale S₃ torsor; compute centralizers of E and match the two restrictions of GJ.

*Needs:* §2.2; RepresentationTheory/SpinRepresentations Layer 8; ReductiveGroups Layer 3.

**Checks.**

- For E=F³ the permutation cocycle is trivial and the triality group is split Spin₈. For a cubic field, PE× has torus dimension 3−1=2.
- In the split cubic case, Res_E SL₂ has dimension 3·3=9; quotienting by finite μ₂ keeps dimension 9. Rational points require a descent calculation.
- For E=F³ the map SL₂(F)³→(SL₂³/μ₂)(F) has kernel {(I,I,I),(−I,−I,−I)} of order 2. In PGL₂(F)³ the three entries of a lifted quotient point have a common determinant square class: (diag(ϖ,1),diag(ϖ,1),diag(ϖ,1)) has common class ϖ and lies in the quotient’s rational points but does not lift to SL₂(F)³. The obstruction is nonzero in Fˣ/Fˣ², so taking the quotient only on F-points misses it.

### 2.4 Local minimal representations

Construct the nonzero irreducible unitarizable minimal representations ΠJ of the required split D/E groups and E₆^D forms, with their chosen central character. For split simply-laced groups select the spherical representation with the subregular-dual Satake parameter and prove its minimality; for E₆^D construct the smooth model of Savin §3. Supply Schrödinger/rank-one models, the exact evaluation-at-zero sequence and ambient-radical Jacquet action needed below. Existence, irreducibility, unitarity and model comparison are proof targets, not axioms on a user-supplied representation. (GS, §1, p. 1; §§4–5, pp. 15–17 (GS line 4); Sav, §3, pp. 396–397 (Theorem 3.4) (Sav line 123); GS04, §5, pp. 797–798 (GS04 line 194); MS, Theorem 1.1, pp. 3–4 (MS line 83)).

Use GS05, §§3–5, for the minimal-model characterization and its independence of the chosen realization. Minimality means the minimal nonzero nilpotent support of the model, not just small dimension of fixed vectors. The evaluation map has source the full smooth model and target the ambient-radical Jacquet quotient; its kernel is the compact-function module on the nonzero highest-weight orbit. Prove the Weyl relations and the comparison with each spherical normalization as part of the construction.

The construction has the following API.

- The induced/orbit and Schrödinger models identify as smooth representations with the stated central character.
- Evaluation at zero gives the exact sequence whose kernel is the compact-function highest-weight orbit model.
- Complex conjugation identifies ΠJ with its smooth contragredient under the chosen invariant Hermitian structure.

A proof route is to build each smooth model and its intertwining operators from the highest-weight orbit; prove the Weyl relations, irreducibility and the unitary completion, then compare normalized Jacquet exponents.

*Needs:* §2.2; SmoothRepresentationsOfLocalGroups §§SR.0.2, SR.0.4; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4.

**Checks.**

- For split E₆/E₇ the chosen hyperspecial fixed line is one-dimensional with the specified Satake parameter.
- The E₆^D model has no isotropic nilpotent vectors coming from D; its G₂ Jacquet modules differ from split E₆.
- The evaluation-at-zero quotient is nonzero, so replacing the model by only its open-orbit compact functions fails.
- The model is nonzero: its hyperspecial-fixed dimension is 1 in the split spherical case, whereas the zero representation has fixed dimension 0 and cannot satisfy the evaluation-at-zero sequence.

### 2.5 Exceptional big and small theta modules

Specialize the imported commuting-action theta construction to ΠJ. For irreducible π of G₂, the maximal π-isotypic quotient is π⊗ΘJ(π), equivalently the appropriate smooth coinvariant model with π∨; use the same convention for HJ input. Define θJ(π) as the maximal semisimple quotient only once finite length is proved. Use full algebraic duals in Hom descriptions and smooth contragredients only where admissibility justifies them. (GS, §1, p. 1; §5.1, p. 16; §6.4, pp. 20–21 (GS line 4)).

The generic commuting-action quotient and its universal Hom adjunction are consumed from MetaplecticAutomorphicForms §§3.4–3.8. Here the target is their specialization to the constructed exceptional ΠJ and its triality square; no classical irreducibility statement is imported for the exceptional restriction.

The construction has the following API.

- Hom_H(ΘJ(π),τ) identifies with Hom_G×H(ΠJ,π⊗τ) for irreducible admissible π,τ with the fixed dual convention.
- The triality square identifies HJ,E-periods on ΘJ(π) with Hom_G₂(RJ(E),π) (GS, (5.1), p. 16 (GS line 589)); applied to π∨ it identifies periods on ΘJ(π∨) with Hom_G₂(RJ(E),π∨).
- Unitarity gives conjugation compatibility; for tempered irreducibles conjugation is smooth contragredience.

A proof route applies the universal isotypic quotient to the commuting exceptional actions and prove the exceptional see-saw by the two Hom adjunctions on ΠJ; no classical oscillator Howe theorem is asserted for this restriction.

*Needs:* §2.4; MetaplecticAutomorphicForms §§3.4–3.8, 3.34, 3.37–3.40; §2.3.

**Checks.**

- If Hom_G×H(ΠJ,π⊗τ)=0 for every τ, no nonzero finite-length small lift can be assigned.
- For J=F, specializing the construction recovers restriction to G₂ rather than a classical symplectic oscillator.
- Twisted ψE coefficients of a contragredient use conjugate ψE; replacing ψE by itself without transport fails for general ψ.
- For the smooth irreducible tensor π⊗τ, the maximal π-isotypic quotient has multiplicity space τ. Using π rather than π∨ in the coinvariant tensor reverses the dual convention. In the imported adjunction’s test on G=C₃ and H={1}, take Π=χ⊗1 with χ of order 3: both Hom_C₃(χ,χ) and the invariant functionals on its multiplicity space have dimension 1, while Hom_C₃(χ,χ∨) has dimension 0. Thus a quotient RJ(E)→π produces a period on ΘJ(π), and RJ(E)→π∨ produces one on ΘJ(π∨).

### 2.6 The spherical extension across the E₆ involution

Extend the split E₆ minimal representation to E₆⋊C₂ by requiring the pinned involution to fix its spherical vector. On PGL₃ the involution is g↦w₀(gᵗ)⁻¹w₀⁻¹ with antidiagonal entries (1,−1,1); it fixes G₂ pointwise. Prove its square is 1 on Π and compatibility with the orbit model, not only invariance of its isomorphism class. (GS, §8 introduction and §8.1, p. 24 (GS line 855)).

The construction has the following API.

- The normalized operator T on Π intertwines the pinned E₆ involution and satisfies T²=1, defining an action of E₆⋊C₂.
- The E₆ action is the original minimal module, while the pinned involution fixes its chosen nonzero spherical vector.
- Restriction to PGL₃ is the displayed inverse-transpose involution and commutes with the fixed G₂ action; its fiber characters are then used in §5.5.

A proof route is to normalize the intertwiner by the spherical vector and then evaluate it on the explicit model to determine the stabilizer characters on coefficient orbits.

*Needs:* §2.4; §2.2.

**Checks.**

- The normalized involution acts by +1 on the spherical line and has square 1. Twisting by sign changes that eigenvalue to −1 while keeping the square 1.
- On t=diag(2,3,5) in PGL₃, the pinned inverse-transpose sends t to diag(1/5,1/3,1/2); applying it twice gives diag(2,3,5). Mere transposition would fix t and fail this coordinate test.
- On the spherical vector v, T(v)=v and T²(v)=v. On the full model the required operator identity is T²=Id; 2T has square 4Id and eigenvalue 2 on v, so neither invariance of the isomorphism class nor a rescaled intertwiner defines the required extension.

### Examples

The dimensions 1,3,9,15 of J yield Lie dimensions 14,28,78,133. For J=F³ the D₄ twist is trivial; for J=M₃⁺ the connected partner is PGL₃; for dimension 15 it is PGSp₆. On the spherical vector the outer involution has eigenvalue +1. A sign twist has −1 and therefore defines the other extension.

### Dependencies

The statement carriers and construction inputs are RepresentationTheory/LieHighestWeight Layer 8; ReductiveGroups Layer 9; ReductiveGroups Layer 3; RepresentationTheory/SpinRepresentations Layer 8; `TauCeti.Algebra.IsSplittingField`; `TauCeti.Algebra.isSplittingField_of_finrank_eq_deg`; `TauCeti.Algebra.exists_isSplittingField_finrank_eq_deg`; QuadraticFormInvariants §7B; ClassFieldTheory Layers 5–6; SmoothRepresentationsOfLocalGroups §§SR.0.2, SR.0.4; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4; MetaplecticAutomorphicForms §§3.4–3.8, 3.34, 3.37–3.40. The internal inputs are §2.1, §0.1, §0.9, §2.2, §2.4, §2.3. The exact additional supplier gaps are those on the individual Needs lines.

## Layer 3: Jacquet filtrations and positive exponents

Each filtration is an ordered exact filtration of the normalized Jacquet module. List the top first and retain the left/right regular actions, the modulus square roots and the ambient-radical quotient. The five filtrations precede all global finite-length claims.

### 3.1 Ambient E₆/E₇ gradings

The two fundamental G₂ cocharacters define E₇ parabolics with derived Levi types D₆ and A₁A₅. The three PGSp₆ cocharacters define ambient derived Levi types E₆,D₆,A₁D₅ for P₃,P₁,P₂ respectively. Construct their intersections with both dual-pair factors, opposite radicals, central characters and projections Π_Nsmall→Π_𝒩ambient. These natural projections are maps of unnormalized coinvariants, equivariant for the small Levi M with its inherited action; on normalized Jacquet modules the same map is M-equivariant only after the twist (δ_𝒫|_M/δ_P)^(1/2), where δ_𝒫 is the ambient modulus restricted to M. The normalized top terms displayed in §§3.4–3.8 carry this correction. In every top-piece formula it is the ambient-radical quotient Π_𝒩 that occurs, not a second copy of the small-radical quotient. (GS, §13.1, p. 40; §13.4, p. 43 (GS line 1484)).

A proof route computes all weights of the Freudenthal bracket under each cocharacter and group the positive weights; compare the zero-weight subgroup and its central lattice.

*Needs:* §2.2; §2.4; §0.3; §0.9; RepresentationTheory/SpinRepresentations Layer 4; RepresentationTheory/LieHighestWeight Layer 8.

**Checks.**

- The five derived Levi dimensions are D₆:66, A₁A₅:3+35=38, E₆:78, D₆:66, A₁D₅:3+45=48; each requires its own ambient radical.
- Modulus ratio for the division form E₆^D, whose Lie algebra is sl₃⊕D₀⊕D₀⊕(V⊗D)⊕(V*⊗D*) with g₂=sl₃⊕V⊕V*. On the cocharacter diag(t,1,t⁻¹) of SL₃⊂G₂ the G₂ radical N has weight 1 four times and weight 2 once, and the ambient radical has weight 1 twenty times and weight 2 once (zero-weight dimension 36=dim gl₂(D)): δ_P=|t|⁶, δ_𝒫=|t|²², twist |t|⁸. On diag(t,t,t⁻²) the weights 1,2,3 occur 2,1,2 times for U and 18,9,2 times ambiently (zero-weight dimension 20=dim gl₂⊕D₀⊕D₀): δ_Q=|t|¹⁰, δ_𝒬=|t|⁴², twist |t|¹⁶. At t=ϖ and q=2, omitting the twist makes the normalized ambient action 2⁸, respectively 2¹⁶, times the normalized small action.

### 3.2 Rank-one and rank-two octonion orbit kernels

Identify the kernels of the small-to-ambient Jacquet projections with compact-function modules on highest-weight orbit intersections. For P₁ the null octonion quadruples x,x′,y,y′ satisfy all pairwise products zero and x∧x′+y∧y′=0, giving strata of span dimension 1 and 2. For P₂ impose dependent spinor columns as well as trace zero, then compute the two span strata. Determine stabilizers and modular-density actions separately on each stratum; no single unknown character is assumed to normalize both. (GS, §13.4, Cases P₁ and P₂, pp. 44–47 (GS line 1650)).

A proof route uses the half-spin highest-weight equations and the null-space classification. Compute the tangent action on each stabilizer quotient to determine its density character before applying normalized induction.

*Needs:* §3.1; §0.2; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3; RepresentationTheory/SpinRepresentations Layer 4.

**Checks.**

- The null plane spanned by top e₁ and bottom e₂ gives a span-two stratum; a single top e₁ gives span one. A zero quadruple has span zero and is excluded from the nonzero orbit kernel.

### 3.3 Raw E₆ Jacquet input and noncuspidal finiteness

Construct the two outer-related PGL₃ maximal-parabolic Jacquet filtrations of Π_E6 with bottom regular GL₂ piece, middle regular GL₁ piece, and top D₅-minimal plus trivial pieces, and the G₂-P filtration with two GL₂ regular pieces, a GL₁ piece and A₅-minimal plus trivial top. In GS04 notation P₂=our P and P₁=our Q; retain its normalized determinant factors. Deduce finite length of the noncuspidal part of every theta lift in either direction without invoking full E₆ Howe duality. (GS04, Propositions 4–6, pp. 798–799 (GS04 line 242); GS, Lemma 6.2 and proof, p. 19 (GS line 674)).

One proof route treats PGL₃→G₂ first: normalize the bottom and middle terms by |det|^(3/2), the top by |det|^(1/2)Π_D5⊕|det|^(3/2). For G₂-P, use |det|^(1/2) on both regular strata and Π_A5⊕|det|^(1/2) on top. Apply second adjointness to finite-length Jacquet modules, regular-isotypic quotients and finite-length parabolic induction; retain the torus characters of every boundary stratum.

*Needs:* §2.4; §2.6; §3.1; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4; SmoothRepresentationsOfLocalGroups §SR.2a.1.

**Checks.**

- On det=ϖ, the two boundary normalizations are q⁻³ᐟ² and q⁻¹ᐟ²; these are unequal for q≥2, so dropping the middle or top character changes the Jacquet action.

### 3.4 The G₂-P Jacquet filtration

The normalized rP(Π_E7) has three graded pieces, from top to bottom: |det|^(1/2)Π_D6⊕|det|^(3/2)1; Ind_(Bbar×P₂)^(GL₂×H)(δ⊗Cc(GL₁)), δ=|·|^(−1/2)×|·|; and Ind_P₁₃^H Cc(GL₂). The central GL₂ acts trivially on the untwisted minimal/trivial top factors. Regular GL₂ spaces have left translation by the G₂ Levi and right translation by the partner Levi; GL₁ uses determinant on the G₂ factor and the indicated (1,1) entry on a lower Borel. All inductions in these filtrations are normalized. (GS, Proposition 13.1, p. 40 (GS line 1484)).

A proof route applies the ambient D₆ evaluation sequence, intersect the highest-weight orbit with trace-zero octonions, then compute stabilizers and all half-modulus corrections.

*Needs:* §3.1; §2.4; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3.

**Checks.**

- A scalar z in the G₂ GL₂ Levi acts on Sym³(F²)⊗det⁻¹ by z³z⁻²=z. The two top scalar twists are |z| and |z|³, obtained from det(zI)=z².

### 3.5 The G₂-Q Jacquet filtration

The normalized rQ(Π_E7) has top |det|^(3/2)Π_A5⊕|det|²Π_A1; middle Ind_(Bbar×P₂)^(GL₂×H)(δ⊗Cc(GL₁)) with δ=|·|^(1/2)×|·|; bottom Ind_P₂^H W, where W is the imported GL₂×GSO₄ similitude Weil representation. Top factors are trivial on the central GL₂ before twisting. Regular GL₂ spaces have left translation by the G₂ Levi and right translation by the partner Levi; GL₁ uses determinant on the G₂ factor and the indicated (1,1) entry on a lower Borel. All inductions in these filtrations are normalized. (GS, Proposition 13.3 and proof, p. 41 (GS line 1526)).

A proof route computes the split highest-weight orbits directly, using the split orbit representatives. Determine the middle twist from stabilizer densities; verify it against generic-character induction using only the bottom Weil quotient, independently of the final nontempered lift theorem.

*Needs:* §3.1; §2.4; MetaplecticAutomorphicForms §§3.4–3.8, 3.34, 3.37–3.40; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3.

**Checks.**

- For lower-Borel coordinates (ϖ,1), the middle twist is q⁻¹ᐟ²; for (1,ϖ) it is q⁻¹. Swapping them fails this two-term test.

### 3.6 The PGSp₆-P₃ Jacquet filtration

The normalized rP₃(Π_E7), as G₂×GL₃ module, has top Π_E6⊕|det|1, middle Ind_(Q×Q₁)^(G₂×GL₃)(δ⊗Cc(GL₁)), δ(g₁,g₂)=|g₁|^(−1/2)|det g₂|^(1/2), and bottom Ind_(P×Q₂)^(G₂×GL₃) Cc(GL₂). Here Qᵢ are the row-subspace stabilizers in GL₃, with Levi factor GLᵢ acting by right translation on Cc(GLᵢ). (GS, Proposition 13.5, pp. 43–44 (GS line 1609)).

A proof route uses the E₆ ambient-radical quotient and classify rank-one/rank-two pairs of trace-zero octonions. Compute the row-stabilizer moduli and subtract δP₃^(1/2).

*Needs:* §3.1; §3.2; §2.4; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3.

**Checks.**

- At det=ϖ the trivial top line has eigenvalue q⁻¹ and the untwisted E₆ term has no extra determinant factor. The filtration has three layers.

### 3.7 The PGSp₆-P₁ Jacquet filtration

The normalized rP₁(Π_E7), as G₂×GSp₄ module, has top |ν|^(1/2)Π_D6⊕|ν|^(3/2)1, middle Ind_(Q×Q₁)(δ⊗Cc(GL₁)) with δ(g₁,g₂)=|g₁|^(−1/2)|det g₂|^(1/2), and bottom Ind_(P×Q₂) Cc(GL₂). On the row-stabilizer Levis of GSp₄, Q₁ has coordinates (g₁,g₂)∈GL₁×GL₂ with ν=det g₂ and δQ₁=|g₁|^(−4)|det g₂|²; Q₂ has (g₂,g₁) with ν=g₁ and δQ₂=|det g₂|^(−3)|g₁|³. (GS, Proposition 13.6 and the preceding Case P₁, pp. 44–45 (GS line 1650)).

One proof route computes, for each of the two null-quadruple strata, an explicit orbit representative, stabilizer and density, then induces its compact functions and normalizes the action.

*Needs:* §3.1; §3.2; §2.4; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3.

**Checks.**

- In Q₁ coordinates (g₁,g₂)=(ϖ,I₂), ν=1 and δQ₁=q⁴; in Q₂ coordinates (g₂,g₁)=(I₂,ϖ), ν=ϖ and δQ₂=q⁻³. Treating the first GL₁ coordinate as ν in both conventions fails.

### 3.8 The PGSp₆-P₂ Jacquet filtration

The normalized rP₂(Π_E7), as G₂×M₂ module, has four pieces from top down: |det|^(1/2)Π_D5⊕|det|^(3/2)Π_A1; Ind_(Q×(Bbar×Bbar)/Gm)(δ⊗Cc(GL₁)), where δ on each Bbar is |·|^(1/2)×|·|; Ind_(P×Bbar₂) Cc(GL₂), where GL₂,1 acts by right regular translation and Bbar₂ by right scalar (1,1)-translation; and Ind_Q^G₂ W. In the top each semisimple factor acts trivially on the other factor’s summand. (GS, Proposition 13.7 and notes, pp. 46–47 (GS line 1728)).

A proof route computes dependent highest-weight spinor columns and both null-span strata. Use separate orbit-density calculations for pieces two and three; derive their twists rather than assume the displayed uniform δ′ action is correct. Confirm the anti-diagonal center acts trivially.

*Needs:* §3.1; §3.2; §2.4; MetaplecticAutomorphicForms §§3.4–3.8, 3.34, 3.37–3.40; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3.

**Checks.**

- For (α,β)=(zI,z⁻¹I), det α·det β=z²z⁻²=1. In piece three the scalar action of the second factor is independent of right translation by the first; exchanging them changes the action on a nonconstant compact function.

### 3.9 Forward positive-exponent lift control

For π=JQ(τ) in Layer 1, Θ_H(π) is a nonzero quotient of I₂(τ⊗τ). For π=JP(τ) in either P family, it is a nonzero quotient of I₁₃(τ⊗1). These statements concern full big modules. Prove their nonvanishing from the appropriate bottom piece and the induced-module universal property. (GS, Lemma 13.4 and proof, pp. 42–43; Theorem 14.1(a)–(b), p. 48 (GS line 1568)).

A proof route uses positive central exponents to kill all unwanted graded pieces, including Ext¹ obstructions, with second adjointness. For the Weil piece import the exact GL₂–GSO₄ big theta computation. Commute maximal isotypic quotient with normalized parabolic induction by GG Lemma 9.4 (second adjointness), not by the compact-induction lemma requiring Ext¹(τ,τ)=0.

*Needs:* §1.7; §3.4; §3.5; SmoothRepresentationsOfLocalGroups §SR.2a.1; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4; MetaplecticAutomorphicForms §§3.4–3.8, 3.34, 3.37–3.40; SmoothRepresentationsOfLocalGroupsPartII, gap isotypic-parabolic.

**Checks.**

- For a strict Q-family exponent s=1, the H inducing datum has matching two GL₂ exponents; a P-family input instead goes to P₁₃. At s=0 the positive-exponent hypothesis is false.

### 3.10 All reverse Langlands-chamber cases

For a nontempered σ of H, Θ_G₂(σ)=0 unless σ is J₂(τ⊗τ) or J₁₃(τ⊗1) attached to the Layer 1 families. In these cases Θ_G₂(σ) is a nonzero quotient of IQ(τ) or IP(τ), respectively. Prove this for all seven proper standard Levi types P₁,P₂,P₃,P₁₂,P₁₃,P₂₃,P₁₂₃, with strictly positive real Langlands exponents and the actual M₂ coordinate order. (GS, Lemma 13.8 and proof, pp. 47–48 (GS line 1782)).

A proof route is to write the full exponent table for every standard Levi using s₁>s₂>|s₃| and its boundary chambers. In the P₂ case use r_B on the second GL₂ in piece three. For P₂₃ kill that piece by the second-torus exponent; for P₁₂ exchange the two inducing factors before using the same argument. For P₁,P₃,P₁₃ and Borel cases use the D₆/E₆ top factors and regular lower factors explicitly; identify surviving supports and compare them with the forward result.

*Needs:* §3.9; §3.7; §3.8; §3.6; §0.10; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4; SmoothRepresentationsOfLocalGroups §SR.2a.1; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3; SmoothRepresentationsOfLocalGroupsPartII, gap isotypic-parabolic.

**Checks.**

- There are seven proper standard Levi subsets of a three-element simple-root set: 2³−1=7. Treating only P₂ covers one of seven cases.

### 3.11 Temperedness and the positive-exponent correspondence

For any irreducible pair π⊗σ occurring as a quotient of Π_E7, π is nontempered exactly when σ is nontempered. Nontempered π has a nonzero H lift. For the E₆ pairs, positive-exponent Jacquet analysis likewise preserves temperedness on nonzero irreducible theta quotients. These implications are available before the global finite-length theorem. (GS, Lemma 6.3 and proof, p. 20; Theorem 14.1, pp. 48–49 (GS line 710)).

A proof route is to combine the forward and reverse support computations and the E₆ analogue; a tempered/nontempered mixed pair would violate one of those support conditions.

*Needs:* §3.9; §3.10; §3.3; §1.7; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4.

**Checks.**

- For τ unitary, nonselfdual and supercuspidal, I_Q(1,τ) is irreducible and equals π=JQ(1,τ); by §3.9 Θ_H(π) is a quotient of I₂(1,τ⊗τ), whose two GL₂ exponents (1,1) are positive, so every irreducible quotient is the nontempered J₂: indicators (0,0).
- For π=St_G₂ and nontempered σ, §3.10 would make Θ_G₂(σ) a quotient of a standard module I_Q(τ′) or I_P(τ′) with positive exponent, whose only irreducible quotient is its nontempered Langlands quotient; St_G₂ is not of that form, so it pairs only with tempered σ: indicators (1,1), and §8.4 then names σ=St_H.
- At exponent s=0 the hypothesis s>0 of §3.9 fails, so neither argument applies to I_Q(0,τ); those pairs are covered by the tempered tables, not by this positive-exponent argument.

### 3.12 The division minimal model as a G₂ module

Let D be a cubic division algebra and Π_D the minimal representation of E₆^D from §2.4. Since PD× is compact, Π_D restricted to PD×× G₂ is the direct sum over τ∈Irr(PD×) of τ⊠Θ_D(τ). Let 𝒫 and 𝒬 be the maximal parabolics of E₆^D attached to the cocharacters defining P and Q, with radicals 𝒩 and 𝒰. Prove, from the division minimal model and its Jacquet modules alone, without Howe duality, finite cubic periods or the triality exact sequences:

- the natural maps of unnormalized coinvariants (Π_D)_N→(Π_D)_𝒩 and (Π_D)_U→(Π_D)_𝒰 are isomorphisms, equivariant for M and L with their inherited actions; for the normalized functors this reads r_P(Π_D)≅(δ_𝒫|_M/δ_P)^(1/2)⊗(r_𝒫(Π_D)|_M) and r_Q(Π_D)≅(δ_𝒬|_L/δ_Q)^(1/2)⊗(r_𝒬(Π_D)|_L);
- PD× acts trivially on both coinvariant spaces, and with the G₂ normalization r_P(Π_D)≅|det|^(1/2)⊗1 as an M-module and r_Q(Π_D)≅|det|^(1/2)⊗st as an L-module; by §§1.3 and 1.5 these are r_P(πdeg[1]) and r_Q(πdeg[1]);
- consequently Θ_D(1)=πdeg[1]⊕C₁ with C₁ supercuspidal, and Θ_D(τ) is supercuspidal (all proper Jacquet modules zero, possibly the zero module) for every τ≠1.

(Sav, Proposition 5.1 and Corollary 5.2 with proof, pp. 398–399 (Sav lines 234–270); GS, Proposition 7.1(i)–(ii), p. 23 (GS lines 829–834).)

A proof route uses minimality of Π_D to show that no nontrivial character of 𝒩/Z(𝒩) trivial on N supports a twisted coinvariant of Π_D, and likewise along 𝒰, giving Π_N=Π_𝒩 and Π_U=Π_𝒰 as unnormalized coinvariants, and reads the central exponents from the action of the centers of the ambient Levis on the minimal model, converting them to the G₂ normalization by the modulus ratios of §3.1. PD× acts on the ambient Levi modules through a Steinberg or trivial module twisted by an unramified character, and an unramified character, with values in the positive reals, is trivial on the compact group PD×. Hence the Jacquet modules of Θ_D(1) are those of Π_D and those of Θ_D(τ), τ≠1, vanish. Write Θ_D(1)=X⊕C₁ with X its noncuspidal and C₁ its cuspidal Bernstein part. Neither Jacquet module has a supercuspidal GL₂ constituent, so X lies in the Borel block, where every nonzero subquotient has nonzero Borel Jacquet module; r_B(X) is one-dimensional, so X is irreducible. Frobenius reciprocity embeds X in I_P(1/2,1) and in I_Q(1/2,st); the only constituent of I_P(1/2,1) (§1.3) in the socle πgen[1]⊕πdeg[1] of I_Q(1/2,st) (§1.5) is πdeg[1], so X≅πdeg[1]. Unlike the source, this route does not detect πdeg[1] through a minimal K-type.

*Needs:* §2.2; §2.4; §0.3; §1.3; §1.5; §3.1; ReductiveGroups Layer 9; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4.

**Checks.**

- The trivial τ occurs with τ^(PE×) of dimension 1 for every cubic field E⊂D, so the decomposition of Θ_D(1_(PE×)) below contains exactly one copy of πdeg[1]; a nontrivial τ contributes τ^(PE×)⊗Θ_D(τ), which is supercuspidal and contains no copy of πdeg[1].
- For τ≠1 the Jacquet modules of Θ_D(τ) along N and U are 0, whereas πdeg[1] has a nonzero, generic Jacquet module along the Q radical. Hence πdeg[1] is not a summand of any Θ_D(τ) with τ≠1.
- Replacing the division model by the split E₆ minimal model fails: by §3.3 its G₂-P Jacquet module contains two regular GL₂ pieces, so the lifts of nontrivial representations of the split partner are not all supercuspidal.
- The normalized comparison carries the twist |t|⁸ along P and |t|¹⁶ along Q on the cocharacters of §3.1; at t=ϖ and q=2 these are 2⁻⁸ and 2⁻¹⁶. Identifying r_P(Π_D) with the restriction of r_𝒫(Π_D) without the twist would change the action of diag(ϖ,1,ϖ⁻¹) by the factor 2⁸ at q=2, so the two normalized modules could not both be |det|^(1/2)⊗1.
- On diag(ϖ,1) the twist |det|^(1/2) has value q^(−1/2). Embedding X only in I_Q(1/2,st) would leave both πgen[1] and πdeg[1] possible; the embedding in I_P(1/2,1), whose constituents are πdeg[1], JQ(1/2,st) and JQ(1,π(1,1)), excludes πgen[1].

### Examples

On a regular GL₂ coefficient the left/right action on a character quotient is χ(a)/χ(b). On det=ϖ the top P twists are q⁻¹ᐟ² and q⁻³ᐟ². The Q middle twist evaluates to q⁻¹ᐟ² at (ϖ,1) and q⁻¹ at (1,ϖ). In the H P₂ Levi, (zI,z⁻¹I) has determinant product 1, preserving descent.

### Dependencies

The statement carriers and construction inputs are RepresentationTheory/SpinRepresentations Layer 4; RepresentationTheory/LieHighestWeight Layer 8; ReductiveGroups Layer 9; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4; SmoothRepresentationsOfLocalGroups §SR.2a.1; MetaplecticAutomorphicForms §§3.4–3.8, 3.34, 3.37–3.40. The internal inputs are §2.2, §2.4, §0.3, §0.9, §3.1, §0.2, §2.6, §3.2, §1.7, §3.4, §3.5, §3.9, §3.7, §3.8, §3.6, §0.10, §3.10, §3.3, §1.3, §1.5. The exact additional supplier gaps are those on the individual Needs lines.

## Layer 4: triality and finite cubic periods

Work with the same cubic étale algebra E, its embedding when required, and its chosen ψE. Every Hom space has an indicated group; every Ext belongs to the full smooth complex category unless explicitly passed to the Schwartz category.

### 4.1 Trialitarian degenerate principal series

For cubic étale E let P_E be the Heisenberg parabolic of Spin₈^E with Levi GL₂(E)^0 (the three determinant coordinates descend to one F× value). Define I_E(s)=Ind_P_E^Spin₈^E |det|^s by normalized induction. For each embedding E→J set RJ(E)=Θ_J(1_HJ,E) on Spin₈^E. Identify it with its natural image in I_E(sJ), with sJ=−1/2 for dim J=9 and +1/2 for dim J=15. (GS, §§5.1–5.2 and Proposition 5.2, pp. 16–17 (GS line 558)).

The construction has the following API.

- The induced module has the normalized smooth Spin₈^E action and commutes with cubic-algebra isomorphism.
- Hom_G₂(RJ(E),π∨) identifies with the HJ,E-invariant functionals on ΘJ(π∨), with the same dual convention as §2.5.
- The embedding of RJ(E) in I_E(sJ) respects both the group action and the chosen normalization.

A proof route applies the trivial-isotypic quotient in the exceptional see-saw and compares the spherical vector and exponents with the degenerate induced module.

*Needs:* §2.3; §2.5; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3.

**Checks.**

- For E=F³ the Levi consists of triples of GL₂ matrices with equal determinants.
- If E is not a field there is no embedding in cubic division D and RD(E)=0.
- The division and split-matrix images occur at −1/2, while the 15-dimensional image occurs at +1/2; interchanging these signs fails the exact sequences.
- At s=±1/2 and det=ϖ, the normalized inducing characters have values q^∓1/2. They are unequal for every q≥2.

### 4.2 The triality exact sequences

I_E(1/2) has length three for E a field and length two otherwise, with irreducible socle V. There are exact sequences 0→R15(E)→I_E(1/2)→RD(E)→0 and 0→V→R15(E)→RM3(E)→0. RD(E)=0 if E is not a field. Every constituent is tracked as a smooth G₂ module after restriction, while its Spin₈^E structure controls the extensions. (GS, Proposition 5.2, p. 17 (GS line 595)).

A proof route computes the degenerate intertwiner image and kernel, identifies the Jordan-rank orbit pieces and spherical quotient, and checks the field/nonfield length distinction.

*Needs:* §4.1; §2.4.

**Checks.**

- For E a field the total length is 3; for E=F×K or F³ it is 2 and RD(E)=0, so the map R15(E)→I_E(1/2) has zero cokernel.

### 4.3 The division-period Ext obstruction

For a cubic field E, RD(E) restricted to G₂ is isomorphic to πdeg[1]⊕C_E, where C_E is a direct sum of supercuspidal representations. Consequently Ext¹_G₂(RD(E),π)=0 when π is tempered or when π has supercuspidal support other than that of πdeg[1]. The ambient Ext is in the full smooth category. In the tempered case use the exact supplier comparison between smooth Ext and Schwartz Ext and discrete-series projectivity in the tempered Schwartz category; never assert that every discrete series is projective among all smooth representations. (GS, Proposition 5.3 and proof, pp. 17–18 (GS lines 628–643)).

A proof route takes PE×-coinvariants, equal to PE×-invariants since PE× is compact, in the decomposition of §3.12: RD(E) is the direct sum over τ of τ^(PE×)⊗Θ_D(τ), the trivial τ contributes Θ_D(1)=πdeg[1]⊕C₁ once and every other summand is supercuspidal. Since G₂ has trivial center, each supercuspidal is projective by compact-center cuspidal splitting, and Ext¹ out of a direct sum is the product of the Ext¹ groups, so C_E contributes 0 against every π. For πdeg[1], separate Bernstein blocks for nonmatching support, and in the tempered case transport discrete-series projectivity across the supplier’s exact Ext comparison. This uses no statement of Layer 5.

*Needs:* §2.2; §3.12; §4.1; §4.2; §1.3; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4; SmoothRepresentationsOfLocalGroupsPartII, gap schwartz-ext.

**Checks.**

- The summand πdeg[1] occurs in RD(E) with multiplicity dim 1^(PE×)=1; every other summand has zero proper Jacquet modules.
- For nonmatching exact cuspidal supports the Ext¹ dimension is 0. In the tempered matching case the Schwartz comparison also yields dimension 0; this does not imply projectivity against nontempered targets.

### 4.4 The G₂ restriction of I_E(s)

I_E(s)|G₂ has an open piece c-Ind_N^G₂ conjugate(ψE) and four boundary pieces J₁=IP(s/2+1/4,Cc(PGL₂)), J₂=mE·IP(s/2+1/4,c-Ind_N₂^PGL₂ ψ), J₃=mE·IQ(s+1,1), J₄=IP(s+1,1), with mE=3,1,0 for E=F³,F×K,cubic field. J₁,J₂ form a submodule and J₃,J₄ the remaining quotient of the boundary module; the filtration order and extension data must be proved. (GS, Proposition 5.4, p. 18 (GS line 633)).

A proof route is to classify G₂ orbits on Spin₈^E/P_E via cubic flags, choose representatives and calculate stabilizers. Compute restrictions of |det|^s and relative half-moduli on each orbit; prove the open embedding and the boundary exact sequence.

*Needs:* §4.1; §0.3; §0.4; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3.

**Checks.**

- The boundary multiplicity is mE=3,1,0 for F³,F×K,and a cubic field. At s=1/2 the P twist is s/2+1/4=1/2 and the Q twist is s+1=3/2.

### 4.5 Restriction to the open cubic orbit

For tempered π and s=1/2, restriction induces Hom_G₂(I_E(1/2),π)≅Hom_N(π∨,ψE). The same conclusion holds for π with Q-supercuspidal support. Prove vanishing of the required Hom and Ext groups of all four boundary pieces. In the Q-support case use nonassociation of P and Q and Bernstein separation of the toral J₃ piece. (GS, Proposition 5.5 and Lemma 5.6 with proofs, pp. 18–19 (GS line 633)).

A proof route computes opposite Jacquet exponents of tempered π against the four explicit boundary twists. Apply second adjointness to all Ext degrees needed by the filtration exact sequences; add the Q-cuspidal-support case explicitly.

*Needs:* §4.4; §4.3; SmoothRepresentationsOfLocalGroups §SR.2a.1; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4.

**Checks.**

- At s=1/2 all four boundary Hom and Ext contributions vanish, so the open restriction map has zero kernel and cokernel; for an arbitrary nontempered target no such boundary vanishing is assumed.

### 4.6 Cubic coefficients of exceptional minimal models

For E embedded in J, (ΠJ)_(N,ψE) is c-Ind_HJ,E^HJ 1 with the chosen period convention. If E has no embedding in J the coefficient is zero. In particular a division E₆ lift has no nonfield cubic coefficients. The isomorphism is constructed on the rank-one orbit fiber and commutes with HJ. (GS, proof of Lemma 6.4, p. 21; Proposition 7.1(iv), p. 23 (GS line 748); GrS, Chapter 6, §2, Lemma 2.9, p. 213 (GrS line 8134)).

For the division model J=D⁺ one degenerate character is needed as well. Every generic character ψ_V of the maximal unipotent subgroup V=N·U_α of G₂ (α the simple root of M) restricts to N as a character ψ_(x³), trivial on Z(N), whose binary cubic is the cube of a linear form, of discriminant 0; the root group U_α fixes ψ_(x³). Prove that (Π_D)_(N,ψ_(x³)) is one-dimensional, the compactly supported functions on the single element 0 of D whose characteristic polynomial is the cube of the variable (6λ³ in the source's normalization of the trilinear form), and that U_α acts trivially on it. Consequently (Π_D)_(V,ψ_V)=0 for every generic ψ_V, and every Θ_D(τ), being a quotient of Π_D, is nongeneric. (Sav, Proposition 5.4, Example 5.5(1) and the remark after it, p. 399 (Sav lines 277–288).)

A proof route is to take the twisted coinvariant of the rank-one model; identify its fiber as the homogeneous space of embeddings E→J and calculate its stabilizer and density. For ψ_(x³) the fiber consists of the elements of D with characteristic polynomial λ³, which are nilpotent, hence 0 in the division algebra; then Hom_V(Π_D,ψ_V) is the space of U_α-functionals on this line transforming by the nontrivial restriction of ψ_V to U_α, which is zero.

*Needs:* §2.3; §2.4; §0.4; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3.

**Checks.**

- For E=F³ and division D the embedding set is empty and the twisted coefficient is 0. For a maximal cubic subfield E⊂D the identity embedding supplies a nonempty orbit.
- For ψ_(x³) the division fiber is the single point 0, since D has no nonzero nilpotent element, and the coefficient is one-dimensional; for split J=M₃(F)⁺ the same fiber is the nilpotent cone of M₃(F), of dimension 6, and the split model has a nonzero Whittaker coefficient (§5.5). Nongenericity is therefore a property of the division model, not of every E₆ minimal model.
- The generic character ψ_V is nontrivial on U_β and U_α and trivial on U_(α+β), U_(2α+β), U_(3α+β) and Z(N); conjugation by U_α leaves the U_β-coordinate of an element of N unchanged and moves the other root coordinates only upward, so U_α fixes ψ_(x³), and on the one-dimensional coefficient the trivial U_α-action meets the nontrivial character ψ_V|U_α, giving 0.

### 4.7 The finite cubic period chain

Suppose tempered π⊗τ is a quotient of ΠJ and E embeds in J. There are natural injections W_E(π)→W_E(ΘJ(τ))≅Hom_HJ,E(τ∨,1)→Hom_HJ,E(ΘJ(π∨),1)≅Hom_G₂(RJ(E),π∨). If any one of these spaces is finite-dimensional, all have that finite dimension, by comparison with Hom(I_E(1/2),π∨) and the triality exact sequences. The statement retains the conjugate character when replacing π by π∨. (GS, Lemma 6.4 and proof, p. 21 (GS line 748)).

A proof route is to construct the two injections from theta quotient maps and the two identifications from coefficient and see-saw universal properties. Use the triality Hom bound to close the chain; never infer equality merely from the existence of injections.

*Needs:* §4.6; §4.5; §4.3; §2.5; §1.10.

**Checks.**

- A closed injection chain of finite dimension d has every dimension equal to d. For d=1 the pattern 1→2→1 is impossible, whereas two separate injections 1→2 do not imply equality.

### 4.8 Preliminary nongeneric uniqueness

If τ is tempered and ΘJ(τ) has a nongeneric tempered irreducible quotient π, then π is its unique tempered irreducible quotient. If π is nongeneric tempered, ΘJ(π) has at most one tempered irreducible quotient; its supercuspidal part is therefore zero or irreducible. These assertions precede any general finite-length claim. (GS, Propositions 6.6–6.7, p. 22 (GS line 781)).

A proof route is to choose a nonzero finite cubic model of the alleged quotient; use the period-chain equalities to make two quotients force a strict dimension increase. For the division pair first use the vanishing of nonfield cubic coefficients.

*Needs:* §4.7; §1.10; §3.11; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4.

**Checks.**

- If the selected nongeneric cubic coefficient has dimension d=1, two independent copies of a quotient would contribute 2>1; finite cubic multiplicity excludes that pair.

### 4.9 Existence before exclusion

Every nongeneric infinite-dimensional tempered π has at least one nonzero theta lift to PD× or PGSp₆. Choose a nonzero cubic coefficient, use the open-orbit restriction and 0→R15→I_E→RD→0 to obtain a nonzero map from one of the two RJ modules, then apply the see-saw. This gives existence only; mutual exclusion is proved after noncuspidal finiteness. (GS, §6.3, p. 20 (GS line 710)).

A proof route applies Hom_G₂(−,π) to the exact sequence and use the nonzero Hom of I_E provided by the chosen coefficient.

*Needs:* §1.10; §4.5; §4.2; §2.5.

**Checks.**

- For E=F³, RD(E)=0 and I_E(1/2)=R15(E); a nonzero open coefficient therefore forces the H lift. For a cubic field both terminal modules can occur before the exclusion argument.

### Examples

For E=F³,F×K,and a field, the number of F factors is 3,1,0. The common P boundary exponent at s=1/2 is 1/2 and the Q boundary exponent is 3/2. If E is not a field, RD(E)=0, so R15(E)=I_E(1/2). At det=ϖ the triality parameters −1/2 and +1/2 have values q¹ᐟ² and q⁻¹ᐟ² respectively.

### Dependencies

The statement carriers and construction inputs are SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4; SmoothRepresentationsOfLocalGroupsPartII, gap schwartz-ext; SmoothRepresentationsOfLocalGroups §SR.2a.1. The internal inputs are §2.2, §2.3, §2.5, §4.1, §2.4, §4.2, §1.3, §3.12, §0.3, §0.4, §4.4, §4.3, §4.6, §4.5, §1.10, §4.7, §3.11. The exact additional supplier gaps are those on the individual Needs lines.

## Layer 5: the two E₆ correspondences

The division group PD× is compact. The split E₆ partner is the disconnected H₃ with the spherical outer extension fixed in Layer 2. Generic plus signs are determined on a Whittaker line, while nongeneric signs are determined by the model.

### 5.1 Howe duality for the cubic division pair

For every τ∈Irr(PD×), ΘD(τ) is finite length, is nongeneric, and is either zero or irreducible; distinct nonzero lifts are inequivalent. ΘD(1)=πdeg[1]. If τ≠1 its nonzero lift is supercuspidal. It is nonzero exactly when τ has a nonzero PE×-fixed vector for some cubic field E embedded in D. Thus the G₂-to-PD× small lift is injective on its domain, which consists of discrete series. (GS, Proposition 7.1 and Theorem 7.2 with proof, p. 23 (GS line 817); Sav, §5, pp. 398–399 (Sav line 223)).

A proof route takes from §3.12 the decomposition ΘD(1)=πdeg[1]⊕C₁ with C₁ supercuspidal and the supercuspidality of the lifts of τ≠1, and from §4.6 nongenericity of every ΘD(τ). By §4.6 with §2.5, dim W_E(ΘD(1)) is the dimension of the PE×-invariants of the trivial representation, 1, for every cubic field E (which embeds in D by §2.2), and 0 for nonfield E. Since πdeg[1] is a discrete series and a quotient of I_E(1/2) through RD(E) (§§4.2–4.3), §4.5 gives W_E(πdeg[1]∨)≠0 for every cubic field E; as πdeg[1] is unitary, πdeg[1]∨ is its complex conjugate, and the central element −1 of M acts by −1 on N/Z(N)=Sym³(F²)⊗det⁻¹, so the conjugate of ψE is M-conjugate to ψE and dim W_E(πdeg[1])=dim W_E(πdeg[1]∨)≥1. Hence W_E(C₁)=0 for every cubic étale E. By compact-center cuspidal splitting C₁ is a direct sum of irreducible supercuspidals, each infinite-dimensional and nongeneric, so §1.10 gives each a nonzero cubic coefficient; therefore C₁=0. Use a nonzero cubic coefficient to obtain the torus criterion, then the preliminary uniqueness theorem to prove irreducibility and injectivity; only these last two steps use §4.8.

*Needs:* §2.2; §3.12; §4.2; §4.3; §4.5; §4.6; §4.8; §1.10; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4; §2.5; §1.3.

**Checks.**

- The input 1 of PD× maps to πdeg[1], whose genericity indicator is 0. For τ≠1 every nonzero lift has proper Jacquet modules equal to 0.
- Coefficient count in ΘD(1)=πdeg[1]⊕C₁: for E=F³ it reads 0=0+0, for a cubic field E it reads 1=1+0. A nonzero summand σ of C₁ would need an étale E with W_E(σ)≠0 by §1.10, impossible on both sides; without the lower bound dim W_E(πdeg[1])≥1 the count 1=0+1 would leave room for a supercuspidal summand.

### 5.2 The residue-characteristic bound for division nonvanishing

If the residue characteristic p is not 3, every irreducible representation of PD× has a fixed vector for the image PE× of some cubic field E⊂D; consequently ΘD(τ)≠0 for every τ. Independently of this bound, the trivial τ and the unramified nontrivial cubic norm characters lift nontrivially; for such a character ω, ΘD(ω∘Nrd)=πsc[ω], with the two inverse characters giving two distinct supercuspidals; matching their individual eigenvalue labels requires a fixed convention. (GS, Proposition 7.1(iii) and Theorem 7.2(iii) with proof, p. 23 (GS line 817); Sav, §6, pp. 399–400 (Sav line 263)).

For representations of PD× of dimension greater than one the input is the prime-degree torus-distinction theorem of the supplier contract prime-degree-torus-distinction (LT, Theorem 1.4.2, printed pp. 6–7 (LT lines 309–330)), applied with ℓ=3≠p. For ℓ=3 its dimension in the unramified inducing-field, totally ramified test-field case is q^m; taking q=2,m=1 gives 2. By the local-division-characters contract every one-dimensional smooth representation of D× is uniquely χ∘Nrd; it descends to PD× exactly when χ³=1, since Nrd(a)=a³ on F×. These are treated here. For χ=1 every cubic field E⊂D works. For χ≠1, ker χ is an open subgroup of index 3, hence by local existence the norm group N(E×) of a cyclic cubic E; E embeds in D as a maximal subfield by §2.2, and χ∘Nrd is trivial on E× because Nrd restricts to N_E/F on E. This case holds for every p.

A proof route applies the supplied torus-distinction theorem with degree 3 and p≠3 to the representations of dimension greater than one and the class-field argument above to the characters. For the two nontrivial unramified cubic norm characters compute the division-model coefficients and identify the unordered pair of two distinct depth-zero representations; fix an eigenvalue convention before ordering it.

*Needs:* §2.2; §5.1; §1.8; SmoothRepresentationsOfLocalGroupsPartII, gap prime-degree-torus-distinction; SmoothRepresentationsOfLocalGroupsPartII, gap local-division-characters; ClassFieldTheory Layer 8.

**Checks.**

- For degree 3, gcd(3,2)=1 and gcd(3,3)=3; universal torus distinction applies at p=2 and does not assert it at p=3. The trivial input still has a nonzero lift at both primes.
- For an unramified nontrivial cubic χ, ker χ consists of the elements of valuation divisible by 3, the norm group of the unramified cubic E; χ∘Nrd is then trivial on E×, whereas on a totally ramified cubic E′ the uniformizer has norm of valuation 1 and χ∘Nrd is nontrivial on E′×. The choice of E depends on χ.

### 5.3 Opposite division algebras and contragredients

For a cubic division algebra D, the identity on its vector space identifies the Jordan algebras D⁺ and (Dop)⁺, while inversion i:x↦x⁻¹ identifies PD× with P(Dop)×. Let τ be a discrete-series representation of PGL₃(F), and let JL_D(τ) denote its transfer to PD×. With θ_D the division-pair lift, prove θ_D(JL_D(τ))≅θ_Dop(JL_Dop(τ∨)); the relation on transferred inputs is i*JL_Dop(τ)≅JL_D(τ)∨. For D=M₃(F), use the full connected-PGL₃ input quotient of the split E₆ model: the normalized outer operator of §2.6 identifies its τ and τ∨ big lifts before decomposing by outer sign. (LL, §3.5, pp. 14–15 (LL line 593)).

A proof route is to check the Jordan product directly, transport the minimal representation through its Jordan isomorphism, and compare the JL character identity after inversion.

*Needs:* §2.1; §5.1; §2.6; EndoscopicTransferAndUnitaryTraceComparison §§4.7a, 10.30–10.31.

**Checks.**

- For the Jordan product, x∘y=(xy+yx)/2 is unchanged in Dop: (yx+xy)/2. Inversion reverses multiplication, (xy)⁻¹=y⁻¹x⁻¹, giving a homomorphism to the opposite group.

### 5.4 PGL₃ outer extensions and their signs

Put H₃=PGL₃⋊⟨ι⟩ with the pinned involution in Layer 2. For nonselfdual irreducible τ, τ+=Ind_PGL₃^H₃ τ is irreducible and is unchanged by τ↦τ∨. For selfdual τ there are two extensions τ±. If τ is generic, τ+ is the unique extension supporting ψ_U⊗1 on U⋊C₂. For nongeneric selfdual τ (including 1 and the quadratic Borel Langlands quotients), choose the unique extension occurring in Π_E6 as plus, using the independent E₆ model classification; minus has zero lift. (GS, §8.1, p. 24 (GS line 855); GS, Theorem 8.2, pp. 25–26 (GS line 899); GS04, §8, Theorem 11, pp. 799–801 (GS04 line 289)).

The construction has the following API.

- Restriction of τ+ is τ⊕τ∨ in the nonselfdual case and τ in either selfdual extension.
- For generic selfdual τ the plus extension has a one-dimensional ψ_U⊗1 space and the minus extension has none.
- Transport by ι matches the contragredient and identifies the nonselfdual induced labels.

A proof route applies index-two Clifford theory and compute the involution on the Whittaker fiber and on the nongeneric Jacquet quotient. The nongeneric plus convention is justified by the model calculation, not used as a proof of occurrence.

*Needs:* §2.6; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3; §3.3; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4.

**Checks.**

- A GL₃ parameter not isomorphic to its dual yields only one H₃ irreducible above its two-element orbit.
- The two extensions of St_PGL₃ are distinct and only plus has the trivial C₂ action on its Whittaker line.
- The plus extension of the trivial PGL₃ module must be determined by the E₆ model; a Whittaker-based definition alone cannot label it.
- For a two-element nonselfdual orbit the induced restriction has two constituents. For a fixed selfdual orbit there are two extensions, each with one constituent on restriction.

### 5.5 E₆ Whittaker, cubic and oscillator fibers

For the fixed outer extension, Π_(V,ψV)=c-Ind_(U⋊C₂)^H₃(ψU⊗1); its cubic coefficients are c-Ind_(PE×⋊C₂)^H₃ 1. The [U,U]-twisted quotient with nontrivial central character is the oscillator module c-Ind_(GL₂⋊C₂)^H₃ Cc(M₂(F)), where GL₂ occupies the first and third coordinates and C₂ acts by the orthogonal involution prescribed by the model. Prove that each indicated disconnected stabilizer has trivial fiber character. (GS, Lemma 8.1, pp. 24–25; Lemma 8.3, p. 26 (GS line 855)).

A proof route computes each fiber of the concrete minimal orbit model and its connected stabilizer. Evaluate the normalized outer intertwiner on one nonzero fiber vector to determine its C₂ character, then use transitivity.

*Needs:* §2.6; §5.4; §4.6; §2.4; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3; MetaplecticAutomorphicForms §§0.15–0.17, 1.1, 2.4a–2.7.

**Checks.**

- The outer stabilizer eigenvalue +1 gives a one-dimensional invariant fiber; eigenvalue −1 gives dimension 0 in characteristic zero, since v=−v forces 2v=0.

### 5.6 The generic supercuspidal precursor

For a generic supercuspidal π of G₂, construct the injective first-occurrence assignment to the disjoint union of generic supercuspidal PGSp₆ representations and contragredient pairs of supercuspidal PGL₃ representations. Use the PGSp₆ supercuspidal branch when it occurs; otherwise the PGL₃ branch occurs. In the latter case the generic constituent of the associated Siegel induction occurs on PGSp₆. Prove uniqueness of the generic PGSp₆ occurrence and injectivity on each branch. For generic supercuspidal σ of PGSp₆, its exceptional G₂ lift is nonzero exactly when its Shalika functional is nonzero, and the lift is irreducible generic supercuspidal. These within-partner uniqueness statements are the precursor used by E₆ uniqueness. The full statement that precisely one partner has a discrete-series lift is the end theorem of §8.8, including residue characteristic 2. (SW, Theorem 3.9 and its qualification, p. 27 (SW lines 1270–1288); Proposition 4.6, p. 37 (SW line 1919)).

A proof route uses the generic twisted fibers, first occurrence and supercuspidal Jacquet vanishing; establish multiplicity one through the Shalika comparison in the supercuspidal setting.

*Needs:* §2.4; §5.5; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4; SmoothRepresentationsOfLocalGroupsPartII, gap quasisplit-whittaker.

**Checks.**

- The first-occurrence assignment takes one of two branch labels. At residue characteristic 2 its construction alone does not rule out two supercuspidal-occurrence indicators (1,1); the later Siegel table and irreducibility theorem rule that pattern out. Thus within-partner uniqueness is not mistaken for cross-partner exclusivity.

### 5.7 Nonzero minus lift for selfdual supercuspidals

For selfdual supercuspidal τ of PGL₃, Θ(τ−) is nonzero, nongeneric and supercuspidal. Produce a nonzero oscillator-model Hom from τ|GL₂ using a generic GL₂ quotient and classical theta, then split the resulting map by supercuspidal projectivity in its compact-center block. Self-dual supercuspidal representations of PGL₃ exist only in residue characteristic 2. (GS, Proposition 8.4 and proof, pp. 26–27 (GS line 937); Pra, Theorem 3, pp. 173–174 (Pra line 243)).

A nonzero GLₙ₋₁-invariant functional on V⊗W∨ gives a nonzero GLₙ₋₁-map V→W: genericity is preserved by smooth duality, and smooth admissible biduality gives (W∨)∨≅W. Smoothness of V places the curried functional in the smooth dual of W∨, rather than its full algebraic dual.

A proof route uses the generic restriction theorem for GL₃↓GL₂ with its exact central-character convention. Apply the rank-one oscillator decomposition with conjugate ψ, and keep track of the disconnected sign to obtain the minus lift. The E₆ Jacquet computation and Whittaker coefficient imply supercuspidality and nongenericity.

*Needs:* §5.4; §5.5; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4; MetaplecticAutomorphicForms §§3.4–3.8, 3.34, 3.37–3.40; AutomorphicLFunctionsAndLocalFactors, “Central periods”, target normalized-rs-period, with m=n−1 and π_m=W∨.

**Checks.**

- For p≠2 the selfdual-supercuspidal PGL₃ case has no inputs. At p=2 a minus extension has Whittaker dimension 0 and a nonzero supercuspidal G₂ lift.
- At n=3, V=τ supercuspidal on PGL₃ and W=st on GL₂ have a nonzero adjacent-rank functional on τ⊗st∨; currying gives a nonzero map τ|GL₂→st, whose image is all of the irreducible st. The functional dimension is 1 and the zero map cannot represent it (GS line 1013; Pra lines 250–252).

### 5.8 The split-E₆ lift table

For nonselfdual τ of PGL₃, θ(τ+) is nonzero and has the same tempered/discrete-series status as τ. For selfdual τ: a parameter containing 1 has only a nonzero plus lift, which is not discrete series; St_PGL₃ has plus lift πgen[1] and minus lift πsc[1]; a selfdual supercuspidal has generic supercuspidal plus lift and nongeneric supercuspidal minus lift; a tempered GL₂-induced selfdual parameter with nontrivial determinant gives the generic/degenerate pair in the P-series; the distinct nontrivial quadratic triple gives πgen[χ₁,χ₂] and πdeg[χ₁,χ₂]. For nongeneric selfdual τ only the plus extension lifts. State genericity of the small lift of a generic input only in the tempered cases of this table. (GS, Theorem 8.2, pp. 25–26; Theorem 8.5(i) and proof, pp. 27–28 (GS line 899); GS04, §§8–9 and 11 (Theorems 11, 14, 15 and 21), pp. 799–807 (GS04 line 289)).

A proof route is to calculate the non-supercuspidal entries by normalized E₆ Jacquet filtrations and standard-module quotients. For selfdual supercuspidals combine the plus Whittaker fiber and the minus nonvanishing argument. For nontempered input distinguish the generic constituent of the big lift from the potentially nongeneric small quotient.

*Needs:* §5.4; §5.7; §5.5; §1.1; §1.2; §1.3; §1.4; §1.5; §1.6; §1.9; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4; EndoscopicTransferAndUnitaryTraceComparison §§4.7a, 10.30–10.31.

**Checks.**

- For St_PGL₃ the plus lift is πgen[1] and the minus lift is πsc[1], with genericity indicators 1 and 0. A generic nontempered standard module can have a nongeneric Langlands quotient; no unrestricted generic-small-lift assertion is made.

### 5.9 Howe duality for split E₆

For H₃×G₂ the big lifts in both directions have finite length, each nonzero small lift is irreducible, and distinct inputs have distinct nonzero small lifts. The image on H₃ is exactly the extensions listed in the E₆ table. Tempered and discrete-series representations are preserved on nonzero lifts. The generic supercuspidal case uses the precursor, while nongeneric tempered uniqueness uses cubic periods. (GS, Theorem 8.5 and proof, pp. 27–29 (GS line 993)).

A proof route is to separate supercuspidal and noncuspidal parts using the compact-center block decomposition; use preliminary period uniqueness for the nongeneric supercuspidal part. For possible generic quotients use the Whittaker fiber and the earlier supercuspidal injectivity theorem. Use the P₃ Jacquet top piece, not the all-representation E₇ Howe theorem, when ruling out conflicting E₆ quotients.

*Needs:* §5.8; §5.6; §4.8; §3.3; §3.11; §3.6; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4.

**Checks.**

- Two distinct nonzero small lifts cannot share one input quotient, whose cosocle multiplicity is 1; the allowed zero lift has length 0 and no irreducible cosocle.

### Examples

The PD× trivial input gives πdeg[1]. The two inverse nontrivial unramified cubic norm characters give two distinct depth-zero supercuspidals. For St_PGL₃ the plus and minus outputs are πgen[1] and πsc[1]. The involution acts by +1 on the chosen Whittaker fiber; its sign twist acts by −1. Both p=2 and p=3 remain in Howe duality, while only p≠3 is used for universal division nonvanishing.

### Dependencies

The statement carriers and construction inputs are SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4; EndoscopicTransferAndUnitaryTraceComparison §§4.7a, 10.30–10.31; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3; MetaplecticAutomorphicForms §§0.15–0.17, 1.1, 2.4a–2.7; MetaplecticAutomorphicForms §§3.4–3.8, 3.34, 3.37–3.40. The adjacent-rank restriction input is AutomorphicLFunctionsAndLocalFactors, “Central periods”, target normalized-rs-period. The division nonvanishing for characters uses ClassFieldTheory Layer 8 and the gap local-division-characters. The internal inputs are §2.2, §3.12, §4.2, §4.3, §4.5, §1.10, §4.8, §4.6, §3.3, §2.5, §1.3, §5.1, §1.8, §2.1, §5.2, §0.8, §2.6, §5.4, §2.4, §5.5, §5.7, §1.1, §1.2, §1.4, §1.5, §1.6, §1.9, §5.8, §5.6, §3.11, §3.6. The exact additional supplier gaps are those on the individual Needs lines.

## Layer 6: independent finiteness and dichotomy

Independent finiteness for the five Jacquet filtrations is proved before dichotomy. The orthogonal and restricted oscillator inputs retain exactly the supplier’s hypotheses, including the tempered condition on the G₂ input where imposed.

### 6.1 Supercuspidal lifts through the restricted Mp₂ × G₂ oscillator

For the restricted Mp₂ × G₂ oscillator of MetaplecticAutomorphicForms §3.38a, let σ be a genuine supercuspidal Mp₂ representation which is not odd Weil and whose split SO₃ lift is zero. Identify the Fourier–Jacobi module of its nonzero small G₂ lift with σ∨. This adds the explicit exceptional Fourier–Jacobi identification to the supplier’s nonvanishing, irreducibility and injectivity assertions. (GG, Theorem 9.1(d), p. 33, and its proof in §9.5, pp. 36–37 (GG line 1071); GG, Propositions 8.1, 8.3–8.4, pp. 27–28 (GG line 886)).

A proof route uses the explicit restricted oscillator and its Jacquet sequence from MetaplecticAutomorphicForms §3.38a. Gan–Gurevich §9.5 and Proposition 8.3 identify the Fourier–Jacobi module with σ∨; retain the separate odd Weil and nonzero SO₃ first-occurrence cases.

*Needs:* §0.3; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3; MetaplecticAutomorphicForms §3.38a.

**Checks.**

- For the odd Weil representation ω⁻ attached to the trivial character, the Whittaker support is the square class F×², which contains 1, and the split SO₃ lift is the Steinberg representation of PGL₂. For a nontrivial quadratic χ with nonsquare class a_χ, the odd Weil ω⁻χ has Whittaker support a_χF×², which omits 1, so its split SO₃ lift is 0 and its anisotropic ternary lift is the one-dimensional χ∘Nrd (GG, Propositions 6.5, 6.8 and 6.11, pp. 22–23 (GG lines 745–799)). Thus ω⁻χ also has zero split SO₃ lift and is excluded only by the explicit not-odd-Weil hypothesis.
- For an admitted σ the split SO₃ lift is 0 and the Fourier–Jacobi module of its G₂ lift is σ∨; taking the smooth dual twice recovers σ, while the unmodified σ would be the wrong output whenever σ is not selfdual.

### 6.2 Comparison with the owned orthogonal theta input

Identify the D₅,D₆ minimal factors in the E₇ Jacquet modules with the exact orthogonal-minimal theta models imported from MetaplecticAutomorphicForms §3.39. For a tempered G₂ input use its finite-length lifts for the relevant SO₁₀/SO₁₂ restrictions and between Sp₂ and Sp₆ in SO₁₂. Derive the exceptional comparison maps with the full algebraic dual on one side and the conjugate ψ on its rank-one oscillator; retain the finite-length assertion at exactly those hypotheses. (GS, Proposition 14.2 and identity (14.3), pp. 50–51; §14.3, pp. 51–52 (GS line 1910)).

A proof route is to match spinor/orthogonal embeddings and central quotients before applying the supplier. Apply the mixed-module Fourier–Jacobi comparison to identify the G₂ factor and check all contragredients.

*Needs:* §3.1; §6.1; MetaplecticAutomorphicForms §§3.4–3.8, 3.34, 3.37–3.40.

**Checks.**

- On a one-dimensional character χ, the smooth dual is χ⁻¹ and the algebraic dual agrees; on an infinite-dimensional module the full algebraic dual need not consist of smooth vectors, so that equality cannot be assumed.

### 6.3 The A₅ minimal restriction to Sp₆

The A₅ minimal factor restricted to Sp₆ has finite length. Realize it as the appropriate homogeneous-function degenerate principal-series model on F⁶ minus {0}, then use transitivity of Sp₆ on nonzero vectors and on projective lines to identify its restriction with a finite-length induction from the line parabolic; retain the exact inducing character fixed by the minimal model. (GS, §14.3, second case, p. 52 (GS line 1989)).

A proof route computes the scalar homogeneity of the A₅ model, apply transitivity and normalized induction, and include any evaluation-at-zero constituent.

*Needs:* §2.4; §0.9; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4.

**Checks.**

- F⁶ minus {0} is one symplectic orbit, whereas all of F⁶ has two orbits, {0} and its complement; evaluation at zero is a separate potential constituent.

### 6.4 Noncuspidal finiteness in both E₇ directions

For every irreducible representation on either side of G₂×PGSp₆, the noncuspidal part of its big theta lift has finite length. This includes every graded piece of every relevant Jacquet filtration, not just its regular bottom piece. (GS, Lemma 6.2, p. 19; §§14.2–14.3, pp. 49–52 (GS line 674)).

One proof route treats each of the five maximal parabolics: tabulate Hom into the finite-length Jacquet module of the input. Use regular GL₁/GL₂ isotypic quotients for lower pieces, classical similitude theta for the Weil piece, and E₆/D₅/D₆/A₅ finiteness for top pieces. For induction through a middle Levi use second adjointness and the general isotypic–parabolic-induction identity; check all Ext terms in the filtration.

*Needs:* §3.4; §3.5; §3.7; §3.8; §3.6; §6.2; §6.3; §5.9; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4; SmoothRepresentationsOfLocalGroups §SR.2a.1; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3; SmoothRepresentationsOfLocalGroupsPartII, gap isotypic-parabolic.

**Checks.**

- There are two G₂ maximal parabolics and three H maximal parabolics, hence five Jacquet filtrations to bound. Summing finite lengths l₁+⋯+lᵣ remains finite; bounding just the bottom length leaves the other lᵢ uncontrolled.

### 6.5 Finite length for nongeneric inputs

For nongeneric tempered π of G₂, ΘH(π) has finite length with zero or irreducible supercuspidal part. For tempered τ of H having a nongeneric quotient π, ΘG₂(τ) has finite length and unique irreducible quotient π. Combine noncuspidal finiteness with preliminary supercuspidal uniqueness, rather than using that uniqueness to assume finite length of the entire module. (GS, Proposition 6.6 and Corollary 6.8, p. 22 (GS line 781); GS, §§14.2–14.3, pp. 49–52 (GS line 1866)).

A proof route is to split off the supercuspidal part in the appropriate compact-center category, bound it by the cubic-period dimension argument and combine it with the noncuspidal length bound.

*Needs:* §6.4; §4.8; §3.11; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4.

**Checks.**

- The total length equals the noncuspidal length n plus a supercuspidal length ε with ε=0 or 1. For n=2 the possibilities are 2 and 3, not an arbitrary infinite cuspidal contribution.

### 6.6 The two E₇ Whittaker fibers

For the fixed minimal representation Π, its generic G₂ coinvariant is c-Ind_S^H ψS and its generic H coinvariant is c-Ind_V^G₂ ψV. Consequently a generic G₂ representation has a nonzero H lift and a nongeneric G₂ input cannot pair with a generic H quotient. These are concrete fiber computations before full Howe duality. (GS, Proposition 11.1 and Corollary 11.2, p. 34; Proposition 11.5, p. 37 (GS line 1254); HKT, Theorem A.7 and proof, pp. 25–27 (HKT line 1038)).

Here define S as the stabilizer of a generic character ψ₂ of the H radical N₂, extended by that radical: S=PGL₂^Δ⋉N₂, with ψS trivial on PGL₂^Δ. The orbit computation constructs this group and character before the dichotomy; §7.2 develops its period functor.

A proof route computes the two generic-character fibers in the minimal orbit model and their stabilizers and density actions, independently of the final multiplicity-one argument.

*Needs:* §2.4; §0.3; §0.9; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3.

**Checks.**

- Taking the G₂ Whittaker coefficient leaves an H-module c-Ind_S^H ψS; taking the H coefficient leaves a G₂-module c-Ind_V^G₂ ψV. For the trivial G₂ representation the generic coefficient is 0.

### 6.7 The exceptional theta dichotomy

Every irreducible π of G₂ has nonzero big theta lift to exactly one of PD× and PGSp₆. Let Irr♠ and Irr♥ denote these disjoint domains. Nongeneric tempered existence comes from the triality exact sequence; generic representations cannot occur in the division pair (§4.6) and have a nonzero PGSp₆ lift; all nontempered representations have their nonzero PGSp₆ lift from positive-exponent analysis. (GS, Theorem 1.1, p. 2; Theorem 6.1 and §§6.2–6.5, pp. 19–21 (GS line 43)).

One proof route assumes a nongeneric tempered lift to both targets and chooses a nonzero cubic field model of dimension d. The exact sequence for I_E and the Ext vanishing identify the two terminal period contributions with d+d, while the open-orbit Hom space has dimension d; deduce d=0, a contradiction. Prove the generic PGSp₆ occurrence from the minimal Whittaker fiber, independently of its full Howe theorem. Use the full nontempered quotient result and the division discrete-series property for the other cases.

*Needs:* §4.6; §4.9; §5.1; §6.5; §3.9; §5.5; §2.4; §2.5; §6.6.

**Checks.**

- For a common finite cubic dimension d=1, simultaneous division and H occurrence would force 1=1+1=2. The selected coefficient has d>0, so d=0 cannot dissolve the contradiction.

### Examples

Finite noncuspidal length n and cuspidal length ε∈{0,1} give total length n+ε. For a selected nonzero cubic coefficient of dimension d=1, simultaneous division and H occurrence would force 1=2. The arithmetic-Frobenius and ψ conventions remain those of Layer 0; any dual coefficient uses conjugate ψ.

### Dependencies

The statement carriers and construction inputs are MetaplecticAutomorphicForms §§3.4–3.8, 3.34, 3.37–3.40; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4; SmoothRepresentationsOfLocalGroups §SR.2a.1. The internal inputs are §0.3, §3.1, §6.1, §2.4, §0.9, §3.4, §3.5, §3.7, §3.8, §3.6, §6.2, §6.3, §5.9, §6.4, §4.8, §3.11, §4.6, §4.9, §5.1, §6.5, §3.9, §5.5, §2.5, §6.6. The exact additional supplier gaps are those on the individual Needs lines.

## Layer 7: enhanced periods and tempered Howe duality

The generic G₂ unipotent is V and the generic H unipotent is V′. Neither is the Q radical U. Period comparisons distinguish twisted coinvariants from their full algebraic-dual functional spaces.

### 7.1 The enhanced Fourier–Jacobi period

For Q=LU in G₂ put Z=Z(U), let U/Z be its three-dimensional Heisenberg quotient, and let Lder≅SL₂. Set J=Lder⋉U. The oscillator representation ρψ of U/Z extends to Mp₂⋉U; for a genuine Mp₂ module Iψ(s) form I_conjugateψ(s)⊗ρψ, whose two genuine signs cancel so it descends to J. Define its Fourier–Jacobi period on π by Hom_J(π,I_conjugateψ(s)⊗ρψ), with the normalized genuine principal series and the stated additive-character convention. (GS, §11.2, p. 34 (GS line 1254)).

The construction has the following API.

- The tensor of the two genuine factors has trivial central μ₂ and therefore defines a J action.
- The normalized Mp₂ standard intertwiner induces the corresponding map of enhanced period modules.
- The root-coordinate and Schrödinger definitions identify with the same ψ and selfdual Haar measure.

A proof route is to construct the Heisenberg quotient from the root commutator pairing and restrict the imported Schrödinger representation; calculate the metaplectic cocycle on Lder.

*Needs:* §0.3; MetaplecticAutomorphicForms §§0.15–0.17, 1.1, 2.4a–2.7; MetaplecticAutomorphicForms §§3.4–3.8, 3.34, 3.37–3.40; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3.

**Checks.**

- Either genuine factor alone fails to descend to SL₂; their tensor descends.
- For nontrivial ψ the oscillator has nontrivial center on U/Z and cannot be a representation of U/[U,U].
- Replacing ψ by conjugate ψ dualizes the oscillator and conjugates the principal-series character; retaining only one change gives a different period.
- The two genuine μ₂ actions are −1 and −1, so their tensor is +1; the value on either factor alone is −1.

### 7.2 The PGSp₆ Shalika period

Let N₂ be the radical of P₂ in H and choose the generic ψ₂ whose stabilizer in M₂ is diagonal PGL₂. Set S=PGL₂^Δ⋉N₂ and extend ψ₂ trivially to ψS on the diagonal factor. Define the Shalika coinvariant π_(S,ψS) and its algebraic-dual functional space Hom_S(π,ψS). Distinguish these dual spaces in every period identity. (GS, §11.3, pp. 36–37 (GS line 1330)).

The construction has the following API.

- The extension ψS is a character because diagonal PGL₂ stabilizes ψ₂.
- The algebraic dual of the Shalika coinvariant identifies with the functional space.
- Conjugating ψ₂ by M₂ transports the subgroup and its period without changing dimensions.

A proof route computes the M₂ action on the generic radical character and its stabilizer, then applies the imported twisted coinvariant construction to the semidirect product.

*Needs:* §0.9; §0.10; SmoothRepresentationsOfLocalGroups §SR.5.1; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3.

**Checks.**

- The anti-diagonal central Gm quotient in M₂ acts trivially and the stabilizer is PGL₂, not an extra GL₂ center.
- A trivial H module has zero Shalika period because ψS is nontrivial.
- Contragredient period identities use conjugate ψS; an assertion with an unchanged arbitrary unitary ψS fails.
- For a trivial H-module and n with ψS(n)≠1 the scalar relation (1−ψS(n))v=0 forces dimension 0. On (zI,z⁻¹I) the quotient character has value z²z⁻²=1.

### 7.3 Root exchange with compact integration

For a smooth Heisenberg module with fixed nontrivial central character, integration along one of two complementary isotropic subgroups induces an isomorphism between the corresponding twisted coinvariant spaces. Use dual selfdual Haar measures so the inverse map is Fourier inversion. For each smooth vector prove compact support of the integrand modulo the relevant stabilizer; integration of an arbitrary constant along a whole noncompact root group is not defined. (GS, Lemma 11.4 and proof, pp. 35–36 (GS line 1291)).

A proof route uses the nondegenerate commutator pairing to identify opposite root groups as Pontryagin duals. Smoothness provides an open stabilizer; the central character forces support inside its compact annihilator. Apply finite-level Fourier inversion and pass to coinvariants.

*Needs:* §7.1; SmoothRepresentationsOfLocalGroups §SR.5.1; MetaplecticAutomorphicForms §§0.15–0.17, 1.1, 2.4a–2.7.

**Checks.**

- Over a finite quotient of cardinality q, the Fourier sum of a nontrivial additive character is 0 and that of the trivial character is q; dividing by the dual-measure normalization gives Fourier inversion. A constant on all of F has infinite Haar integral.

### 7.4 Enhanced Fourier–Jacobi multiplicity one

If π is generic irreducible and either tempered or supported on a Q-supercuspidal Bernstein component, then for real s<1/2 the space Hom_J(π,I_conjugateψ(s)⊗ρψ) has dimension one. In particular the value at s=−1/2 needed by the period chain is one-dimensional. This includes the Q-support case independently of temperedness. (GS, Lemma 11.3 and proof, pp. 34–36 (GS line 1254)).

A proof route uses root exchange to replace the enhanced period by the appropriate mirabolic/Whittaker functional. Analyze the normalized Mp₂ intertwiner and G₂ Jacquet exponents; show boundary terms vanish for s<1/2 in the tempered case. Use Bernstein support separation for the Q-supercuspidal case and the supplier’s generic Whittaker uniqueness.

*Needs:* §7.1; §7.3; §1.4; SmoothRepresentationsOfLocalGroups §SR.2a.1; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4; SmoothRepresentationsOfLocalGroupsPartII, gap quasisplit-whittaker.

**Checks.**

- The required enhanced exponent −1/2 satisfies −1/2<1/2 and the dimension is 1. The boundary value +1/2 is not in this uniqueness assertion.

### 7.5 The Shalika fiber of the minimal representation

With J and S as above, Π_(N₂,ψ₂) is c-Ind_J^G₂(Cc(M₂(F)^0)⊗ρψ) with the commuting diagonal PGL₂ action, and Π_(S,ψS) is c-Ind_J^G₂(I_conjugateψ(1/2)⊗ρψ). In the second formula determine the genuine principal-series normalization by the PGL₂-trivial isotypic quotient of the classical oscillator. The underlying coefficient spaces and actions must be constructed explicitly. (GS, §11.4, Lemma 11.6 and Proposition 11.7, pp. 37–38 (GS line 1372)).

A proof route computes the N₂ character fiber in the E₇ rank-one model, identify its stabilizer and verify the action on the traceless-matrix Schrödinger space. Take diagonal PGL₂ coinvariants using the classical oscillator’s exact sequence and the required Ext¹_PGL₂(1,1)=0; commute this particular quotient with compact induction by the appropriate supplier lemma.

*Needs:* §2.4; §7.2; §7.1; §7.3; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3; MetaplecticAutomorphicForms §§0.15–0.17, 1.1, 2.4a–2.7; SmoothRepresentationsOfLocalGroupsPartII, gap isotypic-compact.

**Checks.**

- The genuine central element acts by (−1)(−1)=+1 on the descended period module. The fiber exponent is +1/2 and its contragredient comparison uses −1/2.

### 7.6 The one-dimensional generic period chain

For tempered π and τ with π⊗τ a quotient of Π, if π is generic then all spaces in the Whittaker–Shalika–Fourier–Jacobi chain of Lemma 12.1 have dimension one. Use Π_(V,ψV)=c-Ind_S ψS and Π_(V′,ψV′)=c-Ind_V ψV, the Shalika fiber at +1/2, the contragredient/intertwiner to the enhanced period at −1/2, and enhanced multiplicity one. Include the Q-support variant used for generic supercuspidal first occurrence. (GS, Lemma 12.1 and proof, pp. 38–39 (GS line 1411)).

A proof route is to write each injection and identification with its source and target, then use the nonzero end maps and the one-dimensional enhanced period bound. Match ψ and conjugate ψ on both sides.

*Needs:* §6.6; §7.5; §7.4; §2.5; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3; SmoothRepresentationsOfLocalGroupsPartII, gap quasisplit-whittaker.

**Checks.**

- The nonzero generic endpoints each have dimension 1; every intermediate space therefore has dimension 1. With endpoints 0 no uniqueness conclusion follows.

### 7.7 Uniqueness for generic tempered quotients

For tempered τ of H, ΘG₂(τ) has at most one tempered generic irreducible quotient. For tempered generic π of G₂, ΘH(π) has a unique irreducible quotient, which has the genericity specified by the explicit lift table. Multiplicity is one and the resulting assignment is injective on these nonzero lifts. (GS, Propositions 12.2–12.3, the remark after 12.2 and Theorem 12.4, p. 39 (GS lines 1448–1473)).

One proof route excludes two generic quotients by comparing their independent Whittaker lines with the one-dimensional period chain; treat supercuspidal quotients through the earlier precursor and noncuspidal quotients through finite-length Jacquet support.

*Needs:* §7.6; §6.4; §3.11; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4; §5.6.

**Checks.**

- Two generic irreducible quotients would supply Whittaker dimension at least 2, contradicting the period bound 1. A nongeneric quotient has Whittaker dimension 0 and needs the separate cubic argument.

### 7.8 Tempered Howe duality in E₇

For every tempered irreducible on either side of G₂×H, the big theta lift has finite length and zero or irreducible maximal semisimple quotient, with multiplicity one; two inputs cannot have the same nonzero small lift. The nonzero lifts are tempered. Combine generic period uniqueness and nongeneric cubic uniqueness, and include generic/noncuspidal and nongeneric/supercuspidal mixed possibilities. (GS, Theorem 12.4 and proof, p. 39; §§14.2–14.3, pp. 49–52 (GS line 1446)).

A proof route uses compact-center supercuspidal splitting and the two independent period bounds to bound the full big module. Distinguish generic and nongeneric quotients with the raw Whittaker fiber; apply reciprocity to obtain injectivity.

*Needs:* §7.7; §6.5; §4.8; §6.4; §3.11; §6.6; §2.5.

**Checks.**

- For a nonzero tempered small lift the cosocle length is 1 and its multiplicity is 1; for a zero lift these values are 0. Finite length alone would also allow a cosocle of length 2, which the period bounds exclude.

### Examples

The two genuine signs multiply to +1. The Shalika fiber uses +1/2, while the enhanced uniqueness bound is evaluated at −1/2<1/2. The two generic endpoint dimensions are 1, forcing every intermediate dimension to be 1. A trivial H input has Shalika coefficient dimension 0, since ψS is nontrivial.

### Dependencies

The statement carriers and construction inputs are MetaplecticAutomorphicForms §§0.15–0.17, 1.1, 2.4a–2.7; MetaplecticAutomorphicForms §§3.4–3.8, 3.34, 3.37–3.40; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3; SmoothRepresentationsOfLocalGroups §SR.5.1; SmoothRepresentationsOfLocalGroups §SR.2a.1; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4. The internal inputs are §0.3, §0.9, §0.10, §7.1, §7.3, §1.4, §2.4, §7.2, §6.6, §7.5, §7.4, §2.5, §7.6, §6.4, §3.11, §5.6, §7.7, §6.5, §4.8. The exact additional supplier gaps are those on the individual Needs lines.

## Layer 8: complete lift tables and discrete-series trichotomy

The small theta modules in every table have finite-length big lifts behind them. Tables denote isomorphism classes, not chosen bases of periods. A lift of an induced reducible module means the constituent-by-constituent assertion spelled out in the table.

### 8.1 Explicit nontempered lifts

If π=JQ(τ), then θH(π)=J₂(τ⊗τ); if π=JP(τ) in either allowed P family, θH(π)=J₁₃(τ⊗1). These big lifts have finite length. Conversely these are exactly the nontempered H representations with nonzero G₂ lift. Under the fixed GL₂ LLC and exceptional dual-group embedding, the two parameters match. (GS, Theorem 14.1, pp. 48–49; Theorem 15.1, p. 52 (GS line 1825)).

A proof route uses the positive-exponent comparison to identify the full module as a quotient of a finite-length induction, so its Langlands quotient is unique. Read its dual-Levi parameter through the fixed lattice coordinates.

*Needs:* §3.9; §3.10; §1.7; §1.11; §7.8; §0.6; §0.7; EndoscopicTransferAndUnitaryTraceComparison §§4.7a, 10.30–10.31; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4.

**Checks.**

- A Q input with positive exponent goes to J₂, and a P input goes to J₁₃; at exponent 0 these formulas are outside the nontempered assertion.

### 8.2 The E₆-to-E₇ tempered Siegel table

For tempered τ of PGL₃ and π=θM₃(τ±) nonzero, θH(π) is I₃(τ) if τ is nonselfdual or if its selfdual parameter contains 1. In the remaining selfdual cases, θH(θM₃(τ+))=I₃(τ)gen and θH(θM₃(τ−))=I₃(τ)deg. In the contains-1 case I₃(τ) is irreducible by §1.12; do not apply the discrete-series splitting rule outside its hypothesis. (GS, Theorem 15.2, pp. 52–53 (GS line 1989)).

A proof route uses the P₃ Jacquet top E₆ term to produce the quotient, compare genericity and finite length, then use the PGSp₆ reducibility table to distinguish the two signs.

*Needs:* §5.8; §3.6; §7.8; §1.12; §1.9.

**Checks.**

- For a selfdual parameter containing 1, the number of occurring E₆ signs is 1; the H Siegel module is irreducible. For a selfdual discrete-series parameter without 1, the Siegel summand count is 2.

### 8.3 Howe duality for all three exceptional pairs

For each of PD××G₂, H₃×G₂ and G₂×H, every irreducible input has a finite-length big theta lift and zero or irreducible small theta lift; the nonzero small assignment is injective. Irr♣, the G₂ domain of the H₃ correspondence, is contained in Irr♥. PD× nonzero lifts are discrete series, H₃ lifts preserve temperedness and discreteness, and H lifts preserve temperedness. PD× is fully hit when p≠3. (GS, Theorems 1.2–1.3, pp. 2–3; Theorem 7.2, p. 23; Theorem 8.5, p. 27; Theorem 15.1, p. 52 (GS line 43); LL, Theorem 2.1, p. 8 (LL line 328)).

A proof route is to combine the three independent proofs and nontempered classification; use the explicitly computed E₆-to-E₇ table to prove Irr♣⊂Irr♥ rather than regard three nonzero domains as disjoint.

*Needs:* §5.1; §5.2; §5.9; §7.8; §8.1; §6.7; §8.2.

**Checks.**

- The PD× domain and H domain have indicator sum 1. A split-E₆ input may also lie in the H domain, so the sum of all three nonzero-lift indicators can be 2.

### 8.4 The remaining tempered non-supercuspidal lifts

For every unitary discrete-series GL₂ representation τ, θH(IQ(τ))=I₂(τ⊗τ), interpreted constituentwise as matching generic/degenerate summands where these split. For τ unitary, selfdual and supercuspidal with ωτ=1, θH(δQ(τ))=δ₂(τ) and θH(δP(τ))=δ₁₃(τ). The S₃-dihedral, nontrivial quadratic and Steinberg entries are πgen[τ]↦σgen[τ], πgen[χ]↦σgen[χ], and StG₂↦StH. Together with the E₆ table and πdeg[1] on the division side this covers every tempered non-supercuspidal π. (GS, Theorem 15.3(i)–(v), p. 53 (GS lines 2036–2060)).

A proof route is to construct maps using the two G₂ Jacquet bottom pieces and follow their discrete-series submodules under the known reducibility filtrations; use genericity to select the correct member.

*Needs:* §1.1; §1.2; §1.3; §1.4; §1.5; §1.11; §1.12; §7.8; §8.2; §5.1.

**Checks.**

- The Steinberg input maps to St_H, with discrete-series indicator 1. A unitary selfdual supercuspidal GL₂ input with ωτ=1 gives two distinct constructions δQ↦δ₂ and δP↦δ₁₃.
- For τ=St_GL₂, unitarity, selfduality and ωτ=1 hold, but supercuspidality fails. The socle of I_Q(1/2,τ) is πgen[1]⊕πdeg[1], with two constituents rather than a single δQ(τ). The two δ formulas do not apply; the unshifted formula still does. The constituent πdeg[1] has division lift 1, while πgen[1] has its nonzero H lift from §8.2. (GS, Proposition 3.2(ii), p. 10 (GS lines 354–362)).

### 8.5 The nongeneric πρ family

For a supercuspidal ρ of PGL₂ let σρ be its classical theta lift on Mp₂ through the anisotropic ternary group using JL(ρ). Its mixed Mp₂×G₂ lift πρ is irreducible nongeneric supercuspidal and determines ρ. These πρ exhaust the supercuspidals outside the PD× and PGL₃ images which have a nonzero reverse Mp₂ mixed lift. No odd Weil representation is of the form σρ: the anisotropic ternary lift of ω⁻χ (χ≠1) is the one-dimensional χ∘Nrd, whose Jacquet–Langlands antecedent is the quadratic twist of Steinberg St⊗χ and not a supercuspidal ρ, and the lift of ω⁻ attached to the trivial character to the anisotropic ternary group is 0. (GS, §15.1 and Lemma 15.4, p. 54 (GS line 2065); GG, Theorem 9.1(d), p. 33 (GG line 1071)).

A proof route uses the imported division-ternary theta theorem and the mixed-module first-occurrence criterion, then recover σρ from the Fourier–Jacobi module and ρ from the classical inverse correspondence. Nonvanishing, irreducibility and injectivity of σ ↦ θ(σ) on genuine supercuspidals are MetaplecticAutomorphicForms §3.38a; this node adds the description of the family π_ρ and its exhaustion property (GS Lemma 15.4(iii)).

*Needs:* §6.1; MetaplecticAutomorphicForms §§3.4–3.8, 3.34, 3.37–3.40; §5.1; §5.9.

**Checks.**

- The inverse classical lift recovers one ρ from πρ, so two inequivalent ρ cannot give the same πρ. An odd Weil representation contributes 0 admitted inputs: its anisotropic ternary lift is 0 or one-dimensional, never JL(ρ) for supercuspidal ρ.

### 8.6 The πρ lift to the D₆ factor

Let τρ be the nongeneric supercuspidal Saito–Kurokawa representation of PGSp₄ attached by classical theta to σρ. Then Θ_D6(πρ)=τρ under the orthogonal-minimal comparison. Specify the same additive character and dual convention throughout. (GS, Lemma 15.4 (definition of τ_ρ) and Lemma 15.5 with proof, p. 54 (GS line 2065)).

Construct the particular classical Saito–Kurokawa input τρ on split SO₅≅PGSp₄ from σρ, with the same ψ and splitting as in the anisotropic ternary lift. Prove its nonvanishing, irreducibility, nongenericity and supercuspidality, and identify its parameter by the classical theta correspondence. Then identify the full D₆ big lift with τρ. This is the classical input of GS §15.1 preceding Lemma 15.5 (GS line 2083), with the exceptional comparison of that lemma.

A proof route uses the orthogonal-minimal see-saw comparison with full algebraic duals; the classical rank-one theta result identifies the only nonzero quotient and its multiplicity.

*Needs:* §8.5; §6.2; MetaplecticAutomorphicForms §§3.4–3.8, 3.34, 3.37–3.40.

**Checks.**

- The classical first occurrence of σρ in split SO₃ is zero and in SO₅ is nonzero; the D₆ comparison yields the full big module τρ, not only a cosocle label.

### 8.7 The remaining PGSp₆ supercuspidal-input table

For the πρ family, θH(πρ)=δ₁(τρ), the discrete-series submodule of I₁(1/2,τρ). For every other supercuspidal π of G₂ outside the division and split-E₆ images, θH(π) is supercuspidal. For generic such π the lift is generic supercuspidal. Include p=2,3 in the local theta theorem, while preserving any source-specific restrictions on the separate depth-zero examples. (GS, Proposition 15.6 and proof, pp. 54–55 (GS line 2065)).

A proof route is to analyze every proper H Jacquet module of the supercuspidal input using the raw filtrations; only the D₆ top term can survive, and the comparison identifies exactly the πρ family. Use nongeneric SK reducibility to select δ₁(τρ).

*Needs:* §8.5; §8.6; §1.13; §3.7; §6.4; §7.8; §5.6; §6.7.

**Checks.**

- For πρ, the H proper Jacquet support survives only in the D₆ top and the lift is δ₁(τρ), a discrete series. Outside the named family all three maximal H Jacquet modules are 0.

### 8.8 The discrete-series trichotomy

Every discrete-series representation of G₂ has a nonzero discrete-series theta lift to exactly one of PD×, H₃ and PGSp₆. The PD× and H₃ domains, and their complement inside the PGSp₆ domain, give the three subsets. Whenever θH(π) is discrete series, it is generic exactly when π is generic. A representation in the H₃ branch can also have a nonzero H lift, but that H lift is not discrete series. (GS, Theorem 1.3, p. 3; Corollary 15.7, p. 55 (GS line 81); LL, Proposition 2.3, p. 8; §5.2, p. 20 (LL line 328)).

A proof route is to read discreteness and genericity from every explicit table entry and the supercuspidal classification.

*Needs:* §8.3; §8.2; §8.4; §8.7; §6.6.

**Checks.**

- For an H₃-branch discrete series, the H lift is nonzero but its discrete-series indicator is 0; counting all nonzero lifts would produce two branches instead of one.

### 8.9 The supercuspidal spin-pole criterion

For generic supercuspidal σ of PGSp₆, the following are equivalent: a nonzero Shalika functional; a nonzero exceptional lift to G₂; a pole at s=0 of the Shahidi degree-eight spin L-factor. In this event its G₂ lift is irreducible generic supercuspidal. The generic G₂ first-occurrence assignment is §5.6, and its full cross-partner exclusivity is §8.8. (SW, Proposition 4.6, p. 37; Theorem 5.3, pp. 37–38 (SW line 1919)).

For this comparison construct the split F₄×G₂ pair in E₈ and its nonzero minimal module Π₈, extending the minimal-model construction of §2.4. Let P₈=M₈N₈ be the E₈ Heisenberg parabolic with derived Levi E₇, aligned so that P₈∩F₄=P₄ and N₈∩F₄=N₄; det₅₆ is the determinant character of M₈ on N₈/Z(N₈), of dimension 56. Prove that its F₄ generic twisted coinvariants vanish, and that an occurrence σ⊗π in Π₇ induces a nonzero map Π₈→I(σ,−1)⊗π, with the F₄ induction normalized as in the spin-factor contract. The image is proper because I(σ,−1) has a nonzero generic quotient whereas Π₈ has no F₄ generic quotient. (SW, Lemma 5.5 and Theorem 5.6 with proofs, pp. 39–43 (SW lines 2005–2007, 2246–2298)).

The construction has the following API.

- The split exceptional embeddings F₄×G₂→E₈ and the restriction of Π₈ use the same G₂ as Π₇.
- The unnormalized ambient N₈-Jacquet quotient of Π₈ containing Π₇ has character |det₅₆|^(3/28), restricting to |sim|³ on GSp₆; the corresponding induction parameter is −1.
- The F₄ generic twisted quotient of Π₈ is zero, so the displayed nonzero image in I(σ,−1)⊗π forces reducibility.

One proof route combines §5.6 with this E₈ calculation and the supplied F₄ reducibility criterion for the Shalika-to-pole direction. For the reverse direction use the Bump–Ginzburg–Vo functional equation and the supplied zero/pole divisor formula in terms of the Shahidi L-factor: a pole of L at 0 gives a zero of γ_BG at 0, and the residue of a section at 0 gives a nonzero Shalika functional. The latter residue argument is proved here, rather than assumed in the spin-factor contract. (SW, Proposition 5.8 and Theorem 5.10, pp. 45–47 (SW lines 2415–2426, 2473–2490)).

*Needs:* §5.6; §7.2; §8.3; §2.4; RepresentationTheory/LieHighestWeight Layer 8; ReductiveGroups Layer 9; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3; AutomorphicLFunctionsAndLocalFactors §AL.4; RepresentationTheory/SpinRepresentations Layer 4; AutomorphicLFunctionsAndLocalFactorsPartII, gaps ramified-spin-factor and bg-spin-integral.

**Checks.**

- For the image of a generic supercuspidal G₂ input outside the PGL₃ branch, the H lift has Shalika dimension 1 and a spin pole at 0. Without genericity this Shahidi construction is not an input to the assertion.
- On the central coroot α∨(ϖ), sim=ϖ² and det₅₆=ϖ⁵⁶. Thus |det₅₆|^(3/28)=q⁻⁶=|sim|³, while δP₄¹ᐟ²=q⁻⁸. The normalized exponent is 3−4=−1, not +1.
- The generic twisted quotient of Π₈ has dimension 0 whereas that of I(σ,−1) has dimension 1. A nonzero map onto the whole induced module would force 0≥1; its image is proper, so the reducibility input applies.
- With the local order convention positive for a zero, a simple pole of L at 0 has order −1, while γ_Sh and γ_BG have order +1 at 0 in this supercuspidal case. Their functional equation therefore requires a pole in a transformed-section integral; a constant-section integral is entire and cannot supply that pole. This distinguishes the residue route from an invalid substitution of s=0 into a singular section.

### 8.10 A generic depth-zero lift example

Construct the specific generic depth-zero supercuspidal G₂ representations used in LL §§8.4 and 10.3 whose H lifts are supercuspidal; relate their finite-reductive cuspidal type and first-occurrence calculation. Record the precise residue-field and regular-character conditions of the finite-group calculation before using this as a local globalization input. (LL, §8.4, pp. 24–25; §10.3, pp. 29–30 (LL line 988); GS04, §12, p. 807 (GS04 line 669)).

A concrete regular-character instance has residue field F₇: take an element a of order 43=7²−7+1 in the multiplicative group of 𝔽_(7⁶) and the Coxeter-torus parameter with diagonal (a,a⁻⁷,a⁶). The product is 1, and its seven standard eigenvalue exponents modulo 43 are 0,1,42,36,7,6,37, all distinct. Establish compact-induction cuspidality and the exceptional first-occurrence comparison for this type and for the regular-character family under the exact finite-field hypotheses. The finite-field comparison uses G99 Theorem 11.3, pp. 341–342 (G99 line 777), with p>5 and a regular Coxeter-torus character. The q=7 example satisfies both hypotheses. The local Howe and dichotomy theorems of §§6.7 and 8.3 cover all residue characteristics, including 2 and 3.

A proof route is to pass from a regular finite-group cuspidal type to compact induction, compute its exceptional first occurrence and use generic supercuspidal injectivity to identify the H lift.

*Needs:* §5.6; §8.7; ReductiveGroups Layer 9; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4.

**Checks.**

- The hyperspecial-fixed space of a positive-dimensional supercuspidal depth-zero type is 0; its parahoric-type space is nonzero. The term depth zero does not make this input a spherical representation.

### Examples

For a selfdual GL₃ parameter containing 1 only the plus E₆ extension lifts, and its H lift is an irreducible Siegel induction. For a selfdual discrete-series parameter without 1 the two H summands have genericity indicators 1 and 0. For πρ the lift is δ₁(τρ); outside that family in the specified complement every maximal H Jacquet module is zero. These use the same ±1/2 normalized rank-one parameters as Layer 1.

### Dependencies

The statement carriers and construction inputs are EndoscopicTransferAndUnitaryTraceComparison §§4.7a, 10.30–10.31; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4; MetaplecticAutomorphicForms §§3.4–3.8, 3.34, 3.37–3.40; AutomorphicLFunctionsAndLocalFactors §AL.4; ReductiveGroups Layer 9. The spin-pole comparison also uses ReductiveGroups Layer 9, RepresentationTheory/LieHighestWeight Layer 8, RepresentationTheory/SpinRepresentations Layer 4 for the spin representation, SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and the two Part II spin contracts above. The internal inputs are §3.9, §3.10, §1.7, §1.11, §7.8, §0.6, §0.7, §5.8, §3.6, §1.12, §1.9, §5.1, §5.2, §5.9, §8.1, §6.7, §8.2, §1.1, §1.2, §1.3, §1.4, §1.5, §6.1, §8.5, §6.2, §8.6, §1.13, §3.7, §6.4, §5.6, §8.3, §8.4, §8.7, §6.6, §7.2. The exact additional supplier gaps are those on the individual Needs lines.

## Layer 9: quaternion relative models

Here D always denotes a quaternion algebra, GD its pointwise stabilizer, and compact induction has support compact modulo GD. An embedding into a Hilbert relative space means the unitary completion of the stated smooth representation.

### 9.1 Quaternion pointwise stabilizers

For a characteristic-zero local field F and an octonion algebra O/F, define GD to be the pointwise stabilizer of a quaternion subalgebra D⊂O in Aut(O). Identify GD with SL₁(D) using Cayley–Dickson coordinates and prove conjugacy of embeddings of a fixed D. The setwise stabilizer is the larger SO₄ form and maps onto Aut(D), with kernel GD. (LL, §10.1, p. 27 (LL lines 1126–1128); for the compact real form, Lemma 10.4 and proof, p. 28 (LL lines 1162–1166)).

F is a characteristic-zero local field, including R; O is an octonion algebra over F and D⊂O a quaternion algebra.

The construction has the following API.

- GD≅SL₁(D), with its action on D⊥ given by the norm-one parameter in Cayley–Dickson coordinates.
- Conjugate embeddings give conjugate subgroups and equivalent relative regular representations.
- GD is the kernel of restriction from the setwise stabilizer to Aut(D).

A proof route uses O=D⊕D·u with its Cayley–Dickson multiplication to calculate automorphisms fixing D pointwise; apply the extension theorem for quaternion embeddings.

*Needs:* §0.1; RepresentationTheory/LieHighestWeight Layer 8; ReductiveGroups Layer 3; RepresentationTheory/LieGroups Layers 2 and 7.

**Checks.**

- For D=M₂(F), GD≅SL₂(F), which is noncompact for nonarchimedean F.
- For division D over a nonarchimedean F, GD is compact.
- For the real division octonions and D=Hamilton quaternions, GD is SU₂, not SO₄.
- In Cayley–Dickson coordinates a norm-one parameter 1 gives the identity and −1 fixes D while negating D⊥. This gives a nontrivial pointwise automorphism and excludes the trivial subgroup model.

### 9.2 Siegel character orbits and quaternion coefficients

For H=PGSp₆, the open orbits of its Siegel Levi M₃ on the character space of N₃ are indexed by quaternion F-algebras D. The stabilizer of a representative ψD is Aut(D). For Π_E7 restricted to Aut(O)×H, Π_(N₃,ψD)=c-Ind_GD^Aut(O)1 when D embeds in O and is zero otherwise. (LL, §10.1, p. 27 (LL line 1112); GrS, Chapter 5, §3, Lemma 3.4 and case (4) of its proof, pp. 197–198 (GrS line 5900)).

A proof route is to classify nondegenerate ternary symmetric forms up to the actual M₃ similitude action and identify their even Clifford quaternion algebra. In the rank-one Albert model identify the ψD fiber with embeddings of D in O; use the pointwise stabilizer, not Aut(D), on the G₂ side.

*Needs:* §9.1; §0.9; §2.4; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3.

**Checks.**

- The open ternary characters have rank 3; rank 0 is the trivial character and has no quaternion open-orbit label. On the H side the stabilizer has dimension 3 as Aut(D), whereas on the G₂ side GD also has dimension 3 but is its pointwise stabilizer.

### 9.3 Tempered lifts have quaternion relative models

If θH(π) is nonzero tempered, then for some quaternion D⊂O the representation π is a quotient of c-Ind_GD^G1. A tempered H representation has a nonzero full-rank Siegel coefficient: otherwise its restriction to Sp₆ has rank at most two and belongs to a classical O(m) theta image with m≤2, which is non-tempered. (LL, Lemma 10.1 and proof, p. 27 (LL line 1112); GrS, Chapter 5, §3, Lemma 3.4 and case (4) of its proof, pp. 197–198 (GrS line 5900)).

Establish the required low-rank theorem on the actual unitary Sp₆ restriction: if every rank-three Siegel character coefficient vanishes, analyze the pure-rank possibilities m∈{0,1,2} using the corresponding O(m) theta models; prove each such constituent is nontempered. Track the metaplectic central character: odd m gives the genuine covered action, so cannot be silently identified with an ordinary Sp₆ action. Rank zero is treated separately. This is the low-rank application of Li, Theorems 3.1 and 4.8, pp. 35 and 44–45 (Li line 223; Li line 506), together with the nontemperedness conclusion used in LL Lemma 10.1 (LL line 1136).

A proof route uses the full low-rank unitary theorem of this subsection including ranks zero and one, obtain a nonzero open-orbit coefficient, then take the corresponding coefficient of the theta quotient and apply the explicit minimal fiber.

*Needs:* §9.2; §8.3; MetaplecticAutomorphicForms §§3.4–3.8, 3.34, 3.37–3.40; MetaplecticAutomorphicForms §§3.6–3.8 for the classical theta carriers.

**Checks.**

- The excluded Siegel ranks are 0,1,2, all strictly below 3; a full-rank coefficient has rank 3. A proof testing only rank 2 leaves two other excluded possibilities.

### 9.4 Supercuspidal relative embeddings

If π is supercuspidal with θH(π)≠0, then π embeds in c-Ind_GD^G1 for a suitable quaternion D⊂O. Tempered compatibility supplies the relative quotient and supercuspidal projectivity for the compact-center group splits it. (LL, Corollary 10.2 and proof, p. 27 (LL line 1112)).

A proof route uses the quotient theorem and split in the relevant supercuspidal block; record the central-character category in which projectivity is used.

*Needs:* §9.3; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4; §8.3.

**Checks.**

- For a compact-center supercuspidal quotient the splitting gives a submodule with multiplicity at least 1. The same inference for arbitrary discrete series has no projectivity input.

### 9.5 The Steinberg relative discrete summand

For split p-adic G₂ and division quaternion D, St_G₂ is a Hilbert direct summand of L²(GD∖G₂). Its H lift is St_H, whose restriction to a maximal unipotent has the required regular model; hence its ψD Siegel coefficient is nonzero. Since GD is compact, a GD-fixed vector and square-integrable matrix coefficients give the closed relative embedding. (LL, Lemma 10.3 and proof, pp. 27–28 (LL line 1112)).

A proof route is to import the precise Steinberg-unipotent regular restriction, obtain a nonzero GD period from the minimal coefficient, and realize the relative embedding by matrix coefficients; use square integrability and unitarity to split it.

*Needs:* §9.2; §8.4; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4; SmoothRepresentationsOfLocalGroupsPartII, gap steinberg-unipotent.

**Checks.**

- For division D, GD is compact with finite Haar volume c>0; scaling its Haar measure to c=1 embeds the relative L² space into L²(G). For split D the volume is infinite and this Hilbert argument is unavailable.
- In the supplied regular model, for a closed N⊂U(F) and smooth χ, the functional f↦∫_N χ(n)f(n)dn transforms by χ under left translation. Choose f with restriction 1_K to a compact open K⊂ker χ in N; the value is vol(K)>0. For N={1}, Haar mass 1 and f(1)=1, it is 1. This tests every Siegel character, including the trivial one, rather than only the generic character of U.

### 9.6 Every compact real G₂ representation has an SU₂ period

For the compact real G₂ and a Hamilton quaternion subalgebra, every irreducible finite-dimensional representation has a nonzero GD≅SU₂-fixed vector and embeds in L²(GD∖G₂). (LL, Lemma 10.4 and proof, p. 28 (LL line 1150)).

The field is R and O is the division octonion algebra.

A proof route is to restrict to the compact long-root SU₃. For a highest weight λ₁≥λ₂≥λ₃, the U₂ interlacing weight (λ₂,λ₂) occurs; its restriction to SU₂ is trivial. Apply Peter–Weyl to the resulting fixed vector.

*Needs:* §9.1; RepresentationTheory/ClassicalGroups Layer 6; RepresentationTheory/LieGroups Layers 2 and 7; RepresentationTheory/CompactGroups Layers 3–5.

**Checks.**

- For SU₃ highest weight (a,b,c), the interlacing pair (b,b) obeys a≥b≥b≥c and has SU₂ weight b−b=0; the corresponding invariant space has dimension at least 1.

### Examples

For D=M₂(F), GD=SL₂(F) is noncompact. For quaternion division D it is compact; over ℝ it is SU₂. A compact SU₃ weight (a,b,c) contains interlacing (b,b), giving SU₂ weight 0. A ternary Siegel character of rank 0 is not in an open quaternion orbit; full rank is 3, and the excluded ranks are 0,1,2.

### Dependencies

The statement carriers and construction inputs are RepresentationTheory/LieHighestWeight Layer 8; ReductiveGroups Layer 3; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3; MetaplecticAutomorphicForms §§3.4–3.8, 3.34, 3.37–3.40; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.4; RepresentationTheory/ClassicalGroups Layer 6. The internal inputs are §0.1, §9.1, §0.9, §2.4, §9.2, §8.3, §9.3, §8.4. The exact additional supplier gaps are those on the individual Needs lines.

## Layer 10: global exceptional lifts

Fix a number field k and the indicated octonion form. In the definite strand k is totally real and O is division at every real place; in the generic strand O is split. These distinct hypotheses control rank, convergence and archimedean modules.

### 10.1 The global Albert E₇ pair

For a number field k and an octonion algebra O/k, construct the Albert algebra J₃(O) and its Koecher–Tits adjoint group E(O) of absolute type E₇, containing Aut(O)×PGSp₆. Specialize the imported split Albert and exceptional Lie-algebra constructions in the split case, and the imported positive real Albert model at definite real places. The descent to k and the group-level global/local comparisons are targets here. For totally real k and totally definite O, E(O) has k-rank 3 and G is compact at every real place; for split O the ambient E₇ has rank 7. (LL, §10.2, pp. 28–29 (LL line 1150); HKT, Appendix A.2, p. 24 (HKT line 991)).

k is a number field; O/k is an octonion algebra.

The construction has the following API.

- A specified unital, product-preserving k-linear octonion isomorphism O→O′ induces a unital Jordan isomorphism J₃(O)→J₃(O′), preserving trace, cubic norm and adjoint, and an isomorphism E(O)→E(O′) compatible with the specified Aut(O) and PGSp₆ embeddings. Identity and composition of the specified isomorphisms are preserved.
- For every field extension K/k, scalar extension identifies J₃(O)⊗_k K with J₃(O⊗_k K) and E(O)_K with E(O⊗_k K), carrying the two commuting embeddings to their K counterparts. For K=k_v this gives the local comparison at every place v, with the imported split Albert model at split places and the imported positive real model at definite real places.
- The algebraic homomorphisms Aut(O)→E(O) and PGSp₆→E(O) are injective and commute. The first acts entrywise on the octonion coordinates of J₃(O); the second has the specified symplectic action in the Koecher–Tits construction. In the split case they compare with the G₂×PGSp₆ pair of §2.2, and at definite real places the first factor is compact G₂.

One proof route for split O starts from the split Albert algebra carrier TauCeti.AlbertAlgebra (its Jordan identity is a LieHighestWeight Layer 8 target) and the split E₇ Lie algebra of that layer; for a totally definite O over a totally real k construct J₃(O), its Koecher–Tits group and the commuting action of Aut(O) × PGSp₆ here. Determine the commuting action on the off-diagonal entries, compare root lattices and localizations, and compute the k-rank from the definite octonion norm.

*Needs:* RepresentationTheory/LieHighestWeight Layer 8; ReductiveGroups Layer 9; §2.2; AutomorphicFormsOnReductiveGroups §§3.1–3.5; `TauCeti.AlbertAlgebra`.

**Checks.**

- The totally definite case has k-rank 3 and compact real G₂, whereas the split case has rank 7. The rank difference is 4 and cannot be suppressed by identifying the real octonions.
- Over a splitting field the Albert carrier has dimension 27, its structure algebra has dimension 78+1=79 and the Koecher–Tits Lie algebra has dimension 27+79+27=133, the dimension of E₇. The quaternionic Hermitian 3×3 model has dimension 15 and would give the Lie algebra of dimension 15+36+15=66 of type D₆, so it cannot be substituted. Restricted to Aut(O)×PGSp₆ the 133-dimensional Lie algebra is 14+21+7·14, with the seven-dimensional G₂ module tensored with the fourteen-dimensional kernel of contraction with the symplectic form on ∧²F⁶, on which the central −1 of Sp₆ acts trivially, so that it descends to PGSp₆; the dimensions 14+21=35 alone leave 98 unaccounted for.
- For the diagonal frame elements, E₁∘E₁=E₁ and E₁∘E₂=0, and the cubic norm of diag(1,2,3) is 6 with N(1)=1; replacing N by N² gives 36 and fails the cubic homogeneity N(λx)=λ³N(x) at λ=2 (64 instead of 8 at the unit).
- The Albert coordinate dimension is 3+3·8=27, whereas the quaternionic Hermitian carrier has dimension 3+3·4=15. At a split completion, the long-root octonion automorphism diag(2,1/2,1) fixes each diagonal scalar entry and sends an off-diagonal entry u₁+v₁ to 2u₁+v₁/2. Their Zorn norms are −1 and −2·(1/2)=−1, but the entries differ; norm preservation alone would not distinguish a trivial action on the octonion entries. The specified entrywise action does.

### 10.2 The global minimal residual representation

For the rank-three Jordan E₇ family with r=3,d=8 in Hanzer–Savin normalization, the normalized degenerate Eisenstein family, spherical at almost all places, has simple poles at s=1,5,9; the residue at s=5 gives the nonzero square-integrable minimal automorphic module, while s=9 gives the trivial constituent. Construct its adelic realization and identify its local constituents with the chosen minimal models, including ramified and real forms; use an occurring irreducible constituent to form a theta kernel. (HS, §6.2, Theorem 6.4 and proof, pp. 198–200 (HS line 642); HS, §4.1, Lemma 4.1, Corollary 4.2 and Proposition 4.3, pp. 190–191; remark after Corollary 4.6, p. 192; proof of Proposition 6.3, p. 197 (HS line 314); LL, §10.2, p. 29 (LL line 1189)).

k is a number field and the Jordan rank-three E₇ family is as in HS §6.2; use its normalized induction parameter.

A proof route uses the Jordan Gindikin–Karpelevich calculation for all constant terms and the cancellation analysis in Theorem 6.4 to prove nonzero simple residue at 5. Apply the residual square-integrability criterion and identify the local spherical subquotients; verify the non-spherical local realization required by the kernel.

*Needs:* §10.1; §2.4; AutomorphicSpectralTheory §§1.1–1.2; AutomorphicSpectralTheory §§2.4–2.6; AutomorphicFormsOnReductiveGroups §§3.1–3.5.

**Checks.**

- For r=3,d=8, the pole list 1+j·d/2 for j=0,1,2 is 1,5,9. The minimal parameter is 5 and the last parameter 9 is the trivial constituent.

### 10.3 The global exceptional theta lift

For a cusp form φ on G=Aut(O) and f in the global minimal automorphic representation, define Θ(f,φ)(h)=∫_[G] f(gh)overline(φ(g))dg. Prove absolute convergence, smoothness, automorphy, moderate growth and compatibility with the local theta quotient at every place. In the anisotropic case [G] is compact; for split G prove the estimates from cusp-form rapid decay and the minimal kernel’s growth. Define the global lift as the span of these functions, not as a presumed irreducible representation. (GrS, Chapter 5, introduction, (0.1)–(0.2), pp. 193–194; §§3–4, pp. 196–204 (GrS line 5411); HKT, Appendix A.8–A.10, pp. 27–30 (HKT line 1133)).

k is a number field; φ is a cuspidal automorphic form with the fixed unitary central conventions and f is a smooth automorphic minimal vector.

The construction has the following API.

- Right G and H translation gives the bilinear equivariant map from the minimal module and the contragredient cuspidal input.
- Every irreducible automorphic constituent of a nonzero global lift has local constituents in the corresponding local exceptional theta module.
- The full-rank Siegel and generic Whittaker coefficients unfold to the explicit local orbit integrals and global periods with compatible measures.

A proof route uses reduction theory to dominate the kernel by a fixed polynomial on Siegel sets, integrate against arbitrary rapid-decay order, and differentiate under a uniform integrable bound. Compare adelic translation with the local quotient universal property.

*Needs:* §10.1; §10.2; AutomorphicFormsOnReductiveGroups §§3.1–3.5; AutomorphicFormsOnReductiveGroups §§4.1–4.2 and its ALS.F.6 contract.

**Checks.**

- The lift vanishes for a zero input; it is linear in f and conjugate-linear in φ.
- For totally definite O the compact quotient supplies absolute convergence without a truncation term.
- If one local exceptional theta module of an irreducible cuspidal input is zero, no nonzero global theta constituent can occur.
- Replacing φ by iφ scales Θ by −i; replacing f by if scales it by i. This determines conjugate linearity in the cuspidal input and linearity in the kernel.

### 10.4 A quaternion period forces global nonvanishing

For totally real k and totally definite O, a cuspidal automorphic representation of G with nonzero GD period for some quaternion D⊂O has a nonzero exceptional global H lift. Prove the extension from the Q setting of Gross–Savin to this k setting by unfolding a full-rank Siegel coefficient of the kernel and choosing factorizable local test functions with nonzero orbit integrals. (GrS, Chapter 5, §4, Proposition 4.5 and proof, p. 200 (GrS line 6271); LL, Corollary 10.6 and proof, p. 29 (LL line 1189)).

k is totally real, O is totally definite, and an automorphic G representation has a nonzero GD period.

A proof route is to identify the rational orbit of quaternion embeddings and its stabilizer, unfold over GD(k)∖G(k), and use compactness/convergence to interchange the integral and orbit sum. Replace the rational-number arithmetic choices by their number-field versions explicitly.

*Needs:* §10.3; §9.2; §9.1; AutomorphicFormsOnReductiveGroups §§4.1–4.2 and its ALS.F.6 contract.

**Checks.**

- A zero GD period contributes zero to the unfolded coefficient; a nonzero period paired with nonzero orbit test factors contributes a nonzero product. The latter is an existence statement for test data, not for every kernel vector.

### 10.5 Cuspidality from Steinberg or regular compact weight

In the setting of the preceding period theorem, the nonzero global lift is cuspidal if its G input has a Steinberg component at one finite place or has regular highest weight at one real place. Prove both alternatives by calculating every proper H constant term; the real condition is regularity, not merely a nontrivial real representation. (LL, Corollary 10.6 and proof, p. 29 (LL line 1189); GrS, Chapter 5, §4, Corollary 4.9 and proof, pp. 203–204 (GrS line 6869)).

k is totally real, O totally definite, and the GD period on the input representation is nonzero.

A proof route computes the three maximal-parabolic constant terms using the global minimal representation and the associated lower lifts. In the finite-place case use Steinberg Jacquet exponents; in the real case use the compact highest-weight condition to kill all lower lift contributions.

*Needs:* §10.4; §10.3; §8.4; AutomorphicFormsOnReductiveGroups §§4.1–4.2 and its ALS.F.6 contract; §9.6.

**Checks.**

- There are three maximal H constant terms. Under either cuspidality alternative their three values are (0,0,0); vanishing of only two leaves the third parabolic untested.

### 10.6 Generic global nonvanishing

For split G₂ over a number field k, every globally ψ-generic cuspidal input has a nonzero globally generic exceptional lift to PGSp₆. If one finite component is supercuspidal and its local H lift is supercuspidal, the global lift is cuspidal. This is a theta theorem for an existing automorphic input; it does not reproduce the separate globalization or G₂ LLC construction. (HKT, Theorem A.9 and Lemma A.10, pp. 28–30 (HKT line 1176); LL, §10.3, proof of Lemma 10.8, p. 30 (LL line 1233)).

k is a number field; G₂ is split; the input is a globally generic cuspidal automorphic representation.

A proof route is to unfold the generic H coefficient to the nonzero G₂ Whittaker coefficient using the rank-one Albert orbit. Use the unramified spherical calculation outside a finite set and compactly supported local choices inside it to make the unfolded integral nonzero. At the designated finite place local supercuspidality kills the proper H constant terms and gives cuspidality.

*Needs:* §10.3; §6.6; §8.7; AutomorphicFormsOnReductiveGroups §§4.1–4.2 and its ALS.F.6 contract.

**Checks.**

- A nonzero global Whittaker functional supplies some input with nonzero unfolded H coefficient; the designated local supercuspidal H lift has all three proper maximal Jacquet modules 0. Genericity alone supplies no such three-zero cuspidality test.

### 10.7 Real infinitesimal-character matching

For the real exceptional G₂×PGSp₆ dual pair in E₇, construct the map on Harish–Chandra central characters induced by the minimal representation and prove that every occurring real theta pair has matched infinitesimal characters. Give its weight-coordinate formula with the chosen positive roots and ρ shifts. Combined with the imported unitary-dual theorem sufficiently far from the walls, this implies discrete-series real H components for the global input used in LL §8.4. (LL, §8.4, p. 25 (LL line 1024)).

Use HPS, infinitesimal-character correspondence, pp. 447–471, for the exceptional central-character comparison. The field is ℝ and the local minimal representation is the real E₇ model for the stated dual pair; the far-from-walls consequence uses split real G₂ and split PGSp₆ as in LL §8.4 (LL lines 1030–1040).

The comparison target is an algebra map from the H Harish–Chandra center to the G center whose two actions agree on the minimal module, hence equality of the corresponding central-character evaluations for every occurring pair. Its explicit weight formula must use the specified Cartans and ρ shifts. State the consequence as follows: there exists C, depending only on this real pair and its positive systems, such that an occurring unitary pair with G discrete-series infinitesimal character and every required positive-root coroot pairing greater than C has discrete-series H output. Neither an unspecified claim of regularity nor a bare scalar identity replaces this theorem.

A proof route computes the two centers in the annihilator quotient of the real minimal Harish–Chandra module; compare the Cartan polynomials and the ρ-shifted parameters. Apply the exact real unitary supplier contract only after checking its good-range bound.

*Needs:* §10.1; §2.4; §0.6; AutomorphicFormsOnReductiveGroups §§2.1–2.7, 5.4; AutomorphicFormsOnReductiveGroups, gap regular-real-unitarity.

**Checks.**

- For a real infinitesimal character λ+ρ, the unshifted highest weight is obtained by subtracting ρ. At λ=0 the two parameters are ρ and 0, which are unequal; this detects any missing Harish–Chandra shift. No numerical exceptional matching polynomial is assumed from this witness.

### Examples

For r=3,d=8 the pole list is 1,5,9; the minimal residual parameter is 5. The split ambient group has rank 7, while the totally definite form has k-rank 3. The theta integral scales by i in the kernel and −i in the cuspidal input. Both cuspidality alternatives kill all three maximal H constant terms.

### Dependencies

The statement carriers and construction inputs are RepresentationTheory/LieHighestWeight Layer 8; ReductiveGroups Layer 9; AutomorphicFormsOnReductiveGroups §§3.1–3.5; `TauCeti.AlbertAlgebra`; AutomorphicSpectralTheory §§1.1–1.2; AutomorphicSpectralTheory §§2.4–2.6; AutomorphicFormsOnReductiveGroups §§4.1–4.2 and its ALS.F.6 contract; AutomorphicFormsOnReductiveGroups §§2.1–2.7, 5.4. The internal inputs are §2.2, §10.1, §2.4, §10.2, §10.3, §9.2, §9.1, §10.4, §8.4, §9.6, §6.6, §8.7, §0.6. The exact additional supplier gaps are those on the individual Needs lines.

## Downstream consumers

LocalLanglandsCorrespondenceForG2 uses the three local correspondences, dichotomy, explicit discrete-series lift tables, the quaternion relative models and the global nonvanishing and cuspidality inputs. It proves the complete G₂ parameterization and enhancement statements. Globalization and automorphic applications consume the exceptional local/global comparisons and the explicit ramified and real constituents; they do not reconstruct the minimal kernel.

## Worked examples

For the null flag F u₁⊂F u₁+F v₂, the ordered products all vanish and the dimensions are 1 and 2. The isotropic idempotent (1,0,0,0) has norm 0, trace 1 and square itself; its line therefore fails the null definition. This same flag fixes the parabolics P and Q used throughout the inducing and period calculations (§§0.1–0.3; GS §§2.1–2.4; HKT Appendix A.1).

For St_G₂, the H lift is St_H. A division quaternion D has compact GD and supplies a nonzero relative period, producing a closed Hilbert copy of St_G₂ in L²(GD∖G₂). The corresponding totally definite global input has a nonzero quaternion period and, with a Steinberg finite component, a cuspidal global H lift (§§8.4, 9.5, 10.4–10.5; GS Theorem 15.3(v); LL Lemma 10.3 and Corollary 10.6).

For a selfdual GL₃ discrete series whose parameter has no trivial summand, the two E₆ signs give distinct G₂ outputs and then the generic and nongeneric summands of I₃(τ). Their H lifts are nonzero tempered inductions, not additional discrete-series branches. This gives the discrete-series trichotomy its precise meaning (§§5.8–5.9, 8.2, 8.8; GS Theorems 8.2, 15.2 and Corollary 15.7).

## References

Locators refer to the versions below. All target statements and proof sketches are expressed independently of the source wording. Line locators refer to the numbered source extractions; printed page and theorem locators accompany them. The GS numbering is arXiv v1, rather than the longer published article. GG page numbers refer to the author preprint.

- **GS.** Wee Teck Gan; Gordan Savin, [Howe duality and dichotomy for exceptional theta correspondences](https://arxiv.org/pdf/2102.00372v1). 2021. All locators use arXiv:2102.00372v1, 56 pages; the published version has different pagination. §§1–15, pp. 1–55; references p. 56; all local target statements and their proofs.
- **LL.** Wee Teck Gan; Gordan Savin, [The local Langlands conjecture for G₂](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2479D805B0F248C91A33671F3A03752E/S2050508623000276a.pdf/the-local-langlands-conjecture-for-dollarg2dollar.pdf). 2023.  §§1–2 pp. 1–8; §3.5, pp. 14–15; §§5–6 pp. 20–22; §8.4 p. 25; §10 pp. 27–30.
- **HKT.** Gordan Savin (appendix to Michael Harris; Chandrashekhar Khare; Jack Thorne), [A local Langlands parameterization for generic supercuspidal representations of p-adic G₂: Appendix A](https://arxiv.org/pdf/1909.05933v3). 2019. arXiv v3 Appendix A.1–A.10, pp. 22–30.
- **GrS.** Benedict Gross; Gordan Savin, [Motives with Galois group of type G₂: an exceptional theta correspondence](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/E242459F743917A019C0726055551FF5/S0010437X98000645a.pdf/div-class-title-motives-with-galois-group-of-type-g-2-an-exceptional-theta-correspondence-div.pdf). 1998.  Chapter 5, introduction (0.1)–(0.2), pp. 193–194; §3, Lemma 3.4, pp. 197–198; §4, Proposition 4.5, p. 200, and Corollary 4.9, pp. 203–204; Chapter 6, §2, Lemma 2.9, p. 213.
- **HS.** Marcela Hanzer; Gordan Savin, [Eisenstein series arising from Jordan algebras](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/AE032F11A3717F7175A486BBE537549F/S0008414X18000615a.pdf/eisenstein_series_arising_from_jordan_algebras.pdf). 2020. Published version, pp. 183–201; text extraction has damaged mathematical font encoding. §§1–2 pp. 183–186; §4.1 (Lemma 4.1, Corollary 4.2, Proposition 4.3) pp. 189–191; §4.2, the remark after Corollary 4.6, p. 192; Proposition 6.3 and proof p. 197; §6.2 Theorem 6.4 and proof pp. 198–200.
- **SW.** Gordan Savin; Martin Weissman, [Dichotomy for generic supercuspidal representations of G₂](https://arxiv.org/pdf/0908.3340v2). 2009. arXiv v2 Introduction pp. 1–3; §3 (the dichotomy map) pp. 16–27; Proposition 4.6 p. 37; Theorem 5.3 pp. 37–38; §5.1 Lemma 5.4 p. 38, Lemma 5.5 and Theorem 5.6 pp. 39–43; §§5.2–5.3 Propositions 5.7–5.9 and Theorem 5.10 pp. 43–47.
- **Sav.** Gordan Savin, [A class of supercuspidal representations of G₂(k)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/CE9F949BF8D96C551E8C40D7EA71DC42/S0008439500010699a.pdf/a-class-of-supercuspidal-representations-of-g2k.pdf). 1999.  §3 (Theorem 3.4), pp. 396–397; §§5–6, pp. 398–400.
- **MS.** Kay Magaard; Gordan Savin, [Exceptional Θ-correspondences I](https://arxiv.org/pdf/math/9505209v1). 1995. arXiv v1 Theorem 1.1 pp. 3–4; §4 Theorem 4.3 p. 10; §5 Theorem 5.3 pp. 14–15.
- **GS04.** Wee Teck Gan; Gordan Savin, [Endoscopic lifts from PGL₃ to G₂](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2CE451D8C1AC7635396F547CB323BE65/S0010437X03000678a.pdf/endoscopic_lifts_from_pgl3_to_g2.pdf). 2004.  §§1–11 pp. 793–806; §12 p. 807 (depth-zero example has p≥5).
- **GG.** Wee Teck Gan; Nadya Gurevich, [Non-tempered A-packets of G₂: liftings from SL₂](https://math.bgu.ac.il/~ngur/Publications/sl2g2.pdf). 2006. Author preprint, 81 PDF pages; its pagination is used throughout. §6 Propositions 6.5, 6.8, 6.11 pp. 22–23; §8 Propositions 8.1, 8.3, 8.4 pp. 27–28; §9 Theorem 9.1 and its proof, including §9.5, pp. 33–37; Lemma 9.4 pp. 34–36.
- **Pra.** Dipendra Prasad, [On the decomposition of a representation of GL(3) restricted to GL(2) over a p-adic field](https://www.math.iitb.ac.in/~dprasad/1077293429.pdf). 1993.  §1 pp. 167–169; §3 Theorem 3 and proof pp. 173–174.
- **Li.** Jian-Shu Li, [On the classification of irreducible low rank unitary representations of classical groups](https://www.numdam.org/item/CM_1989__71_1_29_0.pdf). 1989.  Theorems 3.1 and 4.8, pp. 35, 44–45.
- **G99.** Wee Teck Gan, [Exceptional Howe correspondences over finite fields](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/8C86551FF9BCB2E896A01E580562098D/S0010437X99000597a.pdf/div-class-title-exceptional-howe-correspondences-over-finite-fields-div.pdf). 1999.  Theorem 11.3, pp. 341–342.
- **LT.** Sampath Lonka, [Zero weight space for tori inside a division algebra](https://dspace.uohyd.ac.in/server/api/core/bitstreams/ca56e356-136d-4dae-b8c3-a98d2519bf63/content). 2018. University of Hyderabad thesis; Theorem 1.4.2 states the joint result with Rajat Tandon. Thesis numbering is used, rather than the journal article numbering. Theorem 1.4.2, printed pp. 6–7; §2, printed p. 9.
- **GS05.** Wee Teck Gan and Gordan Savin, *On minimal representations: definitions and properties*, 2005, §§3–5.
- **HPS.** Jing-Song Huang, Pavle Pandzic and Gordan Savin, *New dual pair correspondences*, 1996, infinitesimal-character correspondence, pp. 447–471.

- **Var.** Sandeep Varma, *On a result of Moeglin and Waldspurger in residual characteristic 2*, Math. Z. 277 (2014), pp. 1027–1048, main theorem (cited in GS’s proof of Lemma 3.4 (GS line 518)); [published citation](https://doi.org/10.1007/s00209-014-1292-8), uncertified.
