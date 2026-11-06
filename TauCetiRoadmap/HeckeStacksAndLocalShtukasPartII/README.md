# Roadmap: hecke stacks and local shtukas, part II — affine Deligne–Lusztig dimensions

**Summary.** Build the classical and perfect affine Deligne–Lusztig loci, their spherical dimension theorem,
and the flag-variety nonemptiness and dimension theorem in shrunken Weyl chambers. The inputs are
reductive-group and Iwahori–Weyl geometry, integral Newton invariants, and bounded flag and Grassmannian
moduli. The proof develops lattice charts for superbasic general linear groups, Levi and convolution
comparisons, generic Newton strata, and two geometric correspondences to a cordial translation family. It
treats arbitrary residue characteristic and retains the geometric transfers needed for ramified and
mixed-characteristic flag data.

## Scope and ownership

HeckeStacksAndLocalShtukas, HS0–HS4, ends with generic Hecke correspondences, local-shtuka diamonds and
towers, Hecke functors and representation-valued cohomology. This Part II develops the classical and perfect
relative-Frobenius loci and their geometric dimensions. These constructions do not require a comparison to
local-shtuka diamonds.

The following objects have other owners, and are not additional constructions here.

- Mathlib supplies subgroup double cosets, nonnormal left-coset quotients and finite sets; Tau Ceti supplies subgroup-factor invariance and the Coxeter parabolic factorization identified below.
- ReductiveGroupsPartII RG2.1, RG2.3 and RG2.4 supplies apartments, root groups, connected parahorics, Lang theory, Iwahori–Weyl groups, normal forms, lengths, Bruhat order and integral Kottwitz homomorphisms. The finite factor η and geometric cordiality are defined and proved in §§0.2 and 4.7 here, using that normal form and length formula.
- RootSystems Layers 1 and 2 own the sign and length theory of Coxeter systems and the marked Weyl presentation; the chamber, fundamental-domain, longest-element and integral root-datum declarations its supplier contract lists are native to Tau Ceti and are consumed directly. RootSystemsPartII §1.1 owns integral root dominance on the retained lattice. The affine combinatorics and dominant-subtraction extensions requested below are supplier contracts stated here, rather than assertions of §1.1. This roadmap owns the shrunken-chamber condition (§0.3), its ADLV factorization (§5.2) and the 2ρ∨ Newton range (§8.4).
- VStackSheavesAndLisseCategories §VS4.0, Newton geometry, owns the partial order on B(G) by equal integral Kottwitz invariant and Newton dominance. BunGAndNewtonStrata §§0.6, 0.8 and 1.7–1.45 owns the Kottwitz set B(G), families of G-isocrystals, σ-centralizers, split-rank defect, integral κ, Newton invariants, Levi comparison, straight classes, Galois averages, ordered norms and central lifts. The generic norm and centralizer comparison are used only to construct the geometric isomorphism in §3.6. Superbasic classification and the three Newton-poset/cell inputs below are supplier contracts in that direction. The comparison of Newton-cell and ADLV dimensions belongs to §4.3 here.
- GeometricSatakeAndFusion GS0, “Witt bounds, determinant lines and projective models”, owns flag and Grassmannian carriers, flag incidence and its two fibre bounds; GS1 owns semi-infinite geometry; GS2 §2.6, rational Witt convolution and semismallness, owns spherical geometric semismallness. The variants here are their bσ-graph pullbacks and top-stratum attainment, with explicit bounded-model compatibility.
- SchemeAndStackFoundations §§0.7, 0.9, 0.23–0.26 and Layer 1 owns general dimension, limits, perfection and descent. InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T3 owns the finite-type Grothendieck–Lefschetz theorem with finite and rational constructible coefficients. Its application to the perfect models in §3.1 is part of the local Lang comparison, not a second generic trace theorem.
- SmoothRepresentationsOfLocalGroups SR.1.5 owns the affine-Hecke algebra direction; its twisted cocenter extension is requested as the twisted affine cocenter contract. The geometric dimension-equals-degree comparison belongs to §1.3 here.

The comparisons of κ-labelled components of the ambient flag varieties and Grassmannians in §3.2, and the
P-alcove image comparisons of §7.5, are dimension and nonemptiness inputs owned here. The scope excludes the
classification of connected and irreducible components of these loci, rational strata and centralizer actions
on component sets, parahoric and very-special component reductions, Hodge–Newton component theorems and the
comparison of those classifications with integral specialization. The completion of a bounded Iwahori-cell model at a point of a Newton stratum, and its finite surjective
comparison with the product of the ADLV and a unipotent factor, is a dimension input owned by §4.3. The
exclusions concern integral local-shtuka deformation spaces and their formal-completion and local-model
comparisons: bounded integral parahoric shtuka models, crystalline deformation and quasi-isogeny diagrams,
generic/special-fibre specialization and comparison with local-shtuka diamonds. Fixed-point and elliptic
correspondences, local-shtuka Lefschetz–Verdier applications, finite-length preservation and the Kottwitz
character formula are outside this scope. None of these excluded items is a dimension-theorem input here. Connected components,
irreducible components and framing-group orbits remain distinct, as do integral models and their classical
or perfect special fibres.

## Conventions

Let F be a nonarchimedean local field with finite residue field 𝔽_q, q = p^f with p prime and f ≥ 1. Let L be
its completed maximal unramified extension, k the algebraic residue closure, ϖ a uniformizer of F, and σ
arithmetic q-Frobenius. Thus q = 1 is outside the hypotheses, while p = 2 and 3 are included. The group G is
connected reductive over F; I is a connected σ-stable Iwahori. Special-vertex choices and the based σ-action
are explicit. All moduli live in a fixed universe of test algebras, with quotient types and the ambient sheaf
category in its successor universe; no finiteness of all geometric points or components is imposed.

Use two geometric settings. The classical initial flag setting is F = 𝔽_q((t)), L = k((t)), with tame
splitting and the good-characteristic adjoint comparison of He14. The spherical setting uses a connected
reductive O_F-model and K = G(O_L); in mixed characteristic its test algebras are perfect k-algebras. Each
setting has its own proof. The targets for arbitrary local-field flags include the ramified and
mixed-characteristic comparison in the supplier contract and the bounded ADLV comparisons in §0.5. No theorem
is restricted to a set of good primes: a source's characteristic restriction determines the initial proof case
and the transfer that must subsequently be proved.

For the simple quasi-split flag statements the dominant chamber is opposite the base alcove, translations act
by −λ, and w = x t^λ y is the supplied normal form with t^λy minimal in W₀·t^λy (its coset in W₀\W̃, he21's ^S W̃). The associated
reduced affine root system fixes strip widths, including when the relative root system has multipliable roots.
Define η_σ(w) = σ⁻¹(y)x in §0.2. Write supp_σ for the σ-orbit union of finite simple support, λ^♦ for based
σ-average, ≥_ℤ for a nonnegative integral simple-coroot difference, and ≥ for rational Newton dominance.
Newton order is used inside one integral κ-component. The weight ρ satisfies 〈α∨,ρ〉 = 1; ρ∨ is a coweight.
Defect is rank_F G − rank_F J_b. Pairings ignore central directions of ρ. All halves and differences are
rational arithmetic, never subtraction in natural numbers.

Dimensions of ADLVs are finite rational values or −∞, with dim ∅ = −∞, max ∅ = −∞, −∞ + c = −∞ for finite c, and positive finite scaling of −∞ equal to −∞.
Differences of actual dimensions are formed only when both loci are nonempty. The normalizations on general
loop spaces in §3.1 are relative dimensions on compatible admissible truncations, not absolute dimensions of
an infinite-dimensional ind-space. The full coweight lattice P∨ used in Layer 5 is distinguished from the
original cocharacter lattice Y. A conclusion for the original group includes the component and integral-κ
comparison in §3.2.

**Checks.**

- In split adjoint A₁ the base alcove has α-values (−1,0). The element s t^(nα∨), n ≥ 1, sends it to (2n,2n+1), has length 2n+1 and η = s; for b = 1 the virtual dimension is (2n+1+1)/2 = n+1.
- In GL₂, ρ = (1/2,−1/2). For μ = (1,0) and basic slopes (1/2,1/2), split ranks 2 and 1 give defect 1 and the spherical value 1/2 − 1/2 = 0; absolute ranks would give defect 0 and the value 1/2. This basic witness cannot detect the Newton sign, since 〈ρ,ν〉 = 0.
- To pin the Newton sign, take GL₂, μ = ν = (1,0) and b = diag(ϖ,1): the defect is 0 and dim X_μ(b) = 〈ρ,μ−ν〉 = 0, whereas the reversed sign gives 〈ρ,μ+ν〉 = 1.
- On H²_c of the affine line the geometric Frobenius trace is q, and H¹_c is zero. Arithmetic Frobenius acts by q⁻¹ on that one-dimensional ℚ_ℓ-space. The trace convention in §3.1 is geometric; σ in every point condition is arithmetic. This witness is also required of the Grothendieck–Lefschetz supplier's Frobenius convention.
- With h = 2, the lattice having leading indices ℕ has residue basis {0,1} and determinant component 0; shifting every leading index by 1 gives basis {1,2}, sum 3 and component 1. Reversing the volume sign fails this witness.
- For an unramified degree-three extension, τ_i = σ^(−i)τ₀ gives (σb)_τ₀ = σ(b_τ₁), and ordered norm b₀σ(b₁)σ²(b₂). A positive embedding cycle changes the second factor. Degree two alone cannot detect that mistake.

## Exact supplier contracts

### From Mathlib

Use `DoubleCoset.doubleCoset` and `DoubleCoset.mem_doubleCoset` in `Mathlib/GroupTheory/DoubleCoset.lean`: the
carrier is a product of two arbitrary sets with a singleton, and its membership criterion supplies two
factors. It imposes no subgroup or normality hypotheses. For subgroups H,K, use
`DoubleCoset.doubleCoset_eq_of_mem` in the same file: b∈HaK implies HbK=HaK, so changing either subgroup factor preserves the double coset. Use `QuotientGroup.leftRel` and
`QuotientGroup.leftRel_apply` in `Mathlib/GroupTheory/Coset/Defs.lean`: for a subgroup, the relation is x⁻¹y ∈
I and the quotient represents left cosets. Normality is required only for a quotient group structure. Use
`Finset` in `Mathlib/Data/Finset/Defs.lean` as a finite duplicate-free carrier; semi-modules themselves are
subsets of ℤ. The combinatorial statements of Layer 2 use `Set.ncard` in `Mathlib/Data/Set/Card.lean`, which is 0
on an infinite set, so finiteness of a chart index set is asserted separately; `finsum` in
`Mathlib/Algebra/BigOperators/Finprod.lean`, which is 0 when the support is infinite, applied to the finite
residue basis; and `WithBot` in `Mathlib/Order/TypeTags.lean`, whose bottom element stands for −∞ and satisfies
⊥+1=⊥.

### From Tau Ceti

Use `DoubleCoset.mul_mem_doubleCoset_iff` in `TauCeti/GroupTheory/DoubleCoset/Basic.lean`, for H,K subgroups
and b ∈ H: bz ∈ HaK iff z ∈ HaK. The hypothesis is subgroup membership of b, with no normality assumption.
Both subgroup-factor invariances also follow from Mathlib’s `DoubleCoset.doubleCoset_eq_of_mem`.

Use `CoxeterSystem.parabolic`, `CoxeterSystem.IsMinimalCosetRep`,
`CoxeterSystem.existsUnique_isMinimalCosetRep_mul` and `CoxeterSystem.length_mul_of_isMinimalCosetRep` in
`TauCeti/GroupTheory/Coxeter/Parabolic.lean`. For a Coxeter system and any simple-index subset J, the parabolic is the subgroup generated by J; minimality means ℓu≤ℓ(uv) for every v∈W_J. Every w has a unique factorization w=uv with u minimal in uW_J and v∈W_J, and ℓw=ℓu+ℓv. No finiteness of W_J is required.

Use `TauCeti.inversions` in `TauCeti/LinearAlgebra/RootSystem/Inversions/Basic.lean`: for a base b of
`RootPairing` P, it is the set of positive root indices sent to negative roots by w∈P.weylGroup. Use
`TauCeti.isLeast_ncard_inversions` and `TauCeti.ncard_inversions_mul_le` in
`TauCeti/LinearAlgebra/RootSystem/Inversions/Length.lean`. For finite root indices and a reduced
crystallographic pairing over a characteristic-zero integral domain, these identify the inversion count
with the least simple-word length and give its subadditivity. They do not state the cancellation equality
requested in the parabolic root-length contract.

Use `TauCeti.dominantChamber` and `TauCeti.openDominantChamber` in `TauCeti/LinearAlgebra/RootSystem/Chamber.lean`,
the weak and strict simple-coroot sign cones of a base, and `TauCeti.existsUnique_mem_orbit_inter_dominantChamber`
in `TauCeti/LinearAlgebra/RootSystem/FundamentalDomain.lean`, the closed chamber as a fundamental domain for the
finite Weyl group, including points on walls. Use `TauCeti.longestElement` in
`TauCeti/LinearAlgebra/RootSystem/LongestElement.lean` for the longest element of a finite reduced crystallographic
pairing over a characteristic-zero domain, and `TauCeti.DynkinType.simplyConnectedRootDatum` in
`TauCeti/LinearAlgebra/RootSystem/SimplyConnectedRootDatum/Assembly.lean` for the integral root data of a valid
Dynkin type. These are the finite Weyl-group inputs of Layers 5 and 8; the affine Iwahori–Weyl chamber and
apartment are ReductiveGroupsPartII's.

### From TauCetiRoadmap.ReductiveGroupsPartII

Consume RG2.0.4 for L and σ; RG2.1 for apartments (apartment), the échelonnage reduced root system
(echelonnage-root-system), root groups (affine-roots-and-filtrations), fundamental groups
(algebraic-fundamental-group) and the Kottwitz homomorphism (kottwitz-homomorphism); RG2.3, parahoric-subgroup, associated-parahorics,
lang-theorem and lang-for-pro-algebraic-groups; RG2.4, affine-tits-system, iwahori-weyl-group,
length-and-bruhat-order, dominant-coinvariant-cocharacters, dominant-normal-form, translation-length-formula,
kottwitz-quotient, iwahori-bruhat-decomposition and simple-cell-multiplication. The normal form is unique and
its length is ℓx + ℓt^λ − ℓy. Transport the translation parameter by λ↦−λ and the positive-root choice by Φ⁺↦−Φ⁺ before applying the supplier’s chamber formulas. In this README a split cocharacter has representative t^λ=λ(ϖ), whereas RG2.4 labels that representative t^(−λ). Arithmetic κ and ν are evaluated on that same representative.

**Checks.**

- In split GL₂, this README’s t^(1,0)=diag(ϖ,1) is RG2.4’s t^(−1,0); κ=+1 and ν=(1,0). Its inverse is RG2.4’s t^(1,0), with κ=−1 and ν=(0,−1). Using the latter as the bound in §4.1 excludes the κ=+1 basic class.
- For diag(ϖ²,1) the two translation labels are (2,0) here and (−2,0) there, with κ=2 and ν=(2,0); inversion instead gives κ=−2.
- In SL₂, t^α∨ and s t^α∨ have lengths 2 and 3 in the transported chamber. Lengths alone cannot distinguish the two signs of κ in the GL₂ tests.

What ReductiveGroupsPartII must provide (the unipotent linearization contract): For a reductive O_F-model and an O_F-parabolic P=MN, a finite decreasing M-stable normal filtration N=N[1]⊃⋯⊃N[r+1]=1 by smooth subgroup schemes, compatible with unramified base change and σ, whose quotients N[i]/N[i+1] are M-equivariantly the additive groups of Lie N[i]/Lie N[i+1], in every residue characteristic.

The split construction uses heights in the simple roots outside M, with [N[i],N[j]]⊂N[i+j], then descends along an unramified splitting extension. Conjugation by m∈M(L) and σ induce Ad(m) and its σ-semilinear version on the quotients. This is the precise input to §3.1, with no whole-group logarithm assumed (ghkr06, proof of Proposition 5.3.2, equation (5.3.4), PDF p. 21).

### From TauCetiRoadmap.RepresentationTheory.RootSystems and TauCetiRoadmap.RootSystemsPartII

Consume RootSystems Layer 1, geometric roots and faithful representations, and Layer 2, the marked Weyl
presentation, for Coxeter sign and length theory. Chambers, fundamental domains, longest elements and integral
root data are the native Tau Ceti declarations listed under From Tau Ceti. Consume RootSystemsPartII §1.1, Integral root dominance, for the order determined by the pinned
positive root cone on the retained lattice and its flipped coroot version. For adjoint A₁ with positive coroot
2 in ℤ, 0 ≤_ℤ 2 and 0 ≰_ℤ 1. No saturation of that integral cone is allowed. The Red-Min input, He and Nie's reduction to minimal-length elements, says that each
extended-affine w reaches a minimal element of its σ-class by length-nonincreasing simple twisted
conjugations, and minimal elements of one class satisfy strong twisted conjugacy; a merely terminal word is
insufficient (hn14, Theorem 2.9 and Corollary 2.10, PDF pp. 10–11; Proposition 2.7, PDF p. 10).

What RootSystemsPartII must provide (the Demazure product contract): For an affine Coxeter system (W_a,S_aff) with length-zero automorphisms Ω and based σ preserving S_aff, the associative Bruhat-monotone product on W̃⋊〈σ〉 defined by the greatest product of Bruhat-lower factors, with unit and ℓ(u*v)=ℓu+ℓ(u⁻¹(u*v)).

For Coxeter factors x,y, supp(x*y)=supp x∪supp y. On the extension write u=xτ, v=yυ with τ,υ length zero: u*v=(x*τ(y))τυ, so support of its Coxeter factor is supp x∪τ(supp y). In particular untwisted support union applies to the finite W₀ products of §5.2 (gh10, Lemma 2.5.1, PDF p. 6).

What RootSystemsPartII must provide (the twisted Red-Min contract): For an extended affine Weyl group and σ permuting the affine simple reflections, every element reaches a minimum of its σ-conjugacy class by length-nonincreasing simple σ-conjugations, and any two minima in that class are connected by strong σ-conjugacy (hn14, Theorem 2.9 and Corollary 2.10, PDF pp. 10–11; he14, Theorem 2.1, p. 374).

What RootSystemsPartII must provide (the straight–finite-parabolic contract): For every such σ-class, reduction reaches a minimal ux with J⊂S_aff, W_J finite, u∈W_J, x σ-straight, x minimal on both sides modulo W_J and W_(σJ), and xσ(J)x⁻¹=J, preserving the class’s Newton and Kottwitz invariants (he14, Theorem 2.3, p. 376; hn14, Proposition 2.7, PDF p. 10).

What RootSystemsPartII must provide (the finite Coxeter basic-class contract): For a semisimple extended affine root datum whose irreducible components are permuted transitively by the based σ (the datum of an F-simple adjoint quasi-split group), τ∈Ω, a σ-Coxeter element w∈W₀ and μ∈P∨ with κ(t^μ)=κ(τ), reduction of t^μw reaches a minimal cτ with J a maximal proper Ad(τ)σ-stable affine-simple subset, W_J finite and c∈W_J an Ad(τ)σ-twisted Coxeter element, where (J,c) may depend on (μ,w); this includes the reduction from a transitive σ-orbit of d irreducible components to one component with σ^d (he14, Proposition 11.7, pp. 400–401, stated for simple G).

What RootSystemsPartII must provide (the parabolic root-length contract): For a reduced crystallographic RootPairing P with finite root index type over a characteristic-zero integral domain and a chosen base, on its pinned RootPairing.weylGroup with ℓ the inversion count viewed in ℤ, if wα is negative for every positive α with y⁻¹α negative, then ℓ(wy)=ℓw−ℓy (gh10, Lemma 2.6.1, PDF p. 10).

The unique minimal-coset factorization used in §5.2 is supplied by `CoxeterSystem.existsUnique_isMinimalCosetRep_mul` and `CoxeterSystem.length_mul_of_isMinimalCosetRep`; the root-sign comparison in the parabolic root-length contract is the separate input.

**Checks.**

- In A₂, w=w₀ and y=s₁s₂ give inversions of y⁻¹ equal to {α₁,α₁+α₂}, contained in those of w₀; ℓ(w₀s₁s₂)=1=3−2.
- For w=y=1, including rank zero, the inversion sets are empty and the equality is 0=0−0.
- In A₁, w=y=s gives 0=1−1. With w=1,y=s the sign hypothesis fails and the proposed equality would be 1=−1; integer subtraction exposes the failure.

What RootSystemsPartII must provide (the dominant subtraction contract): For dominant λ,μ in the full coweight lattice P∨, the least dominant ν with ν+μ≥_ℤλ, denoted λ−_domμ, agreeing with λ−μ when that is dominant, satisfying iterated subtraction, and bounded above by dom(λ−uμ′) for u∈W₀ and dominant μ≥_ℤμ′, with the image of the original lattice Y tracked separately (he21, Proposition 5.1 and Corollaries 5.3–5.4, pp. 8–9).

### From TauCetiRoadmap.VStackSheavesAndLisseCategories

Consume §VS4.0, Newton geometry, for the partial order on B(G) for every nonarchimedean local field: [b]≤[b′]
exactly when the integral Kottwitz invariants agree and the dominant Newton point of b is dominated by that
of b′. Every Newton comparison in this README is made inside one integral κ-fibre, and no order between
classes of different κ is used. For GL₂ with κ=1, the basic class of slopes (1/2,1/2) lies below the ordinary
class of slopes (1,0); the class of diag(ϖ²,ϖ⁻¹), of κ=1 and slopes (2,−1), is not below either since
(2,−1) dominates (1,0).

### From TauCetiRoadmap.BunGAndNewtonStrata

Consume §0.6, the Kottwitz set B(G), and §0.8, families of G-isocrystals; §1.7, Galois averaging and Hodge invariants, and §1.8, Newton and Kottwitz invariants;
§1.10, Straight Weyl comparison with B(G), and §1.11, Kottwitz classification by both invariants; §1.13, Algebraic σ-centralizer, §1.14, Change of σ-centralizer representative, and §1.15,
Defect of a σ-class; §1.27, Ordinary straight translation and Levi centrality; §1.30, Products and
unramified restriction of scalars; §1.45, Newton comparison for a Levi representative; and §1.43, Bounded lifting through a z-extension, at
its p-adic scope. Keep the basic class of a given κ, the Newton rational representative and the original
integral κ distinct. The norm comparison uses τ_i = σ^(−i)τ₀, preserves the ρ-pairing and preserves split-rank
defect without a degree multiplier: Res_(E/F) GL₂ and a basic slope-1/2 H-class both have defect 2−1 = 1.

What BunGAndNewtonStrata must provide (the superbasic classification contract): Superbasic classes as those meeting no
proper F-Levi, the criterion that J_b/Z(G) is F-anisotropic and the unramified F-simple adjoint classification as
restrictions of PGL_h, with a GL_h lift preserving the specified integral component.

What BunGAndNewtonStrata must provide (the Newton poset length contract): For [b]≤[b′] in one integral κ-fibre of B(G), every maximal chain between them has length (〈2ρ,ν_b′−ν_b〉+def(b)−def(b′))/2 (mv20, proof of Theorem 3.16, arXiv v3, PDF p. 9).

What BunGAndNewtonStrata must provide (the Newton-cell strong purity contract): For quasi-split G over 𝔽_q((t)), the Newton stratification on Noetherian bounded Iwahori-cell models and their completions has topological strong purity: for each [c], each maximal [c′]<[c] in its κ-fibre, and each irreducible component Z of the ≤[c] locus, Z∩(≤[c′]) is empty or pure of codimension at most one in Z (mv20, proof of Theorem 3.16, arXiv v3, PDF p. 9; ham17, Definition 2.1(3), arXiv v3, PDF p. 4, for this notion).

What BunGAndNewtonStrata must provide (the Newton-cell greatest class contract): For quasi-split G over 𝔽_q((t)) and an Iwahori double coset IẇI, the locally closed admissible Newton stratification on bounded cell models and their completions, compatible with congruence truncation, whose dense open stratum has a greatest B(G)-class that remains greatest on the Bruhat closure ⋃_(v≤w)IṽI (mv20, Definition 3.1 and §3.1, Definitions 3.3 and 3.7, Corollary 3.6, arXiv v3, PDF pp. 5–7; he21, proof of Theorem 4.2, p. 7; vie14, Proposition 5.5 and Corollary 5.6, pp. 1026–1028, for the reductive O_F-model case).

### From TauCetiRoadmap.GeometricSatakeAndFusion

Consume GS0, “Witt bounds, determinant lines and projective models”, §0.28, perfect models and étale realization,
§0.29, equal-characteristic Schubert models, §0.32, integral parahoric ind-properness, §0.38, relative-position flag correspondences and
§0.39, affine flag convolution fibre bounds. Consume GS1 §1.4, affine semi-infinite intersections, and GS2 §2.4, ambient Hecke convolution and
§2.6, rational Witt convolution and semismallness. The spherical fibre bound is ≤ 〈ρ,Σμ−λ〉 over the exact endpoint Gr_λ. The
flag ordinary-product lower bound is (ℓu+ℓv−ℓuv)/2 and the Demazure bound is ℓu+ℓv−ℓ(u*v). For u=v=s these
give 1 and 1; their fibres are A¹ and G_m respectively. All these comparisons must commute with bounded base
change before their ADLV application.

What GeometricSatakeAndFusion must provide (the Levi intersection dimension contract): For an unramified reductive O_F-model, a standard Levi M, dominant μ and μ_M∈S_M(μ), put Σ(μ)={λ∈X_*(T): dom_G(λ)≤_ℤμ} and let Σ(μ)^(M-max) be the set of maximal elements of Σ(μ)∩X_*(T)^(M-dom) for the integral M-coroot order ≤_M; then d(μ,μ_M) ≤ 〈ρ,μ+μ_M〉 − 〈2ρ_M,μ_M〉, with equality when μ_M∈Σ(μ)^(M-max), on compatible classical and perfect models (ham15, Definition 2.5(3), Lemmas 2.6 and 2.8, arXiv v2, PDF pp. 4–5).

The ramified and mixed-characteristic flag carriers, classical models and their perfections, incidence correspondences and fibre bounds are consumed from GS0 §0.32, integral parahoric ind-properness, §0.29, equal-characteristic Schubert models, §0.38, relative-position flag correspondences and §0.39, affine flag convolution fibre bounds, with their stated connected-parahoric and bounded-pfp hypotheses. The relative-Frobenius graph pullbacks and their compatibility are constructed in §§0.5 and 6.1 here.

### From TauCetiRoadmap.SchemeAndStackFoundations

Consume §0.7, fibre_dimension_formula and local dimension; §0.9, limits and approximation; §§0.23–0.26,
universal homeomorphisms, étale topological invariance, perfection and perfectly finitely presented models;
and Layer 1, algebraic spaces, torsors, descent and fibre products. Finite-type dimension inequalities are
applied to compatible bounded models, then passed to the supremum in §0.5. The generic-point lower-bound
argument for the particular ADLV chain diagrams belongs to §§0.5 and 6.3 here.

### From TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups

Consume §IG.0.T2, finite-coefficient Grothendieck–Lefschetz, and §IG.0.T3, the rational constructible trace
formula for all powers. Use separated finite-type finite-field models, bounded constructible complexes of finite Tor
dimension descended over the finite field, compact supports, and ℓ ≠ p; the ℚ_ℓ form is §IG.0.T3 through the normalized rational realization. Section
3.1 constructs and compares the particular separated pfp perfect-space models before applying this input.
Arithmetic and geometric Frobenius are inverse in the supplier's convention as in the affine-line witness
above. No restriction ℓ ≠ 2 is imposed when p ≠ 2.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

Consume SR.1.5, the generic Iwahori–Hecke algebra over ℤ[v,v⁻¹] with q=v² stated with bernstein-presentation (split datum), and iwahori-matsumoto for its specialization v↦q^(1/2). Its basis T_w=[IwI], written U_w here, satisfies (U_s−q)(U_s+1)=0. Here T_w=v^(−ℓw)U_w, so T_s²=(v−v⁻¹)T_s+1. The equal-parameter extended-affine σ-twisted cocenter for the general based datum is the extension below; SR.1.5 alone does not supply it. Degrees in §1.3 are degrees in z=v−v⁻¹ before specialization (he14, §§2.2–2.3, pp. 374–375).

What SmoothRepresentationsOfLocalGroups must provide (the twisted affine cocenter contract): For the equal-parameter extended-affine datum with based σ, the cocenter over ℤ[v,v⁻¹] in the normalized basis T_w=v^(−ℓw)U_w, q=v² and T_s²=(v−v⁻¹)T_s+1, its minimal-σ-class basis, class polynomials in ℕ[z] with z=v−v⁻¹ and degree in z, and their degree recursion.

The integral class-polynomial and cocenter locators are hn14, Theorems 5.3 and 6.7, PDF pp. 25–26 and 29, together with he14 §§2.2–2.5, pp. 374–376. The positive twisted-Coxeter comparison needed for the basic seed belongs to §7.4 here.

## How to read the build

Layer 0 fixes the carriers and dimension conventions. Layer 1 relates geometric reduction to integral
class-polynomial degrees. Layer 2 constructs the superbasic lattice strata and their dimensions. Layer 3
assembles spherical dimensions and the independent flag upper bound. Layer 4 develops generic Newton classes
and cordial saturation. Layers 5 and 6 build the double-flat factorization and its two correspondences. Layer
7 proves the proper-support obstruction and a basic seed without shrunkenness. Layer 8 combines necessity,
cordial reduction and the independent upper bound. Each target lists statement inputs and one proof route
separately through its Needs paragraph; the general local-field targets include their transfer constructions,
rather than assuming unexplained comparison axioms.

The headline results are the minimal-class and reduction theorems, dimension equals class-polynomial degree,
superbasic charts, Lang and Levi dimension comparisons, norm and iterated spherical dimension theorems,
spherical nonemptiness, the virtual upper bound, generic Newton dimension and cordial saturation,
translation-family cordiality, the two-correspondence reduction, Levi obstruction and the basic seed, and the
final shrunken criterion, the basic theorem without a strict Newton gap, and the large-translation specialization. Their actual moduli carriers
are substantial constructions that the pinned libraries do not yet provide, so none of these geometric headlines
is statable at the pins; `Suggested.lean` states the combinatorial core of §2.5, the bound on chart index sets of
extended semi-modules and its attainment, which needs only subsets of ℤ.

## Layer 0: affine Deligne–Lusztig loci and conventions

### 0.1 Affine Deligne–Lusztig points

H is an arbitrary group, σ∈Aut(H), I≤H and σ(I)=I. For a group H, an automorphism σ, a subgroup I with σ(I)=I
and b,w∈H, set r_b(g)=g⁻¹bσ(g) and X_I(w,b)={gI : r_b(g)∈IwI}⊂H/I. This is a set of left cosets, without a
normality assumption. For H=G(L) and w a chosen lift of an Iwahori–Weyl element this is X_w(b)(k). (he21,
§2.2, p. 5; he14, Definition 1.1, p. 372).

A proof route is as follows. Compute r_b(gi)=i⁻¹r_b(g)σ(i); subgroup double-coset invariance proves descent to
H/I. Replacing w by i₁wi₂ leaves the set unchanged; use the existing double-coset carrier.

No quotient group structure is assumed on H/I. Prove the representative criterion in both directions under σ(I)=I.

The construction has the following API.

- r_b(g)=g⁻¹bσ(g).
- A subset of H/I defined by a representative satisfying the double-coset condition.
- gI∈X_I(w,b) iff r_b(g)∈IwI.
- r_b(gi)=i⁻¹r_b(g)σ(i).
- Equal double cosets IwI give equal point loci.

**Checks.**

- For commutative H and σ=id, X_I(w,b) is all of H/I iff b∈IwI, and otherwise empty.
- For I={1}, σ=id and b=1, the locus is all of H exactly when w=1; for w≠1 it is empty.
- For I=H the unique left coset belongs to the locus for every b,w.
- In S₃ with I={1}, σ=id, b=(12), the class of g=(123) belongs to the locus labelled g⁻¹bg=(13), and not to the locus labelled b.
- For the trivial group both quotient and locus have one point. In S₃ with I=〈(12)〉, I is not normal; replacing g by g(12) changes r_b by left multiplication by (12) and right multiplication by σ((12)), so membership is invariant without a quotient-group law.

*Needs:* `DoubleCoset.doubleCoset`; `DoubleCoset.mem_doubleCoset`; `DoubleCoset.doubleCoset_eq_of_mem`; `QuotientGroup.leftRel_apply`;
`DoubleCoset.mul_mem_doubleCoset_iff`.

### 0.2 Virtual dimension

Use any connected reductive based normal-form datum with the apartment orientation of the Conventions. Define
the finite factor η_σ(w) = σ⁻¹(y)x using the supplied unique normal form w = x t^λ y, with t^λy minimal in
W₀·t^λy (its coset in W₀\W̃, he21's ^S W̃). Define the virtual dimension by d_w(b) = (ℓw + ℓη_σ(w) − def_G(b))/2 − 〈ν_b,ρ〉 in ℚ. Here ρ is
the weight with 〈α∨,ρ〉 = 1 for every simple coroot, and def_G(b) uses F-split ranks. This scalar expression
also applies to reductive product data with a compatible normal form, including the GL₂ Checks below. (he21,
§2.2, equation (2.1) and the subsequent unnumbered definitions, p. 5).

A proof route is as follows. Use the supplied normal form and split-rank defect, and the finite factor η
defined here. Define the scalar expression over ℚ and its coercion to extended dimension.

No rounding or natural-number subtraction occurs. The defect uses split ranks over F, not absolute ranks or
ranks over L.

The construction has the following API.

- The virtual dimension is the stated rational expression for the specified normal-form datum.
- It depends only on [b].
- d_w(b)−d_v(b)=(ℓw+ℓηw−ℓv−ℓηv)/2.
- For basic b the Newton pairing vanishes in the semisimple directions.
- For product data the expression is the sum of the factor expressions; this alone is not geometric transport.

**Checks.**

- For split adjoint A₁, b=1 and w=s, ℓw=ℓη=1 and d_w(1)=1.
- For split GL₂, λ=(1,0), w=t^λ and b=t^λ, the length 1 and pairing 1/2 give d=0.
- For GL₂ with slope-1/2 basic b, def=1. At w=s t^(1,0), lengths 2 and 1 give d=1.
- For type A₂ with σ swapping s₁,s₂ and x=s₁,y=s₂, η=σ⁻¹(s₂)s₁=1; replacing σ⁻¹(y) by y gives length 2 and changes d by 1.

*Needs:* ReductiveGroupsPartII RG2.4, dominant-normal-form; BunGAndNewtonStrata §1.15, defect of a σ-class of a σ-class;
BunGAndNewtonStrata §1.8, Newton and Kottwitz invariants.

### 0.3 Shrunken Weyl chambers

Use the simple quasi-split flag datum and apartment orientation of the Conventions. For the reduced root
system associated with the affine Weyl group and He’s apartment convention, remove the open critical strips
{v:−1<〈α,v〉<0} for all positive roots α. A shrunken chamber is a connected component of the subset. Say w is
shrunken when its base-alcove image lies in such a component. This geometric hypothesis is retained
independently of all lower bounds on λ_w^♦. (he21, §2.2, p. 5; Theorem 6.1 and Corollary 6.4, pp. 13–14; he15,
§2.9.4, PDF pp. 36–37).

A proof route is as follows. Use the existing affine apartment and root pairings; define the removed subset
and alcove containment. Translate root inequalities to the Iwahori–Weyl chamber convention only through an
explicit orientation comparison.

Neither a large dominant cocharacter nor full finite support is accepted as a replacement for shrunkenness.

The construction has the following API.

- For each positive root of the associated reduced affine root system, the removed strip is exactly the open set −1 < 〈α,v〉 < 0.
- The shrunken chambers are precisely the connected components after deleting the union of the critical strips.
- The shrunken condition holds exactly when the whole alcove w·a lies in one such component.
- The based σ-action preserves the condition.
- Transport requires the specified apartment and base-alcove orientation.

**Checks.**

- In A₁ a test alcove whose α-values lie in (−1,0) is rejected.
- Alcoves with α-values wholly in (0,1) or in (−2,−1) lie outside the A₁ critical strip.
- The boundary hyperplanes with α=0 or α=−1 are not removed; replacing the open strip by a closed one is a wrong definition.
- In split adjoint A₂ take ν=0 and λ=6ω₁∨=4α₁∨+2α₂∨. Then λ≥_ℤ2ρ∨, but 〈α₂,λ〉=0, so t^λ preserves the base alcove’s α₂-critical strip and is not shrunken.

*Needs:* ReductiveGroupsPartII RG2.1, apartment; ReductiveGroupsPartII RG2.1, echelonnage-root-system;
ReductiveGroupsPartII RG2.4, affine-tits-system; ReductiveGroupsPartII RG2.4, length-and-bruhat-order.

### 0.4 Exact and bounded spherical loci

Use the reductive O_F-model spherical datum, with perfect k-algebras in mixed characteristic. For the
hyperspecial affine Grassmannian Gr_G, evaluated over O_L with b fixed over L, and dominant μ, define
X_≤μ(b) and X_μ(b) in equal characteristic as the reductions of the scheme-theoretic pullbacks of the closed
relative-position bound ≤μ and the exact position μ along the bσ graph. On geometric field points their
modifications (E,β) satisfy Inv(β⁻¹bσ(β))≤_ℤμ and Inv(β⁻¹bσ(β))=μ, respectively. These field-point criteria
do not specify the functors on arbitrary nonreduced algebras. In mixed characteristic construct the perfect
spaces: on perfect k-algebras R the bounded functor consists of modifications satisfying
Inv_x(β⁻¹bσ(β))≤_ℤμ at every geometric point x of Spec R, and equality defines the exact functor. On k-points
these are the closed K-double-coset union and the exact Kt^μK condition, respectively. (he14, Definition 1.1,
p. 372, for the classical geometric point condition; zhu17, §3.1.1, (3.1.1)–(3.1.2), p. 455, and Lemma 1.22,
p. 428, for perfect test algebras).

For a connected σ-stable parahoric level P, use the supplied partial affine flag space Fl_P and define the parahoric relative-Frobenius locus at a double-coset position z by the bσ-graph pullback of its exact position stratum; its geometric points satisfy g⁻¹bσ(g)∈P ż P. A closed bound is the pullback of the corresponding finite Schubert union. Take reductions in the classical scheme setting and perfect pullbacks in the perfect setting. At a special maximal parahoric, the dominant coinvariant λ labels this exact position. This is the parahoric variant used by §4.1; at hyperspecial level it agrees with the spherical construction in the same setting. (he21, Theorem 4.4, p. 7; he14, §7.1, pp. 389–390.)

A proof route is as follows. Pull back the relative-position strata along the bσ graph in the supplied
Grassmannian. Use closedness of ≤μ and openness of equality inside it; the admissible union is not a single
double coset.

The symbol X_μ means the exact stratum; X_≤μ means the closed union. These two objects remain distinct in component comparisons.

The construction has the following API.

- The reduced scheme-theoretic graph pullbacks in equal characteristic, with the stated geometric field points; on perfect test algebras in the perfect setting, the pointwise relative-position functors.
- The open equality locus in the bound.
- k-points are ⋃_(λ≤_ℤμ) X_λ(b)(k).
- A canonical locally closed immersion X_μ(b)→Gr_G factoring through X_≤μ(b).
- μ≤_ℤμ′ gives the inclusion of bounded loci.
- At P=I the parahoric graph pullback has the flag point condition of §0.1 and the realization of §0.5.
- At a hyperspecial P=K the parahoric and spherical graph pullbacks agree for the same μ and b, after reduction in the classical setting and as perfect spaces in the perfect setting.
- For I⊂P, forgetting the I-level gives a morphism from the flag exact locus at w to the parahoric exact locus at the image of w in the parahoric double-coset set; the same forgetting map respects closed Schubert bounds.

**Checks.**

- For G=G_m, μ=0 and b=ϖ, both loci are empty since valuation is 1, although the numerical dimension expression is 0.
- For GL₂, b=1 and μ=(1,−1), the identity point lies in X_0(1)⊂X_≤μ(1) but not in X_μ(1).
- For a torus, the dominance interval has one element, so the exact and bounded loci coincide.
- In equal characteristic take R=k[ε]/(ε²), G=GL₂, b=1, μ=0 and g=1+εt⁻¹E₁₂. Arithmetic q-Frobenius gives σ(g)=1, so r_b(g)=1−εt⁻¹E₁₂∉GL₂(R[[t]]). Every geometric fibre has position 0, but g fails the scheme-theoretic zero-position graph condition and therefore its reduction. The coset is nontrivial since its t⁻¹ coefficient is ε≠0; faithful flat base change cannot kill ε. The identity g=1 satisfies both conditions. A pointwise-only definition would wrongly include g.
- For k of characteristic p, the k-algebra k[ε]/(ε²) is not perfect, because its nonzero ε has ε^p=0; it is outside the mixed-characteristic perfect functor’s domain.
- For the zero test algebra Spec(0)=∅, a sheaf has its required singleton value. A geometrically empty ADLV still has no geometric field points and has dimension −∞; “empty” does not mean an everywhere empty presheaf.
- For G_m the connected parahoric and Iwahori are both O_L×; the two point conditions coincide, and a valuation-1 b at the zero bound is empty in both.
- For GL₂, the finite reflection s maps to the zero position under I⊂K=GL₂(O_L). Over the standard σ-stable lattice, X_s(1) has fibre P¹ minus P¹(𝔽_q) of dimension 1, while X_1(1) has q+1 fixed flags; forgetting the flag is not an isomorphism on these fibres.

*Needs:* §0.1; GeometricSatakeAndFusion GS0, Witt bounds and projective models; ReductiveGroupsPartII RG2.4,
dominant-coinvariant-cocharacters.

### 0.5 Geometric realization and dimension of ADLVs

The initial classical proof uses the equal-characteristic tame adjoint setting of the Conventions; the general
flag theorem includes the specified transfer. For the second branch use a connected reductive O_F-model with
K=G(O_L), evaluating on perfect k-algebras in mixed characteristic; this replaces the equal-characteristic
branch. Construct X_w(b) as a reduced locally closed locus of the affine flag ind-scheme in the He14
equal-characteristic setting, locally of finite type and of finite dimension. For the unramified
mixed-characteristic spherical loci construct locally perfectly finite type spaces. Dimension is the supremum
on bounded finite-type models, valued in ℚ∪{−∞}, with dim ∅=−∞. Show independence of a finite-type
deperfection, invariance under universal homeomorphisms and the bounded fibre estimates actually used below. A
perfect space of positive dimension is not asserted finite type. (he14, Definition 1.1 and §1.3, pp. 371–372;
zhu17, §3.1.1, p. 455; Definition A.13 and Proposition A.15–Corollary A.16, pp. 471–472).

A proof route is as follows. Use the supplied flag/Grassmannian geometry; identify the geometric field
points of the reduced pullback with the point condition. Descend bounded perfect diagrams to compatible
finite-type models and use the topological invariance of Krull dimension. For a surjective morphism on bounded
models with every geometric fibre of dimension ≥n, prove dim(source)≥dim(target)+n at generic points; pass to
the supremum. Construct the
compatible bounded source diagram over each target generic point; global component finiteness is not a
hypothesis.

Bounded exhaustion and independence proofs precede the inequalities in §6.3. For ramified and mixed-characteristic flags, use the GS0 parahoric models and construct the bounded relative-Frobenius pullbacks below.

The construction has the following API.

- Geometric points agree with the point locus and the spherical torsor conditions.
- Closed bounded pieces exhaust the locally finite type locus.
- The empty locus has dimension −∞.
- For each bounded finite-type model, its perfection has the same dimension as that model.
- A universal homeomorphism preserves dimension.
- Surjectivity and a uniform geometric fibre lower bound give the stated dimension lower bound, with finite-type hypotheses explicit.

**Checks.**

- The perfection of A¹ has dimension 1 even though it is not finite type.
- For a split torus of rank r with b=1 and μ=0, the spherical locus is the discrete coweight lattice ℤ^r and has dimension 0. It is infinite when r>0 and a single point when r=0; no global finite-component axiom is allowed in positive rank.
- An empty torus mismatch has dimension −∞, not 0.
- A product Y×Aⁿ→Y on finite-type models has dimension dim Y+n, including after perfection.

*Needs:* §0.1; §0.4; GeometricSatakeAndFusion GS0, Witt bounds and projective models;
SchemeAndStackFoundations §§0.7, 0.9, 0.23–0.26; SchemeAndStackFoundations Layer 1; SchemeAndStackFoundations
§0.7, fibre_dimension_formula.

The general flag realization extends the reduced construction to σ-twisted ramified and mixed-characteristic
local-field data using GS0 §0.32, integral parahoric ind-properness and §0.29, equal-characteristic Schubert models. Identify the geometric relative-Frobenius pullback on each
bounded flag model, compare classical and perfect realizations wherever both are defined, and prove invariance
of nonemptiness and dimension under the stated comparison morphisms. The initial tame classical proof retains
p ∤ |π₁(G_der)|; the general target includes the replacement argument at the excluded characteristics. The
comparison morphisms have those bounded ADLV models as source and target, commute with endpoint and framing
maps, and identify the point condition of §0.1. (he21, §§1.5 and 2.2, pp. 3–5; he14, §1.1, p. 371; zhu17,
Appendix A, pp. 471–472.)

### 0.6 Change of framing, centralizers and Kottwitz obstruction

 For b′=h b σ(h)⁻¹, left multiplication gI↦hgI identifies X_w(b) with X_w(b′); for j∈J_b(F) it acts on X_w(b).
These maps extend to the geometric realizations and respect spherical bounds. Nonemptiness implies
κ_G(b)=κ_G(w) (or κ_G(b)=μ^natural in the spherical case). (he14, §1.3, p. 372 and proof of Theorem 4.8, pp.
382–383; he21, §6.2, p. 13).

A proof route is as follows. Compute (hg)⁻¹b′σ(hg)=g⁻¹bσ(g). Apply the integral Kottwitz homomorphism to
g⁻¹bσ(g) and take σ-coinvariants; I lies in its kernel.

Retain torsion in κ; equality only after tensoring with ℚ does not suffice. For the diagonal torus in GL₂ the
two permutations of diag(ϖ,1) illustrate why a G-class can meet several Levi classes.

**Checks.**

- For σ = id and b′ = hbh⁻¹, the identity (hg)⁻¹b′(hg) = g⁻¹bg fixes the direction of transport. In S₃, b=(12), h=(123) gives b′=(23); using h⁻¹ as the transport map fails.
- For the diagonal torus of GL₂, diag(ϖ,1) and diag(1,ϖ) have torus invariants (1,0) and (0,1), but the same group κ=1. Rationalizing κ cannot detect its torsion components in other groups.

*Needs:* §0.5; BunGAndNewtonStrata §1.13, algebraic σ-centralizer; BunGAndNewtonStrata §1.8, Newton and Kottwitz invariants; ReductiveGroupsPartII RG2.4, kottwitz-quotient.

### Examples

For S₃ with I={1}, σ=id, b=(12), g=(123), one obtains g⁻¹bg=(13). For a split torus, b=ϖ and μ=0 instead gives
the empty locus of dimension −∞. For GL₂ with b=1 and μ=(1,−1), the identity lattice belongs to the bounded
union through the exact zero stratum, but not to the exact μ-stratum.

### Dependencies

BunGAndNewtonStrata §1.8, Newton and Kottwitz invariants; BunGAndNewtonStrata §1.13, algebraic σ-centralizer;
BunGAndNewtonStrata §1.15, defect of a σ-class of a σ-class; GeometricSatakeAndFusion GS0, Witt bounds and projective models;
ReductiveGroupsPartII RG2.1, apartment; ReductiveGroupsPartII RG2.4, affine-tits-system; ReductiveGroupsPartII
RG2.4, dominant-coinvariant-cocharacters; ReductiveGroupsPartII RG2.4, dominant-normal-form;
ReductiveGroupsPartII RG2.4, kottwitz-quotient; ReductiveGroupsPartII RG2.4, length-and-bruhat-order;
SchemeAndStackFoundations Layer 1; SchemeAndStackFoundations §0.7, fibre_dimension_formula;
SchemeAndStackFoundations §§0.7, 0.9, 0.23–0.26; `DoubleCoset.doubleCoset`; `DoubleCoset.mem_doubleCoset`;
`DoubleCoset.mul_mem_doubleCoset_iff`; `DoubleCoset.doubleCoset_eq_of_mem`; `QuotientGroup.leftRel_apply`. The individual Needs paragraphs specify
the additional comparison constructions used by each route.

## Layer 1: reduction and class-polynomial dimensions

Use the extended-affine twisted Red-Min supplier theorem in the exact contract above before the terminal
geometry. It is a statement about arbitrary twisted affine classes, independent of a choice of b.

### 1.1 Minimal-length affine Deligne–Lusztig loci

The initial classical proof uses the equal-characteristic tame adjoint setting of the Conventions; the general
flag theorem includes the specified transfer. If w is minimal in its σ-conjugacy class in the extended affine
Weyl group, then X_w(b) is nonempty iff [b]=[ẇ], and in that case dim X_w(b)=ℓw−〈ν_b,2ρ〉. Representatives of
the same Weyl-group class are compared in B(G), not identified as group elements. (he21, Theorem 3.2, p. 6;
he14, Theorem 4.8, pp. 382–383).

A proof route is as follows. Use the straight–finite-parabolic decomposition, whose generic root-theoretic
input is the straight–finite-parabolic contract. The finite parabolic Lang
calculation supplies nonemptiness and the length contribution; transport the lift through B(G).

The theorem is geometric in the He14 setting; a mixed-characteristic generalization requires the bounded ADLV comparisons of §0.5.

**Checks.**

- For a dominant straight GL₂ translation t^(1,0), length 1 and 〈ν,2ρ〉=1 give dimension 0. At a class with κ=0 the locus is empty and has dimension −∞.
- For the finite A₁ reflection s and b=1, length 1 and Newton pairing 0 give dimension 1.

*Needs:* the twisted Red-Min contract; the straight–finite-parabolic contract; §0.5; BunGAndNewtonStrata §1.10, straight Weyl comparison with B(G); ReductiveGroupsPartII RG2.3, lang-for-pro-algebraic-groups.

### 1.2 Deligne–Lusztig reduction and dimension recurrence

The initial classical proof uses the equal-characteristic tame adjoint setting of the Conventions; the general
flag theorem includes the specified transfer. Length-preserving simple σ-conjugations induce universal
homeomorphisms between the corresponding reduced ADLVs. If ℓ(s w σ(s))=ℓw−2, decompose X_w(b) into a closed
piece universally homeomorphic to an A¹-fibration over X_(s w σ(s))(b) and an open piece universally
homeomorphic to a G_m-fibration over X_(s w)(b). Thus dim X_w(b)=1+max(dim X_(s w)(b),dim X_(s w σ(s))(b)),
with −∞ conventions. (gh10, Proposition 2.5.2 and Corollary 2.5.3, PDF pp. 6–10; he21, Proposition 3.3, p. 6).

A proof route is as follows. Apply simple-cell multiplication to the endpoint correspondence; keep the open
and closed cases separate. Descend the universal-homeomorphism diagrams to bounded models before applying
dimension. Prove the σ-twisted and general local-field versions through the bounded ADLV comparisons of §0.5.

Empty terms remain −∞. A length-preserving move changes neither nonemptiness nor dimension; it does not
automatically preserve η.

**Checks.**

- For w=s₀s₁s₀ in split affine A₁ and b=1, the two reduced endpoints are s₁s₀ and s₁. The first is a straight nonbasic translation and gives −∞; the second has dimension 1. The recurrence gives 1+max(−∞,1)=2.
- If both branches are empty, 1+max(−∞,−∞)=−∞. An empty branch must not be assigned dimension 0.

*Needs:* §0.5; the twisted Red-Min contract; ReductiveGroupsPartII RG2.4,
simple-cell-multiplication.

### 1.3 Class polynomials detect dimension and nonemptiness

The initial classical proof uses the equal-characteristic tame adjoint setting of the Conventions; the general
flag theorem includes the specified transfer. Use the normalized basis T_w=v^(−ℓw)U_w with q=v², so T_s²=(v−v⁻¹)T_s+1. Given its σ-twisted affine-Hecke cocenter basis T_O, write T_w=Σ_O f_(w,O)(z)T_O, where z=v−v⁻¹ and f_(w,O)∈ℕ[z]. Define degree in z, with deg 0=−∞. Then dim
X_w(b)=max_(O mapping to [b]) ((ℓw+ℓO+deg f_(w,O))/2−〈ν_b,2ρ〉). In particular X_w(b) is nonempty iff at least
one such polynomial is nonzero. The generic cocenter and its recursion are supplier obligations, not newly
owned objects here. (he14, §2.2–§2.5, pp. 374–376; Theorem 6.1 and Corollary 6.2, pp. 387–388).

A proof route is as follows. Use the genuine cocenter basis, integral positivity and degree recursion of the
twisted-cocenter supplier contract. Induct along Red-Min and compare the polynomial and geometric max
recurrences, with the same σ-conjugacy-to-B(G) map.

The index includes every Weyl-group class mapping to [b]; it is not a sum over B(G) alone. No polynomial
degree is assigned a finite value for zero. The formula holds in either characteristic: after constructing the geometric realizations, the normalized recursion and its minimal-class terms depend only on the based affine datum and the Newton and Kottwitz invariants (mv20, Remark 1.3, arXiv v3, PDF p. 3; he15, Theorem 2.23, PDF p. 34).

**Checks.**

- At a minimal w in its own twisted class O, f_(w,O)=1 has degree 0, so the formula is ℓw−〈ν,2ρ〉; all other coefficients vanish and contribute −∞.
- For split affine A₁, w=s₀s₁s₀ and b=1, the normalized cocenter relation is T_w≡zT_(s₁s₀)+T_s₁. The basic-class coefficient is 1 of degree 0, giving (3+1+0)/2=2; the straight nonbasic branch does not contribute. The unnormalized coefficient q=v² would give (3+1+2)/2=3 if v-degree were inserted, or 5/2 if q-degree were inserted. Neither is the required z-degree.

*Needs:* §1.1; §1.2; BunGAndNewtonStrata §1.10, straight Weyl comparison with B(G);
SmoothRepresentationsOfLocalGroups SR.1.5; the twisted affine cocenter contract.

### 1.4 Universal dimension advantage

Use the simple quasi-split flag datum and apartment orientation of the Conventions. Define w⇒_σv when for
every [b] with X_v(b) nonempty, X_w(b) is nonempty and dim X_w(b)−dim X_v(b)≥(ℓw+ℓηw−ℓv−ℓηv)/2. This
implication formulation avoids subtracting −∞. It is equivalent to comparing dim X−d in the extended order.
The relation is reflexive and transitive; length-preserving reduction equivalence together with ℓηw≤ℓηv
implies w⇒_σv. (he21, §3.3, p. 6).

A proof route is as follows. Define the relation using the implication and rational inequality. Cancel virtual
dimensions for the equivalent form; prove composition by addition when the right-hand locus is nonempty.

Never cancel two occurrences of −∞. Check the inequality direction on length-preserving moves.

The construction has the following API.

- The displayed condition for every [b].
- Comparison of dim−d with explicit empty-locus convention.
- A preorder, not an asserted antisymmetric order.
- Reduction equivalence plus the stated η inequality supplies advantage.

**Checks.**

- Every w has advantage over itself, including when all tested loci are empty.
- A class with X_v empty imposes no condition; it must not force X_w empty.
- If ℓw=ℓv and dimensions agree, ℓηw≤ℓηv is the direction that permits w⇒v.
- If w⇒v⇒u and X_u(b) is nonempty, add the two rational length differences to obtain w⇒u.
- In split affine A₁ with σ=id, take w=s₀s₁s₀ and v=s₁, so ℓη(w)=ℓη(v)=1. By §1.3, T_w≡zT_(s₁s₀)+T_s₁; X_v is nonempty only at the basic class, where the dimensions are 2 and 1, and the required difference is (3+1−1−1)/2=1. Hence w⇒v.
- In the same example v⇒w fails: at the translation class of s₁s₀, X_w has dimension (3+2+1)/2−2=1 while X_v is empty.
- For u=s₁s₀=t^(−α∨), ℓη(u)=0. At its own class the dimensions of X_w and X_u are 1 and 0 and the required difference is (3+1−2−0)/2=1, so w⇒u; but u⇒w fails at b=1, where X_u is empty and dim X_w=2.

*Needs:* §0.2; §1.2.

### Examples

In split affine A₁ the word s₀s₁s₀ reduces to the finite reflection s₁ and the straight translation s₁s₀. For
b=1 these branches have dimensions 1 and −∞, giving 2. The minimal-class polynomial contribution is
(3+1+0)/2=2.

### Dependencies

Layers 0; BunGAndNewtonStrata §1.10, straight Weyl comparison with B(G); ReductiveGroupsPartII RG2.3,
lang-for-pro-algebraic-groups; ReductiveGroupsPartII RG2.4, simple-cell-multiplication;
SmoothRepresentationsOfLocalGroups SR.1.5; the twisted affine cocenter contract. The individual Needs paragraphs specify the additional comparison
constructions used by each route.

## Layer 2: superbasic lattice charts

### 2.1 Normalized semi-modules and their types

Fix h ≥ 1 and m ≥ 1 with gcd(m,h)=1. A central shift makes the lattice application’s Hodge entries nonnegative and m positive. A semi-module is a nonempty subset A⊂ℤ, bounded below and stable under adding m and h.
Its residue basis B=A∖(h+A) has one element in every residue class modulo h. It is normalized when
ΣB=h(h−1)/2. For b₀=min B, enumerate b_i=b_(i−1)+m−μ′_i h through B, with b_h=b₀ and each μ′_i maximal subject
to membership in A. This defines the type μ′ with the specified starting convention. (vie06, Definition 3.1
and Lemma 3.3, PDF p. 3 (with Remark 3.2)).

A proof route is as follows. Prove existence and uniqueness of the residue basis, then the unique integral
translation normalizing its sum. Use coprimality for the cycle enumeration and recover A from B+hℕ.

Keep μ increasing as in Viehmann until the explicit conversion to the dominant descending convention.

The construction has the following API.

- The nonempty subset with boundedness and both stability conditions.
- The residue basis B=A∖(h+A), `residueBasis`, has exactly h elements, one in each residue class modulo h, when A is a semi-module.
- The unique translated normalized semi-module.
- The cyclic enumeration determines an integer tuple μ′ of sum m and recovers the same residue basis after h steps.
- A=B+hℕ with the specified normalization and cycle.

**Checks.**

- For h=1,m≥1 the normalized semi-module is ℕ.
- For h=2,m=1, A=ℕ has B={0,1}, normalized sum 1, and type (0,1).
- The even nonnegative integers fail stability under m=1 and are not a semi-module for (m,h)=(1,2).
- A=1+ℕ has basis sum 3 for h=2; its normalization is ℕ, not A itself.
- The empty subset is bounded below and stable under both additions, but is not a semi-module and has no h-element residue basis.

*Needs:* `Finset`.

### 2.2 Extended semi-modules

The hypotheses of §2.1 hold; μ is increasing, nonnegative, and Σμ=m. For a normalized semi-module A and a
nonnegative increasing h-tuple μ of sum m, an extended semi-module is φ:ℤ→ℕ∪{−∞} with φ(a)=−∞ iff a∉A;
φ(a+h)≥φ(a)+1; φ(a)≤max{n:a+m−nh∈A}, with equality whenever every integer ≥a belongs to A; and a decomposition
of A into h increasing infinite sequences along which φ increases by 1. A successor is a+h when φ(a+h)=φ(a)+1
and is >a+h otherwise. The multiset of initial values is μ. It is cyclic when the displayed upper bound is an
equality for every a∈A. (vie06, Definition 3.4 and Lemmas 3.6–3.8, PDF pp. 3–5). The structure `ExtendedSemiModule` records exactly these clauses for arbitrary m, h and h-tuple μ, with ⊥ in `WithBot ℕ` standing for −∞; the theorems of §2.5 carry the standing hypotheses.

A proof route is as follows. Package the finite-type data and the required decomposition, without choosing
arbitrary ordered labels on equal initial values. Prove only finitely many extended semi-modules occur at
fixed μ, using the cited boundedness arguments.

The maximum is over integers n≥0 only when a∈A; outside A the value is −∞.

The construction has the following API.

- `ExtendedSemiModule` bundles the nonempty normalized semi-module A, the function φ, its three inequalities and a decomposition of A into h sequences indexed injectively by Fin h × ℕ with image A; `semiModuleJump` is the upper bound max{n≥0 : a+m−nh∈A}.
- `ExtendedSemiModule.IsCyclic` holds if and only if equality holds in the upper bound at every a∈A; general extended semi-modules need not satisfy this equality.
- Finitely many extended types for a fixed μ.
- The leading-index and Frobenius-divisibility construction of §2.3.
- `ExtendedSemiModule.chartIndices` is V(A,φ)={(a,b)∈A²:b>a, φ(a)>φ(b)>φ(a−h)}.

**Checks.**

- For A=ℕ,h=2,m=1, φ(a)=⌊(a+1)/2⌋ on A and −∞ elsewhere gives type (0,1).
- The constant function 0 on A fails φ(a+h)≥φ(a)+1.
- Giving a finite value at −1 for A=ℕ violates the support condition.
- For the cyclic small example the set V is empty, so its chart dimension is 0.
- For (h,m)=(5,4), put B={−2,−1,2,5,6}, A=B+5ℕ and μ=(0,0,0,2,2). Set φ=−∞ off A, φ(−1)=0, and φ(a)=max{n≥0:a+4−5n∈A} on A∖{−1}. The basis sum is 10=5·4/2. The five sequences start at −2,2,5,4,−1, with initial φ-values 0,0,2,2,0; the first four advance by 5 and the last is −1,6,11,16,… . They satisfy the extended conditions, but at −1 the upper bound is 1 since 3,−2∈A and −7∉A. Thus this type is noncyclic and remains among the strata of §§2.3–2.5. (vie06, Example 3.5, PDF p. 4).

*Needs:* §2.1.

### 2.3 Superbasic GLₕ lattice stratification

Use the reductive O_F-model spherical datum, with perfect k-algebras in mixed characteristic. Here G=GL_h, b
is the displayed superbasic shift, and a central shift makes μ nonnegative. For b(e_i)=e_(i+m), e_(i+h)=ϖe_i
and gcd(m,h)=1 with m>0, for a lattice M in the exact nonnegative Hodge locus assign its set A(M) of leading indices. Set φ_M(a)=−∞ off A(M); on
A(M) set φ_M(a)=max{n≥0: some v∈M of leading index a has ϖ^(−n)bσ(v)∈M}. On the determinant-zero component
A(M) is normalized, and the exact Hodge locus of increasing type μ is the finite disjoint union of its locally
closed extended-semi-module strata S_(A,φ). The shift e_i↦e_(i+1), commuting with bσ, transports determinant
components. Finiteness is asserted on each fixed determinant component, not on the entire locus. (vie06, §2,
PDF p. 2; §4, PDF pp. 5–8; zhu17, End of the proof of Proposition 3.3, p. 460).

A proof route is as follows. Prove the lattice conditions give every clause of the extended semi-module
definition. Construct bounded locally closed strata using coefficient conditions, then prove finite exhaustion
and determinant transport. The mixed-characteristic chart morphisms require the perfect chart, Lang and
pullback comparisons of §§2.3–3.7, not merely a bijection of residue-field points.

A(M) uses a fixed leading-index convention. No assertion that every arbitrary pair (A,φ) has a stratum of the
expected dimension is made without the chart theorem.

The construction has the following API.

- The valuation support A(M).
- The function φ_M with the displayed maximum.
- The reduced/perfect locally closed locus with fixed (A,φ).
- The lattice assignment has that exact fibre.
- Finite disjoint stratification of the fixed determinant component.
- The centralizer shift identifies successive determinant components.

**Checks.**

- For h=2,m=1, the standard lattice has A=ℕ and φ(a)=⌊(a+1)/2⌋.
- Shifting leading indices by 1 changes ΣB by h and the determinant component by one.
- Replacing b by ϖb and μ by μ+(1,…,1) preserves A and adds 1 to φ on A.
- The shift with h=2,m=2 is not covered by the superbasic chart theorem.

*Needs:* §0.4; §2.2; BunGAndNewtonStrata §1.13, algebraic σ-centralizer.

### 2.4 Dimensions of superbasic lattice charts

Use the reductive O_F-model spherical datum, with perfect k-algebras in mixed characteristic. Use the
superbasic GL_h datum of §2.3. For every extended semi-module (A,φ) for μ, with S_(A,φ) defined by its lattice
conditions and not assumed nonempty, V(A,φ) is finite and there is a nonempty open U⊂A^V (perfected in mixed
characteristic) mapping to S_(A,φ), with the coefficient construction inducing a bijection on algebraically
closed points. In particular every S_(A,φ) is nonempty: every extended semi-module for μ occurs. Prove from this construction, finite-type models and the requisite
radicial/universal-homeomorphism argument that dim S_(A,φ)=|V|. For a cyclic extended semi-module U is all of
A^V. Consequently dim X_μ(b) on each determinant component is max |V|. (vie06, Theorem 4.3, PDF pp. 5–8;
zhu17, End of the proof of Proposition 3.3, p. 460).

A proof route is as follows. Read the triangular coefficient recursion as a morphism, not merely a
parametrization of points. Establish the geometric comparison in the perfect chart, Lang and pullback
comparisons of §§2.3–3.7 before concluding equality of dimensions in mixed characteristic.

Use the constructed morphism and its bounded finite-type models to prove the dimension assertion. Take the
maximum only after proving the finite stratification.

**Checks.**

- For h=2,m=1 and increasing μ=(0,1), V is empty: the chart A⁰ is a point and has dimension 0.
- For h=3,m=4 and μ=(0,0,4), the normalized cyclic basis is {−3,1,5} and V={(5,6),(5,7),(5,10)}, so U=A³ and the stratum is nonempty of dimension 3. A theory that declared this stratum empty would satisfy a statement quantified only over occurring types, but contradicts the chart theorem.
- The natural universal homeomorphism (A¹)^perf→A¹ preserves dimension 1; a bijection of unstructured sets alone imposes no dimension equation.

*Needs:* §2.3; §0.5.

### 2.5 The superbasic GLₕ dimension formula

Use the reductive O_F-model spherical datum, with perfect k-algebras in mixed characteristic. Use the
superbasic GL_h datum of §2.3 and the actual chart morphisms and finite-type-model comparison of §2.4. For the
superbasic shift of slope m/h and a dominant μ, the determinant-zero component X_μ(b)_0 is nonempty if and only
if Σμ_i=m, and then dim X_μ(b)_0=〈ρ,μ−ν_b〉−(h−1)/2; the centralizer shift of §2.3 gives the same on every
component of the matching determinant. Nonemptiness comes from §2.4 applied to the cyclic extended semi-module
of type μ; conversely a lattice of volume 0 in the exact Hodge locus has Σμ_i=v(det b)=m (vie06, §2, PDF p. 2).
In Viehmann’s increasing convention ρ=((1−h)/2,(3−h)/2,…,(h−1)/2) and 〈ρ,ν_b〉=0. A central shift removes the
nonnegativity restriction on μ. (vie06, Proposition 5.2 and Theorem 5.3, PDF pp. 8–9, with proof through p.
12; zhu17, End of the proof of Proposition 3.3, p. 460).

The combinatorial core is a theorem about subsets of ℤ alone. For coprime h,m≥1 and increasing μ∈ℕ^h with
Σμ_i=m, every extended semi-module for μ has finite V and 2|V|≤Σ_(i=0)^(h−1)(2i+1−h)μ_i−(h−1)
(`ExtendedSemiModule.chartIndices_bound`; vie06, Theorem 5.3, PDF pp. 9–12). The cyclic extended semi-module
attached to the normalized semi-module of type μ attains equality
(`ExtendedSemiModule.exists_isCyclic_chartIndices_eq`; vie06, Lemma 3.3, PDF p. 3, and Proposition 5.2,
PDF pp. 8–9). Equality is asserted for that cyclic module, not for every cyclic one.

A proof route is as follows. Prove the finite combinatorial bound by the inversion count and compare to the
cyclic case. Convert the increasing convention to the chosen descending dominance convention and use
def(b)=h−1.

For h=2,m=1, μ=(0,1) in increasing order gives dimension 0; μ=(−1,2) gives dimension 1. For h=3,m=4, μ=(0,0,4)
gives dimension 3. Central shift (m,μ)↦(m+h,μ+(1,…,1)) preserves the result.

**Checks.**

- For (h,m,μ)=(2,1,(0,1)) both sides of the bound are 0; for (3,4,(0,0,4)) the right side is (−2)·0+0·0+2·4−2=6=2|V|.
- The noncyclic extended semi-module of §2.2 for (h,m)=(5,4), μ=(0,0,0,2,2) has right side 2·2+4·2−4=8; its four chart indices give 8≤8.
- For (h,m)=(4,5), the normalized semi-module of type (0,2,0,3) has residue basis {−2,0,3,5}; its cyclic extended semi-module is one for μ=(0,0,2,3), with V={(3,4),(5,6),(5,8)}. Thus 2|V|=6<8, while the cyclic module of type (0,0,2,3), with basis {−4,1,3,6}, has V={(3,4),(3,5),(3,6),(3,9)} and attains 8. Equality for every cyclic extended semi-module would be false.
- For (h,m)=(2,2) coprimality fails and the bound is not asserted; for Σμ_i≠m the component X_μ(b)_0 is empty and no dimension value is assigned.

*Needs:* §2.4; BunGAndNewtonStrata §1.15, defect of a σ-class of a σ-class.

### Examples

For h=2,m=1, the standard lattice gives A=ℕ, B={0,1}, type (0,1) and φ(a)=floor((a+1)/2) on A; V is empty. The
μ=(−1,2) case has dimension 1. For h=3,m=4, the increasing tuple (0,0,4) gives pairing 4 and defect
contribution 1, hence dimension 3.

### Dependencies

Layers 0; BunGAndNewtonStrata §1.13, algebraic σ-centralizer; BunGAndNewtonStrata §1.15, defect of a σ-class of a σ-class; `Finset`;
Mathlib `Set.ncard`, `finsum` and `WithBot` for the combinatorial statements of §§2.1–2.5. The
individual Needs paragraphs specify the additional comparison constructions used by each route.

## Layer 3: spherical dimensions and the virtual upper bound

### 3.1 Unipotent loop geometry in the Levi reduction

Use the reductive O_F-model spherical datum, with perfect k-algebras in mixed characteristic. For the Newton
Levi M and its parabolic unipotent radical N, establish the equal- and mixed-characteristic loop-space
comparison needed for the twisted Lang-map fibre calculation. Use the finite M-stable filtration of the unipotent linearization contract for the reductive O_F-model and its parabolic; each quotient is the additive group of the corresponding Lie quotient in every residue characteristic. Its loop realization in mixed characteristic is constructed on admissible perfect models. Prove the required admissibility and dimension statements for
the resulting p-adic loop spaces, and the finite fixed-point calculation used in GHKR Lemma 5.4.3 by the
perfect-space trace argument. More precisely, for m∈M(L) with M-dominant Newton point ν_M, the map
f_m(n)=n⁻¹mσ(n)m⁻¹ on N(L) is surjective, inverse images of all admissible subsets are ind-admissible, and for every nonempty admissible Y, dim
f_m⁻¹(Y)−dim Y=Σ_(α∈R_N) min(〈α,ν_M〉,0)=〈ρ,ν_M−ν_G〉. Prove the same normalized formula on the perfect models
used in the Levi reduction; ν_G is the G-dominant representative. (zhu17, Proof of Theorem 3.1, §3.1.2, pp.
456–457; ghkr06, Proposition 5.3.1, PDF pp. 19–21; Lemma 5.4.3, PDF pp. 27–28).

A proof route is as follows. Separate the supplied equivariant vector-group quotients from the new loop-space
construction. Check that coefficient truncations define admissible perfect morphisms and that the dimension
correction is the root-slope sum. Construct compatible perfect and finite-type models, then apply the
Grothendieck–Lefschetz formula of InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T3 at ℓ ≠ p with bounded constructible compactly supported coefficients.

The Lang comparison requires geometric loop models, admissibility and dimensions in addition to the filtration; it does not follow from a point-set bijection with a Lie algebra. For the cohomological
application take ℓ ≠ p and the constant ℚ_ℓ-complex on the separated finite-type model over a common finite residue extension; geometric
Frobenius on H²_c(A¹) has trace q and on H¹_c(A¹) trace 0. Transfer this trace through the étale comparison of
perfection before the fixed-point argument (zhu17, Appendix A.3.4, pp. 480–481).

**Checks.**

- For G=GL₂ and upper-triangular N, ν_M=(a,b) has one N-root slope a−b. Values a−b=2 and −2 give corrections min(2,0)=0 and min(−2,0)=−2; their dominant-reordering pairings 〈ρ,ν_M−ν_G〉 are 0 and −2.
- For N=1 the sum is empty, the Lang map is the identity of a point, and the correction is 0. Over 𝔽₂ the additive Lang polynomial u²−u has two roots and derivative −1=1; residue characteristic 2 does not remove this case.
- For the upper unipotent subgroup of GL₃, N[2]=U₁₃ and N[3]=1 give quotients G_a² and G_a in every characteristic. The commutator of 1+E₁₂ and 1+E₂₃ is 1+E₁₃, also in characteristic 2, whereas a whole-group additive identification would have trivial commutator.

*Needs:* ReductiveGroupsPartII RG2.3, parahoric-subgroup; SchemeAndStackFoundations §§0.7, 0.9, 0.23–0.26;
InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T3 and their coefficient and compact-support suppliers; GeometricSatakeAndFusion GS0, Witt
bounds and projective models; ReductiveGroupsPartII RG2.3; the unipotent linearization contract.

### 3.2 Componentwise adjoint reduction

Use either the equal-characteristic flag branch or the unramified spherical branch, with their separate
proofs. Write κ̃ for the representative integral Kottwitz invariant with values in π₁(G)_I, which labels the
connected components of the flag variety (respectively of the Grassmannian), and α_ad for the image of a label
α in π₁(G_ad)_I. For every label α with κ̃(w)=κ̃(b)+(σ−1)α, and without assuming either side nonempty,
construct the comparison from X^G_w(b)∩Flag^α to X^(G_ad)_(w_ad)(b_ad)∩Flag_ad^(α_ad), and prove that it is an
isomorphism of reduced loci when char k ∤ |π₁(G_ad)| and a universal homeomorphism of reduced, respectively
perfect, loci in every residue characteristic; for any other label α the left side is empty. Such a label
exists if and only if κ_G(w)=κ_G(b). Deduce that X^G_w(b) is nonempty if and only if κ_G(w)=κ_G(b) and
X^(G_ad)_(w_ad)(b_ad) is nonempty, and that the two dimensions then agree. The same statements hold for exact
and bounded spherical loci. This nonemptiness transfer precedes every use of an auxiliary adjoint datum in
§§6.4, 7.4, 7.6 and 8.1. No global immersion of flag varieties is asserted. (ghn15, Corollary 2.2.2, PDF p. 7,
with ghnerr, Proposition 0.0.1, p. 1, for the componentwise statement; ham15, arXiv v2, reduction after
Proposition 2.10, PDF pp. 6–7, proves the component isomorphism for nonempty components only, enough for
dimension but not for nonemptiness; zhu17, §3.1.2, pp. 456–457).

A proof route is as follows. Identify each component with the neutral one by homogeneity and the neutral
components of G and G_ad with the flag variety of the simply connected cover; prove the induced component maps
are the stated isomorphisms or universal homeomorphisms. On Flag^α the element g⁻¹bσ(g) has invariant κ̃(w)
and adjoint image in the adjoint double coset of w_ad, hence lies in the double coset of w; this identifies the
point conditions. For the nonemptiness transfer, let the adjoint locus meet a component β. Then β−α_ad is
σ-invariant; an element h∈G_ad(L) of invariant β−α_ad moves the point into the component α_ad of the adjoint
locus for b′_ad=h⁻¹b_adσ(h), whose integral invariant and Newton point are those of b_ad. Lift b′_ad to b′∈G(L)
with κ̃(b′)=κ̃(b); then b′ and b have the same κ_G and Newton point, so they are σ-conjugate
(BunGAndNewtonStrata §1.11), and the component comparison gives a point of X^G_w(b′)≅X^G_w(b). The lifting
step at characteristics dividing |π₁(G_ad)| is part of the replacement argument of §0.5. Check compatibility of
bσ and bounds before base change to ADLVs. Preserve the original G-class when auxiliary coweights lie only in
P∨.

Do not infer a global flag immersion from componentwise isomorphisms. Do not regard an auxiliary γ∈P∨ as an
original cocharacter without a lift. The BunGAndNewtonStrata §1.43 z-extension bounded-lifting supplier has
p-adic scope; it supplies no equal-characteristic comparison by itself. Use Hamacher’s separate component
argument in that branch.

**Checks.**

- For GL₂→PGL₂ the component map is ℤ→ℤ/2, so 0 and 2 have the same image; componentwise isomorphisms cannot make the whole flag map injective.
- For a group of adjoint type the component comparison is the identity, with no choice of a lift.
- For split SL₂, b=1 and w=s t^(α∨), κ̃(b)=κ̃(w)=0 and the single flag component maps to the neutral adjoint component, where the adjoint locus has dimension 2. Its other adjoint component is the translate by a σ-fixed length-zero element, so nonemptiness of the adjoint locus anywhere gives a point of the SL₂ locus, as the transfer asserts.
- For G_m, b=ϖ and w=1, the adjoint group is trivial and its locus is a point, but κ̃(w)=0 and κ̃(b)=1 and (σ−1)α=0 for every α, so no label solves the equation: the original locus is empty, and the transfer correctly requires κ_G(w)=κ_G(b).

*Needs:* §0.6; §0.5; ReductiveGroupsPartII RG2.3, associated-parahorics; ReductiveGroupsPartII RG2.1,
kottwitz-homomorphism; BunGAndNewtonStrata §1.43, bounded lifting through a z-extension; BunGAndNewtonStrata §1.11, Kottwitz classification by both invariants; GeometricSatakeAndFusion GS0 §0.32, integral parahoric ind-properness.

### 3.3 Reduction of superbasic adjoint factors

Use the reductive O_F-model spherical datum, with perfect k-algebras in mixed characteristic. Apply the
superbasic classification supplied by BunGAndNewtonStrata to an F-simple adjoint unramified factor: it is
Res_(E/F) PGL_h for E/F finite unramified. Using the specified integral component, construct the geometric
comparison to a Res_(E/F) GL_h lift with a superbasic representative. Track the central cocharacter and
determinant. Combined with products and Levi retraction, this is the geometric reduction to the lattice charts
of Layer 2 and the norm isomorphism of §3.6; the abstract classification itself is not a second target here.
(ckv15, Lemma 3.1.1, PDF pp. 20–21; zhu17, §3.1.2, pp. 456–457).

A proof route is as follows. Use the superbasic definition, classification and lift of the BunGAndNewtonStrata
supplier contract. Use the integral component comparison to lift and then apply the ordered norm construction.

The superbasic-classification supplier extension includes the anisotropic-classification input to CKV Lemma
3.1.1, with h ≥ 2 for an adjoint simple factor.

**Checks.**

- For GL₂ with shift m=1, the slope 1/2 is simple and defect is 1; the projection to PGL₂ retains the component 1 mod 2. The shift m=2 is not superbasic.
- For h=1 the GL₁ chart has defect 0; an F-simple adjoint factor is required to have positive semisimple rank, so PGL₁ is not a new simple factor.
- For GL₂ with ordinary slopes (1,0), J_b=G_m² has J_b/Z(G)=G_m of split rank 1; it fails the anisotropy criterion. The basic slope-1/2 division-algebra group has quotient split rank 0. Using the center of J_b instead of Z(G) would wrongly accept the ordinary class.

*Needs:* §3.2; BunGAndNewtonStrata §1.45, Newton comparison for a Levi representative; the superbasic classification contract.

### 3.4 Spherical Levi fibres and dimension reduction

Use the reductive O_F-model spherical datum, with perfect k-algebras in mixed characteristic. The
representative b lies in M(L) and is basic in M; retain κ_M(b) when indexing the retraction strata. Let M be a
standard Levi, P=MN, K_M=M(O_L), and b∈M(L) basic in M, with M-dominant Newton point ν_M and G-dominant
representative ν_G. Let S_M(μ,κ_M(b)) be the finite set of M-dominant relative positions occurring under the Iwasawa
retraction of Gr_μ and having κ_M=κ_M(b). Put d(μ,μ_M)=dim(N(L)t^(μ_M)K/K∩Gr_μ). The retraction is a morphism
on suitable locally closed pieces; over x∈X^M_(μ_M)(b) its fibre has dimension
d(μ,μ_M)+〈ρ,ν_M−ν_G〉−〈2ρ_N,ν_M〉. Thus dim X^G_μ(b) is the maximum of dim X^M_(μ_M)(b)+this correction over
nonempty terms indexed by S_M(μ,κ_M(b)). Use d≤〈ρ,μ+μ_M〉−〈2ρ_M,μ_M〉, with equality for μ_M∈Σ(μ)^(M-max):
here Σ(μ) is the set of λ∈X_*(T) with dom_G(λ)≤_ℤμ, and Σ(μ)^(M-max) is the set of maximal elements of its
M-dominant part for the integral M-coroot order ≤_M; these lie in S_M(μ) (ham15, Definition 2.5(3) and Lemma
2.6, PDF pp. 4–5). Maximality among occurring positions, or for the G-dominance order, is a different condition. For
M=Cent_G(ν_b), choose the representative basic in M and ν_M=ν_G. (ham15, arXiv v2, Definitions 2.5 and 2.7,
Lemma 2.8 and Proposition 2.9, PDF pp. 4–6; ghkr06, Proposition 5.6.1 and Theorem 5.8.1, PDF pp. 29–32; zhu17,
§3.1.2, pp. 456–457).

A proof route is as follows. Use the supplied semi-infinite intersection geometry and its exact relative
positions. Apply the twisted Lang map on N and calculate its dimension shift using root slopes. Stratify the
image and apply fibre dimension on finite-type models; the theorem needs the perfect analogue in the perfect
chart, Lang and pullback comparisons of §§2.3–3.7.

All correction terms are retained before specializing to the Newton Levi. Empty Levi strata do not contribute
to the maximum.

The indexing set and intersection dimension have the following API, using the supplied intersection geometry
(ham15, Definition 2.5, Lemma 2.6 and Definition 2.7, PDF pp. 4–5).

- An M-dominant μ_M belongs to S_M(μ,κ_M(b)) if and only if N(L)t^(μ_M)K/K∩Gr_μ is nonempty and its integral M-Kottwitz label equals κ_M(b). This set is finite, since its occurring positions lie among the M-dominant coweights whose G-dominant representative is ≤_ℤμ.
- For any M-dominant μ_M, d(μ,μ_M) is the geometric dimension of this specified intersection, with value −∞ when the intersection is empty.
- If m∈K_M t^(μ_M)K_M, write mK=k_M t^(μ_M)K with k_M∈K_M. Left multiplication by k_M identifies the intersection over t^(μ_M)K with N(L)mK/K∩Gr_μ, since K_M normalizes N and preserves Gr_μ. Hence d is unchanged within the K_M-orbit of the Levi point.

**Checks.**

- For M=G, N=1 and μ_M=μ, the intersection dimension and both Newton corrections are 0, so the retraction is the identity.
- For GL₂, M=T, b=1, μ=(1,−1) and μ_M=0, the semi-infinite dimension is 〈ρ,(1,−1)〉=1 and both Newton terms vanish: the value is the torus dimension 0 plus 1. Dropping the intersection term gives the wrong value 0.
- For GL₂, M=T and μ=(1,−1), Σ(μ)={(1,−1),(0,0),(−1,1)}; the torus order ≤_T is equality, so all three are T-maximal and the equality d=〈ρ,μ+μ_M〉 applies at μ_M=0, giving 1. Maximality for the G-dominance order would single out (1,−1) only and would not cover μ_M=0. For M=G only μ is maximal, and the intersection at μ is a point with both sides 0.
- In equal characteristic, for GL₂ with upper-triangular N, M=T, μ=(1,0), b=diag(1,t) and μ_M=(0,1), the intersection is a point: n(u)diag(1,t) has position μ exactly for u∈t⁻¹k[[t]], all giving the same coset. Thus d=0; κ_T(b)=(0,1), ν_M=(0,1), ν_G=(1,0), ρ=(1/2,−1/2), and 2ρ_N=(1,−1). The fibre dimension is 0+(−1)−(−1)=0. Omitting 〈ρ,ν_M−ν_G〉 would give 1. For the empty intersection at μ_M=(2,−1), d=−∞ and μ_M is excluded from S_M; replacing the Levi point by any point in its K_M-orbit preserves d.

*Needs:* §0.5; BunGAndNewtonStrata §1.45, Newton comparison for a Levi representative; GeometricSatakeAndFusion GS1;
§3.1; GeometricSatakeAndFusion GS1 §1.4, affine semi-infinite intersections; the Levi intersection dimension contract.

### 3.5 Iterated spherical affine Deligne–Lusztig loci

Use the reductive O_F-model spherical datum, with perfect k-algebras in mixed characteristic. Fix a local
field E, d≥1, dominant bounds μ₁,…,μ_d and b∈G(L_E). Construct the locus of O_(L_E)-torsors E₀,…,E_d,
with E_d=σ_E^*E₀, modifications Φ_i:E_i[1/ϖ]≃E_(i−1)[1/ϖ] bounded by μ_i, and a generic-fibre framing
β:E₀[1/ϖ]≃E_triv[1/ϖ] satisfying βΦ₁⋯Φ_d=bσ_E(β). For GL_h these torsors are lattices. Equivalently take the
fibre product of the convolution Grassmannian’s endpoint map with the bσ_E graph, followed by reduction in
the equal-characteristic scheme setting; its perfect variant is the perfection. In mixed characteristic use
the perfect pullback on perfect test algebras. The bounds are scheme-theoretic in the classical branch;
pointwise bounds alone on nonreduced algebras do not define it. Keep exact endpoint strata X_λ(b) separate
from X_≤Σμ(b). (zhu17, §3.1.3, Proposition 3.3 and diagrams (3.1.4)–(3.1.5), pp. 457–458).

A proof route is as follows. Form the supplied convolution diagram and its endpoint pullback. Use the torsor
description to compare the two functors and retain the order of all modifications.

The graph square uses the specified Frobenius power. In equal characteristic the square is cartesian before
reduction; after reduction it is a pullback in reduced schemes. In the perfect branch it is cartesian in
perfect spaces. A bound on a convolution fibre is applied over an exact endpoint stratum.

The construction has the following API.

- The chain and Frobenius framing functor.
- The cartesian endpoint square before reduction and its reduced or perfect pullback in the corresponding category.
- The proper map to X_≤Σμ(b).
- For d=1 recover §0.4’s reduced bounded graph pullback in the classical setting and its perfect version in the perfect setting.
- The λ-endpoint piece is the reduced or perfect pullback of the convolution diagram over X_λ(b), in the same setting.

**Checks.**

- d=1 gives §0.4’s bounded graph pullback in the same reduced or perfect setting, with no extra intermediate parameter. In equal characteristic the GL₂ deformation g=1+εt⁻¹E₁₂ at b=1, μ=0 still fails the graph condition, while g=1 satisfies it.
- For a torus the only possible endpoint is Σμ and the convolution fibre is a point.
- Interchanging noncommuting modification matrices changes the chain product; no commutative product convention is allowed.
- For GL₂ a smaller endpoint λ<Σμ is not assigned the top-endpoint fibre dimension 0.
- For a degree-3 unramified restriction, (σb)_τ₀=σ(b_(σ⁻¹τ₀)); use τ₁=σ⁻¹τ₀. The opposite cycle fails even though degrees 1 and 2 cannot detect it.

*Needs:* §0.4; GeometricSatakeAndFusion GS2 §2.4, ambient Hecke convolution.

### 3.6 Unramified norm and iterated-locus comparison

Use the reductive O_F-model spherical datum, with perfect k-algebras in mixed characteristic. Let E/F be
unramified of degree d and G=Res_(E/F)H. Order embeddings τ_i=σ^(−i)τ₀, write b=(b₀,…,b_(d−1)), and use the
ordered norm Nm(b)=b₀σ(b₁)⋯σ^(d−1)(b_(d−1)), with σ_E=σ^d. Construct an isomorphism from X^G_≤μ(b) to the
iterated H-locus with these framed modifications and bounds (μ_τ₀,σμ_τ₁,…,σ^(d−1)μ_τ_(d−1)). Import the B(G)
norm, centralizer and defect comparison rather than redefining them; verify the ρ-pairing identity needed for
dimension. (zhu17, Lemma 3.5 and Lemma 3.7, p. 459).

A proof route is as follows. Write the d transition equations and eliminate successively, preserving
multiplication order. Construct the inverse on torsors and descent data, not only on algebraically closed
points. Apply reduction or perfection in the matching branches of §§0.4 and 3.5. Use the imported centralizer
isomorphism to compare F-split defects.

At d=1 both functor and norm comparisons are identities. At d=2 the norm is b₀σ(b₁), not σ(b₁)b₀. Absolute
ranks cannot replace split ranks in the defect. In degree 3 the component formula is (σb)_τ₀=σ(b_(σ⁻¹τ₀));
this fixes τ_i=σ^(−i)τ₀ and detects the printed opposite cycle.

**Checks.**

- In degree one the norm and geometric comparison are identities. In degree two with σ fixing coefficients, upper and lower unipotent matrices U=[[1,1],[0,1]] and V=[[1,0],[1,1]] give UV=[[2,1],[1,1]] and VU=[[1,1],[1,2]], so norm order is detectable.
- In degree three, τ₁=σ⁻¹τ₀ gives the second factor σ(b₁), rather than σ(b₂); the defect of a restricted basic GL₂ factor remains 1.
- More explicitly, take degree three with b₀=1, b₁=U and b₂=V, where U=[[1,1],[0,1]] and V=[[1,0],[1,1]] have Frobenius-fixed coefficients. The inverse embedding cycle gives norm UV=[[2,1],[1,1]], whereas the opposite cycle gives VU=[[1,1],[1,2]]. This also distinguishes the cycles over 𝔽₂.

*Needs:* §3.5; BunGAndNewtonStrata §1.30, products and unramified restriction of scalars.

### 3.7 Convolution bounds on exact endpoint strata

Use the reductive O_F-model spherical datum, with perfect k-algebras in mixed characteristic. For dominant μ•
and λ≤_ℤΣμ_i, the supplied convolution map has fibres over Gr_λ of dimension at most 〈ρ,Σμ_i−λ〉. Pulling back
over the exact X_λ(b), this bounds the iterated ADLV piece by dim X_λ(b)+〈ρ,Σμ_i−λ〉. Prove separately that the
top endpoint λ=Σμ_i is nonempty when its ADLV is nonempty and that its convolution fibre has dimension 0,
giving the lower bound required for the iterated dimension formula. (zhu17, Proposition 2.3, p. 432; proof of
Proposition 3.3, pp. 459–460).

A proof route is as follows. Import the geometric stratified semismallness bound from
GeometricSatakeAndFusion GS2 §2.6, rational Witt convolution and semismallness; its statement concerns actual fibres, not only sheaf
pushforward. Stratify by finitely many exact endpoints and apply the uniform fibre upper bound. Use the top
endpoint and its nonempty zero-dimensional fibre for the opposite inequality.

No closed-union fibre is treated as a single exact stratum. No cohomological decomposition theorem is used to
assume the missing geometry.

**Checks.**

- For GL₂ and two bounds (1,0), the top endpoint (2,0) has fibre dimension 0, while endpoint (1,1) has fibre P¹ of dimension 1 = 〈ρ,(1,−1)〉. The top bound cannot be applied to the whole closed endpoint union.

*Needs:* §3.5; §0.5; GeometricSatakeAndFusion GS2 §2.6, rational Witt convolution and semismallness.

### 3.8 Dimension of spherical and iterated loci

Use the reductive O_F-model spherical datum, with perfect k-algebras in mixed characteristic. If X_μ(b) is
nonempty for an unramified reductive O_F-model, then dim X_μ(b)=dim X_≤μ(b)=〈ρ,μ−ν_b〉−def_G(b)/2. If X_≤μ(b)
is empty, its dimension is −∞ and the numerical expression is not asserted equal to it. More generally a
nonempty iterated locus has dimension 〈ρ,Σμ_i−ν_b〉−def_G(b)/2. Prove nonemptiness/top-stratum attainment
before equating the exact and closed dimensions. (zhu17, Theorem 0.5, p. 410; Theorem 3.1, p. 456; Proposition
3.3, pp. 457–460; ham15, arXiv v2, Theorem 1.1, PDF p. 2; setup p. 1).

A proof route is as follows. Reduce to the Newton Levi and then superbasic adjoint factors. Apply norm
geometry and the GL chart calculation. Apply the exact endpoint bounds and prove lower endpoints cannot exceed
the top value; show the top nonempty stratum supplies equality. Proof order: first the superbasic GL_h chart
formula for every bound, with nonempty top exact strata supplied unconditionally by the cyclic charts of §2.4; then its bounded unions and the Res GL_h convolution step using only those GL_h
endpoint formulas; then adjoint products and Newton-Levi reduction. Only after the single-step theorem for
general H is established deduce the general iterated formula. This avoids using the theorem for G to prove its
own top-stratum attainment.

G_m, μ=0, b=ϖ is empty although the displayed rational number is 0. For GL₂ with μ=(1,0) and basic slope 1/2,
the value is 0. For GL₂ with μ=(1,−1), b=1, the value is 1. This theorem does not assert equidimensionality of
every stratum.

**Checks.**

- For GL₂, μ=(1,0), basic ν=(1/2,1/2) and defect 1 give 0; for μ=(1,−1), b=1 and defect 0 give 1.
- For GL₂, b=1 and μ=(1,0), the determinant mismatch 0≠1 makes the locus empty, although the rational expression is 1/2.

*Needs:* §2.5; §3.4; §3.3; §3.6; §3.7.

### 3.9 The virtual dimension upper bound

Use the simple quasi-split flag datum and apartment orientation of the Conventions. For every w and [b] in the
supported flag setting, dim X_w(b)≤d_w(b). Derive the σ-twisted form using the reduction and spherical
estimates; track the η convention in the survey’s normalized Newton-stratum formula. That stratum dimension
equals the ADLV dimension plus 〈ν_b,2ρ〉, so its plus-Newton term must not be copied into the ADLV formula.
(he21, Theorem 2.1, p. 5; he14, Theorem 10.3 and Corollary 10.4, pp. 396–397; he15, Theorem 2.30, PDF p. 38).

A proof route is as follows. Reduce to the spherical bound and control the extra flag fibres by finite Weyl
lengths. Prove the Frobenius-convention comparison between yσ(x) and σ⁻¹(y)x. Prove the general-σ and
general-datum extension using the flag comparison in §0.5.

The sign is −〈ν,ρ〉 in d_w. The δ=id result alone does not prove the general σ statement.

**Checks.**

- For split GL₂, w=t^(1,0) and b=t^(1,0), the dimension 0 and virtual expression (1+0−0)/2−1/2=0 agree. Replacing the final minus by plus yields 1.
- In split adjoint A₁, w=s and b=1 have actual and virtual dimension 1.

*Needs:* §0.2; §1.2; §1.3; §3.8.

### Examples

For GL₂ with b=1 and μ=(1,−1), the diagonal-torus Levi term at μ_M=0 has semi-infinite dimension 1 and no
Newton correction, giving dimension 1. For two minuscule bounds (1,0), endpoint (2,0) has zero-dimensional
convolution fibre and endpoint (1,1) has P¹ fibre. For basic slopes 1/2, the single-step minuscule dimension
is 0.

### Dependencies

Layers 0, 1, 2; BunGAndNewtonStrata Layer 1; BunGAndNewtonStrata §1.45, Newton comparison for a Levi representative;
BunGAndNewtonStrata §1.30, products and unramified restriction of scalars; BunGAndNewtonStrata §1.43, bounded lifting through a z-extension; GeometricSatakeAndFusion GS0, Witt bounds and projective models;
GeometricSatakeAndFusion GS1; GeometricSatakeAndFusion GS1 §1.4, affine semi-infinite intersections; GeometricSatakeAndFusion
GS2 §2.4, ambient Hecke convolution; GeometricSatakeAndFusion GS2 §2.6, rational Witt convolution and semismallness;
ReductiveGroupsPartII RG2.3; ReductiveGroupsPartII RG2.3, associated-parahorics; ReductiveGroupsPartII RG2.3,
parahoric-subgroup; SchemeAndStackFoundations §§0.7, 0.9, 0.23–0.26; InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T3
and their coefficient and compact-support suppliers. The individual Needs paragraphs specify the additional comparison constructions
used by each route.

## Layer 4: generic Newton classes and cordiality

### 4.1 Spherical nonemptiness and Newton upper bounds

Use the simple quasi-split flag datum and apartment orientation of the Conventions. For dominant λ and the
indicated special maximal parahoric K, the exact locus X^K_λ(b) is nonempty exactly when κ_G(b)=λ^natural and
ν_b≤λ^♦. The bounded union X^K_≤λ(b) has the same criterion: necessity follows on every lower stratum and
sufficiency already holds on the exact top stratum. In particular any class occurring in Kt^λK has ν_b≤λ^♦,
and [t^λ] realizes the greatest class with ν=λ^♦ and defect 0 in the ordinary translation situation used here.
Distinguish rational Newton dominance from the integral relative-position bound. (he21, Theorem 4.4, p. 7;
he14, Theorem 7.1, pp. 389–390).

A proof route is as follows. Apply the integral κ obstruction and Newton semicontinuity for necessity. Use the
straight representative and Levi reduction for sufficiency. Check special-parahoric and root-datum generality
before passing from unramified spherical geometry to the He21 setting; this is part of the bounded ADLV comparisons of §0.5.

A torus with different valuation is empty even though rational dominance in semisimple directions is vacuous.

**Checks.**

- For G_m, λ=0 and valuation(b)=1, κ differs and both exact and bounded loci are empty. Equal semisimple Newton components alone would incorrectly predict nonemptiness.
- For GL₂, λ=(1,0) and basic slopes (1/2,1/2), κ=1 on both sides and ν≤λ, so the exact top stratum is nonempty; slopes (2,−1) have κ=1 but violate ν≤λ.

*Needs:* §0.4; BunGAndNewtonStrata §1.27, ordinary straight translation and Levi centrality; BunGAndNewtonStrata §1.7, Galois averaging and Hodge invariants; VStackSheavesAndLisseCategories §VS4.0, Newton geometry.

### 4.2 Generic Newton class of an Iwahori cell

Use the simple quasi-split flag datum and apartment orientation of the Conventions. The initial classical
proof uses the equal-characteristic tame adjoint setting of the Conventions; the general flag theorem includes
the specified transfer. For w define B(G)_w={[b]:X_w(b)≠∅}. For every supported local-field datum it has a greatest element [b_w]. In equal characteristic construct its dense open Newton stratum in IẇI and prove that the same greatest element occurs in the Bruhat closure ⋃_(v≤w)IṽI. For other local fields transfer greatestness of B(G)_w through §1.3, preserving the affine root datum, σ, integral κ and Newton invariants; no topological closure statement is inferred from that numerical transfer. The order is the Kottwitz-compatible Newton order imported
from B(G); this is not a total ordering of all classes. (he21, §4.1, p. 7; vie14, Proposition 5.5 and
Corollary 5.6, pp. 1026–1028; mv20, §3.1, arXiv v3, PDF pp. 5–7).

A proof route is as follows. Work on admissible bounded models of the loop-group cell, prove generic constancy
and greatestness, then compare its closure. Use the Newton-cell greatest class contract for this equal-characteristic geometric assertion; construct the generic stratum on admissible bounded models before passing to the loop cell. Section 1.3 supplies characteristic-independent occurrence of each class.

Unique maximal and greatest must be distinguished until finiteness/comparability is proved. No assertion that
every class below [b_w] occurs is made here.

The construction has the following API.

- B(G)_w defined by nonemptiness.
- The greatest occurring class in every supported local-field datum, realized on a dense open Newton stratum in equal characteristic.
- Every occurring class is ≤[b_w].
- In equal characteristic, passing to the Bruhat closure does not change the greatest class.
- The generic stratum meets the cell, so X_w(b_w) is nonempty.

**Checks.**

- For a length-zero element τ, the cell has generic class [τ].
- For dominant λ the cell t^λ has generic class [t^λ].
- A class with different κ cannot enter B(G)_w even if its Newton vector is smaller.
- Greatestness alone must not produce all lower classes; saturation is a separate cordial theorem.

*Needs:* §0.5; VStackSheavesAndLisseCategories §VS4.0, Newton geometry; ReductiveGroupsPartII RG2.4,
iwahori-bruhat-decomposition; §1.3; the Newton-cell greatest class contract.

### 4.3 Fundamental representatives, Newton-cell comparison and dimension at the generic class

Use the simple quasi-split flag datum and apartment orientation of the Conventions. For [b]∈B(G) let y∈W̃ be a
σ-straight element with [ẏ]=[b], supplied by BunGAndNewtonStrata §1.10, and let ν_y be its Newton point, so
that ȳσ(ν_y)=ν_y and the dominant representative of ν_y is ν_b. Let P_y=M_yN_y be the semistandard parabolic
determined by ν_y: M_y is the centralizer of ν_y and N_y is generated by the root groups U_α with 〈α,ν_y〉>0;
let N̄_y be the opposite unipotent radical. Put φ_y=Ad(ẏ)∘σ on G(L), which preserves M_y, N_y and N̄_y, and
I_M=I∩M_y(L), I_N=I∩N_y(L), I_N̄=I∩N̄_y(L). Prove that ẏ is P_y-fundamental: φ_y(I_M)=I_M, φ_y(I_N)⊆I_N and
φ_y⁻¹(I_N̄)⊆I_N̄. Prove that the two inclusions are contractions: for every congruence kernel I_n there is k
with φ_y^k(I_N)⊆I_n and φ_y^(−k)(I_N̄)⊆I_n. Prove that the quotient I_N̄/φ_y⁻¹(I_N̄) is an affine space whose
dimension is ℓ(y)=〈2ρ_(N_y),ν_y〉=〈2ρ,ν_b〉, where 2ρ_(N_y) is the sum of the roots of N_y. The parabolic P_y
depends on the representative y, not only on [b]; every σ-straight representative of [b] is covered. The
initial proof is for the unramified datum; the tame quasi-split datum of the Conventions is reached by the
same reduction, which uses only the based σ-action on the affine Weyl group and the root-group filtrations
(nie15, Theorem 1.3, PDF p. 3, proof on PDF p. 10; ghkr10, Definition 13.1.2 and Proposition 13.1.3,
PDF pp. 37–38; mv20, proof of Proposition 3.5 and the paragraph before Theorem 3.10, arXiv v3, PDF pp. 6–7).

A proof route is as follows. Reduce y by length-preserving simple σ-conjugations to a straight element whose
Newton vector meets the closed base alcove, for which the three subgroup conditions are the alcove
inequalities; carry the conditions back through each step, expressing the two inclusions as inequalities
on the affine root-group filtrations of N_y and N̄_y and using a length comparison inside M_y for the
equality on I_M. The contraction follows from the
strict positivity of 〈α,ν_y〉 on the roots of N_y, and the dimension from the root-group filtration of N̄_y
and the translation length formula.

The construction has the following API.

- The representative y, its Newton point ν_y, the parabolic P_y and the twisted Frobenius φ_y, with its source and target G(L).
- φ_y preserves I_M and maps I_N into itself; φ_y⁻¹ maps I_N̄ into itself, so φ_y(I_N̄) contains I_N̄.
- Iterates of φ_y on I_N and of φ_y⁻¹ on I_N̄ enter every congruence kernel.
- The quotient I_N̄/φ_y⁻¹(I_N̄) is an affine space of dimension ℓ(y)=〈2ρ,ν_b〉.

**Checks.**

- In split GL₂ with the base alcove of the Conventions, take y=t^(1,0)=diag(ϖ,1), so ν_y=(1,0), M_y=T, N_y=U_α for α=e₁−e₂ and N̄_y=U_(−α). Here I_N=U_α(ϖO_L), I_N̄=U_(−α)(O_L) and I_M=T(O_L). Then φ_y(U_α(c))=U_α(ϖσ(c)), so φ_y(I_N)=U_α(ϖ²O_L), and φ_y⁻¹(U_(−α)(c))=U_(−α)(σ⁻¹(ϖc)), so φ_y⁻¹(I_N̄)=U_(−α)(ϖO_L); the quotient is O_L/ϖO_L, of dimension 1=ℓ(y)=〈2ρ,(1,0)〉, and the k-th iterates lie in U_α(ϖ^(k+1)O_L) and U_(−α)(ϖ^kO_L). For diag(ϖ²,1) the same computation gives dimension 2.
- The other straight representative t^(0,1)=diag(1,ϖ) of the same class has ν_y=(0,1), the opposite parabolic and N_y=U_(−α); the quotient is U_α(ϖO_L)/U_α(ϖ²O_L), again of dimension 1. The parabolic is attached to y, the dimension only to [b].
- For the basic class of GL₂ with κ=1 the straight representative is the length-zero element τ, with ν_y=(1/2,1/2), M_y=G and N_y=1; φ_y(I)=I and the quotient is a point, of dimension 0=〈2ρ,(1/2,1/2)〉.
- The finite reflection s lies in the class of 1, whose straight representative is y=1 with M_y=G. For the non-straight representative s, Ad(ṡ)∘σ carries I to the opposite Iwahori, so the equality on I_M fails: the length identity ℓ(y)=〈2ρ,ν_b〉 is satisfied by y=1 and not by s, and the subgroup conditions are what the comparison below uses.

For the quasi-split flag datum, let N_[b],w=[b]∩IẇI be nonempty. Let I_n, n≥1, be the congruence kernel
of the connected Iwahori model modulo ϖ^n. On an admissible congruence quotient
define dim_I N_[b],w=dim(N_[b],w/I_n)−dim(I/I_n), independently of sufficiently deep I_n; thus
dim_I(IẇI)=ℓw. Use compatible perfect quotients in mixed characteristic. In either characteristic prove
dim_I N_[b],w=dim X_w(b)+〈2ρ,ν_b〉. In equal characteristic, put c_[b],w equal to the minimum codimension
of an irreducible component of N_[b],w in IẇI, computed on those quotients. Prove
dim X_w(b)=ℓw−〈2ρ,ν_b〉−c_[b],w, and prove that X_w(b) is equidimensional if and only if N_[b],w is
equidimensional. Neither assertion requires cordiality. The equidimensionality comparison retains its
equal-characteristic hypothesis (mv20, Theorem 3.10 and Corollaries 3.11–3.12, arXiv v3, PDF pp. 7–8;
he15, Theorem 2.23, PDF p. 34, for the numerical comparison in either characteristic).

A proof route constructs the finite-surjective comparison between completed local Newton-stratum models
and the product with the ADLV factor of mv20, Theorem 3.10, here, using the P_y-fundamental representative
above: the second factor is the completion of the affine space I_N̄/φ_y⁻¹(I_N̄), of dimension ℓ(y)=〈2ρ,ν_b〉,
and the contraction of φ_y⁻¹ on I_N̄ is what makes the comparison map finite and surjective. Compare
component dimensions on finite-type models to obtain the equality and both directions
of the equidimensionality criterion. Section 1.3 supplies the normalized numerical recurrence in either
characteristic. The Newton stratification on the cell models and their completions is the input of
the Newton-cell greatest class contract; the comparison involving X_w(b) is constructed here after §0.5.

Use the simple quasi-split flag datum and apartment orientation of the Conventions. The initial classical
proof uses the equal-characteristic tame adjoint setting of the Conventions; the general flag theorem includes
the specified transfer. At [b_w], dim X_w(b_w)=ℓw−〈ν_(b_w),2ρ〉. Relate the codimension of the generic Newton
stratum in IẇI to ADLV dimension using the comparison above. (he21, §4.1, p. 7;
he15, Theorem 2.23, PDF p. 34; mv20, Lemma 3.2, arXiv v3, PDF p. 5).

A proof route in equal characteristic uses the dense open Newton stratum to get codimension zero and applies the cell/ADLV dimension comparison, retaining the 〈ν,2ρ〉 correction. Transfer the numerical equality to other local fields by §1.3; density is used only on the equal-characteristic models.

Do not replace the generic class by an arbitrary greatest rational cocharacter.

The comparison has the following API.

- The normalized cell dimension is independent of sufficiently deep congruence truncation and gives ℓw on IẇI.
- For every nonempty N_[b],w, its normalized dimension is dim X_w(b)+〈2ρ,ν_b〉 in either characteristic.
- In equal characteristic, minimum component codimension gives the stated ADLV dimension, and equidimensionality holds on one side exactly when it holds on the other.
- At the generic class the component codimension is zero, giving dim X_w(b_w)=ℓw−〈2ρ,ν_(b_w)〉.

**Checks.**

- For GL₂, t^(1,0) has generic ν=(1,0), and dimension 1−1=0. For the finite A₁ simple cell, generic ν=0 and dimension 1−0=1.
- For GL₂, w=s t^(1,0) has ℓw=2. At the basic class ν=(1/2,1/2), dim X_w(b)=1 and 〈2ρ,ν〉=0, so dim_I N=1 and c=1. At the ordinary class ν=(1,0), dim X_w(b)=1 and 〈2ρ,ν〉=1, so dim_I N=2 and c=0. For the Iwahori-model congruence kernels, dim(I/I_n)=4n; at n=1,2 the basic quotient dimensions 5,9 and ordinary dimensions 6,10 give the same differences 1 and 2. These are the codimensions used in §4.6.
- For G_m with w=1 and valuation(b)=1, both loci are empty by κ mismatch; no finite minimum component codimension is assigned. At b=1 the same cell has dim X=dim_I N=0 and c=0, with both loci equidimensional.

*Needs (fundamental representative):* BunGAndNewtonStrata §1.10, straight Weyl comparison with B(G);
the twisted Red-Min contract, for the length-preserving reduction to a straight element whose Newton vector meets the
closed base alcove; ReductiveGroupsPartII RG2.1, affine-roots-and-filtrations;
ReductiveGroupsPartII RG2.4, translation-length-formula.

*Needs (cell/ADLV comparison):* §0.5; §4.2; the fundamental representative above, with its contraction and
the dimension ℓ(y)=〈2ρ,ν_b〉 of I_N̄/φ_y⁻¹(I_N̄) (mv20, Theorem 3.10 and Corollary 3.11);
GeometricSatakeAndFusion GS0 §0.32, integral parahoric ind-properness;
SchemeAndStackFoundations §0.7, fibre_dimension_formula; the Newton-cell greatest class contract for the
equal-characteristic Newton stratification on bounded cell models and their completions.

*Needs (dimension at the generic class):* §4.2; §1.3; the cell/ADLV comparison above.

### 4.4 Cordial elements

Use the simple quasi-split flag datum and apartment orientation of the Conventions. The initial classical
proof uses the equal-characteristic tame adjoint setting of the Conventions; the general flag theorem includes
the specified transfer. A Weyl-group element w is cordial when ℓw−ℓη_σ(w)=〈ν_(b_w),2ρ〉−def_G(b_w).
Equivalently dim X_w(b_w)=d_w(b_w). The definition is a property of the given based Frobenius datum and
generic class, not a condition imposed on all b by definition. (he21, §4.1, p. 7; mv20, Definition 3.14, arXiv
v3, PDF p. 8).

A proof route is as follows. Define the scalar equality and use the generic-dimension theorem for the
equivalent form.

Keep the factor 2 in the generic dimension and the single ρ in d_w.

The construction has the following API.

- The displayed generic length equality.
- Equivalent equality of actual and virtual dimension at b_w.
- Transport along reduction equivalences only when the relevant η lengths and generic classes have been compared.
- The translation family of §4.7 satisfies the cordiality equality using the supplied length identities and the geometric generic-class calculation.

**Checks.**

- For w=1 and b_w=1 both sides are 0.
- For a dominant translation in split GL₂, ℓ(t^(1,0))=1, η=1, ν=(1,0), def=0, so it is cordial.
- For w=s in split adjoint A₁ the generic class is basic and ℓs−ℓη=0, so it is cordial.
- Equality at one nongeneric b does not establish cordiality without the generic-class theorem.

*Needs:* §0.2; §4.3.

### 4.5 Cordiality under mutual dimension advantage

Use the simple quasi-split flag datum and apartment orientation of the Conventions. The initial classical
proof uses the equal-characteristic tame adjoint setting of the Conventions; the general flag theorem includes
the specified transfer. If w⇒_σv and v⇒_σw, then B(G)_w=B(G)_v and their greatest classes agree. At every
occurring class dim X_w−d_w=dim X_v−d_v. Consequently w is cordial iff v is cordial. (he21, §4.1, p. 7).

A proof route is as follows. Use the nonemptiness implications in each direction to identify the sets.
Antisymmetry of the rational inequalities gives equality of dimension defects; evaluate at the common generic
class.

Only mutual advantage, not a single inequality, gives the equivalence.

**Checks.**

- For w=v the two normalized differences are equal even at an empty locus, where both are −∞. For finite nonempty dimensions D_w=3,D_v=2 and virtual values d_w=4,d_v=3, both differences are −1; a single inequality does not force equality.

*Needs:* §1.4; §4.4.

### 4.6 Cordial saturation and dimensions

Use the simple quasi-split flag datum and apartment orientation of the Conventions. For every supported local field, if w is cordial, [b]∈B(G)_w and [b]≤[b′]≤[b_w], then [b′]∈B(G)_w; every nonempty X_w(b) has dimension d_w(b). The interval starts at a known occurring [b]. In equal characteristic, also prove that every such ADLV is equidimensional and that, inside IẇI, the closure of N_[b],w is the union of the occurring N_[c],w with [c]≤[b]. The closure and equidimensionality conclusions retain their equal-characteristic hypotheses (mv20, Theorem 3.16(3) and Corollary 3.17, arXiv v3, PDF pp. 8–9; Remark 1.3, PDF p. 3; he21, Theorem 4.1, p. 7).

A proof route in equal characteristic uses the Newton poset length contract, the Newton-cell strong purity contract and the Newton-cell/ADLV comparison of §4.3. Propagate codimension equality from the generic stratum down each occurring interval. Transfer saturation and the numerical dimension equality to the same based affine datum over other local fields using §1.3 and its characteristic-independent class polynomials (he15, Theorem 2.23, PDF p. 34). This route makes no transfer claim for Newton-stratum closures or equidimensionality.

A basic seed must be supplied before applying saturation. Generic greatestness alone supplies no lower endpoint.

**Checks.**

- For split GL₂, w=s t^(1,0) has generic ordinary slopes (1,0) and basic slopes (1/2,1/2) below them. The ordinary dimension is (2+1−0)/2−1/2=1 and the basic dimension is (2+1−1)/2−0=1, in either characteristic. The chain length is (1+1−0)/2=1; in equal characteristic the basic Newton stratum has codimension 2−0−1=1 and its closure is itself, whereas the ordinary stratum’s closure contains both strata.
- For a split torus, fixed κ gives one Newton class; the interval is a singleton and the nonempty dimension is 0. In equal characteristic its stratum closure is that same stratum.

*Needs:* §4.4; §4.2; §1.3; §3.9; VStackSheavesAndLisseCategories §VS4.0, Newton geometry; the Newton poset length contract; the Newton-cell strong purity contract; §4.3 for the equal-characteristic geometric comparison.

### 4.7 Generic class of x t^λ and the dominant family

Use the simple quasi-split flag datum and apartment orientation of the Conventions. The initial classical
proof uses the equal-characteristic tame adjoint setting of the Conventions; the general flag theorem includes
the specified transfer. For dominant λ and x ∈ W₀, prove [b_(x t^λ)] = [t^λ]. Establish I t^λ I ⊂ overline(I x
t^λ I) ⊂ overline(K t^λ K) in the source’s closure sense, and use spherical Newton nonemptiness to identify
the greatest class. Then prove x t^λ cordial: the supplied length formula gives ℓ(x t^λ) − ℓη_σ(x t^λ) = ℓt^λ
= 〈λ^♦,2ρ〉, while [t^λ] has defect zero. For w = w_S t^λ y in the dominant chamber, prove the
length-preserving σ-rotation to σ⁻¹(y)w_S t^λ with equal η length; derive its generic class and cordiality.
This rotation is asserted only for this chamber family. (he21, Theorem 4.2, p. 7, and §4.4, p. 8).

A proof route is as follows. Use Bruhat closures, spherical nonemptiness, generic-cell dimension
and the supplied translation lengths; the finite η-factor is σ⁻¹(y)x throughout.

Derive geometric cordiality here from the supplier’s length target and the local generic-class calculation.
For λ=0 retain the actual finite cell and its closure, rather than claiming it contains the identity cell as
an open-cell subset.

**Checks.**

- For GL₂, x=s, λ=(1,0), the generic class is ordinary, ℓw=2, ℓη=1 and 〈ν,2ρ〉−def=1, so 2−1=1.
- For λ=0 and x=s in A₁, I and IsI are disjoint cells; I is contained in the closure of IsI. Cordiality reads 1−1=0−0.

*Needs:* §4.2; §4.1; ReductiveGroupsPartII RG2.4, translation-length-formula; §1.2; §4.5; §4.3, generic Newton
dimension.

### Examples

The GL₂ element s t^(1,0) has greatest ordinary Newton class and also the basic κ=1 class. Cordiality at the
generic class reads 2−1=1; the actual dimensions at the ordinary and basic classes are both 1. A Newton vector
in another integral component is never inserted into this interval.

### Dependencies

Layers 0, 1, 3; GeometricSatakeAndFusion GS0 §0.32, integral parahoric ind-properness;
SchemeAndStackFoundations §0.7, fibre_dimension_formula; BunGAndNewtonStrata Layer 1; BunGAndNewtonStrata §1.7, Galois averaging and Hodge invariants; BunGAndNewtonStrata
§1.27, ordinary straight translation and Levi centrality; BunGAndNewtonStrata §1.10, straight Weyl comparison with B(G); VStackSheavesAndLisseCategories §VS4.0, Newton geometry;
ReductiveGroupsPartII RG2.1, affine-roots-and-filtrations; ReductiveGroupsPartII RG2.4, translation-length-formula; the twisted Red-Min contract;
ReductiveGroupsPartII RG2.4, iwahori-bruhat-decomposition; ReductiveGroupsPartII RG2.4,
translation-length-formula. The individual Needs paragraphs specify the additional comparison constructions
used by each route.

## Layer 5: double-flat bounds and factorization

### 5.1 Double-flat coweight

Use the simple quasi-split flag datum and apartment orientation of the Conventions. The reduced root datum is
realized in its adjoint/full coweight lattice P∨ with its based σ-action. Conclusions about the original
cocharacter lattice require §3.2. Write w=x t^λ y in the imported normal form. Let J={s∈S:s y<y},
ρ_J∨=Σ_(s∈J)ω_s∨, and η_J∨ the dominant representative of −σ⁻¹(ρ_J∨). In the full coweight lattice define
λ_w^♭♭=(λ−ρ_J∨)−_domη_J∨=λ−_dom(ρ_J∨+η_J∨). Prove it is dominant, λ_w^♭♭≥_ℤλ−ρ_J∨−η_J∨, and its image in the σ-coinvariants of P∨/Q∨ equals that of λ. If ρ_J∨+η_J∨∈Q∨, also prove λ_w^♭♭≤_ℤλ; this includes trivial diagram action. This is generally an auxiliary
adjoint-lattice cocharacter, not an element of the original Y. (he21, §5.2, p. 9, and §6.4, p. 14).

A proof route is as follows. Use the generic fundamental coweights, dominant representative and normalized
subtraction contract. Track the original cocharacter sublattice separately. Modulo Q∨, λ_w^♭♭≡λ+(σ⁻¹−1)ρ_J∨. For the conditional upper bound, ρ_J∨+η_J∨ is dominant and, when in Q∨, is a nonnegative integral sum of simple coroots, making λ feasible for least dominant subtraction. With trivial diagram action this sum is ρ_J∨−w₀ρ_J∨∈Q∨.

Do not replace η_J∨ by −ρ_J∨ or drop σ⁻¹. Do not assert an integral lift to G when only a P∨ construction has
been given.

The construction has the following API.

- J is the specified descent set of y.
- The sum of fundamental coweights in P∨.
- The dominant representative of −σ⁻¹ρ_J∨.
- Both normalized subtraction expressions define the same dominant auxiliary coweight in P∨.
- Dominant, with λ_w^♭♭≥_ℤλ−ρ_J∨−η_J∨.
- It has the same image as λ in (P∨/Q∨)_σ.
- If ρ_J∨+η_J∨∈Q∨ then λ_w^♭♭≤_ℤλ; no such upper bound is asserted for arbitrary twisted σ.
- Records P∨ membership and any separately proved lift to Y.

**Checks.**

- For y=1, J=∅, both correction coweights vanish and λ^♭♭=λ.
- In adjoint A₁ with y=s and λ=2ω∨, ρ_J∨=η_J∨=ω∨, so λ^♭♭=0.
- For simply connected A₁, ω∨=α∨/2 is not an original cocharacter; the intermediate subtraction is not silently evaluated in Y=ℤα∨.
- For A₂ with σ swapping the simple nodes and J={s₁}, the input −σ⁻¹ω₁∨ is −ω₂∨, not −ω₁∨.
- For y=s₁s₂ in A₂, the left descent set is {s₁}, while the right descent set is {s₂}. The input ρ_J∨ must use ω₁∨.
- In adjoint A₁, λ=ω∨ and y=s give λ−ρ_J∨=0. Least dominant subtraction of ω∨ from 0 in the required coroot coset is ω∨, so λ^♭♭=λ. Clipping the ordinary difference to zero loses the odd coroot coset.
- For A₂ with σ interchanging nodes and J={s₁}, the input −σ⁻¹ω₁∨ is −ω₂∨ and its dominant representative is ω₁∨. Omitting σ⁻¹ instead gives dominant representative ω₂∨.
- In quasi-split adjoint unitary A₂, λ=ρ∨=ω₁∨+ω₂∨ and y=s₁ give λ_w^♭♭=ω₁∨. Thus λ−λ_w^♭♭=ω₂∨∉Q∨, excluding an unconditional integral upper bound. The lower-bound difference is ω₁∨−(ρ∨−2ω₁∨)=α₁∨. On P∨/Q∨≅ℤ/3, σ acts by −1, so the σ-coinvariants vanish and the two images agree. For x=s₁, η_σ(w)=s₂s₁ has full σ-support and the alcove’s α₁,α₂,θ ranges are (0,1),(−3,−2),(−2,−1), so this is also a shrunken example.
- With the same unitary datum, λ=ω₁∨ and y=s₁ instead give λ_w^♭♭=ω₂∨. The difference λ−λ_w^♭♭=(α₁∨−α₂∨)/3 is not rationally positive; the lower-bound difference is ω₁∨+ω₂∨=α₁∨+α₂∨.

*Needs:* RootSystems Layers 1–2 and the native chamber, longest-element and root-datum declarations; RootSystemsPartII §1.1; the dominant subtraction contract;
ReductiveGroupsPartII RG2.4, dominant-normal-form.

### 5.2 Parabolic factorization data and invariant ledger

Use the simple quasi-split flag datum and apartment orientation of the Conventions. The reduced root datum is
realized in its adjoint/full coweight lattice P∨ with its based σ-action. Conclusions about the original
cocharacter lattice require §3.2. For shrunken w=x t^λy, set J as above, J′=Stab_S(λ−ρ_J∨), and factor
η_σ(w)=x′z with x′ minimal in W₀/W_(J′), z∈W_(J′). Set β=λ−ρ_J∨+(x′)⁻¹σ⁻¹ρ_J∨; let γ be its dominant
representative and choose y′ minimal modulo Stab_S γ with β=y′γ. Define w₁=x z⁻¹t^(λ−ρ_J∨)y′, w₂=(y′)⁻¹z
t^(ρ_J∨)y. Then w=w₁w₂, ℓw=ℓw₁+ℓw₂, γ≥_ℤλ_w^♭♭, and a=σ⁻¹((y′)⁻¹z)*(x′y′) has supp_σ(a)⊇supp_σ(η_σ(w)). Retain
κ in the auxiliary adjoint coinvariants; transferring it to G requires the basic-seed and original-lattice
comparisons of §§7.4 and 3.2. (he21, §5.4, pp. 10–12).

A proof route is as follows. Use the Demazure product and parabolic normal forms of the root-combinatorics
supplier contract. Check the displayed product by the semidirect multiplication law. Use the shrunken root
inequalities for the length identities and the normalized-subtraction bound for γ. Compute κ(β)−κ(λ) as coroot
terms plus (σ⁻¹−1)ρ_J∨ in the auxiliary lattice.

Each minimal-coset direction is specified. The star product is the Demazure product, not ordinary multiplication.

The construction has the following API.

- The tuple (J,J′,x′,z,β,γ,y′,w₁,w₂,a) with its specifications.
- w=w₁w₂ and length additivity.
- γ≥_ℤλ^♭♭.
- The σ-support inclusion for a.
- Equality in the specified adjoint σ-coinvariants, with original-group descent separate.

**Checks.**

- For y=1 the correction ρ_J∨ is zero, β=λ and γ=λ.
- In split adjoint A₁ take x=y=s and λ=2ω∨. Then J={s}, J′=∅, x′=z=y′=1, β=γ=2ω∨, w₁=s t^ω∨ and w₂=t^ω∨s. Their product is s t^(2ω∨)s=t^(−2ω∨), and the lengths are 2+0=2.
- For a simple reflection s, s*s=s, whereas s·s=1; support must be computed from the former.
- In the unitary A₂ example of §5.1 with x=y=s₁ and λ=ρ∨, J′={s₁}, x′=s₂, z=s₁ and y′=1 give β=γ=ω₁∨=λ_w^♭♭. Here w₁=t^ω₂∨ and w₂=t^(−ω₁∨+ω₂∨) have lengths 2 and 2; their product is t^α₂∨ of length 4. The terminal factor is a=s₂*s₂=s₂, with full σ-support. Its original κ comparison is in σ-coinvariants, as required.
- Equality after mapping to P∨ coinvariants cannot be used as equality of original integral κ when the map has a kernel.

*Needs:* §5.1; §0.3; ReductiveGroupsPartII RG2.4, length-and-bruhat-order; RootSystems Layers 1–2 and the native chamber, longest-element and root-datum declarations;
RootSystemsPartII §1.1; the dominant subtraction contract; the Demazure product contract; the parabolic root-length contract;
`CoxeterSystem.parabolic`; `CoxeterSystem.IsMinimalCosetRep`; `CoxeterSystem.existsUnique_isMinimalCosetRep_mul`; `CoxeterSystem.length_mul_of_isMinimalCosetRep`.

### Examples

In split adjoint A₁, x=y=s and λ=2ω∨ give J={s}, J′=∅, β=γ=2ω∨, w₁=s t^ω∨ and w₂=t^ω∨s. Their product is
t^(−2ω∨), with lengths 2+0=2. The intermediate translation t^ω∨ does not exist for the simply connected
cocharacter lattice ℤα∨.

### Dependencies

Layers 0; ReductiveGroupsPartII RG2.4, dominant-normal-form; ReductiveGroupsPartII RG2.4,
length-and-bruhat-order; RootSystems Layers 1–2 and the native chamber, longest-element and root-datum declarations; RootSystemsPartII §1.1; the dominant subtraction contract; the Demazure product contract; the parabolic root-length contract; the pinned Coxeter parabolic API. The individual Needs paragraphs specify the additional comparison constructions used by each
route.

## Layer 6: the two geometric correspondences

### 6.1 Frobenius endpoint correspondences

Use the simple quasi-split flag datum and apartment orientation of the Conventions. The initial classical
proof uses the equal-characteristic tame adjoint setting of the Conventions; the general flag theorem includes
the specified transfer. The reduced root datum is realized in its adjoint/full coweight lattice P∨ with its
based σ-action. Conclusions about the original cocharacter lattice require §3.2. Import C_(u,v)|_(O_z), its
endpoint projection and bounded models from GeometricSatakeAndFusion GS0 §0.38, relative-position flag correspondences. This
target constructs its ADLV application: pull back along gI↦(gI,bσ(g)I), so points are triples with inv(g,h)=u,
inv(h,bσ(g))=v and inv(g,bσ(g))=z. The intermediate flag remains part of the moduli problem. Import the
ordinary and Demazure fibre bounds from GeometricSatakeAndFusion GS0 §0.39, affine flag convolution fibre bounds. The rotation
map is F_b(gI)=bσ(g)I, with r_b(F_b(g))=σ(r_b(g)); compare these rotations by universal homeomorphisms on the
stated geometric models; no new generic flag-incidence definition or fibre theorem is owned here. (he21,
Proposition 5.6 and §5.4, pp. 10–12; gh10, Proposition 2.5.2, PDF pp. 6–8).

A proof route is as follows. Pull back the supplied endpoint projection along the bσ graph on compatible
bounded pieces. Check the relative-Frobenius identity on points and identify the pullbacks used by the five
chain spaces. Use the supplier’s bounds after base change; the bounded ADLV comparisons of §0.5 retains any
comparison between the classical and perfect carriers.

Every chain equation is checked against the point-level product r_b.

The construction has the following API.

- The bσ-graph pullback of the imported triple-flag correspondence.
- Forget the intermediate flag to the endpoint ADLV X_z(b).
- Geometric points are exactly the three relative positions with final flag bσ(g).
- Pullback imposing g′=bσ(g).
- Cyclic rotation with Frobenius gives the stated universal-homeomorphism comparison.

**Checks.**

- When u=1, h=g and z=v, forgetting h identifies the Frobenius pullback with X_v(b).
- For u=v=s, a fixed ordinary endpoint of position 1 has intermediate-flag fibre A¹, while a fixed Demazure endpoint of position s has fibre G_m. Both have dimension 1. The same fibres occur over existing endpoints after the bσ pullback.
- For u=s₁,v=s₂ in A₂ the product endpoint s₁s₂ cannot be replaced by s₂s₁.
- Rotating u,v changes the final label from uv to vσ(u), not vu in a twisted datum.

*Needs:* §0.5; GeometricSatakeAndFusion GS0 §0.38, relative-position flag correspondences; GeometricSatakeAndFusion GS0 §0.39, affine flag convolution fibre bounds.

### 6.2 The two chain-space comparisons

Use the simple quasi-split flag datum and apartment orientation of the Conventions. The initial classical
proof uses the equal-characteristic tame adjoint setting of the Conventions; the general flag theorem includes
the specified transfer. The reduced root datum is realized in its adjoint/full coweight lattice P∨ with its
based σ-action. Conclusions about the original cocharacter lattice require §3.2. Use §5.2 and put A=(y′)⁻¹z,
B=t^(ρ_J∨)y. Rotate the chain w₁,w₂ into X₁ with steps w₂,σ(w₁). Refine w₂=AB and restrict the relative
position from g₃ to bσ(g₁) to σ(x′y′t^γ), obtaining X₂. Forget the B-intermediate flag and split the latter
endpoint into σ(x′y′),σ(t^γ), obtaining X₃. Restrict the position g₁→g₄ to σ(a), obtaining X₄, and forget g₃
to obtain X₅, whose steps are σ(a),σ(t^γ). Supply every map and cartesian square; X₅ compares by the indicated
Frobenius universal homeomorphism with X_(a t^γ)(b). (he21, §5.4, pp. 11–12).

A proof route is as follows. Write the complete flag tuples and relative positions for X₁,…,X₅. Use the
product identities for the first restriction and Demazure endpoint for the second. Verify each rotation and
each refinement on torsors, retaining σ on the final step.

The tuple equations below specify the five moduli spaces and every map. No map from the whole X₁ onto X₃ is
assumed: use the restricted X₂.

The construction has the following API.

- The five chain functors with the displayed restrictions.
- X₂→X₁ is a locally closed restriction, not a surjection onto X₁.
- X₂→X₃ forgets the B-step intermediate flag.
- X₄→X₃ imposes endpoint σ(a).
- X₄→X₅ forgets g₃.
- X₅ compares to X_(a t^γ)(b) through the specified σ-rotation universal homeomorphism.

**Checks.**

- With y=1 the unnecessary zero-length steps collapse to identity correspondences.
- In split adjoint A₁ with x=y=s and λ=2ω∨, the factor B=t^(ω∨)s has length 0, so the step g₃→_B g₂ determines g₂ from g₃ and the forgotten flag of X₂→X₃ carries no fibre; ℓA=ℓB=ℓa=0, ℓw₁=ℓ(x′y′t^γ)=ℓ(t^(2ω∨))=2, so N₁=(0+2−2)/2=0 and N₂=0+0−0=0.
- In the unitary A₂ example of §5.2, A=s₁, B=t^(ω₁∨)s₁, x′y′=s₂, γ=ω₁∨ and a=s₂, with lengths ℓA=1, ℓB=1, ℓ(x′y′)=1, ℓt^γ=2, ℓa=1, ℓw₁=2 and ℓ(x′y′t^γ)=3. Thus N₁=(1+2−3)/2=0 and N₂=1+1−1=1. A half in the Demazure fibre would give the non-integer 1/2 instead of 1; the half in N₁ is not tested here, since its numerator vanishes. The virtual dimensions 3 and 2 of §6.4 differ by exactly N₁+N₂=1.
- In that unitary example σ exchanges s₁ with s₂ and ω₁∨ with ω₂∨, so the terminal chain X₅ has steps (s₁,t^(ω₂∨)), whereas deleting σ gives (s₂,t^(ω₁∨)). These are different relative-position labels, and only the stated Frobenius universal homeomorphism identifies X₅ with X_(s₂t^(ω₁∨))(b).

*Needs:* §5.2; §6.1.

All flags below belong to the same bounded flag diagram. Put A=(y′)⁻¹z and B=t^(ρ_J∨)y; inv denotes relative
position. The intermediate flags are moduli data.

| Space | Tuple equations | Map and target |
|---|---|---|
| X_w | g →_(w₁) g₁ →_(w₂) bσ(g) | Rotate to (g₁,bσ(g)); compare to X₁ by the specified universal homeomorphism. |
| X₁ | g₁ →_A g₃ →_B g₂ →_(σw₁) bσ(g₁) | Restrict the endpoint from g₃ to bσ(g₁). |
| X₂ | X₁ with inv(g₃,bσ(g₁))=σ(x′y′t^γ) | Forget g₂, giving a surjection to X₃ with fibre lower bound N₁. |
| X₃ | g₁ →_A g₃ →_(σ(x′y′)) g₄ →_(σt^γ) bσ(g₁) | Restrict inv(g₁,g₄)=σ(a). |
| X₄ | X₃ with inv(g₁,g₄)=σ(a) | Forget g₃, giving a surjection to X₅ with fibre lower bound N₂. |
| X₅ | g₁ →_(σa) g₄ →_(σt^γ) bσ(g₁) | Identify with X_(σ(a t^γ))(b), then use the Frobenius universal homeomorphism to X_(a t^γ)(b). |

Here N₁=(ℓB+ℓw₁−ℓ(x′y′t^γ))/2 and N₂=ℓA+ℓ(x′y′)−ℓa. The first endpoint is the ordinary product, the second the
Demazure product. The restrictions X₂→X₁ and X₄→X₃ are locally closed inclusions, and are not asserted
surjective. (he21, §5.4, pp. 11–12.)

### 6.3 Dimension inequality for the chain spaces

Use the simple quasi-split flag datum and apartment orientation of the Conventions. The initial classical
proof uses the equal-characteristic tame adjoint setting of the Conventions; the general flag theorem includes
the specified transfer. The reduced root datum is realized in its adjoint/full coweight lattice P∨ with its
based σ-action. Conclusions about the original cocharacter lattice require §3.2. The maps X₂→X₃ and X₄→X₅ are
surjective, with geometric fibre dimensions at least N₁=(ℓB+ℓw₁−ℓ(x′y′t^γ))/2 and N₂=ℓA+ℓ(x′y′)−ℓa=ℓη_σ(w)−ℓa,
respectively. On compatible bounded models deduce dim X_w(b)≥dim X_(a t^γ)(b)+N₁+N₂. The factorization length
identities give N₁+N₂=d_w(b)−d_(a t^γ)(b). (he21, §5.4, pp. 11–12).

A proof route is as follows. Restrict to a bounded model containing a generic point of a maximal-dimensional
target component. Use fibre lower bounds on a compatible finite-type source model and the locally closed
inclusions to bound dim X_w from below. Cancel b-dependent terms in virtual dimensions and check every finite
Weyl length.

Do not argue that finitely many proper closed subsets cover an entire non-quasi-compact ADLV. The dimension
proof uses the bounded-model comparison of §0.5 in addition to the pointwise correspondence.

**Checks.**

- In the A₁ factorization x=y=s, λ=2ω∨, the lengths are ℓB=0, ℓw₁=2, ℓ(x′y′t^γ)=2, ℓA=0 and ℓa=0. Thus N₁=N₂=0 and both virtual dimensions agree.
- For u=v=s the ordinary and Demazure lower bounds are (1+1−0)/2=1 and 1+1−1=1; putting a half in the second bound gives the incorrect 1/2.

*Needs:* §6.2; GeometricSatakeAndFusion GS0 §0.39, affine flag convolution fibre bounds; §0.5;
SchemeAndStackFoundations §0.7, fibre_dimension_formula.

### 6.4 Reduction from a shrunken alcove to a cordial family

Use the simple quasi-split flag datum and apartment orientation of the Conventions. The initial classical
proof uses the equal-characteristic tame adjoint setting of the Conventions; the general flag theorem includes
the specified transfer. The reduced root datum is realized in its adjoint/full coweight lattice P∨ with its
based σ-action. Conclusions about the original cocharacter lattice require §3.2. For shrunken w = x t^λ y in
the auxiliary full-coweight datum, construct dominant γ ≥_ℤ λ_w^♭♭ and a ∈ W₀ with supp_σ(a) ⊇ supp_σ(η_σ(w)),
κ(a t^γ) = κ(w) in that datum, and w ⇒_σ a t^γ. Section 4.7 supplies the target family’s cordiality. No
shrunkenness of a t^γ is imposed. Transfer this comparison to the original group through §3.2, retaining its
original integral κ. (he21, Theorem 5.5, p. 9, proved in §5.4, pp. 10–12).

A proof route is as follows. Assemble γ, a, support and κ from factor data. Use the chain dimension inequality
for every b with the target nonempty. Use §4.7 only after matching geometric and Frobenius conventions.

Auxiliary-lattice descent is the basic-seed and original-lattice comparisons of §§7.4 and 3.2. No basic-seed
theorem requiring shrunkenness can be applied to the target without another argument.

**Checks.**

- With x=y=s, λ=2ω∨ in split adjoint A₁, the construction gives γ=2ω∨, a=1, N₁=N₂=0 and w=t^(−2ω∨). Its support implication is ∅⊇∅, and its target need not furnish a full-support basic seed.

*Needs:* §5.2; §6.3; §1.4; ReductiveGroupsPartII RG2.4, translation-length-formula; §4.7, translation-family
cordiality.

### Examples

The same A₁ factorization has A=1, B=t^ω∨s of length zero, a=1 and γ=2ω∨, so the two correction dimensions are
0 and 0. The independent simple-square example has ordinary fibre A¹ and Demazure fibre G_m, each dimension
one; these are different correspondences.

### Dependencies

Layers 0, 1, 5; GeometricSatakeAndFusion GS0 §0.39, affine flag convolution fibre bounds;
GeometricSatakeAndFusion GS0 §0.38, relative-position flag correspondences;
ReductiveGroupsPartII RG2.4, translation-length-formula; SchemeAndStackFoundations §0.7,
fibre_dimension_formula. The individual Needs paragraphs specify the additional comparison constructions used
by each route.

## Layer 7: Levi obstructions and basic seeds

### 7.1 Levi-compatible P-alcove elements and the twisted-product comparison

Use the simple quasi-split flag datum and apartment orientation of the Conventions. For σ-stable J⊂S, standard
P_J=M_JN_J and x∈W₀, call w a (J,x,σ)-alcove element when x⁻¹wσ(x)∈W̃_J and (xN_Jx⁻¹)∩(wIw⁻¹)⊂(xN_Jx⁻¹)∩I. All
superscripts on subgroups in the source mean conjugation. This definition uses the conjugator x, not
automatically σ⁻¹(y) from the normal form. (ghn15, §3.3, PDF p. 10; he21, §6.1, p. 13).

A proof route is as follows. Use the generic root-group and parabolic data to express both conditions. Relate
the subgroup containment to root inequalities with the fixed apartment orientation.

Retain σ(x) on the right side of the Weyl-group condition.

The construction has the following API.

- The Levi Weyl condition and unipotent subgroup inclusion.
- The equivalent inequalities for the corresponding root groups.
- For J=S the unipotent condition is vacuous.
- Conjugation changes the Iwahori and Levi data explicitly.

**Checks.**

- J=S gives the full group and no unipotent obstruction.
- For J= supp_σ(η_σ(w)) in the shrunken setting, x⁻¹wσ(x)=t^λσ(η_σ(w)) lies in W̃_J.
- Replacing x by σ⁻¹(y) does not give that identity in general; a noncommuting A₂ normal form must fail this substitution.
- For a diagram automorphism, x⁻¹w x and x⁻¹wσ(x) differ and only the latter defines the condition.
- In split A₂ choose x=s₁, y=s₂ and λ=2α₁∨+2α₂∨. Conjugating w=x t^λ y by x gives t^λ s₂s₁. Using y instead gives t^(−2α₂∨) s₂s₁; the translation coordinates (2,2) and (0,−2) differ.

For a (J,x,σ)-alcove element w in the classical flag setting, put M′=xM_Jx⁻¹ and I_M=I∩M′. Construct the map
from the twisted product I×^(I_M)(I_Mẇσ(I_M)) to IẇI sending [i,m] to imσ(i)⁻¹; the quotient identifies
(i,m) with (ij,j⁻¹mσ(j)) for j∈I_M. Prove the map surjective. If the defining root inclusions are strict for
every relevant positive root group, prove it injective. Prove that two source points in one fibre have
I_M-σ-conjugate second coordinates. Its inputs are the root conditions of the definition, the root-group
filtrations and Lang theory; no statement about Levi classes is used (ghn15, Theorem 3.3.1, PDF p. 11).

A proof route is as follows. Use the Iwahori decomposition along M′ and the root-group filtrations of
ReductiveGroupsPartII RG2.1 to write an element of IẇI as imσ(i)⁻¹ by successive approximation on the
congruence filtration, with Lang's theorem on each graded piece; the strict inclusions make each step unique.

The comparison has the following API.

- The source is the quotient of I×(I_Mẇσ(I_M)) by (i,m)↦(ij,j⁻¹mσ(j)) for j∈I_M, and its target is IẇI.
- The map sends [i,m] to imσ(i)⁻¹ and is unchanged by the specified quotient relation.
- Every element of IẇI is the image of at least one quotient class.
- For strict root inclusions, every fibre consists of exactly one quotient class.
- In every fibre the second coordinates of two representatives are σ-conjugate by I_M.

**Checks.**

- For J=S, I_M=I and the twisted-product map reduces to the identity on IẇI. For the diagonal torus Levi in GL₂, a surjection from two source points to one target point is not an isomorphism; injectivity is used only under strict root inclusions.
- In G_m with q=2, choose a constant unit ζ of order 3 in 𝔽₄ and σ(ζ)=ζ². For w=1, the equivalent pairs (1,1) and (ζ,ζ) both map to 1, since ζ·ζ·σ(ζ)⁻¹=1. The untwisted relation would identify (1,1) with (ζ,1), whose image is ζ²≠1.
- For split GL₂, J=∅ and w=t^(1,0) with x=1, the element diag(ϖ,1) is a (∅,1,σ)-alcove element; the twisted-product map from I×^(T(O_L))(T(O_L)ẇσ(T(O_L))) is surjective onto IẇI, and every element of IẇI is σ-conjugate under I to a diagonal element of valuation (1,0).

*Needs:* ReductiveGroupsPartII RG2.3, parahoric-subgroup; ReductiveGroupsPartII RG2.1, affine-roots-and-filtrations; ReductiveGroupsPartII RG2.3, lang-theorem; ReductiveGroupsPartII RG2.4, iwahori-weyl-group.

### 7.2 The Levi Kottwitz obstruction

Use the simple quasi-split flag datum and apartment orientation of the Conventions. The initial classical
proof uses the equal-characteristic tame adjoint setting of the Conventions; the general flag theorem includes
the specified transfer. If w is a (J,x,σ)-alcove element and κ_(M_J)(x⁻¹wσ(x)) is not in
{κ_(M_J)(b_M):[b_M]∈B(M_J), [b_M] maps to [b]∈B(G)}, then X_w(b)=∅. The obstruction quantifies over every Levi
class in the fibre. Only for basic [b], under the corrected theorem’s hypotheses, may that fibre be replaced
by at most one Levi class. (he21, Theorem 6.3, p. 13; ghn15, Theorem 3.3.1, PDF p. 11; ghnerr, Proposition
0.0.2, p. 2).

A proof route is as follows. If g is a point of X_w(b), then g⁻¹bσ(g) lies in IẇI and, by the surjectivity of
the twisted-product map of §7.1, equals imσ(i)⁻¹ with m∈I_Mẇσ(I_M); so [b] contains the M′-class of m, and
x⁻¹mσ(x) lies in I_(M_J)x⁻¹ẇσ(x)σ(I_(M_J)), whose Levi κ is κ_(M_J)(x⁻¹wσ(x)) by the integral κ calculation.
Take the contrapositive. The obstruction uses only this surjectivity and the Levi κ computation, not the
image comparison of §7.5.

For GL₂ and M the diagonal torus, diag(ϖ,1) and diag(1,ϖ) are distinct M-classes in one nonbasic G-class.
Retain the characteristic condition from the corrected geometric comparison.

**Checks.**

- In GL₂ the two diagonal representatives with valuations (1,0) and (0,1) give two distinct torus classes over the same nonbasic group class. The obstruction compares against the two-element set, rather than either singleton.
- For J=S the Levi is G and the obstruction is only κ(w)≠κ(b), as required.

*Needs:* §7.1, the twisted-product comparison; BunGAndNewtonStrata §1.45, Newton comparison for a Levi representative; §0.6.

### 7.3 Proper finite support forces emptiness

Use the simple quasi-split flag datum and apartment orientation of the Conventions. The initial classical
proof uses the equal-characteristic tame adjoint setting of the Conventions; the general flag theorem includes
the specified transfer. For shrunken w=x t^λy with λ^♦−ν_b a positive rational combination of every simple
coroot, supp_σ(η_σ(w))≠S implies X_w(b)=∅. Put J=supp_σ(η_σ(w)); then w is a (J,x,σ)-alcove element and
x⁻¹wσ(x)=t^λσ(η_σ(w)). Show its Levi κ cannot equal that of any Levi class mapping to [b]. (he21, §6.2, p. 13;
ghn15, Lemma 3.6.3 and §3.6, PDF pp. 14–15).

A proof route is as follows. Verify the P-alcove condition using x and the specified root inequalities.
Project the strict Newton difference to the center of the proper Levi; show every candidate Levi class has
incompatible κ. Apply the all-classes obstruction rather than the false nonbasic uniqueness assertion.

Strict positivity is required in every simple direction. Full σ-support is an orbit union, not ordinary support.

**Checks.**

- In split adjoint A₁, w=t^(nα∨), n≥1, has η=1 and proper support; for b=1 the gap is strictly positive and the locus is empty. With b=t^(nα∨) the gap is 0 and the same exact translation locus has dimension 0, so strictness is necessary.

*Needs:* §7.2; §0.3; BunGAndNewtonStrata §1.7, Galois averaging and Hodge invariants; BunGAndNewtonStrata §1.45, Newton comparison for a Levi representative.

### 7.4 Basic nonemptiness seed without shrunkenness

Use the simple quasi-split flag datum and apartment orientation of the Conventions. The initial classical
proof uses the equal-characteristic tame adjoint setting of the Conventions; the general flag theorem includes
the specified transfer. The reduced root datum is realized in its adjoint/full coweight lattice P∨ with its
based σ-action. Conclusions about the original cocharacter lattice require §3.2. For dominant γ in the
auxiliary adjoint lattice and a∈W₀ with supp_σ(a)=S, let [τ] be the basic class of the same integral κ as a
t^γ. Establish X_(a t^γ)(τ)≠∅ without assuming a t^γ shrunken. For γ=0 use finite reductive quotient Lang
theory. For γ≠0, let ℋ be the normalized affine-Hecke algebra of §1.3, and let [ℋ,ℋ]_σ be the
ℤ[v,v⁻¹]-span of hh′−h′σ(h). Prove that some σ-twisted Coxeter element c of W₀ satisfies
T_(a t^γ)−z^(ℓa−ℓc)T_(t^γc)∈ℋ⁺+[ℋ,ℋ]_σ, where z=v−v⁻¹ and ℋ⁺ consists of finite normalized-basis sums
with coefficients in ℕ[z]. Full σ-support gives ℓa≥ℓc, so the exponent is nonnegative. Deduce a nonzero
basic-class coefficient from this comparison. Prove the characteristic and datum
transfers through §0.5, and preserve the original lattice through §3.2. (he21, §6.3, pp. 13–14; he14,
Propositions 11.6–11.7, pp. 399–401, and Corollary 6.2, p. 388; he15, Theorem 2.27, PDF p. 37).

A proof route is as follows. Treat γ=0 independently by the finite quotient. For γ≠0 specialize Proposition
11.6 to J=S and its finite factor y=1, preserving full twisted support. Repair the printed variable and
σ-index errors and prove the twisted induction rather than substituting ordinary support. Use Proposition 11.7
and dimension=degree to get nonemptiness. The characteristic transfer is the construction of §0.5 and the
original-lattice transfer is §3.2.

A citation to the shrunken basic theorem is insufficient. The proof constructs the twisted induction with
σ-saturated support and the shifted reflection index throughout.

**Checks.**

- For γ=0 and a=s in split A₁, the finite-quotient locus is P¹ minus P¹(𝔽_q), which is nonempty of dimension 1, including q=2. Its alcove has α-values (0,1), so it is shrunken.
- In split adjoint A₂, γ=0 and a=s₁s₂ have full support but are not shrunken: (s₁s₂)⁻¹α₂=α₁, so the α₂-values stay in (−1,0). The locus over the standard σ-stable vertex contains the classical Coxeter Deligne–Lusztig variety of PGL₃, of dimension 2=(2+2−0)/2=d_(s₁s₂)(1). This supplies a nonshrunken basic seed.
- In split adjoint A₁, take a=s₁=s and γ=α∨, with t^γ=s₀s₁ for the base alcove (−1,0). Then ℓ(a t^γ)=3 and cyclicity gives T_(s₁s₀s₁)≡T_s₀T_s₁²=zT_(s₀s₁)+T_s₀. The coefficient at the minimal basic class of s₀=t^γs is 1. Its degree is 0, so §1.3 gives dimension (3+1+0)/2=2.
- In unitary A₂ with σ(s₁)=s₂, the twisted commutator of T_s₁ and 1 is T_s₁−T_s₂, a nonzero two-term element of ℋ; the ordinary commutator would be 0. Its image in the twisted cocenter is zero. The cone ℋ⁺ contains T_1 and zT_s₁ and excludes −T_1, so the positive remainder in the A₁ Check cannot be replaced by an arbitrary signed remainder.
- For a=1 and a positive straight translation, the basic class need not occur: full σ-support cannot be discarded.
- For G=Res_(E/F)PGL₂ with E/F unramified quadratic, the affine datum is A₁×A₁ with σ exchanging the factors, so it is not irreducible although G is F-simple. With τ=1, μ=(α∨,0) and the σ-Coxeter element c₀=(s₁,1), t^μc₀=(s₀,1) is minimal of length 1; J={s₀ in each factor} is σ-stable with W_J≅C₂×C₂ and c=(s₀,1) is its σ-twisted Coxeter element. The seed contract must cover this datum.

*Needs:* §1.3; ReductiveGroupsPartII RG2.3, lang-theorem; BunGAndNewtonStrata §1.11, Kottwitz classification by both invariants; SmoothRepresentationsOfLocalGroups SR.1.5; the twisted affine cocenter contract; the finite Coxeter basic-class contract; the Demazure product contract.

### 7.5 Proper-Levi image comparison

Use the simple quasi-split flag datum and apartment orientation of the Conventions. The initial classical
proof uses the equal-characteristic tame adjoint setting of the Conventions; the general flag theorem includes
the specified transfer. Let J be σ-stable, let x ∈ W₀, and suppose w is a (J,x,σ)-alcove element in the
classical flag setting. Put M′ = xM_Jx⁻¹ and I_M = I ∩ M′, and use the surjective twisted-product map of §7.1
from I×^(I_M)(I_Mẇσ(I_M)) to IẇI, with its fibre description. For each [b_M] in B(M_J) mapping to [b] with
κ_M(b_M) = κ_M(x⁻¹wσ(x)), compare the corresponding Levi ADLV to its image after framing transport and
J_b(F)-translation. The union of these images covers X_w(b) on geometric
points. Keep every such Levi class, its M_J-Newton point and its M_J-defect as the invariants of that source. The image-cover statement asserts surjectivity on geometric points; dimensions are compared only after the bounded morphism and its fibre dimensions have been identified as in §0.5. (he21, §6.5, p. 14; ghn15, Theorem 3.3.1,
PDF p. 11).

A proof route is as follows. List the Levi classes in the B(M) fibre and compare their Kottwitz invariants.
State the Hodge–Newton comparison with its actual hypotheses and account for fibre dimensions. Keep the image
comparison on the stated P-alcove pieces and use the all-classes index set.

The all-classes warning from GHN’s erratum remains in force.

The comparison has the following API.

- For each matching Levi class [b_M], the map from the Levi ADLV of x⁻¹wσ(x) for M_J to X_w(b), after framing transport and J_b(F)-translation.
- The images over all matching Levi classes cover X_w(b) on geometric points; the induced ADLV images are indexed by all matching Levi classes.
- Each image retains the M_J-Newton point and M_J-defect of its source class.

**Checks.**

- For J=S the single matching class is [b] itself and the cover is the identity of X_w(b). For a proper torus Levi in GL₂ the two classes above remain distinct in the B(M)→B(G) fibre before imposing the required Levi κ.
- In the GL₂ torus example, the B(M)→B(G) fibre has the two classes (1,0) and (0,1); the additional requirement κ_M=(1,0) selects the first and excludes the second. Counting a second matching class here would be a wrong application of the all-classes condition.

*Needs:* §7.1, the twisted-product comparison; §7.2; §1.2; BunGAndNewtonStrata §1.45, Newton comparison for a Levi representative.

### 7.6 From a basic seed to the required Newton class

Use the simple quasi-split flag datum and apartment orientation of the Conventions. The initial classical
proof uses the equal-characteristic tame adjoint setting of the Conventions; the general flag theorem includes
the specified transfer. The reduced root datum is realized in its adjoint/full coweight lattice P∨ with its
based σ-action. Conclusions about the original cocharacter lattice require §3.2. For the reduced target a t^γ,
if κ(b)=κ(a t^γ), ν_b≤γ^♦ and the basic seed exists, then X_(a t^γ)(b) is nonempty and has virtual dimension.
Indeed the basic class [τ] is ≤[b]≤[t^γ]=[b_(a t^γ)]; use the family cordiality of §4.7 and the saturation
theorem of §4.6. (he21, §6.3, pp. 13–14).

A proof route is as follows. Compare κ in the same integral lattice and Newton order. Use the basic seed for
the lower endpoint and the identified generic translation class for the upper endpoint. Apply saturation and
virtual-dimension equality.

Do not infer the existence of the basic seed from generic greatestness. The γ produced in P∨ is not used for
an original G-class until the comparison of §3.2 has been applied to that original component.

**Checks.**

- For split GL₂, a=s and γ=(1,0), the basic κ=1 class of slopes (1/2,1/2) and the ordinary class of slopes (1,0) bound the interval. Both ADLVs have dimension 1. A class of κ=0 is excluded despite any rational Newton comparison.

*Needs:* §7.4; §4.7; §4.6; VStackSheavesAndLisseCategories §VS4.0, Newton geometry.

### Examples

For the GL₂ diagonal torus, the two integral pairs (1,0) and (0,1) are different Levi classes over the same
nonbasic group class. For γ=0 and a=s in A₁, the basic seed is the finite Deligne–Lusztig locus P¹ minus
P¹(𝔽_q), nonempty even when q=2.

### Dependencies

Layers 0, 1, 4; BunGAndNewtonStrata §1.11, Kottwitz classification by both invariants; BunGAndNewtonStrata §1.7, Galois averaging and Hodge invariants; BunGAndNewtonStrata §1.45, Newton comparison for a Levi representative; VStackSheavesAndLisseCategories §VS4.0,
Newton geometry; ReductiveGroupsPartII RG2.3, lang-theorem; ReductiveGroupsPartII RG2.3,
parahoric-subgroup; ReductiveGroupsPartII RG2.1, affine-roots-and-filtrations; ReductiveGroupsPartII RG2.4, iwahori-weyl-group; SmoothRepresentationsOfLocalGroups SR.1.5; the twisted affine cocenter contract; the finite Coxeter basic-class contract; the Demazure product contract.
The individual Needs paragraphs specify the additional comparison constructions used by each route.

## Layer 8: the shrunken nonemptiness and dimension theorem

### 8.1 Nonemptiness for shrunken affine Deligne–Lusztig varieties

Use the simple quasi-split flag datum and apartment orientation of the Conventions. Let w = x t^λ y be shrunken. Assume λ^♦ − ν_b has strictly positive rational coefficients on every simple coroot and (λ_w^♭♭)^♦ ≥
ν_b. Prove X_w(b) ≠ ∅ if and only if κ_G(w) = κ_G(b) and supp_σ(η_σ(w)) = S. This is the theorem for the
original local-field datum, including its general flag-geometry and original-lattice comparisons; the
constructions and supplier contracts in the preceding layers are its proof inputs. (he21, Theorem 6.1, p. 13).

A proof route is as follows. Necessity is the integral κ obstruction and the proper-support Levi obstruction.
For sufficiency reduce to a t^γ with γ≥λ^♭♭ and full support, compare γ^♦≥ν_b, establish the basic seed, and
use cordial saturation. Dimension advantage forces nonemptiness of the auxiliary adjoint locus, and the
nonemptiness transfer of §3.2 gives nonemptiness of the original locus.

Neither strict λ-gap nor shrunkenness is omitted. All invariants are for the original G on the component
compared in §3.2.

**Checks.**

- For PGL₂, b=1, w=s t^(nα∨), n≥1, κ agrees, η=s has full support, and the alcove (2n,2n+1) is shrunken; the locus is nonempty. For w=t^(nα∨) with the same λ and b, support is empty and the locus is empty.

*Needs:* §7.3; §6.4; §7.6; §0.6; §3.2; ReductiveGroupsPartII RG2.3.

### 8.2 Virtual dimension in the shrunken range

Use the simple quasi-split flag datum and apartment orientation of the Conventions. Under the hypotheses of
§8.1, if the equivalent nonemptiness conditions hold, dim X_w(b)=d_w(b)=(ℓw+ℓη_σ(w)−def_G(b))/2−〈ν_b,ρ〉. Use
the reduced target’s virtual dimension and universal dimension advantage for the lower bound, then the
independent virtual upper bound for equality. (he21, Theorem 6.1 and §6.3, pp. 13–14).

A proof route is as follows. For the nonempty reduced target, apply w⇒a t^γ to dim−d. Its actual dimension
equals its virtual dimension, giving dim X_w≥d_w. Combine with the virtual upper bound; no equidimensionality
claim for general w follows from the numerical equality.

For an empty locus the rational formula is not asserted. Rank-one examples must use the same opposite-chamber
convention as η. For split PGL₂, b=1 and w=s t^(nα∨) with n≥1, λ^♭♭=nα∨, η=s, ℓw=2n+1, def=0, so the formula
gives dimension n+1. The base alcove has α-values (−1,0); its image has values (2n,2n+1) and is shrunken.

**Checks.**

- For PGL₂, b=1 and w=s t^(nα∨), n≥1, λ^♭♭=nα∨, ℓw=2n+1, ℓη=1 and defect 0 give n+1. Values n=1 and n=2 give dimensions 2 and 3.
- For the unitary A₂ example of §§5.1–5.2 and b=1, λ^♦=ρ∨, (λ_w^♭♭)^♦=ρ∨/2, κ=0 and supp_σ(η)=S. The strict λ-gap and double-flat bound hold, so ℓw=4, ℓη=2 and defect 0 give dimension 3, despite λ_w^♭♭ not being integrally below λ.

*Needs:* §8.1; §7.6; §6.4; §3.9.

### 8.3 The basic specialization

Use the simple quasi-split flag datum and apartment orientation of the Conventions. For basic b and shrunken w, prove X_w(b)≠∅ exactly when κ_G(w)=κ_G(b) and supp_σ(η_σ(w))=S. On this nonempty locus prove dim X_w(b)=(ℓw+ℓη_σ(w)−def_G(b))/2−〈ν_b,ρ〉. No strict λ-gap is required. Retain the general-datum constructions of §§0.5 and 3.2 (ghn15, Theorem B, PDF p. 3, with the official erratum; he15, Theorems 2.27 and 2.31, PDF pp. 37 and 39; he14, Theorem 12.1, p. 401).

A proof route works in the auxiliary adjoint datum and transports the result through §3.2. For basic b the semisimple Newton point is zero. If λ≠0 then λ^♦ is a nonzero σ-invariant dominant coweight. Since G is F-simple, σ permutes the irreducible components transitively, so λ^♦ is nonzero on each component and has positive coefficients on every simple coroot. Thus the strict gap is λ^♦−ν_b; §5.1 gives the double-flat Newton inequality, so §§8.1–8.2 apply. If λ=0, shrunkenness forces w=w₀: any positive root left positive by w⁻¹ would retain a critical strip (ghn15, proof of Proposition 3.6.5, PDF p. 15). Matching κ then selects the identity basic class. Finite-quotient Lang theory gives nonemptiness and dimension ℓw₀=(ℓw₀+ℓη)/2; §1.3 gives the numerical comparison in either characteristic. The cited he14 Theorem 12.1 supplies the direct cocenter route as well.

**Checks.**

- For b=1 in split adjoint A₁, w=s t^(nα∨) and n≥1 give ν=0, η=s and dimension (2n+1+1)/2=n+1.
- For b=1 in split adjoint A₂ and w=w₀, λ=0 and the strict gap fails. Nevertheless η=w₀ has full support, κ=0 and the finite Deligne–Lusztig locus is nonempty of dimension (3+3−0)/2=3. The image alcove lies in the positive chamber with every positive-root value in (0,1), hence is shrunken.
- For G=Res_(E/F)PGL₂ with E/F unramified quadratic, the geometric root system is A₁×A₁ with σ swapping factors. At b=1, λ=(α∨,0) is dominant but has second coefficient 0. Its average is λ^♦=(α∨/2,α∨/2), so λ^♦−ν_b has coefficients (1/2,1/2), both positive. Using λ itself would miss the strict gap.

*Needs:* §8.2; §5.1; §1.3; §§0.5 and 3.2; RootSystems Layers 1–2 and the native chamber, longest-element and root-datum declarations; ReductiveGroupsPartII RG2.3, lang-theorem; BunGAndNewtonStrata §1.11, Kottwitz classification by both invariants.

### 8.4 A usable large-translation range

Use the simple quasi-split flag datum and apartment orientation of the Conventions. Let w be shrunken and
assume λ_w^♦≥ν_b+2ρ∨. Then the strict λ-gap and double-flat inequality of the main theorem hold. Therefore
X_w(b) is nonempty iff κ_G(w)=κ_G(b) and supp_σ(η_σ(w))=S, and its nonempty dimension is d_w(b). The bound is
a sufficient explicit range, while shrunkenness remains a separate hypothesis. (he21, Corollary 6.4, p. 14).

A proof route is as follows. Use §5.1 to obtain λ_w^♭♭≥_ℤλ−ρ_J∨−η_J∨. The difference 2ρ∨−ρ_J∨−η_J∨ is dominant and hence rationally coroot-positive. Averaging gives (λ_w^♭♭)^♦≥λ^♦−2ρ∨≥ν_b. The positive simple-coroot coefficients of 2ρ∨ also give the strict λ-gap. Apply the main theorem
with the geometric and original-lattice comparisons of §§0.5 and 3.2.

The coweight is 2ρ∨, not 2ρ. An arbitrary large λ statement cannot drop the shrunken condition.

**Checks.**

- In adjoint A₂, ν=0 and λ=6ω₁∨=4α₁∨+2α₂∨ satisfy λ−2ρ∨=2α₁∨, but 〈α₂,λ〉=0: translation preserves the α₂-critical strip and fails shrunkenness. The numerical bound alone does not apply the theorem.
- For adjoint A₁, λ=α∨=2ρ∨ and w=s t^λ satisfy the range; the dimension is 2.

*Needs:* §8.2; RootSystems Layers 1–2 and the native chamber, longest-element and root-datum declarations; RootSystemsPartII §1.1; the dominant subtraction contract; §5.1.

### Examples

For split PGL₂, b=1 and w=s t^(nα∨), n≥1, the base alcove (−1,0) maps to (2n,2n+1). Thus the shrunken and
strict-gap conditions hold, the double-flat bound is nα∨, κ agrees and η=s has full support. The dimension is
n+1: 2 for n=1 and 3 for n=2. The pure translation with the same λ has empty η-support and an empty basic
locus.

### Dependencies

Layers 0, 3, 5, 6, 7; BunGAndNewtonStrata §1.11, Kottwitz classification by both invariants; ReductiveGroupsPartII
RG2.3; RootSystems Layers 1–2 and the native chamber, longest-element and root-datum declarations; RootSystemsPartII §1.1; the dominant subtraction contract. The individual
Needs paragraphs specify the additional comparison constructions used by each route.

## Downstream consumers

Component and integral-model constructions use the point loci of §0.1, exact and bounded spherical loci
of §0.4, geometric realizations of §0.5, framing transport of §0.6 and the spherical dimension theorem
of §3.8. Such applications must distinguish exact strata from closed unions and supply their own
specialization maps. Fixed-point and character applications also require the generic Hecke and local-shtuka
cohomology of HeckeStacksAndLocalShtukas HS0–HS4 and the applicable geometric comparisons. No conclusion
about components or local-shtuka cohomology follows just from equality of the dimensions in Layer 8.

## References

All statements are formulated here in their own mathematical terms. Page numbers for published sources are
printed pages; PDF pages are explicitly marked. The source manifest fixes the exact legally read versions and
theorem, section and page locators.

- **he21.** Xuhua He, *Cordial elements and dimensions of affine Deligne–Lusztig varieties*. Forum of Mathematics, Pi 9 (2021), e9; published 15-page article. [Legal text](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-deligne-lusztig-varieties.pdf).

- **zhu17.** Xinwen Zhu, *Affine Grassmannians and the geometric Satake in mixed characteristic*. Annals of Mathematics 185 (2017), 403–492; published version. [Legal text](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf).

- **he14.** Xuhua He, *Geometric and homological properties of affine Deligne–Lusztig varieties*. Annals of Mathematics 179 (2014), 367–404; published version. [Legal text](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n1-p06-p.pdf).

- **he15.** Xuhua He, *Hecke algebras and p-adic groups*. arXiv:1511.01386v3, 21 November 2016; survey corresponding to Current Developments in Mathematics 2015. [Legal text](https://arxiv.org/pdf/1511.01386).

- **gh10.** Ulrich Görtz and Xuhua He, *Dimensions of affine Deligne–Lusztig varieties in affine flag varieties*. arXiv:1006.2291v1; Documenta Mathematica 15 (2010), 1009–1028. [Legal text](https://arxiv.org/pdf/1006.2291).

- **mv20.** Elizabeth Milićević and Eva Viehmann, *Generic Newton points and the Newton poset in Iwahori-double cosets*. Forum of Mathematics, Sigma 8 (2020), e50, DOI 10.1017/fms.2020.46; locators here use arXiv:1902.02415v3. [Legal text](https://arxiv.org/pdf/1902.02415v3).

- **ghn15.** Ulrich Görtz, Xuhua He and Sian Nie, *P-alcoves and nonemptiness of affine Deligne–Lusztig varieties*. arXiv:1211.3784; published Annales scientifiques de l’ÉNS 48 (2015), 647–665; corrected by the separate erratum. [Legal text](https://arxiv.org/pdf/1211.3784).

- **ghnerr.** Ulrich Görtz, Xuhua He and Sian Nie, *Erratum to P-alcoves and nonemptiness of affine Deligne–Lusztig varieties*. Official author-hosted 3-page erratum. [Legal text](https://www.esaga.uni-due.de/f/ulrich.goertz/pdf/Erratum-GHN.pdf).

- **ghkr06.** Ulrich Görtz, Thomas J. Haines, Robert E. Kottwitz and Daniel C. Reuman, *Dimensions of some affine Deligne–Lusztig varieties*. arXiv:math/0504443; Annales scientifiques de l’ÉNS 39 (2006), 467–511. [Legal text](https://arxiv.org/pdf/math/0504443).

- **vie06.** Eva Viehmann, *The dimension of some affine Deligne–Lusztig varieties*. arXiv:math/0510385v2, 21 July 2006; Annales scientifiques de l’ÉNS 39 (2006), 513–526. [Legal text](https://arxiv.org/pdf/math/0510385).

- **ham15.** Paul Hamacher, *The dimension of affine Deligne–Lusztig varieties in the affine Grassmannian*. International Mathematics Research Notices 2015, 12804–12839, DOI 10.1093/imrn/rnv081; the legally read text is arXiv:1312.0486v2, titled The dimension of affine Deligne–Lusztig varieties in the affine Grassmannian of unramified groups. [Legal text](https://arxiv.org/pdf/1312.0486v2).

- **ckv15.** Miaofen Chen, Mark Kisin and Eva Viehmann, *Connected components of affine Deligne–Lusztig varieties in mixed characteristic*. arXiv:1307.3845; Compositio Mathematica 151 (2015), 1697–1762; numbering here is that of the downloaded arXiv version. [Legal text](https://arxiv.org/pdf/1307.3845).

- **vie14.** Eva Viehmann, *Truncations of level 1 of elements in the loop group of a reductive group*. Annals of Mathematics 179 (2014), 1009–1040; published version. [Legal text](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n3-p03-p.pdf).

- **hn14.** Xuhua He and Sian Nie, *Minimal length elements of extended affine Weyl groups*. Author copy; Compositio Mathematica 150 (2014), 1903–1927. [Legal text](https://archive.ymsc.tsinghua.edu.cn/pacm_download/315/8989-affmin-2.pdf).

- **ghkr10.** Ulrich Görtz, Thomas J. Haines, Robert E. Kottwitz and Daniel C. Reuman, *Affine Deligne–Lusztig varieties in affine flag varieties*. arXiv:0805.0045v4; Compositio Mathematica 146 (2010), 1339–1382; locators are PDF pages of the arXiv version. [Legal text](https://arxiv.org/pdf/0805.0045v4).

- **nie15.** Sian Nie, *Fundamental elements of an affine Weyl group*. arXiv:1310.2229v2; Mathematische Annalen 362 (2015), 485–499; locators are PDF pages of the arXiv version. [Legal text](https://arxiv.org/pdf/1310.2229v2).

- **ham17.** Paul Hamacher, *The almost product structure of Newton strata in the deformation space of a Barsotti–Tate group with crystalline Tate tensors*. Locators use arXiv:1601.03131v3, Definition 2.1(3), PDF p. 4, and Corollary 2.7, PDF p. 6; Math. Z. 287 (2017), 1255–1277. [Legal text](https://arxiv.org/pdf/1601.03131v3).
