# Roadmap: local factors of twists and types

**Summary.** This roadmap proves statements about smooth complex representations of `p`-adic groups, above all of `GL_n(F)` for a nonarchimedean local field `F`, and about the local factors and `L`-functions attached to them: the tempered and the depth-zero representations, bounds for Satake parameters, the Zelevinsky classification, the reduction of `γ`-factors of pairs to supercuspidal representations, the local converse theorem, and the characterisation of local Langlands correspondences by `ε`-factors of pairs. It extends three roadmaps: [SmoothRepresentationsOfLocalGroups](../../SmoothRepresentationsOfLocalGroups/README.md), which supplies the smooth category, Jacquet functors, cuspidal support, the Satake transform and spherical parameters, segments, and the classical correspondence `rec` as an input theorem; [AutomorphicLFunctionsAndLocalFactors](../../AutomorphicLFunctionsAndLocalFactors/README.md), which supplies Whittaker models and the Rankin–Selberg integrals, factors and functional equations of pairs; and [AutomorphicLFunctionsAndLocalFactorsPartII](../../AutomorphicLFunctionsAndLocalFactorsPartII/README.md), which supplies the standard `L`-function of a unitary group from the doubling method. Moy–Prasad filtrations and the Harish-Chandra functors of finite reductive groups come from [ReductiveGroupsPartII](../../ReductiveGroupsPartII/README.md) and [ReductiveGroups](../../ReductiveGroups/README.md), and the classification of unimodular Hermitian lattices from [HermitianFormsAndLattices](../HermitianFormsAndLattices/README.md).

The headline theorems are these. (1) *The local converse theorem* (6.4). Let `ψ` be a nontrivial additive character of `F`, `n ≥ 2`, and `π₁`, `π₂` irreducible generic representations of `GL_n(F)` with the same central character. If `γ(s, π₁ × τ, ψ) = γ(s, π₂ × τ, ψ)` for every irreducible supercuspidal representation `τ` of `GL_r(F)` with `1 ≤ r ≤ n − 1`, then `π₁ ≅ π₂`, and the ranks `1 ≤ r ≤ ⌊n/2⌋` suffice. (2) *Uniqueness of local Langlands correspondences* (6.5). Let `F/ℚ_p` be finite. Call a family of bijections `r_n`, `n ≤ n₀`, from the irreducible smooth representations of `GL_n(F)` onto the `n`-dimensional Frobenius-semisimple Weil–Deligne representations over `ℂ` a local Langlands correspondence in ranks `≤ n₀` if it is given by reciprocity in rank one, sends supercuspidal representations to irreducible representations of the Weil group, matches central characters with determinants, obeys the segment rule, and matches the Rankin–Selberg `ε`-factors of pairs of supercuspidal representations with the Langlands–Deligne local constants; then there is at most one such correspondence. (3) *The exponent bound* (6.3). If `F` is a nonarchimedean local field and `π ≅ δ₁ν^{α₁} × ⋯ × δ_rν^{α_r}` is an irreducible unitary generic representation of `GL_n(F)`, with `δ_i` unitary square-integrable and `α_i` real, then `|α_i| < 1/2` for every `i`. (4) *Satake bounds* (3.4, 7.2). Let `K` be a nonarchimedean local field with residue cardinality `Q`. If a character of the spherical Hecke algebra of `GL_n(K)` has a bounded spherical function, for instance if it is the eigencharacter of a spherical vector of a unitarisable representation, its Satake parameters satisfy `Q^{−(n−1)/2} ≤ |α_i| ≤ Q^{(n−1)/2}`; the same holds for the unramified unitary group in `n` variables over an unramified quadratic extension `E/F`, with `Q` the residue cardinality of `E`. Consequently, for a quadratic extension `E/F` of number fields, an irreducible automorphic representation `π` of a unitary group `U(V)` occurring in `L²` and a unitary Hecke character `χ` of `E`, the partial standard `L`-function `L^S_E(z, BC(π) ⊗ χ)` outside a finite set `S` of places containing the archimedean places and the ramification converges absolutely and is nonzero for `Re z > (n + 1)/2`.

In the family [RiemannHypothesisForDirichletLFunctions](../README.md), the Satake bounds and the standard `L`-function of a one-dimensional representation of a unitary group serve the theta lifts between definite unitary groups, the converse theorem and the uniqueness of local Langlands correspondences serve the identification of the trace-defined correspondence with the classical one and a second route, in ranks at most three, to the base change of depth-zero supercuspidal representations (the first route, in every rank, is by unramified base change and does not use them), and the depth-zero comparison of Layer 2 serves the finite reductive groups.

Layer 1 characterises the tempered representations of `GL_n` as the irreducible products of unitary square-integrable representations. Layer 2 identifies the depth-zero part of a Jacquet module with Harish-Chandra restriction on the finite reductive quotient of a parahoric subgroup, through the invertibility of a positive Hecke operator, which is proved with the Hecke algebras of depth-zero types. Layer 3 bounds Hecke eigenvalues by bounded coefficients, states the Macdonald formula for every residue cardinality, sums the unitary doubling series, and deduces the Satake bounds for bounded spherical functions. Layer 4 states the Zelevinsky classification and the properties of the classical correspondence that Layer 6 uses, with a Check that they do not determine it. Layer 5 defines the generalized Riemann hypothesis of a unitary cuspidal representation of `GL_n`. Layer 6 proves the convergence of the mirabolic self-pairing of a square-integrable representation near `s = 0`, the reduction of `γ`-factors of pairs to supercuspidal representations, the exponent bound, the local converse theorem and the uniqueness of local Langlands correspondences, and defines the generalized Riemann hypothesis of a Rankin–Selberg pair. Layer 7 computes the standard `L`-function of the trivial representation of a unitary group, with the form for a one-dimensional representation as a remark, and proves the Satake bounds for unitary unramified representations with the absolute convergence they give. The layers follow the order of the sections of the home roadmaps that they extend; Layer 1 uses the classification of Layer 4, which does not use Layer 1.

## Conventions

`F` and `K` are nonarchimedean local fields, of any characteristic unless a target says otherwise, with ring of integers `𝒪`, uniformiser `ϖ`, residue field `k` and residue cardinality `q`; where a target works over `K`, or over an unramified quadratic extension `E` of `F`, the residue cardinality is written `Q` (`Q = q²` for `E`). Representations are on complex vector spaces and smooth, except in 3.1, where `ρ` need not be smooth. `ν = |det|`, and `×` is normalised parabolic induction. Segments `Δ`, the representations `Z(Δ)` and `L(Δ)`, multisegments and linked segments are those of SmoothRepresentationsOfLocalGroups §SR.5.2 *segment-representations*. `ψ` is a nontrivial additive character, `𝒲(π, ψ)` the Whittaker model, and `L(s, π × τ)`, `ε(s, π × τ, ψ)` and `γ(s, π × τ, ψ)` the Rankin–Selberg factors of AutomorphicLFunctionsAndLocalFactors §§AL.3.2.3, AL.3.3.2. `ℋ(G, K)` is the convolution algebra of finitely supported bi-`K`-invariant functions on `G`. Satake transforms, spherical parameters and their normalisations are those of SmoothRepresentationsOfLocalGroups §§SR.4.1–SR.4.4, the base-change parameter `BC(α)` of an unramified unitary group being that of SmoothRepresentationsOfLocalGroups §SR.4.4 *paired-unitary-parameter*. Weil–Deligne representations, their Frobenius semisimplicity, sums, tensor products, duals and determinants are those of SmoothRepresentationsOfLocalGroups §SR.5.2 *wd-raw-parameters*, *wd-parameter-operations*, and the Weil group and the reciprocity map those of ClassFieldTheory layer 9; 6.5 says which Frobenius normalisation each correspondence uses. `Sp(b)` is the special representation of SmoothRepresentationsOfLocalGroups §SR.5.2 *wd-parameter-operations*: the Weil group acts on the basis vector `e_i`, `0 ≤ i < b`, by `ω^i`, where `ω(w) = q^{deg w}` and arithmetic Frobenius has degree one, and `Ne_i = e_{i+1}`. In the segment rules of 4.2 and 6.5 the segment attached to `ρ ⊗ Sp(b)` has the supercuspidal representation matched with `ρ` as its last member (4.2, arithmetic normalisation) or its first member (6.5, geometric normalisation); it is not centred at it.

Italic labels such as *satake-transform* name targets of SmoothRepresentationsOfLocalGroups and are cited with their section. Notation and conventions not restated here are those of the home roadmaps: SmoothRepresentationsOfLocalGroups (its Conventions and Layers SR.0–SR.5), AutomorphicLFunctionsAndLocalFactors (its Conventions and Layers AL.2–AL.4) and AutomorphicLFunctionsAndLocalFactorsPartII (its Conventions and §§2.3, 3.4).

**Statements of the formal proof.** Where a target names [FormalProof], the form that proof establishes is recorded at the target: its
hypotheses, ranges and constants are those of the proof, including restrictions that the route written here does not
visibly use. A wider or sharper form stated beside it is not in [FormalProof]; the `*Origin:*` label of the section says
where it comes from, and it is proved by the route written here.

**Labels.** Under each section heading, `*Origin:*` says where its statement comes from and
`*Method of the formal proof:*` how [FormalProof] proves it. The definitions of 5.1 and 6.6 carry the first label only.
The statements of 6.1 and 6.2 are not statements of [FormalProof]: 6.2 reduces to supercuspidal representations a
published theorem, cited with it; 6.1 is published at `s = 0`, cited with it, and is this roadmap's own formulation on the
rest of its half-plane. For 4.2 and 6.5 the second label says what [FormalProof] states in their place.

**Corollaries of general theorems.** A section may carry, as a third line under these two labels, `*Corollary of:*`,
which names a general theorem and the roadmap section that states it, and the clauses it covers when it does not cover
the whole section. As long as that general theorem is not in the library, what the line covers is proved as
[FormalProof] proves it: the `*Method of the formal proof:*` label says how, and for which form of the statement when
that proof has a narrower one; the route given with the section is that proof's unless the label says that it differs.
Once the general theorem is in the library, the proof of what the line covers is replaced by the deduction from it, and
the lemmas that only the first proof uses are removed. The statement does not change.

## Layer 1: Tempered representations of general linear groups

This layer extends SmoothRepresentationsOfLocalGroups §SR.3.3: for `GL_n` the tempered representations are the irreducible products of unitary square-integrable representations, which makes the Langlands classification of that section unconditional for `GL_n`.

### 1.1 Tempered representations of `GL_n` are irreducible products of unitary square-integrable representations

*Origin:* published: Zelevinsky (1980), Theorem 9.7 (a) with Bernstein's Theorem 9.3 there, the irreducibility of the
products of the representations `L(Δ)` of pairwise unlinked segments and the essentially square-integrable
representations as the `L(Δ)`, from which the characterisation follows for `GL_n` over every nonarchimedean local field.

*Method of the formal proof:* for `F` of characteristic zero: a tempered `π` is the Langlands quotient `L(𝔪)` of the
product of its factors `L(Δ)`; Casselman's inequalities force the exponents of these factors to vanish, so they are
unitary square-integrable, and their product, unitarisable of finite length with a unique irreducible quotient, is
irreducible and equal to `π`. Conversely the exponents of such a product are computed by the geometric lemma, and
Casselman's criterion shows that it is tempered. The route written below is not this proof's: it takes the
irreducibility of the products from the criterion on linked segments, 4.1 (ii), and the characterisation from 4.1 (v).

*Corollary of:* EndoscopicTransferAndUnitaryTraceComparison §2.16, the paragraph on `GL_r(D)`, `D` a central division
algebra over `F` (for `F` of characteristic zero and `D = F`, the characterisation and the irreducibility of the
products: a unitary induction from a unitary square-integrable representation of a Levi subgroup is irreducible, and
every irreducible tempered representation is such an induction by the tempered support of
SmoothRepresentationsOfLocalGroups §SR.3.3, which that paragraph takes as its input; over `F` of positive
characteristic, and for the consequence for *harish-chandra-tempered-support*, the route below stays).

For `GL_n` over any nonarchimedean `F` (the family uses it for `F` of characteristic zero): an irreducible `π` is
tempered iff `π ≅ δ₁ × ⋯ × δ_h` with `δ_i` unitary
square-integrable, and every such product is irreducible; hence SmoothRepresentationsOfLocalGroups §SR.3.3 *harish-chandra-tempered-support* holds for `GL_n`
and SmoothRepresentationsOfLocalGroups §SR.3.3 *langlands-classification* is unconditional for `GL_n`. For `F` of
characteristic zero the characterisation of tempered representations is [FormalProof],
`Development/AbelianVarietyTheory/PublishedTheorems/GaloisGeometry₂/TemperedProductOfSquareIntegrable.lean`
(`GlobalTheory.Published.TemperedProductOfSquareIntegrable`). *Route:* the irreducibility of the products is 4.1 (ii)
(Zelevinsky 1980, Theorem 9.7 (a)): by 4.1 (v) a unitary square-integrable representation is `L([ρν^{−x}, …, ρν^{x}])` with `ρ`
unitary supercuspidal (its central character being unitary), two such segments on one line `{ρν^y}` have the same centre, so
one contains the other, and no two are linked; the characterisation of tempered representations then follows from 4.1 (v).
In characteristic zero the irreducibility of these products is also EndoscopicTransferAndUnitaryTraceComparison §2.16
(for `GL_r(D)`, with `D = F`) and the case `k = 1` of the unitary classification of AutomorphicSpectralTheory §7.0b.
*Needs:* 4.1; SmoothRepresentationsOfLocalGroups §SR.3.3
*casselman-criterion*, §SR.2.3 *casselman-pairing*.

### Examples

1.1 has no worked Check; its smallest instances, stated without proof, are these. For `n = 1` every irreducible representation is a character, tempered exactly when it is unitary, and it is its own one-factor product (instance of 1.1). For `n = 2` and unitary characters `χ₁`, `χ₂` of `F^×`, the unitary principal series `χ₁ × χ₂` is irreducible and tempered, and the Steinberg representation is tempered, being square-integrable with unitary central character (instances of 1.1 with `h = 2` and `h = 1`).

### Dependencies

Layer 4 (4.1, which does not use this layer); SmoothRepresentationsOfLocalGroups §§SR.2.3, SR.3.3; EndoscopicTransferAndUnitaryTraceComparison §2.16 (of which 1.1 is a corollary for `F` of characteristic zero).

## Layer 2: Depth-zero representations and Jacquet modules

This layer extends SmoothRepresentationsOfLocalGroups Layer SR.2a: for a parabolic subgroup and a point of the building, the depth-zero part of the Jacquet module is Harish-Chandra restriction on the finite reductive quotient of the parahoric subgroup.

### 2.1 Depth-zero representations and Jacquet modules

*Origin:* published: Dat (2009), Proposition 3.1 with Proposition 6.2 (i), and Proposition 6.3 (ii): for every connected
reductive `G`, every point `x` and every smooth `π`, the projection maps `π^J` isomorphically onto `(π_N)^{M_{x,0+}}`
((b), (d)), and depth zero is read on the supercuspidal support ((a)); for admissible `π` and the Levi subgroup attached
to `x`, Moy and Prasad (1996), Proposition 6.7. Clause (c) is this roadmap's own formulation.

*Method of the formal proof:* for `GL_n`, the vertex fixed by `GL_n(𝒪)` and a standard parabolic subgroup: surjectivity,
for admissible `π`, is Jacquet's lemma with a contracting central element of `M`, and injectivity is proved by induction
on the exponents of a diagonal element, each step using that in a representation of `GL_n(k)` the sum over one unipotent
radical is injective on the invariants of the opposite one; that finite statement is proved by induction on pairs of
orthogonal idempotents in the matrix ring, every matrix `X` having a `Y` with `XYX = X`. The route written below is not
this proof's for the injectivity in (d), which it proves through (c), the invertibility of `T_z` in `H(G, J)`, by
reduction to a cuspidal representation of the finite Levi quotient and a gallery in the Hecke algebra of a depth-zero
type; (a) and the surjectivity are proved as in the route below, for `GL_n` and that vertex.

*Corollary of:* SmoothRepresentationsOfLocalGroups §SR.7.1 (clauses (a), (b) and (d): for every connected reductive `G`,
every point `x` of the building of `M` and every smooth `π`, `π^J ≅ (π_N)^{M_{x,0+}}`, and an irreducible `π` has depth
zero iff its cuspidal support has).

Complex coefficients. Let `G` be a connected reductive group over a nonarchimedean local field `F`, `S` a maximal split torus, `x` a point
of the apartment of `S`, `G_{x,0} ⊃ G_{x,0+}` the parahoric subgroup and its pro-unipotent radical (ReductiveGroupsPartII
§RG2.3.6), and `P = MN` a parabolic subgroup with Levi subgroup `M ⊃ S`. Put `J = G_{x,0+}(N ∩ G_{x,0})`, a compact
open subgroup normalised by `M_{x,0}`, with Iwahori decomposition `J = (N̄ ∩ G_{x,0+})·M_{x,0+}·(N ∩ G_{x,0})`
(ReductiveGroupsPartII RG2.4 *iwahori-factorization*, for `G_{x,0+}`). An
irreducible smooth `π` has **depth zero** if `π^{G_{y,0+}} ≠ 0` for some point `y` of the building.
(a) An irreducible `π` has depth zero iff every member of its supercuspidal support (SmoothRepresentationsOfLocalGroups §SR.3.1 *cuspidal-support*) has
depth zero.
(b) For every smooth `π` the projection `π → π_N` induces a surjection `π^J → (π_N)^{M_{x,0+}}` of representations of
`M_{x,0}/M_{x,0+}`.
(c) Let `z ∈ Z(M)` be strongly positive for `(P, J)` in the sense of SmoothRepresentationsOfLocalGroups §SR.1.4 *iwahori-decomposition*; equivalently
`z(N ∩ J)z⁻¹ ⊂ N ∩ J`, `z⁻¹(N̄ ∩ J)z ⊂ N̄ ∩ J`, and the conjugates `z^{−m}(N ∩ J)z^m` exhaust `N`. Then
`T_z = 1_{JzJ} ∈ H(G, J)` (`vol J = 1`) is invertible.
(d) For every smooth `π` the surjection of (b) is an isomorphism `(π^{G_{x,0+}})^{N ∩ G_{x,0}} = π^J ≅ (π_N)^{M_{x,0+}}`:
Harish-Chandra restriction of the representation `π^{G_{x,0+}}` of the finite reductive quotient
`G_{x,0}/G_{x,0+}` to its Levi quotient `M_{x,0}/M_{x,0+}` is the depth-zero part of the Jacquet module. In particular,
if `π` is supercuspidal, `π^{G_{x,0+}}` is a cuspidal representation of `G_{x,0}/G_{x,0+}`. For `G = GL_n`, `x` the vertex
fixed by `GL_n(𝒪)` and `P` standard: `(π^{K₁})^{N(k)} ≅ (π_N)^{M∩K₁}` as `M(k)`-modules.

The case that this family uses is `G = GL_n`, `x` the vertex fixed by `GL_n(𝒪)` and `P` a standard parabolic
subgroup: there the map `(π^{K₁})^{N(k)} → (π_N)^{M∩K₁}` is injective for every smooth `π` and bijective for every
admissible `π`, and an irreducible `π` has `π^{K₁} ≠ 0` if and only if every member of its supercuspidal support
has nonzero invariants under the corresponding subgroup of its own group ("if" being used for `F` of
characteristic zero). For "only if" the form that the family uses is
[FormalProof], `Development/AbelianVarietyTheory/PublishedTheorems/GaloisCohomology₂/DepthZeroSupport.lean`
(`GlobalTheory.Published.DepthZeroSupport`). The bijectivity for every admissible `π` is [FormalProof],
`Development/AbelianVarietyTheory/PublishedTheorems/GaloisGeometry₂/MoyPrasadJacquetIsoTrivial.lean`
(`GlobalTheory.Published.MoyPrasadJacquetIso`). The injectivity for every smooth `π` is [FormalProof],
`Development/AutomorphicSpectrum/Proofs/BlockDecomposition/FixedInjSmooth.lean`
(`GlobalTheory.CompanionTheory.DepthZeroJac.fixed_inj_smooth`); the form that its uses take is the one for irreducible
`π`, `Development/AbelianVarietyTheory/PublishedTheorems/GaloisGeometry₂/DepthZeroJacquetInjective.lean`
(`GlobalTheory.Published.DepthZeroJacquetInjective`), derived from the bijectivity and the admissibility of irreducible
representations.
The statements (a)–(d) for a general `G`, a general point `x` and every smooth `π` go beyond
that case; in that generality (a), (b) and (d) are Dat 2009, Proposition 3.1 with Proposition 6.2 (i), and
Proposition 6.3 (ii), and (c) is this roadmap's, by the route below.

*Route.* (a) "⇒": let `π ↪ i_P σ` with `σ` supercuspidal on `M` (SmoothRepresentationsOfLocalGroups §SR.3a.1 *jacquet-subrepresentation*), and `π^{G_{x,0+}} ≠ 0` for
some `x`, which may be taken in the apartment of a maximal split torus `S ⊂ M`. Then `G = P·N_G(S)·G_{x,0}`: choose a
chamber `C` of the apartment of `S` with `x` in its closure, a special vertex `v` in the closure of `C`, `K = G_{v,0}`, a
minimal parabolic subgroup `P_0 = Z_G(S)U_0 ⊂ P`, the Iwahori subgroup `I₀ = G_{C,0} ⊂ K ∩ G_{x,0}`, and the Iwahori subgroup
`I₁ ⊂ K` that is the preimage of the image of `P_0 ∩ K` in `K/G_{v,0+}`; then `I₁ = (I₁ ∩ P_0)(I₁ ∩ Ū_0)` with
`I₁ ∩ Ū_0 ⊂ G_{v,0+}`, which is normal in `K` and contained in `I₀`. As `I₀ = ẏI₁ẏ⁻¹` for some `ẏ ∈ N_K(S)`, the Bruhat
decomposition of `K` over `I₁` gives `K = ⊔_{w∈W_v} I₁ẇI₀` (`W_v` the finite Weyl group at `v`), and
`P_0I₁ẇI₀ = P_0ẇ(ẇ⁻¹(I₁ ∩ Ū_0)ẇ)I₀ = P_0ẇI₀`; with the Iwasawa decomposition `G = P_0K`, `G = ⋃_w P_0ẇI₀ ⊂ P·N_G(S)·G_{x,0}`
(ReductiveGroupsPartII RG2.4 *iwasawa-decomposition*, *parahoric-double-cosets*). A
`G_{x,0+}`-invariant vector of `i_P σ` is determined by its values on representatives `g = nk`, `n ∈ N_G(S)`,
`k ∈ G_{x,0}`, of `P\G/G_{x,0+}`, and its value at `g` is fixed by the image in `M` of `P ∩ gG_{x,0+}g⁻¹ = P ∩ G_{nx,0+}`,
which is `M_{nx,0+}` by the Iwahori decomposition of `G_{nx,0+}` (`nx` lies in the apartment of `S`;
ReductiveGroupsPartII RG2.4 *iwahori-factorization*). So
`σ^{M_{nx,0+}} ≠ 0` for some `n`: `σ` has depth zero. "⇐": if the supercuspidal support `σ` of `π` has depth zero,
conjugate within `M` so that `σ^{M_{y,0+}} ≠ 0` with `y` in the apartment of `S`, and choose `P` with `π_N ↠ σ` (first
adjointness); invariants under a compact open subgroup are exact, so `(π_N)^{M_{y,0+}} ≠ 0`, and (b) at `y` gives
`π^{G_{y,0+}} ⊃ π^J ≠ 0`. Neither direction uses (c). (b) Jacquet's lemma for the Iwahori-decomposed group `J`
(SmoothRepresentationsOfLocalGroups §SR.2a.1 *jacquet-lemma-smooth*, §SR.2.3 *jacquet-invariants* (1)), equivariant because `M_{x,0}` normalises `J` and `N`. (c) `T_z` commutes with the action of the finite group
`M_{x,0}/M_{x,0+}` (`M_{x,0}` normalises `J` and commutes with `z`), so it suffices to invert it on the isotypic part of
each irreducible representation `ρ` of `M_{x,0}/M_{x,0+}`. *Reduction to cuspidal `ρ`.* Let `ρ` have cuspidal support
`(L_x(k), τ)` in the finite group, `L ⊂ M` a Levi subgroup of a parabolic subgroup `P' = LN' ⊂ P` of `G` with
`S ⊂ L` and `L_{x,0}/L_{x,0+} = L_x(k)`, and `J' = G_{x,0+}(N' ∩ G_{x,0}) ⊃ J`. Such an `L` exists: it is the centraliser
in `M` of the subtorus of `S` lifting the split centre of the finite Levi subgroup `L_x(k)` (Moy–Prasad 1996, §6). Then `N ∩ J' = N ∩ J`, so `1_{JzJ}` and `1_{J'zJ'}` act by the same formula
on `π^{J'} ⊂ π^J`, the `ρ`-part of `π^J` is generated over `M_{x,0}` by the `τ`-part of `π^{J'}`, and `z ∈ Z(M) ⊂ Z(L)` is
positive for `(P', J')`. *Cuspidal `τ`.* `J'` is the pro-unipotent radical of the parahoric subgroup `G_{y,0} = L_{x,0}J'`
of a facet `y` with `G_{y,0}/G_{y,0+} = L_{x,0}/L_{x,0+}`, and the `τ`-part of `π^{J'}` is a module over the Hecke
algebra `H(G, G_{y,0}, τ)` of the type `(G_{y,0}, τ)`. The intertwining of `τ` is supported on `G_{y,0}N_τG_{y,0}` for a
group `N_τ` of elements of `N_G(S)` normalising the facet class of `y` and fixing `τ`, the element `T_n` supported on
`G_{y,0}nG_{y,0}` is unique up to a scalar, and `T_nT_{n'}` is a nonzero multiple of `T_{nn'}` when the lengths in the
relevant affine Weyl group add. A reduced gallery from `y` to `zy` writes `z` as a product of length-zero elements,
which normalise `G_{y,0}` and give invertible `T_n`, and of simple affine reflections `s`. For each `s` the computation
takes place in the finite reductive quotient `M_s` of the parahoric subgroup of the wall crossed, which contains
`L_{x,0}/L_{x,0+}` as the Levi subgroup of two opposite parabolic subgroups `P_1`, `P_2`. Three cases occur. (1) Some
element `s` of `N_{M_s}(L)` exchanges `P_1` and `P_2` and fixes `τ`: then `End(R_{L⊂P_1}^{M_s}τ)` is two-dimensional
(by the adjunction of ReductiveGroups 7c and the Mackey formula of 7d, `τ` being cuspidal and fixed by `s`), spanned by `1` and `T_s`, which is supported off the identity double coset; so `T_s` has trace zero on
`R^{M_s}τ`, two distinct eigenvalues, and these are nonzero, whence `T_s` satisfies a quadratic relation with nonzero
constant term and is invertible. (2) Such an `s` exists but does not fix `τ`: the step is the isomorphism
`R_{L⊂P_1}^{M_s}τ ≅ R_{L⊂P_2}^{M_s}τ` between the two Harish-Chandra inductions (ReductiveGroups 7e), an invertible
intertwining operator between the `τ`- and `^sτ`-parts. (3) No element of `N_{M_s}(L)` exchanges `P_1` and `P_2` (for
instance `L = GL₂ × GL₁` in `M_s = GL₃`): the step passes from the type of the facet `y` to the type `(G_{y′,0}, τ)` of the facet
`y′` on the other side of the wall, and is again the isomorphism of ReductiveGroups 7e between the two Harish-Chandra
inductions, read as an invertible intertwiner between the two types. The product along the gallery is a nonzero multiple of
`T_z` on the `τ`-part, which is therefore invertible (Morris 1993, Theorem 4.15, for the support of the intertwining,
and Theorem 7.12, for the structure of `H(G, G_{y,0}, τ)`; Bushnell–Kutzko 1998, Definition 8.1, for the invertible
element of a cover).
(d) Surjectivity is (b). Injectivity: by SmoothRepresentationsOfLocalGroups §SR.2a.1 *jacquet-lemma-smooth* the
projection is an isomorphism on the eventual range of `T_z` in `π^J`, which is all of `π^J` by (c). Directly: if
`v ∈ π^J` maps to `0` in `π_N`, then `∫_{N_c} π(n)v dn = 0` for some compact
open `N_c ⊂ N` (SmoothRepresentationsOfLocalGroups §SR.2.2 *jacquet-module*); `T_z^m v` is a positive multiple of `π(z^m)∫_{z^{−m}(N∩J)z^m} π(n)v dn`, and
`z^{−m}(N ∩ J)z^m ⊃ N_c` for large `m` by strong positivity, so `T_z^m v = 0` and `v = 0` by (c). Without (c) the argument
fails: for `J = G_{x,0+}` alone a depth-zero supercuspidal `π` has `π^J ≠ 0 = π_N`. The supercuspidal case: `π_N = 0`
for every proper `P`, so all Harish-Chandra restrictions of `π^{G_{x,0+}}` vanish. The comparison (d) is Dat 2009,
Proposition 3.1 with Proposition 6.2 (i), and, for admissible `π` and the Levi subgroup attached to `x`, Moy–Prasad 1996,
Proposition 6.7, beside Morris's treatment of the Hecke algebras of depth-zero types.

*Needs:* ReductiveGroupsPartII §RG2.3.6 *moy-prasad-filtration*, RG2.4 *iwasawa-decomposition*,
*parahoric-double-cosets*, *iwahori-factorization*;
ReductiveGroups Layers 7c–7e (Harish-Chandra functors of finite reductive groups, the
Mackey formula, independence of the parabolic); SmoothRepresentationsOfLocalGroups §SR.1.2 (the double-coset Hecke ring), §SR.1.4 *iwahori-decomposition*,
*positive-hecke-homomorphism*, §SR.2.2 *jacquet-module*, *parabolic-induction*, *first-adjointness*, §SR.2.3
*jacquet-invariants*, §SR.3a.1 *jacquet-subrepresentation*, §SR.3.1 *cuspidal-support*, §SR.2a.1 *jacquet-lemma-smooth*,
§SR.0.3.

**Checks.**
- `GL₂`, `π` an unramified principal series, `x` the vertex of `GL₂(𝒪)`, `P = B`: `π^{K₁} = Ind_{B(k)}^{GL₂(k)} 1`, whose
  `U(k)`-invariants are two-dimensional, as is `(π_N)^{T(𝒪)}`.
- (c) for `GL₂`, `x` that vertex, `P = B`: `J` is the pro-`p` Iwahori subgroup, `τ = 1` on `T(k)`, and
  `z = diag(ϖ, 1)` is the product of the length-zero element `ω = [[0, 1], [ϖ, 0]]` and a simple affine reflection `s`.
  `T_z T_{z⁻¹} = T_s² = (q − 1)T_s + q` is not a scalar; `T_z` is invertible because `T_s` is. For split `G`, `x` a
  hyperspecial vertex and `P` a Borel subgroup, `J` is the pro-`p` Iwahori subgroup and (c) is, after extension of
  scalars to `ℂ`, the case of strongly positive `z` of SmoothRepresentationsOfLocalGroups §SR.1.4 *pro-iwahori-torus*.
- Strong positivity is needed: for `M` the diagonal torus of `GL₃` and `z = diag(ϖ, 1, 1)`, `z(N ∩ J)z⁻¹ ⊊ N ∩ J`, but the
  conjugates `z^{−m}(N ∩ J)z^m` keep the entry `(2, 3)` in `𝒪` and do not exhaust `N`; for the block Levi `GL₁ × GL₂`
  the same `z` is strongly positive.
- (a) does not choose `P` among the parabolic subgroups with `x` in an apartment of `M`: for `GL₄`, `π = σ × σ'` with
  `σ, σ'` depth-zero supercuspidal representations of `GL₂(F)`, `x` the barycentre of the edge whose reductive quotient
  is `GL₂(k) × GL₂(k)` on the blocks `{1, 2}`, `{3, 4}`, and `M` the Levi subgroup on the blocks `{1, 3}`, `{2, 4}`, one
  has `π_N ≠ 0` and `π^J = 0`; the route of (a) uses the block parabolic of the supercuspidal support instead.
- A depth-zero supercuspidal `π`: `π_N = 0`, and `π^{K₁}` is a cuspidal representation of `GL_n(k)`, so
  `(π^{K₁})^{N(k)} = 0` for every proper `P`, as (d) requires; `π^{K₁}` itself is nonzero.
- `G = GL₁`: `J = 1 + ϖ𝒪`, `N = 1`, and (d) is the identity.

### Examples

From the Checks of 2.1: for `GL₂`, an unramified principal series `π`, the vertex of `GL₂(𝒪)` and `P = B`, `π^{K₁} = Ind_{B(k)}^{GL₂(k)} 1` has two-dimensional `U(k)`-invariants, as has `(π_N)^{T(𝒪)}`; the positive element `z = diag(ϖ, 1)` of `GL₂` is the product of a length-zero element and a simple affine reflection `s` with `T_s² = (q − 1)T_s + q`; for a depth-zero supercuspidal `π` of `GL_n(F)`, `π^{K₁}` is a nonzero cuspidal representation of `GL_n(k)`; and for `G = GL₁` the comparison (d) is the identity.

### Dependencies

SmoothRepresentationsOfLocalGroups §§SR.0.3, SR.1.2, SR.1.4, SR.2.2, SR.2.3, SR.2a.1, SR.3a.1, SR.3.1, and §SR.7.1, the general theorem of which 2.1 is a corollary; ReductiveGroupsPartII §RG2.3.6 and Layer RG2.4; ReductiveGroups Layers 7c–7e.

## Layer 3: Spherical functions, Satake parameters and Hecke bounds

This layer extends SmoothRepresentationsOfLocalGroups Layer SR.4: Hecke eigenvalues are bounded by bounded coefficients (3.1), the Macdonald formula holds for every residue cardinality (3.2), the length generating series of an unramified unitary group is summed against every spherical function (3.3), and bounded spherical functions of `GL_n` and of unramified unitary groups have Satake parameters in the expected annulus (3.4).

### 3.1 Hecke eigenvalue bound from bounded coefficients

*Origin:* this roadmap's own formulation: the bound `|θ(h)| ≤ ‖h‖₁` of a Hecke eigencharacter by a bounded coefficient,
with the spherical function `ω_θ` and the absolute convergence of the series of eigenvalues that it gives.

*Method of the formal proof:* (a) and (c): for (a), `ℓ` is applied to the translate by `g` of the eigen-identity, the sum
is bounded by `‖h‖₁` times `sup_g |ℓ(ρ(g)x)|`, and the supremum over `g` is taken; for (c), the triangle inequality for
the invariant norm gives `|θ(h)|·‖x‖ ≤ ‖h‖₁·‖x‖` directly.

Let `G` be a locally profinite
group, `K` a compact open subgroup, `ℋ(G, K)` the convolution algebra of finitely supported bi-`K`-invariant functions,
and `‖h‖₁ = Σ_{c∈G/K}|h(c)|`. Let `ρ` be a representation of `G` on a complex vector space (not assumed smooth), `x ≠ 0` a
`K`-fixed vector and `θ : ℋ(G, K) → ℂ` with `Σ_{c∈G/K} h(c)ρ(c)x = θ(h)x` for every `h`. Prove:

- (a) if some linear form `ℓ` has `ℓ(x) ≠ 0` and `sup_g |ℓ(ρ(g)x)| < ∞`, then `|θ(h)| ≤ ‖h‖₁` for every `h`;
- (b) `ω_θ(g) := θ(1_{KgK})/#(KgK/K)` is bi-`K`-invariant with `ω_θ(1) = 1` and `Σ_c h(c)ω_θ(gc) = θ(h)ω_θ(g)`, and the
  following are equivalent: `ω_θ` is bounded; `|ω_θ| ≤ 1`; `|θ(h)| ≤ ‖h‖₁` for all `h`;
- (c) the hypothesis of (a) holds if `ρ` is unitarisable (`ℓ = ⟨·, x⟩`);
- (d) for `h_m ∈ ℋ(G, K)`, `Σ_m θ(h_m)X^m` converges absolutely whenever `Σ_m ‖h_m‖₁|X|^m < ∞` and `|θ| ≤ ‖·‖₁`.

*Route.* (a) follows from
[FormalProof], `Development/AbelianVarietyTheory/Proofs/DecoratedLatticeProofs/SphericalParameterBoundSplitPlace.lean`
(`GlobalTheory.Core.Rk.BdSplit.norm_le_card`),
and (c) from [FormalProof], `Development/AbelianVarietyTheory/Proofs/TwistedOperators/NormLeCard.lean`
(`GlobalTheory.SatakeBound.Rep.norm_le_card`).
(a) With `M = sup_g |ℓ(ρ(g)x)| ∈ (0, ∞)`: `|θ(h)|·|ℓ(ρ(g)x)| = |Σ_c h(c)ℓ(ρ(gc)x)| ≤ ‖h‖₁M` for every `g`; take
the supremum over `g`. (b) `θ` is multiplicative; pairing both sides of the eigen-identity with the indicator functions
of double cosets gives the functional equation of `ω_θ`; a bounded `ω_θ` is a bounded coefficient of `x = ω_θ` under
right translation with `ℓ` the evaluation at `1`, so (a) gives `|θ(1_{KgK})| ≤ #(KgK/K)`, that is `|ω_θ| ≤ 1`. (c)
Cauchy–Schwarz. (d) Comparison of the two series term by term. *Needs:* SmoothRepresentationsOfLocalGroups §SR.0.4.

**Checks.**
- For the trivial representation `θ(1_S) = #S`: the bound is attained.
- `G = ℤ`, `K = 0`, `ρ(m) = z^m` with `|z| > 1`: the coefficient is unbounded and `|θ(1_{1})| = |z| > 1`; boundedness
  cannot be dropped.

### 3.2 The Macdonald formula for every residue cardinality

*Origin:* published: Macdonald (1979), chapter V, and, for split groups over a `p`-adic field, Haines, Kottwitz and
Prasad (2010), Theorem 5.6.1: the Satake transform of `1_λ` for `GL_n` over a nonarchimedean local field with residue
cardinality `Q` is `Q^{⟨λ, ρ⟩} P_λ(X; Q⁻¹)`.

*Method of the formal proof:* both sides satisfy, for every `r`, the recursion given by the Hecke operator of
`diag(ϖ, …, ϖ, 1, …, 1)`: on the spherical side by a count of cosets, on the other side because multiplication by `e_r`
is termwise on unnormalised Hall–Littlewood functions indexed by all exponent vectors; both obey the same rule under
rearrangement and agree at the identity, and a function with these properties is determined, by induction on the
distance from a constant vector. This is the textbook argument for `GL_n` through multiplication by the elementary
classes, arranged as a uniqueness statement in place of the isomorphism with the Hall algebra. The route written below
is not this proof's: with the count of the lattices in a double coset by their relative position against a flag it
names Hall–Littlewood branching, in place of the multiplication by `e_r` and the uniqueness statement.

*Corollary of:* SmoothRepresentationsOfLocalGroups §SR.4.3a (Macdonald's formula `S(1_λ) = Q^{⟨λ, ρ⟩} P_λ(X; Q⁻¹)` for
`GL_n` over every nonarchimedean local field, `Q` its residue cardinality).

This target extends SmoothRepresentationsOfLocalGroups §SR.4.3 *macdonald-formula*, which states, for `GL_n(E)` with `E/F` unramified quadratic and
`q = #k_F`, the formula `S(1_λ) = q^{⟨λ, 2ρ⟩} P_λ(X; q⁻²)`. For `GL_n(K)`, `K` any nonarchimedean local field with residue cardinality
`Q`, and `λ` dominant, prove `S(1_λ) = Q^{⟨λ, ρ⟩} P_λ(X; Q⁻¹)`, with the square root of `Q` chosen in SmoothRepresentationsOfLocalGroups §SR.4.1
*satake-transform*; for `K = E` unramified quadratic over `F` (`Q = q²`) this is `q^{⟨λ, 2ρ⟩} P_λ(X; q⁻²)`. The proof (the
count of the lattices in a double coset by their relative position against a flag, and Hall–Littlewood branching)
uses only the residue cardinality `Q`, not that it is a square. It follows from
[FormalProof], `GroundTheory/AutomorphicForms/MacdonaldFormula.lean`
(`GroundTheory.Automorphic.Spherical.macdonald_formula_hlR`).
*Needs:* SmoothRepresentationsOfLocalGroups §SR.4.3 *hall-littlewood*, *gln-generators*.

**Checks.**
- `n = 2`, `λ = (1, 0)`: `Q^{1/2}(X₁ + X₂)`, which is SmoothRepresentationsOfLocalGroups §SR.4.3 *gln-generators* for `r = 1`; for `n = 1`,
  `S(1_{(m)}) = X^m`.

### 3.3 The unitary doubling series

*Origin:* adapted from Shimura (1997), Theorem 1: the closed form of the local Hecke series of a unitary group weighted by
the norm of the denominator ideal, over a nonarchimedean local field of characteristic zero, the unitary counterpart of
Böcherer (1986) and Shimura (1994) for symplectic groups; here in the length `ℓ` against every spherical function, in
every characteristic and residue characteristic, with the region of absolute convergence in (b) and the exact disc in
(c), which are this roadmap's own formulation, and with the cell lemma (d), which is particular to this proof.

*Method of the formal proof:* induction on the Witt index: the cosets are parametrised by a power of the uniformiser, a
coset of the group of Witt index one less and a coset of the unipotent radical of the stabiliser of an isotropic line;
on each cell the length is computed exactly from the row and the corner of the unipotent element, the unipotent cosets
of given length are counted, the sum over the power of the uniformiser is a two-sided geometric series, and the rest is
the series of the smaller group at `q²X`. Shimura's proof counts on the cells of the Siegel parabolic subgroup, with the
Hecke series of `GL_n` and the count of Hermitian matrices by their denominators; the nearest published relative of the
induction along an isotropic line is Gritsenko (1994).

In the model of SmoothRepresentationsOfLocalGroups §SR.4.4: `E/F`
unramified quadratic (any residue characteristic), `q = #k_F`, `Q = q²`, `ϖ ∈ F` a uniformiser, `G_n` the unitary group
of the Hermitian form on `E^n` with antidiagonal Gram matrix, `K_n = G_n ∩ GL_n(𝒪_E)`, `Λ = 𝒪_E^n`, `r = ⌊n/2⌋`, `B_n` the
upper triangular elements; for `α ∈ (ℂ^×)^r`, `φ_α` the Borel-spherical function (`φ_α(bk) = (χ_αδ_B^{1/2})(b)`, `χ_α`
the unramified character with `χ_i(ϖ) = α_i`, `φ_α(1) = 1`) and `ω_α` the zonal spherical function of parameter `α`
(SmoothRepresentationsOfLocalGroups §SR.4.1 *satake-transform*, §SR.4.2 *spherical-parameter*; the trivial representation has `α_i = q^{n−1−2(i−1)}`). For `g ∈ G_n` let
`ℓ(g)` be the length of the `𝒪_E`-module `(Λ + gΛ)/Λ`, and put `y = q^{n−1}X`. Prove:

- (a) `ℓ` is bi-`K_n`-invariant, `ℓ(g) = λ_1 + ⋯ + λ_r` on the double coset of
  `diag(ϖ^{λ_1}, …, ϖ^{λ_r}, (1), ϖ^{−λ_r}, …, ϖ^{−λ_1})`, `λ_1 ≥ ⋯ ≥ λ_r ≥ 0`; `ℓ(g) = 0` if and only if `g ∈ K_n`; each set `{ℓ = m}` is a finite union of double
  cosets.
- (b) If `|y| < 1` and `|y||α_i| < 1`, `|y||α_i|⁻¹ < 1` for all `i`, then `Σ_{x∈G_n/K_n} |X|^{ℓ(x)}|φ_α(x)| < ∞` and
  `Σ_x X^{ℓ(x)}φ_α(x) = Σ_x X^{ℓ(x)}ω_α(x) = ∏_{j=0}^{n−1}(1 − (−q)^jX) / ( ∏_{i=1}^{r}(1 − yα_i)(1 − yα_i⁻¹) · (1 − y)^{ε_n} )`,
  `ε_n = 1` for odd `n` and `0` for even `n`.
- (c) `Σ_x X^{ℓ(x)} = ∏_{j=0}^{n−1}(1 − (−q)^jX)/(1 − q^{2j}X)` for `|X| < q^{−2(n−1)}`, and for `n ≥ 2` this is the exact
  disc of convergence.
- (d) *The cell lemma.* Let `n ≥ 2`, `N = n − 2`, `P_n` the stabiliser of the line `Ee_1` and `R` its unipotent radical,
  whose elements `u` have a row `ρ ∈ E^N`, a column `b ∈ E^N` and a corner `c ∈ E` (`ρ_j = −b̄_{N+1−j}`, `c + c̄ = ρ·b`). For
  `a ∈ ℤ`, `g₀ ∈ G_N` and `m = diag(ϖ^a, g₀, ϖ^{−a})`, choose integral matrices `U`, `V`, `C` with `g₀C` integral and
  `(U + Vg₀)C = 1` (so `C𝒪_E^N = 𝒪_E^N ∩ g₀⁻¹𝒪_E^N` and `v(det C) = ℓ(g₀)`); let `e₀(u)` be the least `e ≥ 0` with `ϖ^eρC`
  integral and `f₀(u)` the least `f ≥ 0` with `ϖ^f(c − ρ·(CVg₀b))` integral, and `a⁺ = max(a, 0)`. Then
  `ℓ(mu) = ℓ(g₀) − a + max(2a⁺, 2e₀(u), f₀(u))`; `f₀(u)` depends on the choice of `(U, V, C)`, but `max(2e₀(u), f₀(u))` does not
  (it is `ℓ(mu) − ℓ(g₀) + a` at `a ≤ 0`), so the formula is well defined; for `2e ≤ f`, `#{u ∈ R/(R ∩ K_n) : e₀(u) ≤ e, f₀(u) ≤ f} = q^{2ℓ(g₀)+2Ne+f}`;
  and for `|y| < 1`, `Σ_{u∈R/(R∩K_n)} X^{ℓ(mu)} = q^{2ℓ(g₀)+2(n−1)a⁺}X^{|a|+ℓ(g₀)}(1 − X)(1 + qX)/(1 − y²)`.

No hypothesis on the residue characteristic.

*Route.* (a) The bi-invariance and the value on the double cosets follow from
[FormalProof], `Development/AbelianVarietyTheory/Proofs/TwistedOperators/HasLenOfLatLen.lean` (`GlobalTheory.InertZeta.len`) and
[FormalProof], `Development/AbelianVarietyTheory/Proofs/TwistedOperators/SphericalDoublingSectionGraphDiagonalEq.lean`
(`GlobalTheory.UGraph.sphSec_io_diag`).
`ℓ(g)` is also the length of the row lattice `𝒪_E^n + 𝒪_E^n g` over `𝒪_E^n` (the dual of `Λ ∩ g⁻¹Λ`, `Λ` being
self-dual); bi-invariance is clear, and on the diagonal representatives of the Cartan decomposition (as SmoothRepresentationsOfLocalGroups §SR.4.1 *satake-transform*
takes it) the length is the sum of the positive exponents. (d) is
[FormalProof], `Development/AbelianVarietyTheory/Proofs/TwistedOperators/HasLenOfLatLen.lean`: the length formula, in
the equivalent form at the end of *Length* below, is `GlobalTheory.InertZeta.Pointwise`, the count is
`GlobalTheory.InertZeta.SmallCorner` with `GlobalTheory.InertZeta.Count`, and the sum over the radical is
`GlobalTheory.InertZeta.GenFun`, with the coordinates and the group law of `R` from `GlobalTheory.InertZeta.Heis`. *Length.* The rows of `mu` are `ϖ^a(1, ρ, c)`,
`(0, (g₀)_i, (g₀b)_i)` and `(0, 0, ϖ^{−a})`. The projection of the row lattice to the first coordinate contributes
`max(−a, 0)`; its kernel `L′ ⊂ E^N ⊕ E` is generated by `𝒪_E^{N+1}`, the rows `((g₀)_i, (g₀b)_i)`, `(0, ϖ^{−a})` and
`ϖ^{a⁺}(ρ, c)`. Since `𝒪_E^N + 𝒪_E^Ng₀ = 𝒪_E^NC⁻¹` and `C⁻¹ = U + Vg₀`, the vectors `(wC⁻¹, wVg₀b)`, `w ∈ 𝒪_E^N`, lie in `L′`.
The lattice `L′₁` generated by all these except `ϖ^{a⁺}(ρ, c)` projects onto `𝒪_E^NC⁻¹` and meets `0 ⊕ E` in
`ϖ^{−max(a⁺, e₀)}𝒪_E`, by duality: `zb ∈ ϖ^{−t}𝒪_E` for all `z ∈ 𝒪_E^Ng₀ ∩ 𝒪_E^N` if and only if `b ∈ ϖ^{−t}(Λ ∩ g₀⁻¹Λ)^∨`,
if and only if `ϖ^tρC` is integral (`Λ` self-dual, `g₀` unitary). So `L′₁` has length `ℓ(g₀) + max(a⁺, e₀)` over
`𝒪_E^{N+1}`, and adding the one vector `ϖ^{a⁺}(ρ, c)` raises it by the least `k ≥ 0` with `ϖ^{k+a⁺}ρC` integral and
`ϖ^{k+a⁺}(c − ρ·(CVg₀b)) ∈ ϖ^{−max(a⁺, e₀)}𝒪_E`; the sum of the three contributions is the formula. Equivalently,
`ℓ(mu) ≤ |a| + ℓ(g₀) + j` if and only if `e₀ ≤ a⁺ + ⌊j/2⌋` and `f₀ ≤ 2a⁺ + j`. *Count.* The row map `R/(R ∩ K_n) → E^N/𝒪_E^N`
is onto, and its fibres are torsors under `T/(T ∩ 𝒪_E)`, `T` the elements of trace zero (two elements of `R` with the same
row differ by a central element whose corner has trace zero). The rows with `ϖ^eρC` integral, modulo integral rows,
are `ϖ^{−e}𝒪_E^NC⁻¹/𝒪_E^N`, of order `Q^{Ne+ℓ(g₀)}`. Over each of them a corner with `ϖ^f(c − ρ·(CVg₀b))` integral
exists when `2e ≤ f`: writing `b = x + g₀⁻¹y′` with `x, y′ ∈ ϖ^{−e}Λ`, the trace that the corner must have differs from
an admissible one by `±(h(x, x) − h(y′, y′))` modulo `ϖ^{−2e}𝒪_E`, of valuation at least `−2e ≥ −f`, and the trace is onto
`ϖ^{−f}𝒪_F` on `ϖ^{−f}𝒪_E`. The admissible corners then form a coset of `T ∩ ϖ^{−f}𝒪_E`, of index `q^f` over `T ∩ 𝒪_E`
(a saturated rank-one `𝒪_F`-module, in every residue characteristic). *Sum over the radical.* With `e = a⁺ + ⌊j/2⌋`
and `f = 2a⁺ + j`, `#{u : ℓ(mu) ≤ |a| + ℓ(g₀) + j} = q^{2ℓ(g₀)+2(n−1)a⁺}q^{2N⌊j/2⌋+j}`; Abel summation and
`Σ_j q^{2N⌊j/2⌋+j}X^j = (1 + qX)/(1 − y²)` give the last formula. (b) is
[FormalProof], `Development/AbelianVarietyTheory/Proofs/TwistedOperators/HasSumSpherical.lean`
(`GlobalTheory.InertZeta.hasSum_spherical`).
Induction on `r`; for `n ≤ 1`, `G_n = K_n` and both
sides are `1`. For `n ≥ 2` fix a representative `g₀(z)` of every `z ∈ G_N/K_N`; then
`(a, z, u) ↦ m(ϖ^a, g₀(z))uK_n` is a bijection `ℤ × G_N/K_N × R/(R ∩ K_n) → G_n/K_n` (the Iwasawa decomposition
`G_n = P_nK_n`; injectivity from the diagonal blocks), and `φ_α(m(ϖ^a, g₀)u) = α_1^aq^{−a(n−1)}φ_{α′}(g₀)`,
`α′ = (α_2, …, α_r)`, by the `B_n`-equivariance of `φ_α` (the exponents `n − 1 − 2i`, `i ≥ 1`, of `δ_{B_n}^{1/2}` are those
of `G_N`). By (d) the sum over `a ∈ ℤ` is `1/(1 − yα_1) + (y/α_1)/(1 − y/α_1) = (1 − y²)/((1 − yα_1)(1 − yα_1⁻¹))`, and
the sum over `z` is the series of `G_N` at `q²X`, which has the same `y`; the right side satisfies the same recursion,
since `(−q)^jq² = (−q)^{j+2}`. Absolute convergence: the same computation for `|X|`, `|α_i|` and `|φ_{α′}|`; for `n ≥ 2` the
three sums are finite exactly under the conditions of (b) (for `n ≤ 1` the series is the single term `1`, finite for every
`X`). Finally `φ_α` and `ω_α` have the same sum over every double coset
(each sum is the Hecke eigenvalue of its characteristic function), `X^{ℓ}` is constant on double cosets and so is
`ω_α`, so the absolute convergence and the value pass to `ω_α`. (c) is (b) at the trivial parameter, whose two
denominators together are `∏_{j<n}(1 − q^{2j}X)`; for `n ≥ 2` the pole at `X = q^{−2(n−1)}` is not cancelled, the
numerator vanishing only where `|X| ≥ q^{−(n−1)}`. *Needs:* SmoothRepresentationsOfLocalGroups §SR.4.1 *satake-transform* (the Iwasawa and Cartan decompositions of
this group, as it takes them), §SR.4.2 *spherical-parameter*, §SR.4.4 *paired-unitary-parameter*; elementary divisors over a discrete
valuation ring.

**Checks.**
- `n ≤ 1`: both sides are `1`.
- `n = 2`, trivial representation (`α = q`): the double coset of `diag(ϖ^m, ϖ^{−m})` (`m ≥ 1`) is the sphere of radius `2m`
  of the `(q + 1)`-regular tree, with `(q + 1)q^{2m−1}` points, so the series is
  `1 + Σ_{m≥1}(q + 1)q^{2m−1}X^m = (1 + qX)/(1 − q²X)`, which is the right side `(1 − X)(1 + qX)/((1 − q²X)(1 − X))`.
- `n = 2`, any `α ≠ ±1` (at `α = ±1` the limit as `α → ±1`): `ω_α(diag(ϖ^m, ϖ^{−m})) = q^{−m}(c(α)α^m + c(α⁻¹)α^{−m})` with
  `c(α) = (1 − q⁻¹α⁻¹)/((1 + q⁻¹)(1 − α⁻¹))`, and the series is `(1 − X)(1 + qX)/((1 − qαX)(1 − qα⁻¹X))`. On a cell,
  `ℓ = max(|a|, −a − v(c))`, the elementary divisors of `[[ϖ^a, ϖ^ac], [0, ϖ^{−a}]]`.
- `n = 3`: the double coset of `diag(ϖ^m, 1, ϖ^{−m})` has `(q³ + 1)q^{4m−3}` cosets (the vertices at distance `2m` from a
  hyperspecial vertex of the biregular tree of valencies `q³ + 1` and `q + 1`), for `α ≠ ±1` `ω_α = q^{−2m}(c(α)α^m + c(α⁻¹)α^{−m})`
  with `c(α) = (1 − q⁻²α⁻¹)(1 + q⁻¹α⁻¹)/((1 + q⁻³)(1 − α⁻²))` (at `α = ±1` the limit of this expression as `α → ±1`), and the
  series is
  `(1 − X)(1 + qX)/((1 − q²αX)(1 − q²α⁻¹X))` (the factor `1 − q²X` of the numerator cancels that of the parameter `1`).
- The coefficient of `X` is `q^{n−1}e_1(BC(α)) − Σ_{j<n}(−q)^j`, `BC(α) = (α_1, …, α_r, (1), α_r⁻¹, …, α_1⁻¹)`: the case
  `δ = 1` of SmoothRepresentationsOfLocalGroups §SR.4.4 *unitary-triangular-transform*. For the trivial representation it is `Σ_{j<n}(q^{2j} − (−q)^j)`, the number of
  cosets with `ℓ = 1`; for `n = 4`, `q = 2` there are `90` cosets with `ℓ = 1` and `6192` with `ℓ = 2`.
- The numerator carries `(−q)^j`, not `q^j`: with `q^j` the identity fails already for `n = 2` (the factor `1 + qX`).

### 3.4 Satake parameters of a bounded spherical function

*Origin:* adapted from Macdonald (1971), the characterisation of the bounded spherical functions of a simply connected
group of `p`-adic type by their parameters: here the bound `Q^{−(n−1)/2} ≤ |α_i| ≤ Q^{(n−1)/2}` that it gives for the
Satake parameter, stated for `GL_n(K)` and for the unramified unitary group `G_n` and read in case (ii) in the
base-change parameter.

*Method of the formal proof:* for `GL_n` the sum of a Borel-spherical function over the integral matrices of determinant
valuation `m`, counted by Hermite normal forms, is a complete homogeneous polynomial of the parameters, bounded by its
value for the trivial representation, so that `∏_i (1 − α_iY)⁻¹` has no pole in `|Y| < Q^{−(n−1)/2}`; for the unitary
group the length series of a bounded spherical function converges on the disc where that of the trivial representation
does, and its product with the denominator of the doubling series equals a numerator with no zero there.

Let (i) `G = GL_n(K)`, `K`
nonarchimedean with residue cardinality `Q`, `K₀ = GL_n(𝒪_K)`; or (ii) `G = G_n`, `K₀ = K_n`, as in
3.3, `Q = q²` the residue cardinality of `E`. Let `θ` be a character of `ℋ(G, K₀)` with Satake
parameter `α` (SmoothRepresentationsOfLocalGroups §SR.4.2 *spherical-parameter*), and suppose `ω_θ` is bounded (equivalently, by 3.1:
`θ` is the eigencharacter of a `K₀`-fixed vector with a bounded coefficient `g ↦ ℓ(ρ(g)x)`, `ℓ(x) ≠ 0`; in particular of a
spherical vector of a unitarisable representation). Prove that
`Q^{−(n−1)/2} ≤ |α_i| ≤ Q^{(n−1)/2}` for every `i`; in case (ii) the same holds for every entry of the base-change parameter
`(α_1, …, α_r, (1), α_r⁻¹, …, α_1⁻¹)` (SmoothRepresentationsOfLocalGroups §SR.4.4 *paired-unitary-parameter*).

Case (i) is `satake_bound_gl`. There `K₀` is `integralGL K n`, the image of the invertible matrices over `𝒪_K`; `ℋ(G, K₀)`
is Mathlib's Hecke coset ring `HeckeRing` of `GL_n(K)` and `K₀`, with integer coefficients and the ring structure of Tau Ceti,
whose basis element `[K₀gK₀]` is `1_{K₀gK₀}`, and `θ` is a ring homomorphism from it to `ℂ`; `ω_θ` is `sphericalFunction θ`;
and the Satake parameter is characterised by the eigenvalues `θ(T_r) = Q^{r(n−r)/2}e_r(α)`, `0 ≤ r ≤ n`, of the operators
`T_r = [K₀ diag(ϖ, …, ϖ, 1, …, 1) K₀]` (`heckeT`, with `r` entries `ϖ`) of SmoothRepresentationsOfLocalGroups §SR.4.3
*gln-generators*. The condition that `K₀` and `GL_n(K)` form a Hecke triple, which holds for every compact open subgroup, is
a hypothesis of the statement. For `K` of characteristic zero this statement follows from 3.1 and from the upper bound
for the parameter of a `K₀`-fixed eigenvector with a bounded coefficient ([FormalProof],
`Development/AbelianVarietyTheory/Proofs/DecoratedLatticeProofs/SphericalParameterBoundSplitPlace.lean`
(`GlobalTheory.Core.Rk.BdSplit.norm_le_of_isSatVecGL`), stated for the completions of number fields at their finite
places, which up to isomorphism are the nonarchimedean local fields of characteristic zero), applied to `θ` and to the character
`h ↦ θ(h^∨)`, `h^∨(g) = h(g⁻¹)`, whose spherical function is `g ↦ ω_θ(g⁻¹)` and whose parameter is `α⁻¹`. For `K` of
positive characteristic, and for a bounded spherical function that is not a coefficient of a unitarisable
representation, it is not a statement of [FormalProof]; it is proved by the route below, which uses only Hermite normal forms over
`𝒪_K` and SmoothRepresentationsOfLocalGroups §SR.4.3 *gln-generators*. The unitarisable case with the parameter read
from the unramified principal series is 7.2 (i) and holds over every `K`.

*Route.* By 3.1, `|θ(h)| ≤ ‖h‖₁` for every `h`. (i) Let `S_m ⊂ G/K₀` be the cosets of the
integral matrices whose determinant has valuation `m` (the sublattices of index `Q^m` of `𝒪_K^n`); it is `K₀`-stable,
`#S_m = h_m(Q^{n−1}, …, Q, 1)` by Hermite normal forms (`h_m` the complete homogeneous symmetric polynomial), and the
Satake transform of `1_{S_m}` is `Q^{m(n−1)/2}h_m(X_1, …, X_n)` (the same count weighted by the Borel-spherical function;
for `K = E` unramified quadratic over `F` this is EndoscopicTransferAndUnitaryTraceComparisonPartII §4.8).
So `|Q^{m(n−1)/2}h_m(α)| ≤ #S_m ≤ (m + 1)^{n−1}Q^{m(n−1)}`, and `Σ_m h_m(α)Y^m = ∏_i(1 − α_iY)⁻¹` converges on
`|Y| < Q^{−(n−1)/2}`, whence `|α_i| ≤ Q^{(n−1)/2}` (there is no numerator, so no cancellation). The lower bound comes in
the same way from the superlattices of index `Q^m`, whose transform is `Q^{m(n−1)/2}h_m(α⁻¹)`, with the same
cardinality. (ii) is [FormalProof],
`Development/AbelianVarietyTheory/Proofs/DecoratedLatticeProofs/SatakeTrivialBoundOfBoundedZonalSphericalUnitary.lean`
(`GlobalTheory.ZonalBound.trivialBound_of_bounded`).
Take `h_m = 1_{ℓ = m}`, a finite sum of double cosets (3.3 (a)). By
3.3 (c), `Σ_m ‖h_m‖₁R^m < ∞` for `0 ≤ R < q^{−2(n−1)}`, so `F(X) = Σ_m θ(h_m)X^m = Σ_x X^{ℓ(x)}ω_θ(x)` is
a power series converging on `|X| < q^{−2(n−1)}`. Near `0`, `F·D_α = ∏_{j<n}(1 − (−q)^jX)` with `D_α` the denominator of
3.3 (b); both sides are holomorphic on the disc, so the identity holds there. At a zero `X₀` of
`D_α` in the disc the right side would vanish, but `q^j|X₀| < q^{j−2(n−1)} ≤ 1` for `j ≤ n − 1`; so `D_α` has no zero in
the disc, that is `|α_i|^{±1} ≤ q^{n−1} = Q^{(n−1)/2}`. *Needs:* 3.1, 3.3; SmoothRepresentationsOfLocalGroups §SR.4.1
*satake-transform*, §SR.4.2 *spherical-parameter*, §SR.4.4 *paired-unitary-parameter*.

**Checks.**
- Sharp: the trivial representation of `GL_n(K)` has parameter `(Q^{(n−1)/2}, …, Q^{−(n−1)/2})`; that of `G_n` has
  `α_1 = q^{n−1} = Q^{(n−1)/2}`.
- For `n = 2` and `n = 3` the zonal spherical function of `G_n` is bounded if and only if `Q^{−(n−1)/2} ≤ |α| ≤ Q^{(n−1)/2}`
  (the formulas of the Checks of 3.3: `c(α) ≠ 0` when `|α| > 1`).
- The bound does not imply boundedness in rank two. `G_4`, `α = (q^{5/2}, q^{5/2})` satisfies it (`q^{5/2} < q³`); for the
  double coset `D` of `diag(ϖ, ϖ, ϖ⁻¹, ϖ⁻¹)`, `#(D/K₀) = q⁴(q + 1)(q³ + 1)`, while the `q⁸` cosets `ntK₀`, `n` in the integral
  points of the unipotent radical modulo those fixing `tK₀`, each contribute `α_1α_2q^{−4} = q` to `θ(1_D)` and all other
  contributions are positive, so `θ(1_D) ≥ q⁹ > #(D/K₀)` and `ω_θ` is unbounded. `GL_4`,
  `α = (Q^{3/2}, Q^{3/2}, Q^{−3/2}, Q^{−3/2})`: with `T_2 = 1_{K₀diag(ϖ, ϖ, 1, 1)K₀}`, `θ(T_2) = Q²e_2(α) = Q⁵ + 4Q² + Q⁻¹`
  exceeds `#(T_2) = (Q² + 1)(Q² + Q + 1)` (SmoothRepresentationsOfLocalGroups §SR.4.3 *gln-generators*).
- In (ii) `Q` is the residue cardinality of `E`: the trivial representation of `G_2` has `α = q`, and a bound `q^{1/2}`
  would be false for it.
- Boundedness is needed: every `α` is the parameter of an irreducible unramified representation (SmoothRepresentationsOfLocalGroups §SR.4.2).

### Examples

From the Checks of this layer: the trivial representation attains the bound of 3.1, `θ(1_S) = #S`; for `n = 2` and `λ = (1, 0)` the Satake transform of 3.2 is `Q^{1/2}(X₁ + X₂)`; for the unitary group in two variables and the trivial representation the series of 3.3 is `(1 + qX)/(1 − q²X)`, and for `n = 4`, `q = 2` there are `90` cosets with `ℓ = 1` and `6192` with `ℓ = 2`; the trivial representation of `GL_n(K)`, with parameter `(Q^{(n−1)/2}, …, Q^{−(n−1)/2})`, shows that the bound of 3.4 is sharp.

### Dependencies

SmoothRepresentationsOfLocalGroups §§SR.0.4, SR.4.1, SR.4.2, SR.4.3, SR.4.4, and §SR.4.3a, the general theorem of which 3.2 is a corollary.

## Layer 4: Zelevinsky classification and the classical correspondence

This layer extends SmoothRepresentationsOfLocalGroups Layer SR.5: it states the Zelevinsky classification of the irreducible representations of `GL_n(F)` (4.1) and the properties of the classical correspondence `rec` that Layer 6 uses (4.2).

### 4.1 The Zelevinsky classification

*Origin:* published: Zelevinsky (1980), Theorems 4.2, 6.1, 9.3 (Bernstein's) and 9.7, 3.1 with Proposition 3.4,
Proposition 8.5 and Corollary 7.5, for `GL_n` over every nonarchimedean local field; the form `L(𝔪′)` of (i) as recalled by Henniart (2002),
§§2.6, 2.8, its subquotient clause Tadić (1986), Proposition A.4, and the irreducibility of a product of two irreducible
unitarisable representations Bernstein (1984), as quoted in Tadić (1986), Theorem 2.5.

*Method of the formal proof:* for (iii), (iv), (vi) and Bernstein's theorem over every nonarchimedean local field, and
for (i) in the form `L(𝔪′)`, (ii) for two representations `Z(Δ)`, (v) and "generic ⇒ product" of (vii) over fields of
characteristic zero: `Z(Δ)` is the unique irreducible subrepresentation of `ρν^a × ρν^{a+1} × ⋯ × ρν^b`, its
Jacquet module being cut down to `ρν^a ⊗ ⋯ ⊗ ρν^b` by the subrepresentations induced from segments of length two; the
polynomial ring follows by unitriangularity of the products of segment representations, the classification by Langlands
quotients from socles and cosocles of ordered products, and Bernstein's theorem by Bernstein's argument with
distributions invariant under the mirabolic subgroup and derivatives of unitary representations. The reducibility of
`ρ × ρν` is obtained from complementary series (the Hermitian family `ρν^{−s} × ρν^{s}` cannot stay irreducible, the
exponents of unitary representations being bounded), where Zelevinsky's proof uses derivatives. The route written
below is not this proof's: it is Zelevinsky's, with derivatives, takes the subquotient clause of (i) from Tadić, and
derives Bernstein's theorem, in characteristic zero, from the unitary classification.

*Corollary of:* SmoothRepresentationsOfLocalGroups §SR.5.2a (the Zelevinsky classification, clauses (i)–(vi), and the
irreducibility of a product of two irreducible unitarisable representations, over every nonarchimedean local field;
clause (vii) is not in that section).

For `F` any nonarchimedean local field: (i) every irreducible `π` of `GL_n(F)` is `Z(𝔪)` for a unique multisegment
`𝔪`, and `L(𝔪')` for a unique `𝔪'`, and, for `F` of characteristic zero, `L(𝔪 + 𝔫)` is a subquotient of
`L(𝔪) × L(𝔫)` for any multisegments `𝔪`, `𝔫`; (ii) `Z(Δ₁) × ⋯ × Z(Δ_r)` and `L(Δ₁) × ⋯ × L(Δ_r)` are irreducible iff the
`Δ_i` are pairwise unlinked; (iii) the Jacquet module of `Z(Δ)` along the partition `(d, …, d)` is
`ρν^a ⊗ ⋯ ⊗ ρν^b` for `Δ = [ρν^a, …, ρν^b]`; (iv) `R = ⊕_n K₀(GL_n(F))` with the parabolic product is the
polynomial ring `ℤ[X_Δ]` on segments, `X_Δ = [Z(Δ)]`; (v) an irreducible `π` is essentially square-integrable iff
`π ≅ L(Δ)` for a segment `Δ`; (vi) if no member of the cuspidal support of `π₁` is `σ'ν^j` with `j ∈ {−1, 0, 1}` and `σ'`
in the cuspidal support of `π₂`, then `π₁ × π₂` is irreducible; (vii) an irreducible `π` is generic iff
`π ≅ L(Δ₁) × ⋯ × L(Δ_r)` for pairwise unlinked segments `Δ_i`, and the multisegment `Δ₁ + ⋯ + Δ_r` is then determined by
`π`. For `F/ℚ_p`, (vii) is the case of complex coefficients of SmoothRepresentationsOfLocalGroups §SR.5.2
*modular-generic-segments*. Of these clauses the family uses (iii), (iv) and (vi) over every nonarchimedean local field,
and (i) in the form `L(𝔪′)`, (ii) for products of two representations `Z(Δ)`, (v) and "generic ⇒ product" of (vii) over
fields of characteristic zero. Besides these clauses it uses Bernstein's theorem, which no clause of 4.1 states: a product
of two irreducible unitarisable representations is irreducible (Bernstein 1984, as quoted in Tadić 1986, Theorem 2.5;
SmoothRepresentationsOfLocalGroups §SR.5.2a *unitary-product-irreducibility*, over every nonarchimedean local field). For `F` of characteristic zero this follows from the
unitary classification of AutomorphicSpectralTheory §7.0b, whose blocks have irreducible finite products and exhaust the
unitary dual. The forms of (iii) and (iv) that the family uses are [FormalProof],
`Development/AbelianVarietyTheory/PublishedTheorems/TwistedTraceFormula/SegmentRepresentation.lean`
(`GlobalTheory.Published.SegmentRepresentation`)
and [FormalProof], `Development/AbelianVarietyTheory/PublishedTheorems/TwistedTraceFormula/ExistsCellOfIsSubquotient.lean`
(`GlobalTheory.Published.ZelevinskyPolynomialRing`). The form of (vi) is [FormalProof],
`Development/AbelianVarietyTheory/PublishedTheorems/GaloisGeometry₂/TotallyDisjointProductIrreducible.lean`
(`GlobalTheory.Published.TotallyDisjointProductIrreducible`), with its case in which no member of the supercuspidal
support of `π₁` is an unramified twist of a member of that of `π₂`,
`Development/AbelianVarietyTheory/PublishedTheorems/GaloisGeometry₂/UnlinkedProductIrreducible.lean`
(`GlobalTheory.Published.UnlinkedProductIrreducible`). The form of Bernstein's theorem, stated over every nonarchimedean
local field, is [FormalProof],
`Development/AbelianVarietyTheory/PublishedTheorems/TwistedTraceFormula/BernsteinUnitaryProductIrreducible.lean`
(`GlobalTheory.Published.BernsteinUnitaryProductIrreducible`). (iv) is also [FormalProof],
`Development/AbelianVarietyTheory/PublishedTheorems/TwistedTraceFormula/GrothendieckRingPolynomial.lean`
(`GlobalTheory.Published.GrothendieckRingPolynomial`). For `F` of characteristic zero: (i) in the form `L(𝔪′)`, with its
subquotient clause, is [FormalProof],
`Development/AbelianVarietyTheory/PublishedTheorems/GaloisCohomology₂/LanglandsExhaustionGL.lean`
(`GlobalTheory.Published.LanglandsExhaustionGL`) for the existence and [FormalProof],
`Development/AbelianVarietyTheory/PublishedTheorems/GaloisCohomology₂/LanglandsMultisegments.lean`
(`GlobalTheory.Published.LanglandsMultisegments`) for the uniqueness and the subquotient clause; (v) is [FormalProof],
`Development/AbelianVarietyTheory/PublishedTheorems/GaloisGeometry₂/EssSquareIntegrableSegments.lean`
(`GlobalTheory.Published.EssSquareIntegrableSegments`), with its case of square-integrable `π`,
`Development/AbelianVarietyTheory/PublishedTheorems/GaloisCohomology₂/SquareIntegrableSegment.lean`
(`GlobalTheory.Published.SquareIntegrableSegment`); and "generic ⇒ product" of (vii) is [FormalProof],
`Development/AbelianVarietyTheory/PublishedTheorems/GaloisCohomology₂/GenericUnlinkedGL.lean`
(`GlobalTheory.Published.GenericUnlinkedGL`).
*Route:* Zelevinsky (Ann. Sci. ÉNS 1980) with Bernstein–Zelevinsky derivatives
(SmoothRepresentationsOfLocalGroups §SR.5.1 *mirabolic-derivatives*) and the geometric lemma: (i), in the form `Z(𝔪)`, is
Theorem 6.1, and in the form `L(𝔪′)` it is the classification recalled in Henniart 2002, §2.8, p. 596, with §2.6, p. 595,
for the essentially square-integrable representations `L(Δ)`, and its subquotient clause is Tadić 1986, Proposition A.4,
over every nonarchimedean local field, with the route of SmoothRepresentationsOfLocalGroups §SR.5.2a;
(ii) is Theorems 4.2 and 9.7 (a); (iii) is 3.1, pp. 180–181 (Proposition 3.4, p. 181, gives the Jacquet modules along
the parabolic subgroups with two blocks); (iv) is Corollary 7.5; (v) is Bernstein's
Theorem 9.3, of which Zelevinsky derives "`L(Δ)` is essentially square-integrable" from Casselman's criterion and states the
converse without proof; (vi) is Proposition 8.5 with Theorem 6.1; (vii) is Theorem 9.7 (b). *Needs:* SmoothRepresentationsOfLocalGroups §SR.5.2
*segment-representations*, §SR.2.2 *geometric-lemma*, §SR.3.3 *casselman-criterion*, §SR.5.1 *mirabolic-derivatives*,
§SR.5.2a *zelevinsky-classification* (the subquotient clause of (i)).

### 4.2 Listed properties of the classical correspondence

*Origin:* published: Harris and Taylor (2001) and Henniart (2000), the local Langlands correspondence for `GL_n(F)` with
the properties listed; the segment rule as in Henniart (2002), §§2.3, 2.6–2.7. The selection of the properties and the
Check that they do not determine `rec` are this roadmap's own formulation.

*Method of the formal proof:* the formal proof states its laws not of `rec` but of a map of its own making, from the
irreducible representations of the groups `GL_n` over the completions of a number field to Weil–Deligne representations:
characters go to their compositions with a local reciprocity map, depth-zero supercuspidal representations over `ℚ_p`
and their twists by characters to irreducible tame parameters with prescribed inertial characters and with determinant
the central character, every other supercuspidal representation to an unramified twist of one fixed wildly ramified
irreducible parameter, and the other representations by the segment rule; the laws checked are those listed at the end
of 6.5, and the map is not injective, so it is not `rec`.

This target extends SmoothRepresentationsOfLocalGroups §SR.5.2 *classical-llc-normalization*, where the classical correspondence
`rec` is an owned input theorem, not a consequence of reconstruction. This owned input is the local Langlands
correspondence for `GL_n(F)`, `n ≥ 1`, in the arithmetic normalisation fixed there. Of its properties, the following are
stated and used: `rec_1` is the reciprocity of
ClassFieldTheory layer 9; `rec_n` is a bijection from the `n`-dimensional Frobenius-semisimple Weil–Deligne
parameters over `ℂ` onto the irreducible smooth representations of `GL_n(F)`; irreducible parameters with `N = 0`
go to supercuspidal representations; `rec_n(ρ ⊗ χ) = rec_n(ρ) ⊗ (rec_1(χ)∘det)`, `rec_n(ρ^∨) = rec_n(ρ)^∨`, the
central character of `rec_n(ρ)` is `rec_1(det ρ)`; and the segment rule
`rec(⊕_i ρ_i ⊗ Sp(n_i)) = L(Δ_1 + ⋯ + Δ_r)` for irreducible representations `ρ_i` of the Weil group, with
`Δ_i = [rec(ρ_i)ν^{1−n_i}, …, rec(ρ_i)ν^{−1}, rec(ρ_i)]` (SmoothRepresentationsOfLocalGroups §SR.5.2 *segment-representations*): in
the arithmetic normalisation `rec_1(ω) = |·|^{−1}`, so the weight `ω^j` of `Sp(n_i)` goes to `rec(ρ_i)ν^{−j}` (Henniart 2002,
§§2.3, 2.6–2.7, pp. 594–595, in the geometric normalisation, transported as in 6.5). The essentially AIG dual
(SmoothRepresentationsOfLocalGroups §SR.5.2 *essentially-aig*) and the supercuspidal support of the normalised fibre `π_norm(ρ)` of
SmoothRepresentationsOfLocalGroups §SR.5.2 *classical-llc-normalization* use only the segment rule and the supercuspidal clause. These properties do not determine `rec`; the property that does, the
matching of the `ε`-factors of pairs, involves the Rankin–Selberg factors, which are defined downstream of
SmoothRepresentationsOfLocalGroups, in AutomorphicLFunctionsAndLocalFactors §AL.3.3.2 (property 5 of 6.5).
*Needs:* SmoothRepresentationsOfLocalGroups §SR.5.2 *classical-llc-normalization*, *segment-representations*; ClassFieldTheory
layer 9.

**Checks.**
- The listed properties do not determine `rec`: composing it on supercuspidal classes with a
  permutation that commutes with twists by characters, with contragredients and with central characters, and
  extending by the segment rule, gives another family with all of them; for instance, exchange the twist orbits of
  two supercuspidal representations of `GL₂(F)` with the same central character and the same group of self-twists.
- The segment rule is not centred: `rec(Sp(2)) = L([ν^{−1}, 1]) = ν^{−1/2}St`, whose central character `|·|^{−1}` is
  `rec_1(det Sp(2)) = rec_1(ω)`. The centred segment `[ν^{−1/2}, ν^{1/2}]` would give `St`, whose central character is
  trivial, against the central-character property.

### Examples

From the Check of 4.2: exchanging the twist orbits of two supercuspidal representations of `GL₂(F)` with the same central character and the same group of self-twists, and extending by the segment rule, gives a second family with every property listed in 4.2. For 4.1, whose statement carries no worked Check, the smallest instance, stated without proof: for `n = 1` every irreducible representation is a character `χ`, and the multisegment of (i) is the single segment `[χ]` of length one (instance of 4.1 (i)).

### Dependencies

SmoothRepresentationsOfLocalGroups §§SR.2.2, SR.3.3, SR.5.1, SR.5.2; ClassFieldTheory layer 9.

## Layer 5: Riemann hypothesis for cuspidal automorphic representations

This layer adds to AutomorphicLFunctionsAndLocalFactors Layer AL.2 the predicate that states the generalized Riemann hypothesis for the completed standard `L`-function of a unitary cuspidal representation of `GLₙ(𝔸_K)`.

### 5.1 The generalized Riemann hypothesis of a cuspidal representation

*Origin:* definitions and conventions.

For a unitary cuspidal automorphic representation `π` of `GLₙ(𝔸_K)`, the *generalized Riemann hypothesis*
for `π` is the predicate `ZeroFreeRightOf (1/2)` (RiemannHypothesisStatementsAndConsequences §9.2) of its completed
standard L-function `Λ(s, π)` of AutomorphicLFunctionsAndLocalFactors §AL.2.4.1. For unitary `π` the contragredient is the complex conjugate, so
`Λ(s, π^∨) = conj Λ(conj s, π)`, and the functional equation `Λ(s, π) = ε(s, π) Λ(1 − s, π^∨)` makes
the zero set of `Λ(·, π)` invariant under `s ↦ 1 − conj s`: the hypothesis alone puts every zero of
`Λ(s, π)` on `Re s = 1/2`, and it is equivalent to the hypothesis for `π^∨`. When the completed
function is that of an `AnalyticLFunctionData` card it is the card's hypothesis
(RiemannHypothesisStatementsAndConsequences §9.3). For `n = 1` and a character of finite order it is the hypothesis of
RiemannHypothesisStatementsAndConsequences §9.5.

*Needs:* AutomorphicLFunctionsAndLocalFactors §AL.2.4.1; RiemannHypothesisStatementsAndConsequences §§9.2, 9.3, 9.5.

**Checks.**

- Unitarity is needed: `Λ(s, π ⊗ |det|^{−1/4}) = Λ(s − 1/4, π)`, so the zeros of the completed
  function of `π ⊗ |det|^{−1/4}` are those of `Λ(·, π)` shifted by `1/4`, symmetric about
  `Re s = 3/4`. `Λ(·, π)` has zeros and its zero set is invariant under `s ↦ 1 − conj s`, so it
  has a zero with real part at least `1/2`, whose shift has real part at least `3/4`: the
  threshold `1/2` makes the hypothesis false for `π ⊗ |det|^{−1/4}` whatever the zeros of
  `Λ(·, π)`.

### Examples

From the Check of 5.1: the twist `π ⊗ |det|^{−1/4}` shifts every zero of `Λ(·, π)` by `1/4`, so the predicate fails for it whatever the zeros of `Λ(·, π)`; unitarity cannot be dropped. For `n = 1` and a character of finite order the predicate is the hypothesis of RiemannHypothesisStatementsAndConsequences §9.5.

### Dependencies

AutomorphicLFunctionsAndLocalFactors §AL.2.4.1; RiemannHypothesisStatementsAndConsequences §§9.2, 9.3, 9.5; Tau Ceti's `TauCeti.LFunctions.AnalyticLFunctionData`.

## Layer 6: Local factors of pairs, converse theorem and Langlands characterisation

This layer extends AutomorphicLFunctionsAndLocalFactors Layer AL.3: the convergence of the mirabolic self-pairing of a square-integrable representation near `s = 0` (6.1), the reduction of `γ`-factors of pairs to supercuspidal representations (6.2), the exponent bound for unitary generic representations (6.3), the local converse theorem (6.4), the characterisation of local Langlands correspondences by `ε`-factors of pairs with their uniqueness (6.5), and the generalized Riemann hypothesis of a Rankin–Selberg pair (6.6).

### 6.1 The mirabolic self-pairing of a square-integrable representation near `s = 0`

*Origin:* published at `s = 0`: Jacquet, Piatetski-Shapiro and Shalika (1983), (8.2), the absolute convergence of the
mirabolic integral of a square-integrable `δ`, integrated over `K` (AutomorphicLFunctionsAndLocalFactors §AL.3.2.4); the
open range `σ > −ε_δ` and the bound uniform in `k ∈ K` are this roadmap's own formulation.

*Method of the formal proof:* none; the statement is not in [FormalProof].

Let `F` be a nonarchimedean local field, `ψ` nontrivial, and `δ` an irreducible representation of `GL_n(F)` that is
square-integrable modulo the centre with unitary central character (SmoothRepresentationsOfLocalGroups
§SR.3.3 *square-integrable-tempered*). Write `P = P_n` for the mirabolic subgroup, `N = N_n` for the upper unitriangular group,
`K = GL_n(𝒪)`, and `dp` for the right Haar measure on `N\P` for which `(W, W̃) ↦ ∫_{N\P} W(p)W̃(p) dp` is the `P`-invariant
pairing of the Kirillov models of `δ` and `δ^∨` (the case `σ = 1` below, AutomorphicLFunctionsAndLocalFactors §AL.3.2.2). Then there is `ε_δ > 0` such that for
all `W ∈ 𝒲(δ, ψ)`, `W̃ ∈ 𝒲(δ^∨, ψ⁻¹)` and every real `σ > −ε_δ` the integrals
`I_σ(W, W̃; k) = ∫_{N\P} |W(pk)W̃(pk)|·|det p|^{σ−1} dp` are finite, bounded in `k ∈ K`; so
`s ↦ ∫_K ∫_{N\P} W(pk)W̃(pk)|det p|^{s−1} dp dk` is holomorphic on `Re(s) > −ε_δ`, in particular near `s = 0`.
At `σ = 0`, integrated over `k ∈ K`, the finiteness is AutomorphicLFunctionsAndLocalFactors §AL.3.2.4, which asserts
only that point; the open range `σ > −ε_δ` and the bound uniform in `k` are stated here.

*Route* (sources: Jacquet–Piatetski-Shapiro–Shalika, *Rankin–Selberg convolutions* (1983), §2 for the
asymptotic expansion of Whittaker functions and §8 for square-integrable representations). The
restriction of a Whittaker function of `δ` to the diagonal torus of `P` is a finite sum of products of Schwartz functions and
finite functions whose exponents are the central exponents of the derivatives of `δ`; for square-integrable `δ` these
exponents satisfy the strict inequalities of Casselman's criterion (SmoothRepresentationsOfLocalGroups
§SR.3.3 *casselman-criterion*), which give the convergence of the weighted integral in a neighbourhood of `σ = 0`, and uniformity in
`k` because `W(·k)` runs through finitely many `K`-translates. For supercuspidal `δ` the Kirillov functions are compactly
supported modulo `N` and every `σ` is allowed. The remaining steps of the route are not given here.

*Needs:* AutomorphicLFunctionsAndLocalFactors §§AL.3.2.1, AL.3.2.2, AL.3.2.4; SmoothRepresentationsOfLocalGroups §SR.3.3 *square-integrable-tempered*,
*casselman-criterion*, §SR.5.1 (*mirabolic-derivatives*).

**Checks.**
- The Steinberg representation of `GL₂(F)` (`ψ` trivial on `𝒪`, not on `𝔭⁻¹`): its new vector has `W(diag(a, 1)) = |a|·1_𝒪(a)`,
  and `∫|W(diag(a, 1))|²|a|^{σ−1}d^×a = Σ_{m≥0} q^{−m(σ+1)}`, finite exactly for `σ > −1`.
- The hypothesis cannot be weakened to tempered: for a unitary unramified principal series of `GL₂(F)` with Satake
  parameters `α, β` of absolute value `1`, the spherical `W` has `|W(diag(ϖ^m, 1))|² = q^{−m}|Σ_{i+j=m}α^iβ^j|²`, and at
  `α = β = 1` the sum `Σ_m (m + 1)²q^{−mσ}` diverges at `σ = 0`.

### 6.2 Multiplicativity of `γ`-factors

*Origin:* published: Jacquet, Piatetski-Shapiro and Shalika (1983), Theorem 3.1, the multiplicativity of `γ`-factors of
pairs in both variables, over every nonarchimedean local field (AutomorphicLFunctionsAndLocalFactors §AL.3.3.2a); its
reduction to supercuspidal representations, with the comparison with EndoscopicTransferAndUnitaryTraceComparison §10.29,
is this roadmap's own formulation.

*Method of the formal proof:* none; the statement is not in [FormalProof].

Let `F` be a nonarchimedean local field, `ψ` nontrivial, `π` an irreducible generic representation of `GL_n(F)`, and
`τ` an irreducible generic representation of `GL_m(F)`. Then `τ` is the irreducible generic subquotient of a normalised
induction `σ₁ × ⋯ × σ_t` from supercuspidal representations `σ_j` of `GL_{m_j}(F)`, `m_1 + ⋯ + m_t = m`, and
`γ(s, π × τ, ψ) = ∏_j γ(s, π × σ_j, ψ)`, and symmetrically in the first variable: `γ(s, π × τ, ψ)` for generic `τ` is a
product of `γ`-factors against supercuspidal representations of ranks at most `m`. This is
AutomorphicLFunctionsAndLocalFactors §AL.3.3.2a (for the generic subquotient of a normalised induction from irreducible
generic representations the `γ`-factor is the product of those of the inducing representations, in both variables, over
every nonarchimedean `F`) applied to an induction `σ₁ × ⋯ × σ_t` from supercuspidal representations, which are generic, in
which `τ` embeds (SmoothRepresentationsOfLocalGroups §SR.3a.1 *jacquet-subrepresentation*, with the cuspidal support of
§SR.3.1) and whose only irreducible generic subquotient `τ` therefore is. For `F/ℚ_p` the identity also follows from EndoscopicTransferAndUnitaryTraceComparison §10.29, by
which both sides are the product of the factors `γ(s, σ × σ′, ψ)` over the pairs of members `σ`, `σ′` of the supercuspidal
supports of `π` and `τ`, counted with multiplicity; 6.2 holds for every nonarchimedean `F`, and 6.4 uses it in positive
characteristic as well.

*Needs:* AutomorphicLFunctionsAndLocalFactors §AL.3.3.2a; SmoothRepresentationsOfLocalGroups §SR.2.2
(*parabolic-induction*), §SR.3a.1 (*jacquet-subrepresentation*), §SR.3.1 (*cuspidal-support*).

**Checks.**
- `n = 1`, `π = χ`, `τ = χ₁ × χ₂` an irreducible principal series of `GL₂`: `γ(s, χ × τ, ψ) = γ(s, χχ₁, ψ)γ(s, χχ₂, ψ)`,
  Tate's factors.
- `L`-factors are not multiplicative in this generality: for the Steinberg representation `St` of `GL₂` and
  `π = |·|^{1/2}`, `L(s, π × St) = L(s + 1, 1)` while `L(s, |·|^{1/2}·|·|^{1/2})L(s, |·|^{1/2}·|·|^{−1/2}) = L(s+1,1)L(s,1)`;
  the target concerns `γ`, not `L`.

### 6.3 The exponent bound for unitary generic representations

*Origin:* published: Bernstein (1984), §8.9 with §9, the classification of the generic irreducible unitarisable
representations of `GL_n(F)`, which gives `|α_i| < 1/2` with the nonzero exponents in pairs `±α` with the same `δ`, also
Tadić (1986); the unramified case Jacquet and Shalika (1981); the pole of `L(s, δ × δ^∨)` at `s = 0`, Jacquet,
Piatetski-Shapiro and Shalika (1983), Proposition (8.1) with Theorem (8.2). The consequences for the supercuspidal
support are this roadmap's own formulation.

*Method of the formal proof:* Bernstein's route, for `F` of characteristic zero: a unitary structure on `π` gives a
positive Hermitian form on its Whittaker coinvariants for which the translates of a vector by the powers of a central
element of a Levi subgroup are summable with an explicit weight; for a vector of the product supported in the open cell
these translates are, modulo the Whittaker kernel, a geometric sequence in the central character of one factor
`δ_iν^{α_i}`, so summability forces its central exponent above `−1/2`, and reordering the factors and passing to the
contragredient give `|α_i| < 1/2` for every `i`. The route written below is not this proof's: it deduces the bound
from the pole of `L(s, δ × δ^∨)` at `s = 0`, the factors under induction and the absolute convergence of the local
integrals for `Re(s) ≥ 1`, in every characteristic.

*Corollary of:* AutomorphicLFunctionsAndLocalFactors §AL.3.3.8a (for `F` of characteristic zero: the exponents `α_i` of an
irreducible unitary generic representation of `GL_n(F)` satisfy `|α_i| < 1/2`, the nonzero ones in pairs `±α` with the
same square-integrable factor, and `L(s, δ × δ^∨)` has a pole at `s = 0` for unitary square-integrable `δ`; for `F` of
positive characteristic the route below stays).

Let `F` be a nonarchimedean local field and `π` an irreducible unitary generic representation of `GL_n(F)`. Write `π` as
an irreducible product `δ₁ν^{α₁} × ⋯ × δ_rν^{α_r}` with `δ_i` unitary square-integrable and `α_i` real (4.1 (v), (vii)). Then `|α_i| < 1/2` for every `i`. Part of the target: for a unitary square-integrable `δ`,
`L(s, δ × δ^∨)` has a pole at `s = 0`. In particular, if every `δ_i` is supercuspidal, two members `δ_iν^{α_i}`,
`δ_jν^{α_j}` of the supercuspidal support satisfy `|α_i − α_j| < 1`, and so do the characters `ν^{α_i}∘N_{L/F}` after any
finite extension `L/F`. The family uses the bound for `F` of characteristic zero, where the exponents `α_i ≠ 0` moreover
occur in pairs `±α` with the same `δ` (the complementary series); for `F` of positive characteristic the statement
rests on the route below alone. In characteristic zero the form that the family uses follows from
[FormalProof], `Development/AbelianVarietyTheory/PublishedTheorems/GaloisCohomology₂/IsComplementaryProductOfIsCuspidal.lean`
(`GlobalTheory.Published.GenericUnitaryDualGL`)
and [FormalProof],
`Development/WeilBound/CoreStatements/AutomorphicKernels/UnitaryDualGL/GenericUnitaryDual/GenericUnitaryDualGLHolds.lean`
(`PositivityTheory.Gud.Fin.genericUnitaryDualGL_holds`).

*Route.* (1) The pole. Take `Φ = 1_{𝒪^n}`, the characteristic function of `𝒪^n`, and write the equal-rank integral
`Ψ(s, W, W̃, Φ)` in the coordinates `g = z·p·k` (centre, mirabolic `P`, `K = GL_n(𝒪)`): the central characters of `δ` and `δ^∨`
cancel, and since `e_nk` is a primitive vector of `𝒪^n`, the inner integral
`∫_{F^×} Φ(z e_n k)|z|^{ns} d^×z = Σ_{m≥0} q^{−nms} = (1 − q^{−ns})^{−1}` for every `k ∈ K`. So
`Ψ(s, W, W̃, Φ) = (1 − q^{−ns})^{−1}∫_K ∫_{N\P} W(pk)W̃(pk)|det p|^{s−1} dp dk`. For square-integrable `δ` the double integral
converges absolutely and is holomorphic for `Re(s) > −ε_δ` (6.1; the unitary convergence of AutomorphicLFunctionsAndLocalFactors §AL.3.2.2 gives only
`Re(s) ≥ 1`, the unweighted pairing being the value at `s = 1`). Take `W ≠ 0` and `W̃ = W̄`, which lies in `𝒲(δ^∨, ψ⁻¹)` because
`δ` is unitary (`δ^∨ ≅ δ̄`); at `s = 0` the double integral is `∫_K ∫_{N\P}|W(pk)|²|det p|^{−1} dp dk > 0` (the integrand is
continuous, nonnegative and not identically zero, since `GL_n(F) = Z·P·K` and `|W(zg)| = |W(g)|`). Hence `Ψ` has a pole at
`s = 0`, and so has the generator `L(s, δ × δ^∨)` of AutomorphicLFunctionsAndLocalFactors §AL.3.2.3, `Ψ/L` being a Laurent polynomial in `q^{−s}`
(Jacquet–Piatetski-Shapiro–Shalika 1983, §8). A test function `Φ` vanishing near `0`, supported on a compact set
`C ⊂ F^n ∖ {0}`, gives an entire inner integral: `e_nk` is primitive, so `‖ze_nk‖ = |z|` for the sup norm, and only the `z` with
`|z|` between the minimum and the maximum of the norm on `C` contribute, finitely many valuations, so the inner integral
is a Laurent polynomial in `q^{−s}`. These `z` need not lie near `1` (over `ℚ_3`, for `Φ = 1_{e_n + 3𝒪^n}` and `k = −1`, they
form `−1 + 3ℤ_3`). The pole comes from the value `Φ(0)`. (2) Unitarity: `π̄ ≅ π^∨`, so the multiset `{(δ_i, α_i)}` is stable under
`α ↦ −α`. (3) If `α_i > 0`, take `j` with `(δ_j, α_j) = (δ_i, −α_i)`. By AutomorphicLFunctionsAndLocalFactors §AL.3.3.1, `L(s, π × π^∨)` is the product of the
`L(s, δ_kν^{α_k} × (δ_lν^{α_l})^∨)`, among them `L(s, δ_iν^{−α_i} × δ_i^∨ν^{−α_i}) = L(s − 2α_i, δ_i × δ_i^∨)`, which has a pole
at `s = 2α_i` by (1); the other factors are inverses of polynomials in `q^{−s}` and have no zeros. (4) By AutomorphicLFunctionsAndLocalFactors §AL.3.2.2 the
local integrals of the unitary generic pair `(π, π^∨)` converge absolutely for `Re(s) ≥ 1`, and by AutomorphicLFunctionsAndLocalFactors §AL.3.2.3 at each `s₀`
some integral divided by `L(s, π × π^∨)` is nonzero; so `L(s, π × π^∨)` has no pole in `Re(s) ≥ 1`, and `2α_i < 1`. The
last statements: `|α_i − α_j| ≤ |α_i| + |α_j|`, and `ν^α∘N_{L/F} = ν_L^α`.

*Needs:* AutomorphicLFunctionsAndLocalFactors §§AL.3.2.1, AL.3.2.2, AL.3.2.3, AL.3.3.1; 4.1; 6.1; SmoothRepresentationsOfLocalGroups
§SR.0.4 (*smooth-dual*).

**Checks.**
- At an unramified place this is AutomorphicLFunctionsAndLocalFactors §AL.3.3.8 (`q^{−1/2} < |α| < q^{1/2}` for the Satake parameters).
- The bound concerns the exponents of the square-integrable blocks: the Steinberg representation, unitary and
  generic, has supercuspidal support `{ν^{1/2}, ν^{−1/2}}` at distance one, which is allowed because its block is the
  square-integrable `St` itself with `α = 0`. The trivial representation of `GL₂(F)`, unitary with exponents `±1/2`,
  is not generic.
- `n = 1`: `π` is a unitary character, `r = 1` and `α₁ = 0`.

### 6.4 The local converse theorem

*Origin:* published: Henniart (1993), the local converse theorem for generic `π₁`, `π₂` with twists of ranks up to
`n − 1`; Jacquet and Liu (2018), the ranks `1 ≤ r ≤ ⌊n/2⌋` with generic twists and the same central character, and for
`F/ℚ_p` Chai (2019). The form with supercuspidal twists of ranks `1 ≤ r ≤ ⌊n/2⌋`, deduced with 6.2, is this roadmap's own
formulation.

*Method of the formal proof:* for `F` of characteristic zero and supercuspidal `π₁`, `π₂`: for Whittaker functions
agreeing on `GL_{n−1}(F)`, the functional equation for `GL_n × GL_{n−1}` makes the difference of the transformed Whittaker
functions orthogonal to the Whittaker functions of every irreducible representation of `GL_{n−1}(F)`; such a function
vanishes, so the two functions agree at the long Weyl element, hence everywhere, and `π₁ ≅ π₂`. The vanishing is proved
with extreme invariant positive Hermitian forms on the space of Whittaker test functions and the admissibility of
irreducible unitary representations, where the usual proof appeals to the Plancherel decomposition of the space of
square-integrable functions on `GL_{n−1}(F)` transforming by `ψ` under its upper unitriangular group. The route written
below is not this proof's: after 6.2 it cites Henniart's theorem for the ranks `1 ≤ r ≤ n − 1`, and Jacquet–Liu and
Chai for the half range.

*Corollary of:* AutomorphicLFunctionsAndLocalFactors §AL.3.9.7 (the local converse theorem for irreducible generic `π₁`,
`π₂` over every nonarchimedean local field, in its three forms: with generic twists of rank `n − 1`, of which the form
of [FormalProof] is a case; with supercuspidal twists of ranks `1 ≤ r ≤ n − 1`, of which the first assertion is a case;
and, for equal central characters, with generic twists of ranks `1 ≤ r ≤ ⌊n/2⌋`, from which the half range with
supercuspidal twists follows with 6.2).

Let `F` be a nonarchimedean local field, `ψ` nontrivial, `n ≥ 2`, and `π₁`, `π₂` irreducible generic
representations of `GL_n(F)` with the same central character. If `γ(s, π₁ × τ, ψ) = γ(s, π₂ × τ, ψ)` for every
irreducible supercuspidal `τ` of `GL_r(F)` with `1 ≤ r ≤ n − 1`, then `π₁ ≅ π₂`. The ranks `1 ≤ r ≤ ⌊n/2⌋` suffice.
The form that the family uses is [FormalProof],
`Development/AbelianVarietyTheory/PublishedTheorems/GaloisCohomology₂/LocalConverseGL.lean`
(`GlobalTheory.Published.LocalConverseGL`): for `F` of characteristic zero, supercuspidal `π₁`, `π₂` are isomorphic if
their `ε`-factors of pairs agree with every irreducible representation `τ` of `GL_{n−1}(F)`, a single rank (the condition is
empty for a non-generic `τ`, and `γ = ε` for these pairs), with no hypothesis on central characters. With 6.2, which
extends the equality from supercuspidal `τ` to the generic `τ` of rank `n − 1`, it gives the statement above for
supercuspidal `π_i` in characteristic zero. Henniart's Théorème 1.1 (Henniart 1993, p. 340) is the statement for
generic `π_i` with generic twists of the single rank `n − 1`, with no hypothesis on central characters; the form with
supercuspidal twists of the ranks `1 ≤ r ≤ n − 1` is the Remarque after its Corollaire, p. 340, proved by Lemme 3.5,
pp. 347–348 (Henniart 2002, §1.9, Corollaire, p. 592), and the Corollaire is the case of supercuspidal `π_i` (Henniart
2002, §1.4, pp. 589–590); the statement for generic `π_i`, the half range and positive characteristic rest on
the sources cited in the route.

*Route.* By 6.2 the hypothesis extends from supercuspidal to all irreducible generic `τ` of the same ranks.
For `1 ≤ r ≤ n − 1`, Henniart's theorem (Henniart 1993, Théorème 1.1, p. 340, with the Remarque after its Corollaire
and Lemme 3.5, pp. 347–348; recalled in Henniart 2002, §1.4, pp. 589–590, for supercuspidal `π_i`, and §1.9,
Corollaire, p. 592, for generic `π_i`), by the route of AutomorphicLFunctionsAndLocalFactors §AL.3.9.7: the functional
equation for `GL_n × GL_{n−1}` alone, a completeness statement for the Whittaker functions of `GL_{n−1}(F)`, and the
fact that the mirabolic subgroup and its transpose generate `GL_n(F)`, which give `W₁ = W₂` and `π₁ ≅ π₂` by Whittaker
uniqueness (AutomorphicLFunctionsAndLocalFactors §AL.3.1.1). For `1 ≤ r ≤ ⌊n/2⌋`:
Jacquet–Liu 2018, Theorem 1.3, which proves their Conjecture 1.1 (generic twists of ranks `≤ ⌊n/2⌋`, the same central
character) over every nonarchimedean local field; for `F/ℚ_p` also Chai 2019, Theorem 1.1, with partial Bessel functions.

*Needs:* AutomorphicLFunctionsAndLocalFactors §§AL.3.1.1, AL.3.1.2, AL.3.2.1–AL.3.3.2; 6.2; SmoothRepresentationsOfLocalGroups §SR.5.1
(*mirabolic-derivatives*).

**Checks.**
- `n = 2`: twists by characters (`r = 1`) determine a generic representation with given central character (the
  classical converse theorem for `GL₂`).
- `n = 2`, `π₁`, `π₂` unramified principal series with Satake parameters `{a₁, b₁}`, `{a₂, b₂}`: already the
  unramified characters `χ` separate them, since `L(s, π_i × χ) = ((1 − a_iχ(ϖ)q^{−s})(1 − b_iχ(ϖ)q^{−s}))^{−1}` and the
  poles of `γ` in `q^{−s}` locate `a_i, b_i`.

### 6.5 Local Langlands correspondences: characterisation by pair factors and uniqueness

*Origin:* adapted from Henniart (1993), corollary of Théorème 1.1, and Henniart (2002), §1.4: the uniqueness of the local
Langlands correspondence for `GL_n(F)` characterised by the `ε`-factors of pairs, by induction on the rank; here truncated
to ranks `≤ n₀`, with central characters among properties 1–5 in place of contragredients.

*Method of the formal proof:* in place of properties 1–5 the formal proof states the shorter list of laws of the map
described in the Method label of 4.2, those of the last paragraph of the statement below, proves the existence of such a
map by the construction described there, and proves that two such maps agree on the representations whose supercuspidal support consists of characters and of
twists by characters of depth-zero supercuspidal representations of `GL_n(ℚ_p)`: on characters by property 1, on a
depth-zero supercuspidal representation because both values are irreducible tame parameters with the same determinant
and the same polynomial of inertial eigenvalues, which determine such a parameter, and on the whole class by the twist
law, the segment rule 4 and the Langlands classification.

Let `F/ℚ_p` be finite, `ψ` nontrivial, `Art_F` the reciprocity map of ClassFieldTheory layer 9 composed with inversion
(ClassFieldTheory C.6, `geometricArtinMap`), sending uniformisers to geometric Frobenius,
and `n₀ ≥ 1` or `n₀ = ∞`. A **local Langlands correspondence in ranks `≤ n₀`** is a family
`(r_n)_{1 ≤ n ≤ n₀}`, `r_n` a bijection from the isomorphism classes of irreducible smooth representations of `GL_n(F)`
onto the `n`-dimensional Frobenius-semisimple Weil–Deligne representations over `ℂ`, such that:
1. `r_1(χ) = χ∘Art_F⁻¹`;
2. `r_n` sends supercuspidal representations to irreducible representations of `W_F` with `N = 0`;
3. `det r_n(π) = r_1(ω_π)`;
4. the segment rule: `r_n(L(Δ_1 + ⋯ + Δ_t)) = ⊕_i r_{a_i}(ρ_i) ⊗ Sp(b_i)` for the segments `Δ_i = [ρ_i, ρ_iν, …, ρ_iν^{b_i−1}]`
   (SmoothRepresentationsOfLocalGroups §SR.5.2 *segment-representations*) on supercuspidal `ρ_i` of `GL_{a_i}(F)`
   (Henniart 2002, §§2.3, 2.6–2.7, pp. 594–595);
5. `ε(s, π × π', ψ) = ε(s, r_n(π) ⊗ r_m(π'), ψ)` for supercuspidal `π` of `GL_n(F)` and `π'` of `GL_m(F)`, `m < n ≤ n₀`, the left
   side the Rankin–Selberg factor of AutomorphicLFunctionsAndLocalFactors §AL.3.3.2 and the right side the Langlands–Deligne local constant of the Weil
   representation `r_n(π) ⊗ r_m(π')` (ClassicalArithmeticCompletion §7.12b).
A family `(rec_n)` in the arithmetic normalisation (uniformisers to arithmetic Frobenius) going from parameters to
representations, such as the classical correspondence of SmoothRepresentationsOfLocalGroups §SR.5.2, is called a local
Langlands correspondence if the family `π ↦ (rec_n⁻¹(π))^∨` is one. Then there is at most one local Langlands
correspondence in ranks `≤ n₀`, and the restriction of one in ranks `≤ n₀` to ranks `≤ n₀' < n₀` is one in ranks `≤ n₀'`.

*The classical correspondence* (stated here, not proved here). The classical correspondence `rec` of
SmoothRepresentationsOfLocalGroups §SR.5.2 *classical-llc-normalization*, transported in this way, is a local Langlands
correspondence in every rank. This is not a target of this roadmap: it is the input theorem of
SmoothRepresentationsOfLocalGroups §SR.5.2 (the theorem of Harris–Taylor 2001 and Henniart 2000; Henniart 1993, corollary
of Théorème 1.1, recalled in Henniart 2002, §1.4, pp. 589–590, for the characterisation by property 5), stated here because the pair factors of property 5 are defined here, and it does
not follow from what SmoothRepresentationsOfLocalGroups §SR.5.2 states (property 5 cannot be stated there).
EndoscopicTransferAndUnitaryTraceComparison states it in the geometric normalisation: its §10.30 identifies the
classical correspondence with its trace-defined correspondence, which has properties 1–4 by its §§10.1, 10.23, 10.26
and 10.30 and property 5 by its §10.28.
The family's base change of depth-zero representations does not use property 5 or the uniqueness. It uses, for a map from
irreducible representations to Weil–Deligne representations in the geometric normalisation: property 1; property 2;
the segment rule 4; compatibility with the twists `ν^s`, `s` real; the equality of dimensions; property 3 in absolute
value, for every representation; and, for the representations whose supercuspidal support consists of characters and,
for `F = ℚ_p`, of twists by characters of depth-zero supercuspidal representations, compatibility with twists by
characters and with contragredients, property 3, injectivity, tameness of the image when the representation has depth
zero, and the inertial type of the image when it has depth zero.

*Route.* The restriction statement is the definition. The statement on `rec` is not proved here: read with this
definition, 4.2 lists the bijection and properties 1–4 in the arithmetic normalisation, and property 5 is part of the
theorem of Harris–Taylor and Henniart that is the input of SmoothRepresentationsOfLocalGroups §SR.5.2. Uniqueness,
by induction on `n` (Henniart 2002, §1.4, pp. 589–590, from the corollary of Théorème 1.1 of Henniart 1993): two correspondences `r`, `r'` agree in rank one by 1. Suppose they agree in ranks `< n` and let `π`
be supercuspidal of rank `n`. `r_n(π)` is irreducible with `N = 0` (2), so `π'' = r'^{−1}_n(r_n(π))` is supercuspidal: by
the segment rule 4 and bijectivity, `r'_n` sends every non-supercuspidal irreducible representation to a reducible
representation or to one with `N ≠ 0`. For supercuspidal `π`, `π''` of rank `n` and `τ` of rank `m < n` the pair
`L`-factors `L(s, π × τ)`, `L(s, π^∨ × τ^∨)` and those of `π''` are `1`: in the Kirillov model of a supercuspidal
representation (SmoothRepresentationsOfLocalGroups §SR.5.1 *mirabolic-derivatives*) the functions `g ↦ W(diag(g, 1_{n−m}))` are compactly supported modulo
`N_m`, so every integral of AutomorphicLFunctionsAndLocalFactors §AL.3.2.1 is a Laurent polynomial in `q^{−s}` and the
generator of AutomorphicLFunctionsAndLocalFactors §AL.3.2.3 is `1`
(Jacquet–Piatetski-Shapiro–Shalika 1983). Hence `γ = ε` for these pairs, and 5 for both families with the induction
hypothesis gives `γ(s, π'' × τ, ψ) = γ(s, π × τ, ψ)` for every supercuspidal `τ` of rank `< n`; no property of the factors
of the second variable is needed. By 3, `ω_{π''} = ω_π`. The local converse theorem (6.4) gives `π'' ≅ π`, that
is `r'_n(π) = r_n(π)`. The segment rule 4 extends the agreement to all irreducible representations, each being
`L(Δ_1 + ⋯ + Δ_t)` for a unique multiset of segments (4.1 (i)).

*Needs:* AutomorphicLFunctionsAndLocalFactors §§AL.3.1.1, AL.3.2.1, AL.3.2.3, AL.3.3.2; 4.1, 4.2, 6.4; SmoothRepresentationsOfLocalGroups §SR.5.1
(*mirabolic-derivatives*), §SR.5.2 (*segment-representations*, *classical-llc-normalization*, *wd-raw-parameters*,
*wd-parameter-operations*: Weil–Deligne representations, Frobenius semisimplicity), §SR.3.1;
ClassicalArithmeticCompletion §7.12b (Langlands–Deligne local constants of Weil representations); ClassFieldTheory
layer 9.

**Checks.**
- `n₀ = 1`: property 1 alone; uniqueness is the definition.
- `n₀ = 2`: GL2AutomorphicRepresentationsAndTransfer §R16.0.1 states the neighbouring uniqueness for `GL₂(F)`, by the
  `L`- and `ε`-factors of the twists by characters of all irreducible representations.
- The supercuspidal clause 2 is used: without it `r'^{−1}_n(r_n(π))` need not be generic, and the converse theorem
  does not apply.
- For a supercuspidal `π` of `GL₂(F)` and a character `χ` of `F^×`, `L(s, π × χ) = 1`, so property 5 for `m = 1` is the
  equality of `γ(s, π × χ, ψ)` with the constant of `r_2(π) ⊗ χ`; for `π` an unramified principal series of `GL₂(F)`
  (not covered by 5) `L(s, π × 1) ≠ 1`.
- The segment rule 4 is not centred. The Steinberg representation `St = L([ν^{−1/2}, ν^{1/2}])` is the segment of length 2
  on `ν^{−1/2}`, so 4 gives `r_2(St) = r_1(ν^{−1/2}) ⊗ Sp(2) = ω^{−1/2} ⊗ Sp(2)` (`r_1(ν) = ω`, uniformisers going to
  geometric Frobenius), of determinant `ω^{−1}·ω = 1 = r_1(ω_St)`, as 3 requires; `r_2(St) = Sp(2)` would have
  determinant `ω`.

### 6.6 The generalized Riemann hypothesis of a Rankin–Selberg pair

*Origin:* definitions and conventions.

For unitary cuspidal `π` of `GLₙ(𝔸_K)` and `π′` of `GLₘ(𝔸_K)`,
the *generalized Riemann hypothesis* for the Rankin–Selberg pair
`(π, π′)` is the predicate `ZeroFreeRightOf (1/2)` of the completed `Λ(s, π × π′)` of AutomorphicLFunctionsAndLocalFactors
§§AL.3.6.1–AL.3.6.2; poles are allowed. As in 5.1, the functional equation
against `π^∨ × π′^∨` and `Λ(s, π^∨ × π′^∨) = conj Λ(conj s, π × π′)` make the hypothesis put every
zero of `Λ(s, π × π′)` on `Re s = 1/2`.

*Needs:* AutomorphicLFunctionsAndLocalFactors §§AL.3.6.1, AL.3.6.2; 5.1; RiemannHypothesisStatementsAndConsequences §9.2.

### Examples

From the Checks of this layer: for the Steinberg representation of `GL₂(F)` the integral of 6.1 is `Σ_{m≥0} q^{−m(σ+1)}`, finite exactly for `σ > −1`; for `n = 1` and an irreducible principal series `τ = χ₁ × χ₂`, 6.2 gives `γ(s, χ × τ, ψ) = γ(s, χχ₁, ψ)γ(s, χχ₂, ψ)`, Tate's factors; the Steinberg representation, unitary and generic with supercuspidal support `{ν^{1/2}, ν^{−1/2}}`, has the single exponent `α = 0` in 6.3; two unramified principal series of `GL₂(F)` are already separated by twists by unramified characters, as 6.4 requires for `n = 2`; and for `n₀ = 1` a local Langlands correspondence in the sense of 6.5 is property 1 alone.

### Dependencies

Layers 4 and 5 (4.1 in 6.3 and 6.5, 4.2 in 6.5, 5.1 in 6.6); AutomorphicLFunctionsAndLocalFactors §§AL.3.1.1, AL.3.1.2, AL.3.2.1, AL.3.2.2, AL.3.2.3, AL.3.2.4, AL.3.3.1, AL.3.3.2, AL.3.3.2a, AL.3.3.8, AL.3.6.1, AL.3.6.2, and §AL.3.3.8a, of which 6.3 is a corollary for `F` of characteristic zero, and §AL.3.9.7, the general theorem of which 6.4 is a corollary; SmoothRepresentationsOfLocalGroups §§SR.0.4, SR.2.2, SR.3a.1, SR.3.1, SR.3.3, SR.5.1, SR.5.2; ClassicalArithmeticCompletion §7.12b; ClassFieldTheory layer 9; RiemannHypothesisStatementsAndConsequences §9.2.

## Layer 7: Standard L-functions of characters and Satake bounds

This layer extends AutomorphicLFunctionsAndLocalFactorsPartII §3.4: it computes the standard `L`-function of the trivial representation of a unitary group as a product of shifted Hecke `L`-functions, with the form for a one-dimensional representation `μ ∘ det` as a remark (7.1), and proves the Satake bounds for unitary unramified representations of `GL_n` and of unramified unitary groups, with the abscissa of absolute convergence of the partial standard `L`-function that they give (7.2).

### 7.1 The standard `L`-function of a one-dimensional representation

*Origin:* this roadmap's own formulation: the unramified base-change Satake parameter of the trivial representation of a
unitary group and the factorisation of its partial standard `L`-function twisted by `χ` into shifted Hecke
`L`-functions, whose use in the Rallis inner product formula is Harris, Kudla and Sweet (1996), §6; the continuation and
the poles of that function, clause (iv), and the wider form for a one-dimensional representation `μ ∘ det` given in the
Remark, are this roadmap's own formulation as well.

*Method of the formal proof:* the constant function satisfies the transformation law of the unramified principal series
with parameter the `ρ`-shift `q^{(n−1)/2−i}`, so the Hecke operators act on it with the eigenvalues of the segment of
length `n` (at split places on `GL_n`, at inert places on the unitary group, then rewritten as a base-change parameter);
the Euler factor of a segment is the product of the shifted factors of its centre, and the identity of partial
`L`-functions is the product over the places for `Re s` large; on an anisotropic space the constant function is a cusp
form because there is no proper parabolic subgroup.

Prove the following. Let `E/F` be a quadratic extension of number fields (or of
local fields), `V` a nondegenerate Hermitian space of dimension `n`, `1` the trivial representation of `U(V)`, and `χ`
a Hecke character of `𝔸_E^×/E^×`. Then, with `z = s + ½` and the conventions of AutomorphicLFunctionsAndLocalFactorsPartII §3.4:

- (i) *Locally.* At a finite place `v` where `E/F`, `χ` and `U(V)` are unramified, the base-change Satake parameter of the
  trivial representation is `(q^{(n−1)/2}, q^{(n−3)/2}, …, q^{−(n−1)/2})`, with `q` the residue cardinality of `E` at the
  place (of `E_w` at a split place, where the parameter is that of the trivial representation of `GL_n(E_w)`), and
  `L_v(z, BC(1_v) ⊗ χ_v) = ∏_{i=1}^{n} L_v(z + (n + 1)/2 − i, χ_v)`, the right side being the Euler factor at `v` of the
  Hecke `L`-function of `E` (the product over the places `w | v`).
- (ii) *Globally.* For every finite set `S` containing the archimedean places and the ramification,
  `L^S(z, BC(1) ⊗ χ) = ∏_{i=1}^{n} L^S_E(z + (n + 1)/2 − i, χ)` on a right half-plane of `z`.
- (iii) When `V` is anisotropic, the trivial representation is cuspidal (there are no proper rational parabolics), and the
  partial function above is the partial standard `L`-function of AutomorphicLFunctionsAndLocalFactorsPartII §3.4 for
  `π = 1`.
- (iv) *Continuation.* For every such `S`, `L^S(z, BC(1) ⊗ χ) = ∏_{i=1}^{n} L^S_E(z + (n + 1)/2 − i, χ)` continues
  meromorphically to `ℂ` and is holomorphic away from the poles of the factors, which occur only when `χ` is a power
  `|·|_E^{w}` of the norm, `w ∈ ℂ`.

The parameter of the trivial representation, the identity of partial `L`-functions on a right half-plane and the
cuspidality on an anisotropic space are [FormalProof],
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/ConstantFunctionHasTrivialRepSatakeParametersStatement.lean`
(`GlobalTheory.T.constantFunction_has_trivialRep_satakeParameters`),
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/PartialLTrivialRepTwistEqProdHeckeLStatement.lean`
(`GlobalTheory.T.partial_L_trivial_rep_twist_eq_prod_hecke_L`) and
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/ConstantOneMemCuspFormsOfWittIndexZeroStatement.lean`
(`GlobalTheory.T.one_mem_A0_of_wittIndex_eq_zero`), for a Hermitian space with a self-dual lattice outside a finite set
of places. Clause (iv) is not a statement of [FormalProof]; it is proved by the route below.

*Remark* (the wider form: this roadmap's own formulation, not a statement of [FormalProof]; it is proved by the route
below). Let `μ` be a unitary character of
`U(1)(F)\U(1)(𝔸_F)` (`U(1)` the norm-one torus) and `μ̃(x) = μ(x/x̄)` its base change to `𝔸_E^×`. Then:

- *Locally.* At a finite place `v` where `E/F`, `μ`, `χ` and `U(V)` are unramified, the base-change
  Satake parameter of `μ_v ∘ det` is `μ̃_v(ϖ) · (q^{(n−1)/2}, q^{(n−3)/2}, …, q^{−(n−1)/2})`, with `q`
  the residue cardinality of `E` at the place (of `E_w` at a split place, where the parameter is that
  of `μ̃_w ∘ det` on `GL_n(E_w)`), and
  `L_v(z, BC(μ_v ∘ det) ⊗ χ_v) = ∏_{i=1}^{n} L_v(z + (n + 1)/2 − i, μ̃_v χ_v)`,
  the right side being the Euler factor at `v` of the Hecke `L`-function of `E` (the product over
  the places `w | v`).
- *Globally.* For every finite set `S` containing the archimedean places and the ramification,
  `L^S(z, BC(μ ∘ det) ⊗ χ) = ∏_{i=1}^{n} L^S_E(z + (n + 1)/2 − i, μ̃ χ)`; in particular it continues
  meromorphically to `ℂ` and is holomorphic away from the poles of the factors, which occur only when
  `μ̃χ` is a power `|·|_E^{w}` of the norm, `w ∈ ℂ`.
- When `V` is anisotropic, `μ ∘ det` is cuspidal (there are no proper rational parabolics), and the
  partial function above is the partial standard `L`-function of AutomorphicLFunctionsAndLocalFactorsPartII §3.4 for `π = μ ∘ det`.

For `μ = 1` the first and the third of these are (i) and (iii), and the second is (ii) with (iv).

*Route.* The unramified representation `μ_v ∘ det` is the spherical constituent of the normalised
principal series whose parameter is `μ̃_v(ϖ)` times the `ρ`-shift (SmoothRepresentationsOfLocalGroups
§§SR.4.2–SR.4.4, the trivial representation having parameter `q^{ρ}`); insert it in the Satake Euler
factor of AutomorphicLFunctionsAndLocalFactorsPartII §2.3 and AutomorphicLFunctionsAndLocalFactors Layer AL.4. The global statement is the product
over `v ∉ S`. (iv) follows from (ii) because Hecke `L`-functions are meromorphic on `ℂ`.

(Harris–Kudla–Sweet, J. Amer. Math. Soc. 9 (1996), §6, for the use in the Rallis
inner product of the trivial representation.) *Needs:* AutomorphicLFunctionsAndLocalFactorsPartII §§2.3, 3.4; SmoothRepresentationsOfLocalGroups
§§SR.4.2–SR.4.4; AutomorphicLFunctionsAndLocalFactors Layer AL.4; MetaplecticAutomorphicForms §6.10a.

**Checks.**

- `n = 1`, in the Remark: `U(V) = U(1)`, `BC(μ) = μ̃`, and the formula is `L^S_E(z, μ̃χ)`.
- `n = 2`, `μ = 1`, `χ` unramified at a split `v`: the factor is
  `L_v(z + ½, χ_v) L_v(z − ½, χ_v)`, the Euler factor of the trivial representation of `GL_2(F_v)`
  twisted by `χ_v`.
- A shift `(n − 1)/2 − i` in place of `(n + 1)/2 − i` would give, for `n = 1`, `L(z − 1)`; the `n = 1`
  case fixes the shift.
- In the Remark, if `μ̃χ|_{𝔸_F^×}` is trivial (for instance `μ = 1` and `χ` a splitting character of even exponent),
  then `(μ̃χ)^c = (μ̃χ)⁻¹`, so the Hecke `L`-functions of `μ̃χ`, its inverse and its conjugate coincide,
  and the formula does not depend on the choice among the conventions `BC(π)⊗χ`, `BC(π^∨)⊗χ⁻¹` of
  AutomorphicLFunctionsAndLocalFactorsPartII §3.4.

### 7.2 Satake bounds for unitary unramified representations and absolute convergence

*Origin:* adapted from Macdonald (1971), as in 3.4, of which (i) and (ii) are the unitary case, and from Borel (1979),
Theorem 13.2, after Langlands (1971), the absolute convergence of the Euler product of a unitary unramified
representation from a bound on its Satake parameters: here (i) and (ii), for `GL_n` and for the unramified unitary group
in its base-change parameter, and (iii), for `L^S_E(z, BC(π) ⊗ χ)` with its half-plane `Re z > (n + 1)/2`.

*Method of the formal proof:* a spherical vector `v₀` of the unitary `π` gives the spherical function
`g ↦ ⟨π(g)v₀, v₀⟩/⟨v₀, v₀⟩`, bounded by `1`, and 3.4 bounds the Satake parameters; for `GL_n` the lower bound follows
from the upper one, the multiset of the parameters of a unitarisable representation being stable under
`α_i ↦ conj(α_i)⁻¹`. For (iii), a bounded number of Euler parameters of absolute value at most `q_w^κ` at each place `w`
bound the distance of the local Euler polynomial from `1` by a constant times `q_w^{−(Re z − κ)}`, with no vanishing
factor, and `Σ_w q_w^{−σ}` converges for `σ > 1`.

Prove the absolute convergence (iii), with the local bounds (i)–(ii), which are the unitary case of 3.4.

- (i) *`GL_n`.* Let `K` be a nonarchimedean local field with residue cardinality `Q` and `π` an irreducible
  unitary unramified representation of `GL_n(K)` with Satake parameter `(α_1, …, α_n)` in the unitary
  normalisation (SmoothRepresentationsOfLocalGroups §SR.4.3). Then `Q^{−(n−1)/2} ≤ |α_i| ≤ Q^{(n−1)/2}` for
  every `i`. For generic `π`, AutomorphicLFunctionsAndLocalFactors §AL.3.3.8 gives the strict bound
  `Q^{−1/2} < |α_i| < Q^{1/2}`.
- (ii) *Unramified unitary groups.* Let `E_v/F_v` be an unramified quadratic extension of nonarchimedean local fields
  (any residue characteristic), `q_w` the residue cardinality of `E_v`, `V_v` a Hermitian space of dimension `n` with a
  self-dual lattice `L_v`, and `π` an irreducible unitary representation of `U(V_v)` with a nonzero vector fixed by the
  stabiliser of `L_v`. Its base-change parameter `α ∈ (ℂ^×)^n` (SmoothRepresentationsOfLocalGroups §SR.4.4) satisfies `q_w^{−(n−1)/2} ≤ |α_i| ≤ q_w^{(n−1)/2}`,
  that is `q_v^{−(n−1)} ≤ |α_i| ≤ q_v^{n−1}`.
- (iii) *Global.* Let `E/F` be a quadratic extension of number fields, `π` an irreducible automorphic
  representation of `U(V)` occurring in `L²` (so its local components are unitary), `χ` a unitary Hecke
  character of `E`, and `S` a finite set of places, containing the archimedean ones, outside which `E/F` and `χ` are
  unramified, `V_v` has a self-dual lattice `L_v` and `π_v` has a nonzero vector fixed by its stabiliser. Then `L^S_E(z, BC(π) ⊗ χ) = ∏_{w ∤ S} det(1 − α_w(π)χ_w(ϖ_w)q_w^{−z})⁻¹`, the product over the places
  `w` of `E` above places of `F` outside `S`, converges absolutely and is nonzero for `Re z > (n + 1)/2`.

*Route.* At the places of a number field, (i) and (ii) are
[FormalProof], `Development/AbelianVarietyTheory/Proofs/TwistedOperators/ExistsSatakeParametersBoundedEigenfunction.lean`
(`GlobalTheory.FinZeta.ParamBound.exists_param_bounded`)
and [FormalProof], `Development/AbelianVarietyTheory/Definitions/LatticeFrames/ChainParSucc.lean`
(`GlobalTheory.ChainOnto.ParBound`);
(ii) is also [FormalProof],
`Development/AbelianVarietyTheory/Proofs/TwistedOperators/ExistsSatakeParameterTrivialBoundUnramifiedUnita.lean`
(`GlobalTheory.Twist.satParam_exists_trivialBound`).
(i) and (ii): a unitary `π` has a positive definite, hence bounded, spherical function (its spherical
vector `v₀` gives the bounded coefficient `g ↦ ⟨π(g)v₀, v₀⟩`; SmoothRepresentationsOfLocalGroupsPartII §§0.3–0.4),
and 3.4 gives the bounds: case (i) for `GL_n`; case (ii) (the doubling series) for the unitary
group, after identifying `(V_v, L_v)` with the standard space of SmoothRepresentationsOfLocalGroups §SR.4.4 (antidiagonal form on `E_v^n`, lattice
`𝒪_{E_v}^n`): both are Hermitian spaces of dimension `n` with unimodular lattices, so they are isometric
(HermitianFormsAndLattices §2.1 (a): the determinants have even valuation), and unimodular lattices are unique up to the
unitary group in every residue characteristic (HermitianFormsAndLattices §4.2 (a)); at a split place
`U(n)(F_v) ≅ GL_n(E_w)` and (i) applies with `Q = q_w`. (iii) follows from (i)–(ii) and
[FormalProof], `Development/AbelianVarietyTheory/Definitions/Foundations/NormEulerPolySubOneLe.lean`
(`GlobalTheory.LFun.Bounded.converges`: a bounded number of Euler parameters at each place `w`, each of absolute value at most
`q_w^κ`, give an absolutely convergent product with no vanishing factor for `Re z > κ + 1`), with `κ = (n − 1)/2`: by (i)–(ii) the Euler factor at `w` converges absolutely
for `Re z > (n − 1)/2 + 1`, uniformly, and the product over `w` converges by AutomorphicLFunctionsAndLocalFactors §AL.4.1.2
(`Σ_w q_w^{−σ} < ∞` for `σ > 1`), with no vanishing factor.

*Needs:* AutomorphicLFunctionsAndLocalFactorsPartII §§2.3, 3.4; SmoothRepresentationsOfLocalGroups §§SR.4.1–SR.4.4; 3.4;
HermitianFormsAndLattices §§2.1, 4.2; AutomorphicLFunctionsAndLocalFactors §§AL.4.1.1, AL.4.1.2;
SmoothRepresentationsOfLocalGroupsPartII §§0.3–0.4.

**Checks.**

- The bounds are attained: the trivial representation of `GL_n(K)` has parameter `(Q^{(n−1)/2}, …, Q^{−(n−1)/2})`,
  and with `L(z, 1 ⊗ χ)` the factors `L(z + (n − 1)/2 − i, χ)`, `0 ≤ i < n`; each local factor converges for
  `Re z > (n − 1)/2`, and the product over the places converges absolutely exactly for `Re z > (n + 1)/2`.
- `n = 1`: a unitary character has `|α| = 1`.
- In (ii) the unit is `q_w = q_v²`: the trivial representation of `U(2)` at an inert place has
  base-change parameter `(q_v, q_v⁻¹)`; a bound `q_v^{(n−1)/2}` read in `q_v` would be false for it.

### Examples

From the Checks of this layer: for `n = 1` the formula of the Remark of 7.1 is `L^S_E(z, μ̃χ)`, and for `n = 2`, `μ = 1` and `χ` unramified at a split place the Euler factor is `L_v(z + ½, χ_v) L_v(z − ½, χ_v)`; the trivial representation of `GL_n(K)` attains the bounds of 7.2, and the trivial representation of `U(2)` at an inert place has base-change parameter `(q_v, q_v⁻¹)`, so the bound of 7.2 (ii) is measured in the residue cardinality `q_v²` of `E_v`.

### Dependencies

Layer 3 (3.4); AutomorphicLFunctionsAndLocalFactorsPartII §§2.3, 3.4; AutomorphicLFunctionsAndLocalFactors Layer AL.4, with §§AL.4.1.1, AL.4.1.2; SmoothRepresentationsOfLocalGroups §§SR.4.1–SR.4.4; MetaplecticAutomorphicForms §6.10a; HermitianFormsAndLattices §§2.1, 4.2; SmoothRepresentationsOfLocalGroupsPartII §§0.3–0.4.

## Downstream consumers

In the family RiemannHypothesisForDirichletLFunctions, the following roadmaps consume this one. FiniteReductiveGroups §6.0 consumes 2.1, and through it so do FiniteReductiveGroups §§6.1 (exhaustion) and 6.3 (labels of depth-zero representations). BaseChangeAndGaloisRepresentationsForUnitaryGroups §10.29a consumes 6.5: its statement takes properties 1, 2 and 4 from there, and property 3 on the representations whose supercuspidal support consists of characters and, for `F = ℚ_p`, of twists by characters of depth-zero supercuspidal representations, and its remark states that the trace-defined correspondence, which attaches a parameter to a representation in the geometric normalisation, is a local Langlands correspondence in every rank, and the only one. BaseChangeAndGaloisRepresentationsForUnitaryGroups §10.30 consumes the transport of 6.5: it identifies that correspondence with the classical one, `LLC_WD(π) = (rec⁻¹(π))^∨`. BaseChangeAndGaloisRepresentationsForUnitaryGroups §10.34 consumes the half range of 6.4 for `n = 3`: twists by characters determine a depth-zero supercuspidal representation of `GL_3(F)`. BaseChangeAndGaloisRepresentationsForUnitaryGroups §§14.2 (its second route) and 15.1 consume 6.3 (in 15.1, the base change to the spherical place is the full unramified principal series). ThetaKernelsForUnitaryDualPairs §3.47 consumes 4.1 (ii) and (iv) (the theta quotients at split places are, for `ν` ramified or unramified with `ν(ϖ) ≠ 1`, irreducible products of two segment representations), §5.7d consumes 4.1 (ii)–(iv) and (vi) (the local multiplicity bounds along an adapted line), and §6.11 consumes 3.3 and 3.4 (the unramified doubling integral at inert places). ThetaLiftsForDefiniteUnitaryGroups §5.2 consumes 7.1 (i) and (ii) and, when `d ≤ 2n`, the continuation (iv) (the norm of the lift of the trivial representation, `∏_{i=0}^{n−1} L^S_E(d/2 − i, χ_W)` at `z = (d − n + 1)/2`), and ThetaLiftsForDefiniteUnitaryGroups §3.3 consumes 7.2, with the local bounds of 3.4 (the Rallis formula in its range of absolute convergence, `d ≥ 2n + 1`). RowTowerAndRallisIdentities §5.1 consumes 7.2, (i) at the split places and (ii) at the inert places, for the bound on the Satake parameters of the Hecke eigensystems of its row spaces, which every Euler product of its Layer 5 uses.

Outside the family: EndoscopicTransferAndUnitaryTraceComparison §10.26, whose standard-data uniqueness uses *langlands-classification*, has it unconditionally for `GL_n` in characteristic zero from its own §2.16, of which 1.1 is, for `D = F`, the form in every characteristic; AutomorphicSpectralTheory §3.6c assumes, for a self-dual cuspidal representation, the generalized Riemann hypothesis that 5.1 defines, and the Conventions of LevelOneAutomorphicFormsForClassicalGroups assume it for the Rankin–Selberg pairs of 6.6; GL2AutomorphicRepresentationsAndTransfer §R16.0.1 concerns the correspondence of 6.5 at `n = 2, 3`. AutomorphicLFunctionsAndLocalFactorsPartII §10.2 (coarse local transfer: equality of `γ`-factors against supercuspidal representations of rank `≤ N − 1` determines the supercuspidal support, Henniart 2002, Proposition 1.9) is the neighbouring statement of 6.4 for arbitrary irreducible representations.

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

This roadmap owns: the characterisation of the tempered representations of `GL_n` (1.1); the comparison of the depth-zero part of a Jacquet module with Harish-Chandra restriction, with the invertibility of the positive Hecke operator it rests on (2.1); the Hecke eigenvalue bound from bounded coefficients (3.1); the Macdonald formula for every residue cardinality (3.2); the unitary doubling series and its cell lemma (3.3); the Satake bounds for bounded spherical functions (3.4); the Zelevinsky classification (4.1; its clause (vii) is, for `F/ℚ_p`, SmoothRepresentationsOfLocalGroups §SR.5.2 *modular-generic-segments* with complex coefficients, and differs in holding over every nonarchimedean `F`); the list of properties of the classical correspondence that this roadmap uses, with the Check that they do not determine it (4.2); the generalized Riemann hypothesis of a unitary cuspidal representation of `GLₙ(𝔸_K)` and of a Rankin–Selberg pair (5.1, 6.6); the convergence of the mirabolic self-pairing of a square-integrable representation near `s = 0` (6.1; its convergence at `s = 0` is AutomorphicLFunctionsAndLocalFactors §AL.3.2.4); the reduction of `γ`-factors of pairs to supercuspidal representations (6.2, from the multiplicativity of AutomorphicLFunctionsAndLocalFactors §AL.3.3.2a; for `F/ℚ_p` it follows from EndoscopicTransferAndUnitaryTraceComparison §10.29, which gives the pair factors of all irreducible representations through their Langlands data, and 6.2 differs in holding over every nonarchimedean `F`, positive characteristic included); the exponent bound for unitary generic representations, with the pole of `L(s, δ × δ^∨)` at `s = 0` (6.3); the local converse theorem (6.4); the definition of a local Langlands correspondence by pair factors and its uniqueness (6.5); the standard `L`-function of a one-dimensional representation of a unitary group (7.1); and the Satake bounds for unitary unramified representations with the absolute convergence of the partial standard `L`-function (7.2).

Not owned here. The theory these statements extend is owned by the home roadmaps. [SmoothRepresentationsOfLocalGroups](../../SmoothRepresentationsOfLocalGroups/README.md) owns the smooth category, Hecke algebras, Jacquet functors and parabolic induction, cuspidal support, square-integrable and tempered representations with Casselman's criterion and the conditional Langlands classification (§SR.3.3), the Satake transform and spherical parameters (§§SR.4.1–SR.4.4), derivatives and the Kirillov model (§SR.5.1), segments, generic segments and the classical correspondence `rec` with its normalisation (§SR.5.2), where `rec` is an owned input theorem; *integral-llc-centre* and *llc-family-conditional* stay as they are there. SmoothRepresentationsOfLocalGroups §SR.4.3 states *macdonald-formula* for `GL_n(E)` with `E/F` unramified quadratic, in the form `S(1_λ) = q^{⟨λ, 2ρ⟩} P_λ(X; q⁻²)`; this roadmap uses the form of 3.2 for every residue cardinality `Q`, whose case `Q = q²` is the form there. The statement that `rec`, transported as in 6.5, is a local Langlands correspondence in every rank (the theorem of Harris–Taylor and Henniart) is the input theorem of SmoothRepresentationsOfLocalGroups §SR.5.2, and EndoscopicTransferAndUnitaryTraceComparison §10.30, with §10.28, states it in the geometric normalisation; it is stated in 6.5, where its property 5 can be stated, and is not a target here. [AutomorphicLFunctionsAndLocalFactors](../../AutomorphicLFunctionsAndLocalFactors/README.md) owns Tate's local factors and Gauss sums (Layer AL.1), the Godement–Jacquet standard `L`-functions (Layer AL.2), Whittaker models, the Rankin–Selberg integrals, factors and functional equations of pairs, local and global (Layer AL.3), and Satake Euler products with their convergence (Layer AL.4). [AutomorphicLFunctionsAndLocalFactorsPartII](../../AutomorphicLFunctionsAndLocalFactorsPartII/README.md) owns the unramified unitary doubling formula (§2.3), the standard `L`-function of a cuspidal representation of a unitary group from doubling (§3.4) and coarse local transfer (§10.2). Moy–Prasad filtrations and parahoric subgroups are ReductiveGroupsPartII §RG2.3.6 and Layer RG2.4; Harish-Chandra induction and restriction for finite reductive groups are ReductiveGroups Layers 7c–7e; the Langlands–Deligne local constants of Weil representations are ClassicalArithmeticCompletion §7.12b; the classification of Hermitian spaces and of unimodular Hermitian lattices over local fields is HermitianFormsAndLattices §§2.1, 4.2; zero-free half-planes and the generalized Riemann hypothesis of `L`-function data are RiemannHypothesisStatementsAndConsequences §§9.2–9.5. The general theorems of which sections here are corollaries are stated in their homes: EndoscopicTransferAndUnitaryTraceComparison §2.16 (1.1, in characteristic zero), SmoothRepresentationsOfLocalGroups §§SR.7.1 (2.1, without its clause (c)), SR.4.3a (3.2) and SR.5.2a (4.1, without its clause (vii)), and AutomorphicLFunctionsAndLocalFactors §§AL.3.3.8a (6.3, in characteristic zero) and AL.3.9.7 (6.4).

The roadmaps of this family that use these statements are FiniteReductiveGroups, BaseChangeAndGaloisRepresentationsForUnitaryGroups, ThetaKernelsForUnitaryDualPairs, ThetaLiftsForDefiniteUnitaryGroups and RowTowerAndRallisIdentities (Downstream consumers above).

## Exact supplier contracts

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

§SR.0.3 (compact open invariants and averaging) and §SR.0.4 (admissibility, coefficients and *smooth-dual*, used in 3.1 and 6.3). §SR.1.2 (the double-coset Hecke ring) and §SR.1.4 (*iwahori-decomposition*, with strongly positive elements, and *positive-hecke-homomorphism*), used in 2.1. §SR.2.2 (*jacquet-module*, *parabolic-induction*, *first-adjointness*, *geometric-lemma*), §SR.2.3 (*jacquet-invariants*, *casselman-pairing*) and §SR.2a.1 (*jacquet-lemma-smooth*). §SR.3a.1 (*jacquet-subrepresentation*: every irreducible representation embeds in a representation induced from a supercuspidal one) and §SR.3.1 (*cuspidal-support*). §SR.3.3 (*square-integrable-tempered*, *casselman-criterion*, *harish-chandra-tempered-support*, *langlands-classification*), used in 1.1 and 6.1. §SR.4.1 (*satake-transform*, with the Iwasawa and Cartan decompositions of the groups it treats and the chosen square root of the residue cardinality), §SR.4.2 (*spherical-parameter*: every parameter is that of an irreducible unramified representation), §SR.4.3 (*hall-littlewood*, *gln-generators*, *macdonald-formula*, and the unitary normalisation of Satake parameters) and §SR.4.4 (the model of the unramified unitary group, *paired-unitary-parameter*, *unitary-odd-formulas*, *unitary-triangular-transform*), used in Layers 3 and 7. §SR.5.1 (*mirabolic-derivatives*, the Kirillov model of a supercuspidal representation) and §SR.5.2 (*segment-representations*: segments, `Z(Δ)`, `L(Δ)` and multisegments; *modular-generic-segments*: the classification of generic representations, which 4.1 (vii) extends to every `F` with complex coefficients; *classical-llc-normalization*: the classical correspondence `rec` in the arithmetic normalisation, an owned input theorem there; *wd-raw-parameters* and *wd-parameter-operations*: Weil–Deligne representations and Frobenius semisimplicity, with their sums, tensor products, duals, determinants and `Sp(n)`), used in Layers 4 and 6. The general theorems of which sections here are corollaries: §SR.7.1 (*depth-zero-jacquet* and *depth-zero-support*: the depth-zero Jacquet comparison for every connected reductive group, every point and every smooth representation, and depth zero read on the cuspidal support; 2.1, without its clause (c)), §SR.4.3a (*macdonald-formula-general*: Macdonald's formula for `GL_n` over every nonarchimedean local field; 3.2) and §SR.5.2a (*zelevinsky-classification*, clauses (i)–(vi), and *unitary-product-irreducibility*; 4.1, whose route also cites from it the subquotient clause of (i) and Bernstein's theorem).

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroupsPartII

§§0.3 (functions of positive type, bounded by their value at the identity) and 0.4 (positive-type coefficients of unitary representations), used in 7.2.

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

§AL.2.4.1: the completed standard `L`-function `Λ(s, π)` of a unitary cuspidal representation of `GLₙ(𝔸_K)` and its functional equation (5.1). §AL.3.1.1 (local Whittaker uniqueness) and §AL.3.1.2 (the Whittaker realisation); §AL.3.2.1 (the local Rankin–Selberg integrals), §AL.3.2.2 (their convergence, absolute in `Re(s) ≥ 1` for unitary generic pairs) and §AL.3.2.3 (the local `L`-factor as the generator of the integrals); §AL.3.3.1 (the nonarchimedean factors under normalised induction), §AL.3.3.2 (the local functional equation, with the factors `ε` and `γ`) and §AL.3.3.8 (the Jacquet–Shalika Satake bound); §§AL.3.6.1–AL.3.6.2 (the completed `Λ(s, π × π′)` and its functional equation), all used in Layer 6. §AL.3.2.4 (the absolute convergence of the mirabolic integral of a square-integrable representation at `s = 0`, cited in 6.1) and §AL.3.3.2a (the multiplicativity of `γ`-factors of pairs in both variables over every nonarchimedean local field, from which 6.2 is derived); §AL.3.3.8a (the exponent bound for unitary generic representations in characteristic zero, with the pole of `L(s, π₀ × π₀^∨)` at `s = 0` for square-integrable `π₀`), of which 6.3 is a corollary for `F` of characteristic zero, and §AL.3.9.7 (the local converse theorem in its three printed forms), the general theorem of which 6.4 is a corollary. Layer AL.4, with §AL.4.1.1 (the unramified Euler factor) and §AL.4.1.2 (convergence of partial Euler products, `Σ_w q_w^{−σ} < ∞` for `σ > 1`), used in Layer 7.

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactorsPartII

§2.3 (the unramified unitary doubling formula and the Satake Euler factor) and §3.4 (the partial and completed standard `L`-function of a cuspidal representation of `U(V)` from doubling, with its conventions `BC(π) ⊗ χ` and `BC(π^∨) ⊗ χ⁻¹`), used in Layer 7.

### From TauCetiRoadmap.ReductiveGroupsPartII

§RG2.3.6 (*moy-prasad-filtration*: the parahoric subgroups `G_{x,0}`, their pro-unipotent radicals `G_{x,0+}`) and Layer RG2.4 (*iwasawa-decomposition*, *parahoric-double-cosets*, and *iwahori-factorization*: the Iwahori decompositions of the groups `G_{x,0+}`), used in 2.1.

### From TauCetiRoadmap.ReductiveGroups

Layers 7c–7e: Harish-Chandra induction and restriction for finite reductive groups with their adjunctions (7c), the Mackey formula (7d), from which with the cuspidality of `τ` the endomorphism algebra of case (1) of 2.1 (c) is two-dimensional, and the independence of the parabolic (7e), used in 2.1 (c).

### From TauCetiRoadmap.ClassicalArithmeticCompletion

§7.12b: the Langlands–Deligne local constants of Weil representations, used in property 5 of 6.5.

### From TauCetiRoadmap.ClassFieldTheory

Layer 9: the Weil group and the local reciprocity map, with its normalisation, used in 4.2 and 6.5.

### From TauCetiRoadmap.MetaplecticAutomorphicForms

§6.10a: the standard doubling factors and their global product, used in 7.1.

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

§2.16 (for `GL_r(D)` over a nonarchimedean local field of characteristic zero: the tempered-support decomposition and the irreducibility of the unitary induction from a unitary square-integrable representation of a Levi subgroup), of which 1.1, with `D = F` and for `F` of characteristic zero, is a corollary.

### From RiemannHypothesisStatementsAndConsequences, a sub-roadmap of this family

§9.2: the predicate `ZeroFreeRightOf σ f` of a zero-free half-plane; §9.3: the generalized Riemann hypothesis of an `AnalyticLFunctionData` card; §9.5: the hypotheses for Dedekind zeta functions, ray-class characters and Grössencharacters. Used in 5.1 and 6.6.

### From HermitianFormsAndLattices, a sub-roadmap of this family

§2.1 (a): over a nonarchimedean local field, two Hermitian spaces for a separable quadratic extension are isometric if and only if they have the same dimension and the same determinant class. §4.2 (a): at an unramified place a Hermitian space contains a unimodular lattice if and only if the valuation of its determinant is even, and a unimodular lattice is unique up to the unitary group, in every residue characteristic. Used in 7.2.

### From Tau Ceti

`TauCeti.LFunctions.AnalyticLFunctionData`, the completed `L`-function data whose generalized Riemann hypothesis 5.1 compares with its own (5.1).

## References

- Andrei V. Zelevinsky, Induced representations of reductive `p`-adic groups II: on irreducible representations of `GL(n)`, Ann. Sci. École Norm. Sup. 13, 1980: Theorems 4.2, 6.1, 9.3 and 9.7, 3.1, Propositions 3.4 and 8.5, Corollary 7.5 (1.1, 4.1).
- M. Tadić, Classification of unitary representations in irreducible representations of general linear group (non-Archimedean case), Ann. Sci. École Norm. Sup. 19, 1986, pp. 335–382: Proposition A.4, the subquotient clause of 4.1 (i), and Theorem 2.5, Bernstein's irreducibility of products of irreducible unitarisable representations (4.1, through SmoothRepresentationsOfLocalGroups §SR.5.2a); the unitary dual of `GL_n` (6.3).
- Joseph Bernstein, P-invariant distributions on GL(N) and the classification of unitary representations of GL(N) (non-Archimedean case), in Lie Group Representations II, Lecture Notes in Math. 1041, 1984, pp. 50–102: the irreducibility of products of irreducible unitarisable representations (4.1, through SmoothRepresentationsOfLocalGroups §SR.5.2a); §§7.3–7.4, 8.8–8.9 and 9.1–9.5, the classification of the generic irreducible unitarisable representations of `GL_n` and its proof (6.3, through AutomorphicLFunctionsAndLocalFactors §AL.3.3.8a).
- Allen Moy and Gopal Prasad, Jacquet functors and unrefined minimal `K`-types, Comment. Math. Helv. 71, 1996: Proposition 6.7, the depth-zero comparison of Jacquet modules for admissible representations and the Levi subgroup attached to a point, and §6, the Levi subgroups attached to finite Levi subgroups (2.1).
- Jean-François Dat, Finitude pour les représentations lisses de groupes `p`-adiques, J. Inst. Math. Jussieu 8, 2009, pp. 261–333: Proposition 3.1 with Proposition 6.2 (i), the depth-zero comparison of Jacquet modules for every reductive group, every point and every smooth representation, and Proposition 6.3 (ii), parabolic functors preserve depth zero (2.1, through SmoothRepresentationsOfLocalGroups §SR.7.1).
- Lawrence Morris, Tamely ramified intertwining algebras, Invent. Math. 114, 1993: Theorem 4.15, the support of the intertwining, and Theorem 7.12, the Hecke algebras of depth-zero types (2.1).
- Colin J. Bushnell and Philip C. Kutzko, Smooth representations of reductive `p`-adic groups: structure theory via types, Proc. London Math. Soc. 77, 1998: Definition 8.1, covers and their invertible elements (2.1).
- I. G. Macdonald, Symmetric functions and Hall polynomials, Oxford, 1979 (second edition 1995): chapter V, the Hecke ring of `GL_n` over a local field and Macdonald's formula by Hall–Littlewood polynomials (3.2, through SmoothRepresentationsOfLocalGroups §SR.4.3a).
- T. Haines, R. Kottwitz and A. Prasad, Iwahori–Hecke algebras, J. Ramanujan Math. Soc. 25, 2010 (arXiv:math/0309168): Theorem 5.6.1, Macdonald's formula for a split group over a `p`-adic field (3.2, through SmoothRepresentationsOfLocalGroups §SR.4.3a).
- Goro Shimura, Zeta functions and Eisenstein series on classical groups, Proc. Natl. Acad. Sci. USA 94, 1997, pp. 11133–11137: §3, Proposition 2 and Theorem 1, the closed form of the local Hecke series of a unitary group weighted by the norm of the denominator ideal, with the details referred to his Euler products and Eisenstein series, CBMS 93, 1997 (3.3).
- Goro Shimura, Euler products and Fourier coefficients of automorphic forms on symplectic groups, Invent. Math. 116, 1994, pp. 531–576: Lemmas 2.5–2.8 and Theorem 2.9, the symplectic counterpart (3.3).
- S. Böcherer, Ein Rationalitätssatz für formale Heckereihen zur Siegelschen Modulgruppe, Abh. Math. Sem. Univ. Hamburg 56, 1986, pp. 35–47: the rationality of the formal Hecke series of the Siegel modular group, the symplectic counterpart (3.3).
- Gritsenko, Induction in the theory of zeta-functions, Algebra i Analiz 6, no. 1, 1994, pp. 3–63 (St. Petersburg Math. J. 6, 1995, pp. 1–49): introduction and §3, Theorem 1, the nearest published relative of the induction of 3.3 along the stabiliser of an isotropic line (3.3).
- Hervé Jacquet, Ilya I. Piatetski-Shapiro and Joseph A. Shalika, Rankin–Selberg convolutions, Amer. J. Math. 105, 1983: the asymptotics of Whittaker functions, square-integrable representations and the multiplicativity of `γ`-factors (6.1, 6.2, 6.3, 6.5); (8.2), the convergence at `s = 0` (6.1, through AutomorphicLFunctionsAndLocalFactors §AL.3.2.4); Theorem 3.1, the multiplicativity of `γ`-factors (6.2, through AutomorphicLFunctionsAndLocalFactors §AL.3.3.2a); Proposition (8.1) with Theorem (8.2), the pole of `L(s, δ × δ^∨)` at `s = 0` (6.3, through AutomorphicLFunctionsAndLocalFactors §AL.3.3.8a).
- Hervé Jacquet and Joseph A. Shalika, On Euler products and the classification of automorphic representations I, Amer. J. Math. 103, 1981: the unramified case of the exponent bound (6.3, through AutomorphicLFunctionsAndLocalFactors §AL.3.3.8a).
- Guy Henniart, Caractérisation de la correspondance de Langlands locale par les facteurs `ε` de paires, Invent. Math. 113, 1993, pp. 339–350: Théorème 1.1, its Corollaire and the Remarque after it, p. 340, with Lemme 3.5, pp. 347–348: the local converse theorem and the uniqueness by `ε`-factors of pairs (6.4, 6.5).
- Guy Henniart, Une preuve simple des conjectures de Langlands pour `GL(n)` sur un corps `p`-adique, Invent. Math. 139, 2000 (4.2, 6.5).
- Michael Harris and Richard Taylor, The geometry and cohomology of some simple Shimura varieties, Annals of Mathematics Studies 151, 2001 (4.2, 6.5).
- Guy Henniart, Une caractérisation de la correspondance de Langlands locale pour `GL(n)`, Bull. Soc. Math. France 130, 2002: §1.4 (pp. 589–590) and §1.9, Corollaire (p. 592), Henniart's theorem of 1993 (6.4, 6.5); §§2.3, 2.6–2.7 (pp. 594–595), the segment rule (4.2, 6.5); §§2.6, 2.8 (pp. 595–596), the classification of the irreducible representations by multisegments in the form `L(𝔪′)` (4.1); Proposition 1.9, coarse local transfer (Downstream consumers).
- Hervé Jacquet and Baiying Liu, On the local converse theorem for `p`-adic `GL_n`, Amer. J. Math. 140, 2018: Theorem 1.3, proving Conjecture 1.1, numbered as in arXiv:1601.03656v3 (6.4).
- Jingsong Chai, Bessel functions and local converse conjecture of Jacquet, J. Eur. Math. Soc. 21, 2019: Theorem 1.1, numbered as in arXiv:1601.05450v2 (6.4).
- Michael Harris, Stephen S. Kudla and William J. Sweet, Theta dichotomy for unitary groups, J. Amer. Math. Soc. 9, 1996: §6, the standard `L`-function of the trivial representation in the Rallis inner product (7.1).
- Robert P. Langlands, Euler products, 1971: the bound for the Satake parameters of unitary unramified representations and the absolute convergence of the Euler products it gives (7.2).
- Armand Borel, Automorphic L-functions, Proc. Sympos. Pure Math. 33, part 2, 1979, pp. 27–61: Theorem 13.2 (7.2).
- I. G. Macdonald, Spherical functions on a group of `p`-adic type, Publ. Ramanujan Inst. 2, 1971: the bounded spherical functions (3.4, 7.2).
- **[FormalProof]** Levent Alpöge, the Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet L-functions announced in [Announcement]; source as published: the first commit, `40e56ba`, of the repository with a public verification setup, <https://github.com/leanprover-community/riemann-hypothesis/tree/40e56bab026552e089d7afcfeff08d2defb9c005>; the files named above are under its directory `src/`. It is the source of the routes given here for the Hecke eigenvalue bound from bounded coefficients (3.1 (a), (c)), for the unitary doubling series and its cell lemma (3.3), for the Satake bound for the unramified unitary group (3.4 (ii)), for the standard `L`-function of the trivial representation (7.1) and for the Satake bounds for unitary unramified representations with the absolute convergence they give (7.2); and it has the forms of the Macdonald formula (3.2), of 2.1 (a) for `GL_n`, of the bijectivity in 2.1 (d) for `GL_n` and admissible `π` and of the injectivity there for every smooth `π`, of 4.1 (iii), (iv) and (vi) and of Bernstein's theorem (4.1), and, for `F` of characteristic zero, of the characterisation of tempered representations (1.1), of the upper bound behind 3.4 (i), of 4.1 (i) in the form `L(𝔪′)` with its subquotient clause, of 4.1 (v) and of "generic ⇒ product" in 4.1 (vii), of the exponent bound (6.3) and of the local converse theorem for supercuspidal representations (6.4) that the family uses.
- **[Announcement]** Levent Alpöge, the announcement of that proof, 20 November 2026: <https://alpo.ge/remark.pdf>.
