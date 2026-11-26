# Roadmap: base change and Galois representations for unitary groups

**Summary.** This roadmap makes the local Langlands correspondence for `GL_n` over a finite extension `F` of `ℚ_p` explicit on representations of depth zero, and states the properties of the `ℓ`-adic Galois representations of regular algebraic polarized cuspidal representations of `GL_n` over a CM field that are used at places of depth zero, at the places above `ℓ` and for definite unitary groups. Below, `k ≅ 𝔽_q` is the residue field of `F` and `F_n/F` its unramified extension of degree `n`.

The headline statements are these; (1) and (4) are stated in their sections as remarks beside the forms that [FormalProof] has.

(1) For every `n ≥ 1` the trace-defined correspondence `rec_n` of EndoscopicTransferAndUnitaryTraceComparison, from irreducible smooth representations of `GL_n(F)` to Frobenius-semisimple `n`-dimensional Weil–Deligne representations, is a local Langlands correspondence (rank one by `Art_geo⁻¹`, supercuspidal representations to irreducible representations of `W_F` with `N = 0`, determinants, the segment rule, `ε`-factors of supercuspidal pairs), and the only one; it also matches duals, twists by characters and the `L`- and `ε`-factors of all pairs (10.29a). The statement of 10.29a is the form of [FormalProof], a map of its own, defined by cases, with the laws used in this family; (1) is the remark beside it.

(2) Let `θ̃` be a regular character of level zero of `F_n^×` with reduction `θ` on `k_n^×`, and `π_θ̃` the depth-zero supercuspidal representation of `GL_n(F)` attached to it. Then `rec_n(π_θ̃) = Ind_{W_{F_n}}^{W_F}((Δ_n θ̃)∘Art_{geo,F_n}⁻¹)`, where `Δ_n` is the unramified character with `Δ_n(ϖ) = (−1)^{n−1}`; its restriction to inertia is `⊕_{0≤j<n} θ^{q^j}∘t_n`; and for `n ≥ 2` and `ψ` trivial on `𝒪` and not on `ϖ⁻¹𝒪`, `ε(s, π_θ̃, ψ) = (−1)^{n−1}θ̃(ϖ)G_n(θ⁻¹)q^{−ns}`, so that the conductor is `n` (10.34).

(3) Let `E` be a CM field, `(π, χ)` a regular algebraic polarized cuspidal representation of `GL_n(𝔸_E)`, `ℓ` a prime, `ι : ℚ̄_ℓ ≅ ℂ` and `r = r_{ℓ,ι}(π)`. At every finite place `w ∤ ℓ`, `WD(r|_{G_{E_w}})^{F-ss} ≅ ι⁻¹rec^T(π_w)`, monodromy included (14.1); if `π_w` is of depth zero up to twist with pairwise unlinked supercuspidal support `{χ_i ⊗ π_{θ̃_i}}`, then `r` has `N = 0` at `w` and `r|_{I_w} ≅ ⊕_i ⊕_{j<n_i} ι⁻¹∘((χ_i∘Art⁻¹|_{I_w})·(θ_i^{q^j}∘t_{n_i}))` (14.2). At a place `w ∣ ℓ` where `rec^T(π_w)` has `N = 0` and each of its irreducible constituents is induced from a character of the Weil group of an unramified extension, `r|_{G_{E_w}}` is potentially crystalline, `WD(D_pst(r|_{G_{E_w}}))` has `N = 0`, and its Frobenius semisimplification agrees with `ι⁻¹rec^T(π_w)` on the Weil group of an unramified extension of `E_w`, and on all of `W_{E_w}` when `rec^T(π_w)` is a sum of characters or irreducible (15.1).

(4) Let `E/E⁺` be a CM extension with `[E⁺:ℚ] ≥ 2`, `V` a Hermitian space over `E` of dimension `n`, definite at every infinite place, and `Π` an automorphic representation of `U(V)(𝔸_{E⁺})` whose archimedean component is algebraic, of dominant highest weight `λ_τ` on `V ⊗_{E,τ} ℂ` for each embedding `τ : E → ℂ`, with weak base change `⊞_i Speh(π_i, d_i)` to `GL_n(𝔸_E)`. Then for every `ℓ` and `ι` the representation `⊕_i ⊕_{0≤j<d_i} r_{ℓ,ι}(π_i ⊗ |det|^{s_{ij}})`, `s_{ij} = (d_i − 1)/2 − j − (n − n_i)/2`, is continuous and semisimple, unramified with Frobenius polynomial `P_w(BC(Π)_w; X)` at every `w ∤ ℓ` at which the base change is unramified, and de Rham at every `w ∣ ℓ` with `τ`-labelled Hodge–Tate weights `{j − 1 − λ_{τ,j} : 1 ≤ j ≤ n}`, the labels read through `ι` (16.1). The statement of 16.1 is the case, which [FormalProof] has, of the standard Hermitian space over a CM extension unramified at every finite place, with the polynomial at the split places and crystalline where `Π` is unramified above `ℓ`; (4) in general is the remark beside it.

The statements extend two roadmaps and rest on two others of this family. Headline (1) restates, clause by clause and with the same hypotheses, what EndoscopicTransferAndUnitaryTraceComparison proves of its trace-defined correspondence, in the terms of the characterisation of LocalFactorsOfTwistsAndTypes; in (3), the comparisons 14.1 and 15.1 are cases of those of AutomorphicGaloisRepresentationsPartII, for which this roadmap adds routes that do not use their irreducibility input. [EndoscopicTransferAndUnitaryTraceComparison](../../EndoscopicTransferAndUnitaryTraceComparison/README.md) gives the trace-defined correspondence with its compatibilities, local and global cyclic base change, and weak base change from unitary groups; [AutomorphicGaloisRepresentationsPartII](../../AutomorphicGaloisRepresentationsPartII/README.md) gives the attached Galois representations, the away-prime comparison and admissibility at the coefficient prime. In the family [RiemannHypothesisForDirichletLFunctions](../README.md), [FiniteReductiveGroups](../FiniteReductiveGroups/README.md) gives the cuspidal representations of `GL_n(k)`, their Gauss sums, the Shintani lift and the labels of depth-zero representations, and [LocalFactorsOfTwistsAndTypes](../LocalFactorsOfTwistsAndTypes/README.md) the characterisation of local Langlands correspondences by `ε`-factors of pairs, the local converse theorem and the exponent bound for unitary generic representations.

The layers below carry the numbers of the layers they extend. Layer 6 constructs splitting characters for quadratic extensions of number fields. Layer 10 states the map of [FormalProof] with its laws, restates the identification of the trace-defined correspondence with the local Langlands and the classical correspondences, and computes it at depth zero, through local automorphic induction, characters at very regular elements and the lift of labels under unramified base change of prime degree. Layer 13 compares the cuspidal multiplicities of two inner forms of a unitary group in an odd number of variables. Layers 14–16 extend Layers AG2.5–AG2.7 of AutomorphicGaloisRepresentationsPartII.

## Conventions

Notation and conventions not restated here are those of EndoscopicTransferAndUnitaryTraceComparison (its Conventions and Layers 6 and 10) in Layers 6, 10 and 13, of AutomorphicGaloisRepresentationsPartII (its Conventions and Layer AG2.0) in Layers 14–16, and of FiniteReductiveGroups (its Layers 5 and 6) for representations of `GL_n` over finite fields and for representations of depth zero. A label AG2.k followed by a title in italics names the target of that title in Layer AG2.k of AutomorphicGaloisRepresentationsPartII.

Local notation (Layer 10 and the local statements of Layers 14–15). `F` is a finite extension of `ℚ_p` with ring of integers `𝒪`, maximal ideal `𝔭`, uniformiser `ϖ`, normalised valuation `v` and residue field `k ≅ 𝔽_q`; `F_n/F` is unramified of degree `n`, with residue field `k_n` and Frobenius generator `φ` of `Gal(F_n/F)`. `W_F ⊃ I_F` are the Weil group and inertia, and `Art_geo = Art_{geo,F}` is the reciprocity map sending uniformisers to geometric Frobenius. `rec_n = LLC_WD` is the trace-defined correspondence of EndoscopicTransferAndUnitaryTraceComparison §10.26, from irreducible smooth complex representations of `GL_n(F)` to Frobenius-semisimple `n`-dimensional Weil–Deligne representations `(ρ, N)`, and `σ_ss` its semisimple Weil parameter. `ψ` is a nontrivial additive character of `F`, `a(χ)` the conductor exponent of a character `χ` of `F^×`, and `ν = |det|`; `χ_1 × ⋯ × χ_n` is normalised parabolic induction, and two characters are linked when their quotient is `ν^{±1}`. `K = GL_n(𝒪)`. The tame characters `t_n : I_F → k_n^×` are defined in 10.34. Depth zero, depth zero up to twist, the label `m_π` of a representation of depth zero and its lift `m_π^{(l)}`, the representations `π(σ, c)` and `π_θ̃`, the Gauss sums `G_n` and `w`, and the Shintani lift `Sh_d` are those of FiniteReductiveGroups §§5.10, 5.11 and 6.1–6.4. Base change along an unramified cyclic extension of prime degree is that of EndoscopicTransferAndUnitaryTraceComparison §6.12 with AutomorphicSpectralTheory §7.0b.

Global notation (Layers 14–16). `E` is a CM field with complex conjugation `c`; `(π, χ)` is a regular algebraic polarized cuspidal representation of `GL_n(𝔸_E)` of weight `a ∈ (ℤⁿ)_w`; `ℓ` is a prime, `ι : ℚ̄_ℓ ≅ ℂ`, and `r_{ℓ,ι}(π)` is the attached Galois representation. It exists for every `ℓ` and `ι`, is continuous and semisimple, and is unique up to isomorphism: AutomorphicGaloisRepresentationsPartII AG2.3 *Arbitrary regular conjugate-self-dual existence*, after the twist of AG2.2 *Twisting an essentially self-dual form into unitary type*, with the uniqueness of AG2.0 *A Galois representation attached to `π` at the good places*. At every `w ∣ ℓ` it is de Rham with the labelled weights `a_{τ,i} + n − i`, and crystalline where `π_w` is spherical (AG2.6 *Polarized admissibility at the coefficient prime*). As in AutomorphicGaloisRepresentationsPartII, Frobenius elements are geometric, the cyclotomic character `ε_ℓ` has Hodge–Tate weight `−1`, the labelled Hodge–Tate weights of the weight `a` are `a_{τ,i} + n − i`, `rec^T(π_w) = rec(π_w ⊗ |det|^{(1−n)/2})` (the twist of [FormalProof], `Development/AbelianVarietyTheory/PublishedTheorems/GaloisCohomology₂/GaloisRepOfPolarizedCuspidal.lean` (`GlobalTheory.GalOfCusp.algNorm`)), and `P_w(π_w; X)` is the good-place polynomial. `WD` is the Weil–Deligne representation of a representation of `G_{E_w}` for `w ∤ ℓ`, or of its `D_pst` for `w ∣ ℓ`, and `F-ss` denotes Frobenius semisimplification. In Layers 14–16 `rec` is the correspondence in the geometric normalisation, `rec(χ) = χ∘Art⁻¹` with `Art` sending uniformisers to geometric Frobenius elements: it is `rec_n = LLC_WD` of Layer 10 (10.30). The classical correspondence of SmoothRepresentationsOfLocalGroups SR.5.2 that 10.30 calls `rec` is in the arithmetic normalisation and goes from parameters to representations; the two are related by `LLC_WD(π) = (rec⁻¹(π))^∨` (10.30).

**Statements of the formal proof.** Where a target names [FormalProof], the form that proof establishes is recorded at the target: its
hypotheses, ranges and constants are those of the proof, including restrictions that the route written here does not
visibly use. A wider or sharper form stated beside it is not in [FormalProof]; it is this roadmap's own, proved by the
route written here, unless its `*Origin:*` label says that it is published.

**Labels.** Under each section heading, `*Origin:*` says where its statement comes from and
`*Method of the formal proof:*` how [FormalProof] proves it. The statements of 10.30 and 10.33b are not statements of
[FormalProof]: 10.30 restates a published theorem through the section that states it, and 10.33b reads a published
character formula for `GL_n`. The remarks of 10.29a and 16.1 are set apart from their statements: that of 10.29a
restates a published theorem through the sections that state it, that of 16.1 is this roadmap's own formulation.

**Corollaries of general theorems.** A section may carry, as a third line under these two labels, `*Corollary of:*`,
which names a general theorem and the roadmap section that states it, and the clauses it covers when it does not cover
the whole section. The general theorem is proved in the roadmap that states it, and what the line covers is deduced
from it. The proof of the Riemann hypothesis for Dirichlet L-functions needs no more of the general theorem than that
case (for 13.0a, all of it): the `*Method of the formal proof:*` label says how [FormalProof] proves it, and for which form of the statement
when that proof has a narrower one. Where the route given with the section is not the deduction, it is a second proof,
[FormalProof]'s unless the label says that it differs; the `*Needs:*` line lists what that route needs, and the
deduction needs the section that the `*Corollary of:*` line names.

## Layer 6: Splitting characters of quadratic extensions

The quadratic character of a CM extension extends to a unitary Hecke character only under a parity condition at the real places; this layer constructs such characters for every quadratic extension of number fields, with prescribed infinity types.

### 6.3a Splitting characters for a quadratic extension

*Origin:* this roadmap's own formulation: splitting characters for every quadratic extension of number fields, every
`κ` and prescribed archimedean components, with the uniqueness clause and the avoidance of given split places; the
splitting condition is that of Kudla (1994), §1, and Harris, Kudla and Sweet (1996), §1, for Hecke characters with
infinity type in the sense of Hecke (1918, 1920).

*Method of the formal proof:* for `E` a CM field unramified over its maximal totally real subfield `F`, one unitary
Hecke character is prescribed on an open subgroup of the ideles (the archimedean character `∏(z/|z|)^{m_v}`, a subgroup
of units without roots of unity at an auxiliary split place, the units elsewhere) together with `E^×` and `𝔸_F^×`,
where it is `1` and `η`; the prescriptions are checked to agree and the character is extended to the idele group by
divisibility of the circle. Its powers and their twists by powers of the norm give the splitting characters used.

Prove that splitting characters exist. Let `E/F` be a quadratic extension of number fields,
`η` the quadratic character of `𝔸_F^×/F^×` attached to it by global Artin reciprocity, `κ ∈ ℤ`, and
for every real place `v` of `F` that is complex in `E` an integer `m_v ≡ κ (mod 2)`. Then there is a
continuous unitary character `χ` of `𝔸_E^×/E^×` with:

- `χ|_{𝔸_F^×} = η^κ` (through the inclusion `𝔸_F^× ⊂ 𝔸_E^×`);
- at every such `v`, `χ_v(z) = (z/|z|)^{m_v}` on `E_v^× ≅ ℂ^×`;
- `χ` unramified outside a finite set of places, which may be chosen to avoid any given finite set of
  places of `F` split in `E`.

Moreover two such characters with the same `κ` differ by a unitary Hecke character trivial on
`𝔸_F^×`, and the parity condition is necessary: on `ℝ^× ⊂ ℂ^×` the character `(z/|z|)^{m_v}` is
`sgn^{m_v}`, which must equal `η_v^κ = sgn^κ`; for `κ` even and every `m_v = 0` the trivial character is one of them.

*Route.* The map `F^×\𝔸_F^× → E^×\𝔸_E^×` is injective (`E^× ∩ 𝔸_F^× = F^×`), its image is closed,
being the kernel of the continuous endomorphism `x ↦ x/x^c` of `E^×\𝔸_E^×` (`c` the nontrivial
automorphism of `E/F`: if `x/x^c = e ∈ E^×`, then `ee^c = 1`, so `e = f/f^c` with `f ∈ E^×` by Hilbert's
theorem 90, and `xf⁻¹ ∈ 𝔸_F^×`), and it is a homeomorphism onto that image (the open mapping theorem for
a σ-compact source). The character `η^κ` of this closed subgroup extends to a unitary character of
`E^×\𝔸_E^×`, because every continuous unitary character of a closed subgroup `H` of a Hausdorff locally
compact abelian group `G` extends to `G`. This extension step is part of 6.3a, deduced from the
Pontryagin duality theorem of VonNeumannAlgebras Layer 11: characters of `G/H` separate its points, so
`H` is the annihilator of its annihilator `H^⊥` in the dual `Ĝ`; the duality theorem for `G` then
identifies `H` with the dual of `Ĝ/H^⊥`, and the duality theorem for `Ĝ/H^⊥` identifies `Ĝ/H^⊥` with `Ĥ`
through restriction. The archimedean components of the extension restrict to `sgn^κ` on
`ℝ^×`, which forces them to be `(z/|z|)^{m′_v}` with `m′_v ≡ κ` (a factor `|z|^{it}` would restrict to
`|x|^{2it}`); correct them by a unitary character of `E^×\𝔸_E^×` trivial on `𝔸_F^×` with prescribed
archimedean components `(z/|z|)^{m_v − m′_v}`, trivial on `ℝ^×` since `m_v − m′_v` is even (such
characters exist because `𝔸_E^×/E^×𝔸_F^×` is compact and the image of its archimedean part
`∏_v ℂ^×/ℝ^×` is closed; the extension step again). Finite ramification by local
continuity. Avoiding given split places: multiply by a character trivial on `𝔸_F^×` that cancels the
ramification there, constructed the same way with prescribed restriction to the local units.

(H. Hecke, *Eine neue Art von Zetafunktionen*, 1918–20, for characters with infinity type;
S. Kudla, Israel J. Math. 87 (1994), §1, for the splitting conditions; Harris–Kudla–Sweet, J. Amer.
Math. Soc. 9 (1996), §1.) The form that the family uses is [FormalProof],
`Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/ThetaParseval/IdeleNormCharacters/AbsFactsAlt.lean`
(`UpperTheory.Gal.TP.Chr.ChrEx`), with `Development/AbelianVarietyTheory/Definitions/Divisors/HilbertNinetyQuotientHomEqIff.lean`
(`GlobalTheory.WeilM.ResEtaPow`). *Needs:* GlobalNumberFields Layer 8 (idele classes, norms and the Galois
action), Layer 9 (Hecke characters), Layer 10 (infinity types); VonNeumannAlgebras Layer 11 (the Pontryagin
duality theorem, with V11.DoubleDualEmbedding for the separation of points); Mathlib
`groupCohomology.exists_div_of_norm_eq_one` (Hilbert's theorem 90) and `MonoidHom.isOpenMap_of_sigmaCompact`
(the open mapping theorem); ClassFieldTheory Layer 11 (`η` from global Artin reciprocity).

**Checks.**

- `F = ℚ`, `E` imaginary quadratic, `κ = 1`, `m = 1`: this is EndoscopicTransferAndUnitaryTraceComparison §6.3.
- `κ` odd forces `χ ≠ 1` and every `m_v` odd; `κ` even allows `χ = 1` with every `m_v = 0`.
- The character `(z/|z|)²` at a real place restricts trivially to `ℝ^×`, so it occurs only for `κ` even.

### Examples

For `F = ℚ`, `E` imaginary quadratic, `κ = 1` and `m = 1`, 6.3a is EndoscopicTransferAndUnitaryTraceComparison §6.3. For `κ` even the trivial character is a splitting character, with every `m_v = 0`; for `κ` odd every splitting character is nontrivial and every `m_v` is odd (6.3a).

### Dependencies

EndoscopicTransferAndUnitaryTraceComparison §6.3 (the case of the first Check); GlobalNumberFields Layers 8–10; VonNeumannAlgebras Layer 11; ClassFieldTheory Layer 11.

## Layer 10: Local Langlands correspondence, depth zero and unramified base change

The trace-defined correspondence of EndoscopicTransferAndUnitaryTraceComparison Layer 10 is identified with the local Langlands correspondence (the remark of 10.29a, 10.30) and then computed on representations of depth zero: through local automorphic induction from unramified extensions (10.33a), characters at very regular elements (10.33b), and the lift of labels along unramified base change of prime degree (10.33c, 10.33d), which give the explicit parameters (10.34) and the correspondence on representations of depth zero up to twist (10.35). Only characteristic zero is treated. 10.0a is Brauer's theorem in degree zero, an input of the form of [FormalProof] of 10.29a.

### 10.0a Brauer's theorem in degree zero

*Origin:* published: Deligne (1973), Proposition 1.5, Brauer's induction theorem in degree zero, there with `H`
elementary.

*Method of the formal proof:* induction on the order of `G`. Brauer's induction theorem, in a form with subgroups whose
quotient by their centre has prime-power order, reduces the statement to such subgroups; these are nilpotent, and an
irreducible character of one is linear or induced from a character of a proper subgroup; the differences
`Ind_H^G 1 − [G : H]` are treated by induction on the index, through an intermediate subgroup in which `H` is normal
with abelian quotient, where they are sums of differences `χ − 1` over the characters of that quotient. This is
Deligne's argument with these subgroups in place of elementary ones and the last induction run on the index. The route
written below is not that of [FormalProof]: it is Deligne's, which reduces to elementary groups and concludes by an
induction on the order through the quotient by the centre.

*Corollary of:* InductionRestriction §6.2 (Brauer's theorem in degree zero: `tr ρ − dim ρ` is an integral
combination of differences `Ind_H^G χ − Ind_H^G 1` with `H` elementary and `χ` linear).

For a finite group `G` and a finite-dimensional complex representation `ρ` of `G`, the virtual character `tr ρ − dim ρ`,
of degree zero, is an integral combination of differences `Ind_H^G χ − Ind_H^G 1`, with `H` a subgroup of `G` and `χ` a
linear character of `H`.

*Sources:* (Brauer; Deligne 1973, Proposition 1.5, which moreover takes `H` elementary; [FormalProof],
`Development/AbelianVarietyTheory/PublishedTheorems/GaloisCohomology₂/BrauerDegreeZero.lean`
(`GlobalTheory.Published.BrauerDegreeZero`)). *Route.* Deligne's: Brauer's induction theorem for the trivial
representation reduces the statement to elementary groups; an irreducible representation of an elementary group is
induced from a linear character of a subgroup, which then contains the centre; and an induction on the order, through
the quotient by the centre, concludes.

*Needs:* InductionRestriction Layer 6 (Brauer's induction theorem); Tau Ceti
`FDRep.exists_character_eq_indClassFun_of_isNilpotent` and `TauCeti.IsElementary.isNilpotent`.

### 10.27 The explicit threshold on the Weil side

*Origin:* published: Deligne and Henniart (1981), Theorem 4.6 and Lemma 4.7, the formula
`ε(V ⊗ χ, ψ) = ε(χ, ψ)^{dim V}·det V(c_χ)` for characters `χ` beyond the threshold of `V`; here its case of rank one, a
tamely ramified character twisting a character of conductor exponent `2`, with the element only asserted to exist.

*Method of the formal proof:* the Gauss sum of a character of conductor exponent `2` is split over the cosets of
`1 + 𝔭` modulo `𝔭²`; a coset contributes zero unless the additive character, scaled by it, reproduces
`z ↦ χ_w(1 + z)` on `𝔭`, at most one coset does, and a tamely ramified character is constant on it, so the twisted
Gauss sum is the value of the tamely ramified character at one point times the untwisted one.

*Corollary of:* EndoscopicTransferAndUnitaryTraceComparison §10.26a (the Deligne–Henniart formula
`ε(V ⊗ χ, ψ) = ε(χ, ψ)^{dim V}·det V(c_χ)` for `χ` whose break exceeds twice the largest break of `V − (dim V)·1`, with
`c_χ` fixed by `χ(1 + x) = ψ(c_χ⁻¹x)` for `v(x) ≥ ⌈a(χ)/2⌉`).

Let `E` be a number field, `w` a finite place of `E` with `E_w ≅ ℚ_p`, `ψ_w` a nontrivial additive character of `E_w`,
and `χ`, `ξ` Hecke characters of `E` whose components at `w` have `a(χ_w) = 2` and `ξ_w` trivial on `1 + 𝔭_w`. Then
`a(χ_wξ_w) = 2`, and there is `y ∈ E^×` with `ε(s, χ_wξ_w, ψ_w) = ξ_w(y)·ε(s, χ_w, ψ_w)`; the element that the proof
produces depends only on `χ_w` and `ψ_w`, not on `ξ`. It follows from
EndoscopicTransferAndUnitaryTraceComparison §10.26a for `V = ξ_w|·|^s` and for `V = |·|^s`, with `y` congruent to the
`c_χ` of `χ_w` modulo `1 + 𝔭` (`ξ_w` is trivial on `1 + 𝔭`, and `E^×` is dense in `E_w^×`). The form that the
family uses is [FormalProof] (`GlobalTheory.T.tateLocalEpsilonFactor_mul_tameChar`).

*Route.* That of [FormalProof], through the Gauss sum (the method above); its steps are not given here.

*Needs:* EndoscopicTransferAndUnitaryTraceComparison §10.26a (for the deduction).

**Checks** (on the element `c_χ` of EndoscopicTransferAndUnitaryTraceComparison §10.26a, to which `y` is congruent
modulo `1 + 𝔭`; the specified ideal is `v(x) ≥ ⌈a(χ)/2⌉`).
- `F = ℚ_3`, `ψ` trivial on `ℤ_3` and not on `3⁻¹ℤ_3`, `a(χ) = 2`: on `9ℤ_3` both `c = 1` and `c = 9` satisfy
  `χ(1 + x) = ψ(c⁻¹x)` (both sides are `1`), and for `V = |·|` they give `det V(c) = 1` and `1/9`; on the specified ideal
  `v(x) ≥ 1`, `x ↦ χ(1 + x)` is a nontrivial character of `3ℤ_3/9ℤ_3`, which `ψ(x)` does not reproduce and `ψ(ux/9)` does for
  a suitable unit `u`, so `v(c_χ) = 2`.
- The determination needs `a(χ) ≥ 2`: for `F = ℚ_3`, `ψ` as above and `χ` the nontrivial tamely ramified quadratic character
  (`a(χ) = 1`, specified ideal `3ℤ_3`), both sides of `χ(1 + x) = ψ(c⁻¹x)` are `1` for every `x ∈ 3ℤ_3` and every `c` of valuation
  at most `1`, for instance `c = 1` and `c = 3`; for `a(χ) = 2, 3, 4` the solutions all have valuation `a(χ)` and form one coset of
  `1 + 𝔭^{⌊a(χ)/2⌋}` (by enumeration over `ℚ_3`).
- The threshold cannot be lowered to every tame twist: for a nontrivial tamely ramified `χ` (`a(χ) = 1`, break `0`) and
  `V = χ⁻¹`, `V ⊗ χ = 1` has inertia invariants.

### 10.29a The trace-defined correspondence is the local Langlands correspondence

*Origin:* particular to this proof: a map from the irreducible smooth representations of `GL_n(F)` to Weil–Deligne
representations, defined by cases, with the laws used in this family (properties 1, 2 and 4, dimensions, the twists
`ν^s` and the absolute value of the determinant, and on the representations built from characters and, over `ℚ_p`, from
depth-zero supercuspidal representations also property 3, twists by characters, duals, injectivity and the inertial
type); nearest published result: on depth-zero supercuspidal representations it is given by the explicit tame
parameter of Henniart (1992) and Bushnell and Henniart (2005); the full correspondence is Harris and Taylor (2001) and
Henniart (2000). The remark below, the trace-defined correspondence as a local Langlands correspondence, is published
(Harris and Taylor (2001), Henniart (2000), Scholze (2013); the uniqueness, Henniart (1993)); it restates
EndoscopicTransferAndUnitaryTraceComparison §§10.20–10.30 clause by clause, in the terms of
LocalFactorsOfTwistsAndTypes §6.5.

*Method of the formal proof:* a local Artin map is fixed; characters go to their Artin characters, twists by
characters of depth-zero supercuspidal representations over `ℚ_p` go to the irreducible tame parameter whose inertial
characters are read off from the cuspidal representation of `GL_n(𝔽_p)` and whose determinant is prescribed by the
central character, every other supercuspidal representation goes to an unramified twist of one fixed irreducible
parameter, and the map is extended by the segment rule; the laws are then checked.

*Corollary of:* EndoscopicTransferAndUnitaryTraceComparison §§10.20–10.30 (the trace-defined correspondence `rec_n` is a
bijective local Langlands correspondence, compatible with duals and with twists by characters: the remark below), with
10.34 (iii) and 10.35 (d) for the clauses on depth zero: the maps `r_n = rec_n` have every property of the statement.

For `F/ℚ_p` finite there is a family of maps `r_n` (`n ≥ 1`) from the irreducible smooth representations of `GL_n(F)`
to the `n`-dimensional Frobenius-semisimple Weil–Deligne representations with properties 1, 2 and 4 of
LocalFactorsOfTwistsAndTypes §6.5 (numbered as there: `r_1(χ) = χ∘Art_geo⁻¹`; supercuspidal representations to
irreducible representations of `W_F` with `N = 0`; the segment rule), compatible with the twists by `ν^s`, `s` real,
with `|det r_n(π)| = |r_1(ω_π)|` for every irreducible `π`, and with the following laws on the representations whose
supercuspidal support consists of characters and, for `F = ℚ_p`, of twists by characters of depth-zero supercuspidal
representations: compatibility with twists by characters
and with contragredients, property 3 (`det r_n(π) = r_1(ω_π)`), injectivity, tameness of `r_n(π)` when `π` has depth
zero, and, for `F = ℚ_p`, `r_n(π_θ̃)|_{I_F} ≅ ⊕_{0≤j<n} θ^{p^j}∘t_n` (`t_n` as in 10.34). The form that the family uses is
[FormalProof], `Development/AutomorphicArithmetic/Foundations/LocalLanglands/IsRecTOfIsRec.lean`
(`UpperTheory.Zero.LLC.RecTExists`), stated for `F = E_w` the completion of a number field `E` at a finite place `w`,
the Weil group of `E_w` being taken inside `Gal(Ω/E)` for an algebraic closure `Ω` of `E` and a valuation ring of `Ω`
above `w`, with
`Development/AbelianVarietyTheory/PublishedTheorems/AutomorphicForms₂/HasExponentZeroIff.lean`
(`GlobalTheory.LocLanglands.IsLocalArtin`).

*Remark* (published, not a statement of [FormalProof]: the local Langlands correspondence of Harris and Taylor (2001),
Henniart (2000) and Scholze (2013), as EndoscopicTransferAndUnitaryTraceComparison §§10.20–10.30 state it for the
trace-defined correspondence, with the uniqueness of Henniart (1993) that LocalFactorsOfTwistsAndTypes §6.5 states).

For `F/ℚ_p` finite, nontrivial `ψ` and the normalisation of EndoscopicTransferAndUnitaryTraceComparison §10.1, the family
`rec_n := LLC_WD` (`n ≥ 1`) of EndoscopicTransferAndUnitaryTraceComparison §10.26 is a local Langlands correspondence in every rank
in the sense of LocalFactorsOfTwistsAndTypes §6.5 (its properties 1–5 are numbered as there), and the only one; moreover
`rec_n(π^∨) = rec_n(π)^∨`, `rec_n(π ⊗ χ∘det) = rec_n(π) ⊗ rec_1(χ)` for characters `χ` of `F^×` (the twist rule), and
`L(s, π × π') = L(s, rec_n π ⊗ rec_m π')`, `ε(s, π × π', ψ) = ε(s, rec_n π ⊗ rec_m π', ψ)` for all irreducible `π` of `GL_n(F)` and
`π'` of `GL_m(F)`, the factors of a pair in which `π` or `π'` is not generic being those defined through Langlands data in
EndoscopicTransferAndUnitaryTraceComparison §10.29.

This is EndoscopicTransferAndUnitaryTraceComparison clause by clause, with the same hypotheses: bijectivity onto the
Frobenius-semisimple `n`-dimensional Weil–Deligne classes is EndoscopicTransferAndUnitaryTraceComparison §10.26; property 1,
`rec_1(χ) = χ∘Art_geo⁻¹`, is the rank-one geometric reciprocity of EndoscopicTransferAndUnitaryTraceComparison §10.20, with `N = 0`
by EndoscopicTransferAndUnitaryTraceComparison §10.26; property 2, supercuspidal representations to irreducible representations of
`W_F` with `N = 0`, is EndoscopicTransferAndUnitaryTraceComparison §10.21 with EndoscopicTransferAndUnitaryTraceComparison §10.26;
property 3, `det rec_n(π) = rec_1(ω_π)`, is EndoscopicTransferAndUnitaryTraceComparison §10.30 (for supercuspidal `π` also
EndoscopicTransferAndUnitaryTraceComparison §10.28); property 4, the segment rule, is the definition of `LLC_WD` in
EndoscopicTransferAndUnitaryTraceComparison §10.26 through the adapter of EndoscopicTransferAndUnitaryTraceComparison §10.23;
property 5, `ε`-factors of supercuspidal pairs, is EndoscopicTransferAndUnitaryTraceComparison §10.28; the duals, the twist rule
and the factors of all pairs are EndoscopicTransferAndUnitaryTraceComparison §10.30. Uniqueness is LocalFactorsOfTwistsAndTypes §6.5.

*Route.* For the remark, the citations above. The route here obtains the duals and the twist rule without the classical theorem of
SmoothRepresentationsOfLocalGroups SR.5.2, from which EndoscopicTransferAndUnitaryTraceComparison §10.30 transports them: the duals
from EndoscopicTransferAndUnitaryTraceComparison §10.28 and the twist rule from EndoscopicTransferAndUnitaryTraceComparison §10.20.
For the statement, the definition by cases of the method above, with its laws checked; those steps are not given here.
The construction of the form of [FormalProof] uses two published inputs: the theorem on units (for a number field `E` and
integers `m, b ≥ 1` there is `a ≥ 1` prime to `b` such that every unit congruent to `1` modulo `a` is an `m`-th power:
GL2AutomorphicRepresentationsAndTransfer §R16.1.7 for the unit group and the places above the primes dividing `b`, with `a`
the positive generator of the intersection of its modulus with `ℤ`), for the injectivity of the map from a local
multiplicative group into the abelianised global Galois group; and Brauer's theorem in degree zero (10.0a).

*Needs:* for the statement: FiniteReductiveGroups §§6.1–6.4; SmoothRepresentationsOfLocalGroups SR.5.2
(*segment-representations*); ClassFieldTheory Layer 9; GL2AutomorphicRepresentationsAndTransfer §R16.1.7; 10.0a. For
the remark: EndoscopicTransferAndUnitaryTraceComparison §§10.20–10.21, 10.23, 10.26, 10.28–10.30;
LocalFactorsOfTwistsAndTypes §6.5 and AutomorphicLFunctionsAndLocalFactors AL.3.2–AL.3.3.

**Checks.**
- `n = 1`: property 1 alone.
- For supercuspidal `π`, `π'` of unequal ranks `L(s, π × π') = 1` on both sides, so 5 for them is the equality of
  `γ`-factors on which the uniqueness argument of LocalFactorsOfTwistsAndTypes §6.5 runs.

### 10.30 The classical correspondence is the trace-defined correspondence

*Origin:* published: Scholze (2013), Theorem 1.2, with Henniart (2002), Theorem 1.8, the identification of the
trace-defined correspondence with the classical correspondence of Harris and Taylor (2001) and Henniart (2000);
EndoscopicTransferAndUnitaryTraceComparison §10.30 states it.

*Method of the formal proof:* none; the statement is not in [FormalProof].

For every `n ≥ 1` and every irreducible smooth complex representation `π` of `GL_n(F)`, `LLC_WD(π) = C_geo(π)`, where `C_geo(π) = (rec⁻¹(π))^∨` is the classical correspondence `rec` of SmoothRepresentationsOfLocalGroups SR.5.2 transported to the geometric normalisation. This is EndoscopicTransferAndUnitaryTraceComparison §10.30, with its identities of standard and pair factors with full monodromy and of the newvector exponent with the Artin–Deligne conductor; `C_geo(π) = (rec⁻¹(π))^∨`, the transport of LocalFactorsOfTwistsAndTypes §6.5, is the `C_geo` of EndoscopicTransferAndUnitaryTraceComparison §10.30.

*Needs:* EndoscopicTransferAndUnitaryTraceComparison §10.30; LocalFactorsOfTwistsAndTypes §6.5; SmoothRepresentationsOfLocalGroups SR.5.2 (*classical-llc-normalization*).

### 10.33a Local automorphic induction from unramified extensions

*Origin:* published: Henniart (1992), the explicit correspondence in the unramified case: the representation attached
to a character of `F_n^×` with pairwise distinct conjugates has the parameter induced from it (a); at level zero, (a)
and (b) are in Yang (2019), by the route written here. The global form of (b) at level zero over `ℚ_p` that
[FormalProof] has is particular to this proof; nearest published result: Silberger and Zink (2008), Shintani base
change against restriction of tame parameters, and Adler and Lansky (2005), depth-zero base change for `U(2,1)`.

*Method of the formal proof:* only (b), at level zero over `ℚ_p`, for the component of a weak base change of a cuspidal
automorphic representation along a tower of extensions of prime degree, with the characters identified on units: a
depth-zero representation is labelled by the cuspidal characters over the residue field whose Harish-Chandra product
meets its first-congruence invariants; the label is unchanged at split steps of the tower and replaced by its Shintani
lift at inert unramified steps, through a trace identity for test functions inflated from the residue field (10.33c),
and at the top the lifted label gives a type and a supercuspidal support of `n` tamely ramified characters.

For `F/ℚ_p` finite, `F_n/F` unramified of degree `n` with Frobenius generator `φ` of `Gal(F_n/F)`, and a character `ξ`
of `F_n^×` whose conjugates `ξ∘φ^j`, `0 ≤ j < n`, are pairwise distinct:
(a) there is a unique supercuspidal representation `A(ξ) = A_{F_n/F}(ξ)` of `GL_n(F)` with
`LLC_WD(A(ξ)) = Ind_{W_{F_n}}^{W_F}(ξ∘Art_{geo,F_n}⁻¹)`, `N = 0`; `A(ξ∘φ) = A(ξ)`, `A(ξ·χ∘N_{F_n/F}) = A(ξ) ⊗ χ∘det` for
characters `χ` of `F^×`, and the central character of `A(ξ)` is `ξ|_{F^×}·η_n`, `η_n` the unramified character with
`η_n(ϖ) = (−1)^{n−1}`;
(b) the base change of `A(ξ)` to `F_n`, along any tower of cyclic extensions of prime degree (EndoscopicTransferAndUnitaryTraceComparison §6.12), is the
irreducible normalised induction `ξ × ξ∘φ × ⋯ × ξ∘φ^{n−1}`.

*Route.* (a) `Ind(ξ∘Art⁻¹)` is irreducible by Mackey's criterion (the conjugates are distinct) and has finite inertia
image (`ξ` is continuous on the compact `𝒪_{F_n}^×`); EndoscopicTransferAndUnitaryTraceComparison §10.21 gives a unique supercuspidal `π` with `σ_ss(π)` equal to
it, and on supercuspidal representations `LLC_WD = σ_ss` with `N = 0` (EndoscopicTransferAndUnitaryTraceComparison §10.26). The conjugation, twist and central
character statements follow from `Ind(ξ∘φ) ≅ Ind(ξ)`, `Ind(ξ·χ∘N) ≅ Ind(ξ) ⊗ χ` and `det Ind(ξ) = ξ|_{F^×}·det Ind(1)`,
`det Ind(1)(ϖ)` being the sign `(−1)^{n−1}` of the `n`-cycle by which Frobenius permutes `W_F/W_{F_n}`, with the
central characters of EndoscopicTransferAndUnitaryTraceComparison §10.28 and the twists of
EndoscopicTransferAndUnitaryTraceComparison §10.20, for the supercuspidal `A(ξ)`, on which `LLC_WD = σ_ss`
(EndoscopicTransferAndUnitaryTraceComparison §10.26). (b) At each prime-degree step the lift of a supercuspidal representation is supercuspidal or the
irreducible induction of a full orbit of distinct conjugate supercuspidal representations of lower rank (EndoscopicTransferAndUnitaryTraceComparison §6.12), and
EndoscopicTransferAndUnitaryTraceComparison §10.20 gives `σ_ss(BC π) = σ_ss(π)|_{W_E}` for supercuspidal `π` and additivity on normalised induction; so the lift to
`F_n` has semisimple parameter `Ind(ξ)|_{W_{F_n}} = ⊕_j ξ∘φ^j∘Art⁻¹`, its supercuspidal support is `{ξ∘φ^j}` (rank one of
EndoscopicTransferAndUnitaryTraceComparison §10.21), and it is the irreducible induction of these characters, which are pairwise unlinked (their quotients have
absolute value one and are not trivial).

*Needs:* EndoscopicTransferAndUnitaryTraceComparison §§6.12, 10.20, 10.21, 10.26, 10.28; InductionRestriction Layers 4, 5 (Mackey's irreducibility criterion,
Clifford theory); ClassFieldTheory Layer 9.

**Checks.**
- `n = 1`: `A(ξ) = ξ`.
- `n = 2`: the central character of `A(ξ)` is `ξ|_{F^×}` times the unramified quadratic character, not `ξ|_{F^×}`.
- (a), (b) for `ξ = χ∘N_{F_n/F}`: the conjugates coincide, `Ind(ξ)` is reducible, and the hypothesis excludes it.
- Unramified twists: for `κ` an unramified character of `F^×` of order `n`, `κ∘N_{F_n/F} = 1`, so `A(ξ) ⊗ κ∘det ≅ A(ξ)`.
- The character of `A(ξ)` for `ξ` of level zero at elements `ϖ^a u` with `u` of regular elliptic reduction is computed in
  10.34's Checks from 10.34 (iv) and 10.33b.

### 10.33b Characters of depth-zero supercuspidal representations at very regular elements

*Origin:* published: DeBacker and Reeder (2009), Lemmas 9.3.1 and 10.0.4 with Proposition 10.1.1, the character of a
depth-zero supercuspidal representation of an unramified group at a central element times a regular element of the
parahoric subgroup; the statement is its case of `GL_n` and its unramified elliptic torus.

*Method of the formal proof:* none; the statement is not in [FormalProof].

For `F/ℚ_p` finite with residue field `k`, `K = GL_n(𝒪)`, an irreducible cuspidal representation `σ` of `GL_n(k)` and a
character `c` of `F^×` as in FiniteReductiveGroups §6.1, let `π = π(σ, c)`. For every `a ∈ ℤ` and every
`u ∈ K` whose reduction `ū` is regular elliptic, `Θ_π(ϖ^a u) = c(ϖ)^a χ_σ(ū)`. For `π = π_{θ̃}` (FiniteReductiveGroups §6.2)
and `z̄` the eigenvalue of `ū`, `Θ_{π_{θ̃}}(u) = (−1)^{n−1}Σ_{j=0}^{n−1} θ(z̄^{q^j})`.

*Route.* `g = ϖ^a u` is elliptic regular (its characteristic polynomial reduces, after scaling, to an irreducible one),
so `Θ_π` is locally constant near `g` (EndoscopicTransferAndUnitaryTraceComparison §2.16(b)). For `f` supported in a small neighbourhood `V` of `g` stable under
conjugation by `K`, `π(f)` acts on `c-Ind_{F^×K}^G Λ_{σ,c}` with kernel supported on the pairs of cosets related by `V`, and
its trace is `Σ_{x ∈ G/F^×K} ∫ f(h) tr Λ(x⁻¹hx) 1_{F^×K}(x⁻¹hx) dh`, a finite sum since `x⁻¹hx ∈ F^×K` means that `h` fixes
the vertex `x·[𝒪^n]` of the building, and an elliptic element fixes a bounded set of vertices. An element `h = ϖ^au′`
near `g` (so `u′ ∈ K` with reduction `ū`) fixes only the vertex `[𝒪^n]`: let `L′` be an `h`-stable lattice, scaled so that
`L′ ⊂ L = 𝒪^n` and `L′ ⊄ ϖL`; its image in `L/ϖL` is a nonzero `ū`-stable subspace, hence all of `L/ϖL` because the
characteristic polynomial of `ū` is irreducible, and `L′ = L` by Nakayama's lemma. So
`Θ_π(g) = tr Λ(g) = c(ϖ)^a χ_σ(ū)`. The value for `π_{θ̃}` is FiniteReductiveGroups §5.2 at `ū`.

*Needs:* EndoscopicTransferAndUnitaryTraceComparison §2.16; FiniteReductiveGroups §§5.2, 6.1–6.2; SmoothRepresentationsOfLocalGroups SR.2.1
(compact induction).

**Checks.**
- `n = 1`: `π = c` and `Θ_π(ϖ^a u) = c(ϖ^a u)`.
- `n = 2`, `u` with reduction of eigenvalue `z̄ ∈ k_2 ∖ k`: `Θ = −(θ(z̄) + θ(z̄^q))`; for a unit whose reduction is scalar,
  every vertex adjacent to `[𝒪²]` is fixed, and the formula does not apply.

### 10.33c Matching of functions inflated from the residue field

*Origin:* adapted from Kottwitz (1986), the matching of the unit elements (the case `f = 1`): here every function
inflated from a class function on `GL_n(k)`, with the Shintani lift on the twisted side.

*Method of the formal proof:* for integral regular semisimple `γ` one element `δ₀` of `K_d` with norm `γ` is chosen;
every `δ` with norm conjugate to `γ` is `σ`-conjugate to `δ₀` by a form of Hilbert's theorem 90; an `x` with
`x⁻¹δ₀σ(x) ∈ K_d` lies in `GL_n(F)·K_d`, by descent of lattices; and the twisted orbit sum is then the ordinary one term
by term, the values agreeing because the Shintani lift is read through the norm on reductions; for non-integral `γ`
both sides vanish. This is Kottwitz's argument for the unit element, carried to functions inflated from class
functions of the residue field.

Let `F/ℚ_p` be finite with residue field `k`, `F_d/F` unramified of degree `d ≥ 1` with residue field `k_d` and Frobenius `σ`,
`K = GL_n(𝒪_F)` and `K_d = GL_n(𝒪_{F_d})`, the Haar measures of `GL_n(F)` and `GL_n(F_d)` giving `K` and `K_d` volume one, and
`Nδ = δσ(δ)⋯σ^{d−1}(δ)` for `δ ∈ GL_n(F_d)`. For a class function `f` on `GL_n(k)` let `φ_f` be the function on `GL_n(F)` supported
on `K` and equal there to `f` of the reduction, and `φ′_f` the function on `GL_n(F_d)` supported on `K_d` and equal there to
`Sh_d(f)` of the reduction (FiniteReductiveGroups §5.11 (b), for `k_d/k`). Then:
(a) for every `δ ∈ GL_n(F_d)` whose norm is regular semisimple, `Nδ` is conjugate to an element `γ` of `GL_n(F)`, the
`σ`-centraliser `{x : x⁻¹δσ(x) = δ}` is identified with the centraliser `G_γ(F)` of `γ` in `GL_n(F)`, and, with the same Haar
measure on both, `TO_{δ,σ}(φ′_f) = O_γ(φ_f)`, where `TO_{δ,σ}(φ) = ∫_{G_γ(F)∖GL_n(F_d)} φ(x⁻¹δσ(x))dx` and
`O_γ(φ) = ∫_{G_γ(F)∖GL_n(F)} φ(x⁻¹γx)dx`;
(b) `O_γ(φ_f) = 0` for every regular semisimple `γ ∈ GL_n(F)` that is not conjugate to a norm.
For `d` prime, `φ′_f` and `φ_f` are therefore matching functions in the sense of AutomorphicSpectralTheory §7.0b, with the
measures of AutomorphicSpectralTheory §7.0a.
The orbital-integral identity of (a) and the vanishing (b) are the two clauses of [FormalProof],
`Development/AbelianVarietyTheory/Definitions/Divisors/IntersectionFamilySymmetric.lean` (`GlobalTheory.DZA.InflMatching`), with
`Development/AbelianVarietyTheory/Definitions/Divisors/SimpleTwistedTraceFormulaStable.lean` (`GlobalTheory.BCT.twOrb`) and
`Development/AbelianVarietyTheory/Definitions/Divisors/IntersectionFamilySymmetric.lean` (`GlobalTheory.DZA.infl`).

*Route.* `σ(Nδ) = δ⁻¹(Nδ)δ`, so the characteristic polynomial of `Nδ` has coefficients in `F`; a regular semisimple matrix is
conjugate over its field of coefficients to its companion matrix, which gives `γ`. *The `σ`-centraliser, for every `δ`.*
Two regular semisimple matrices with the same characteristic polynomial are conjugate in `GL_n(F_d)`; for `g ∈ GL_n(F_d)`,
`N(g⁻¹δσ(g)) = g⁻¹(Nδ)g`, and `x ↦ g⁻¹xg` carries the `σ`-centraliser of `δ` onto that of `g⁻¹δσ(g)`. So we may assume `Nδ = γ`.
Then `σ(γ) = δ⁻¹γδ` (from `σ^d = 1`) and `σ(γ) = γ`, so `δ` commutes with `γ`; as `γ` is regular semisimple, its commutant in
`M_n(F_d)` is `F_d[γ]`, so `δ ∈ F_d[γ]^×`. If `x⁻¹δσ(x) = δ`, then applying this `d` times gives `x⁻¹(Nδ)σ^d(x) = Nδ`, so `x`
commutes with `γ`, hence `x ∈ F_d[γ]` commutes with `δ`, and `δσ(x) = xδ = δx` gives `σ(x) = x`: `x ∈ F[γ]^× = G_γ(F)`. Conversely
every element of `G_γ(F) = F[γ]^×` commutes with `δ` and is `σ`-fixed. This holds with no integrality condition on `γ`. Call `γ`
integral if `χ_γ` has coefficients in `𝒪_F` and unit constant term. If `γ` has a conjugate in `K_d`, or a `σ`-conjugate of a `δ` with norm class `γ` lies in `K_d`
(its norm is then a conjugate of `γ` lying in `K_d`), then `γ` is integral; so for non-integral `γ` both sides vanish. Let `γ` be
integral, `B = 𝒪_F[X]/(χ_γ)` and `A = 𝒪_{F_d} ⊗_{𝒪_F} B` with `σ` acting on the first factor: `A` is finite étale and Galois over
`B` with group `ℤ/d`, and `B` is a finite product of complete local rings with finite residue fields. The norm
`y ↦ yσ(y)⋯σ^{d−1}(y)` maps `A^×` onto `B^×`: modulo the radical `J` of `B` it is a product of norms of extensions of finite
fields, which are onto; on `(1 + J^iA)/(1 + J^{i+1}A)`, `i ≥ 1`, it is the trace `A → B` tensored with `J^i/J^{i+1}`, onto because
`A/B` is étale; and `B` is `J`-adically complete. So the unit `X` of `B` is `yσ(y)⋯σ^{d−1}(y)` with `y ∈ A^×`; for a lift
`p ∈ 𝒪_{F_d}[X]` of `y`, `δ₀ = p(γ)` has norm `γ` (Cayley–Hamilton), commutes with `G_γ(F)`, and lies in `K_d` together with its
inverse (a polynomial in `γ` lifting `y⁻¹`) whenever `γ ∈ K`. Every `δ` whose norm is conjugate to `γ` is `σ`-conjugate to `δ₀`:
after replacing `δ` by `g⁻¹δσ(g)`, `Nδ = γ`; then `δσ(γ)δ⁻¹ = γ` (from `σ^d = 1`), so `δ` lies in `(F_d ⊗_F F[γ])^×`, where `δ` and `δ₀`
have the same norm over `F[γ]`, and Hilbert's theorem 90 for this cyclic étale algebra gives `δ = x⁻¹δ₀σ(x)`. The
`σ`-centraliser of `δ₀` is `G_γ(F)` (above). So it suffices to treat `δ = δ₀`. If `x⁻¹δ₀σ(x) ∈ K_d`, its norm `x⁻¹γx` lies in `K_d`, hence `x⁻¹δ₀x = p(x⁻¹γx) ∈ K_d`, hence
`x⁻¹σ(x) ∈ K_d`; then the lattice `x𝒪_{F_d}^n` is `σ`-stable, hence spanned by its `σ`-invariants (the first cohomology of
`Gal(F_d/F)` with values in `GL_n(𝒪_{F_d})` is trivial: Lang's theorem modulo the maximal ideal, then successive approximation),
and `x ∈ GL_n(F)·K_d`. For `h ∈ GL_n(F)`, `h⁻¹δ₀h ∈ K_d` iff `h⁻¹γh ∈ K` (one direction as above, the other by taking the norm),
and then the reduction of `h⁻¹δ₀h` has norm the reduction of `h⁻¹γh`, so `φ′_f(h⁻¹δ₀σ(h)) = φ′_f(h⁻¹δ₀h) = φ_f(h⁻¹γh)`. The
integrands are invariant under conjugation by `K`, respectively `σ`-conjugation by `K_d` (`f` is a class function and `Sh_d(f)` an
`F`-class function), so both integrals are sums over `G_γ(F)∖GL_n(F)/K` (as `GL_n(F)K_d/K_d = GL_n(F)/K`, `GL_n(F) ∩ K_d = K`) with
the weights `vol(G_γ(F) ∩ hKh⁻¹)⁻¹ = vol(G_γ(F) ∩ hK_dh⁻¹)⁻¹`, and they agree term by term. Finally, an integral regular
semisimple `γ` is the norm of `δ₀`, which gives (b).

*Needs:* AutomorphicSpectralTheory §§7.0a–7.0b (twisted objects, measures, matching); FiniteReductiveGroups §5.11 (a), (b) (norm classes and the Shintani lift in degree `d`); ReductiveGroups Layer 7a (Lang's theorem).

**Checks.**
- `f = 1`: `φ_f = 1_K`, `φ′_f = 1_{K_d}`, and (a), (b) are the matching of the spherical units of AutomorphicSpectralTheory §7.0b.
- `n = 1`: `O_γ(φ_f) = f(γ̄)` for a unit `γ` and `0` otherwise; `TO_δ(φ′_f) = f(N_{k_d/k}(δ̄))` for a unit `δ` and `0` otherwise; every
  unit of `F` is a norm from `F_d`, and no non-unit is conjugate to the norm of a unit.
- `d = 1`: `φ′_f = φ_f`.
- The surjectivity of the norm on the units of the finite algebras, by enumeration on truncations `𝒪/p^e` (`p = 2, 3`, `e ≤ 3`,
  `d = 2, 3`; `χ` linear, `(X − 1)²` and `X² + X + 1` modulo `2`, `X² + 7X + 1` modulo `9`): onto in every case.

The case `f = 1` is due to Kottwitz.

### 10.33d Labels of depth-zero representations under unramified base change of prime degree

*Origin:* this roadmap's own formulation: the label of the base change of a depth-zero representation along an
unramified extension of prime degree, in terms of the labels of FiniteReductiveGroups §6.3, with (a) and the global
form (b), which is the form that [FormalProof] has; the relation between Shintani base change and restriction of tame
parameters under Macdonald's correspondence is Silberger and Zink (2008).

*Method of the formal proof:* (b) only, for the global pair: a twisted trace identity at the inert place, proved for
that pair, is applied to the function inflated from the conjugate of the character of the label and to the function
inflated from its Shintani lift, which match by 10.33c; both act through the invariants of the first congruence
subgroups, so the nonvanishing of the trace below forces the Shintani lift to act nontrivially on the invariants above,
and the Shintani lift annihilates every representation of the finite group that does not carry the lifted label.

Let `F/ℚ_p` be finite with residue field `k ≅ 𝔽_q`, `F_l/F` unramified of prime degree `l` with residue field `k_l`, and `π` an
irreducible representation of `GL_n(F)` of depth zero with label `m_π` (FiniteReductiveGroups §6.3). Let `Π`
be its base change to `F_l` (EndoscopicTransferAndUnitaryTraceComparison §6.12 with AutomorphicSpectralTheory §7.0b: the tempered lift if `π` is essentially tempered, the
Langlands base change in general). Then `Π` has depth zero and label `m_π^{(l)}`, the lift of FiniteReductiveGroups §5.11.
Consequently:
(a) for `F_f/F` unramified with `n ∣ f` and a regular character `θ̃` of level zero of `F_n^×` with `π_{θ̃}` unitary, the base change
of `π_{θ̃}` along any tower of unramified extensions of prime degree from `F` to `F_f` is the irreducible principal series of `n`
unitary tamely ramified characters of `F_f^×` whose restrictions to `𝒪_{F_f}^×` reduce to the characters `θ^{q^j}∘N_{k_f/k_n}`,
`0 ≤ j < n`;
(b) (global form) for a cyclic extension `E′/E` of number fields of prime degree `l`, a unitary cuspidal representation `π` of
`GL_n(𝔸_E)` with cuspidal base change `Π`, and a finite place `w` of `E`, inert and unramified in `E′`, at which `π_w` has depth
zero, `Π_{w′}` (`w′ | w`) has depth zero and label `m_{π_w}^{(l)}`.
The global form (b) is the one [FormalProof] has, for totally complex fields; the local statement and (a) are this roadmap's.
For (b) the form that the family uses is [FormalProof],
`Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/RegularSemisimpleFibres/PStepInert.lean`
(`UpperTheory.Gal.InertialTypesAlt.stepInert`).

*Route.* *Essentially tempered `π`.* Let `χ` be the character of the Harish-Chandra product of cuspidal representations of
`GL_n(k)` of label `m_π`. Every constituent of `π^{K₁}` lies in that series (FiniteReductiveGroups §6.3) and is a constituent of
the product (DeligneLusztigTheory §2.6 (d)); `π(φ_{conj χ})` maps `π` into `π^{K₁}` and acts there as `|GL_n(k)|⁻¹ Σ_x conj χ(x)·π^{K₁}(x)`, so
`tr π(φ_{conj χ}) = ⟨tr π^{K₁}, χ⟩_{GL_n(k)} > 0` (`π^{K₁} ≠ 0`). By 10.33c with `d = l`, `φ′_{conj χ}` and `φ_{conj χ}` match, and the
character identity of AutomorphicSpectralTheory §7.0b gives `tr(Π(φ′_{conj χ})A_Π) = tr π(φ_{conj χ}) ≠ 0`. The operator `Π(φ′_{conj χ})`
maps `Π` into the invariants of the first congruence subgroup `K₁′` of `GL_n(𝒪_{F_l})` and acts there as
`|GL_n(k_l)|⁻¹ Σ_δ conj Sh_l χ(δ)·Π^{K₁′}(δ)`, and `A_Π` preserves `Π^{K₁′}` (`σ(K₁′) = K₁′`); so
`Σ_δ conj Sh_l χ(δ)·Π^{K₁′}(δ) ≠ 0`. By FiniteReductiveGroups §5.11 (e), `Π^{K₁′}` has a constituent of label `m_π^{(l)}`; so `Π` has
depth zero and, by FiniteReductiveGroups §6.3, label `m_π^{(l)}`. *General `π`.* `π` is the Langlands quotient of a product of essentially tempered
representations `π_i`, of depth zero (FiniteReductiveGroups §6.3: the members of the supercuspidal support have depth zero); `Π` is the Langlands
quotient of the product of their lifts, whose supercuspidal supports together form that of `Π`; labels are additive over
supercuspidal supports (FiniteReductiveGroups §6.3), so the label of `Π` is `Σ_i m_{π_i}^{(l)} = m_π^{(l)}`. (a) Each step of the tower is an irreducible
tempered representation of depth zero: an irreducible unitary induction of unitary supercuspidal representations, whose
lift is the product of the lifts of its members (EndoscopicTransferAndUnitaryTraceComparison §6.12: the lift of a supercuspidal representation is supercuspidal or the
induction of the orbit of its distinct conjugate supercuspidal representations of lower rank; AutomorphicSpectralTheory §7.0b for products, both
products being irreducible). The iterated lift of the label `{[θ]}` to `k_f` consists of the `n` orbits `{θ^{q^j}∘N_{k_f/k_n}}` of size
one (FiniteReductiveGroups §5.11), so by FiniteReductiveGroups §6.3 (and FiniteReductiveGroups §6.2 in rank one) the supercuspidal support at the top consists of `n` tamely ramified characters
with these reductions; they are unitary and pairwise distinct on the units, hence pairwise unlinked, and the tempered top
representation is their irreducible product. (b) EndoscopicTransferAndUnitaryTraceComparison §6.24 identifies `Π_{w′}` with the local base change of `π_w`, to which the
general case applies.

*Needs:* 10.33c; EndoscopicTransferAndUnitaryTraceComparison §§6.12, 6.24; AutomorphicSpectralTheory §7.0b; FiniteReductiveGroups §§5.11, 6.1–6.3;
DeligneLusztigTheory §§2.6 (d), 2.9 (the Harish-Chandra series of a label, over residue fields that need not
be prime fields); SmoothRepresentationsOfLocalGroups SR.3.1, SR.3.3 (supercuspidal support; the Langlands classification).

**Checks.**
- `π` an unramified principal series: label `n·{1}`, lifted label `n·{1}`, and `Π` is unramified (EndoscopicTransferAndUnitaryTraceComparison §6.12, Checks).
- `n = l = 2`, `π = π_{θ̃}` unitary: the label of `Π` is `{θ}, {θ^q}` over `k₂` (two orbits of size one), so `Π` is the principal series
  of two tamely ramified characters with reductions `θ`, `θ^q`, as in 10.33a (b); on the finite field, the Shintani lift of `σ_θ`
  to `GL₂(k₂)` is the twisted character of `R(θ ⊠ θ^q)` (FiniteReductiveGroups §5.11, Checks).
- `n = 2`, `l = 3`: `Π` is the depth-zero supercuspidal representation whose reduction is `θ∘N_{k₆/k₂}`, regular of degree `2` over
  `k₃`. `n = l = 3`: the principal series of three tamely ramified characters with reductions `θ, θ^q, θ^{q²}`.
- Without the splitting of orbits in the lift (keeping `{[θ]}` as one orbit over `k₂`), the lift of `π_{θ̃}` for `n = l = 2` would be
  supercuspidal, contradicting 10.33a (b).

### 10.34 Explicit parameters of depth-zero supercuspidal representations

*Origin:* published: Henniart (1992), in the unramified case, and Bushnell and Henniart (2005), for essentially tame
representations: the explicit local Langlands correspondence at depth zero, with the rectifier `Δ_n`.

*Method of the formal proof:* the inertial formula (iii) is, in the formal proof, the defining property of its map of
10.29a at a depth-zero supercuspidal representation over `ℚ_p`: the parameter is taken to be the irreducible tame one
with inertial characters `θ^{p^j}∘t_n` and the given central character, and what is proved is that the label `θ`, the
tame character and the parameter are well defined; the comparison with Galois representations is made globally, in
14.2.

For `F/ℚ_p` finite with residue field `k`, `F_n/F` unramified of degree `n` with residue field `k_n` and Frobenius
generator `φ`, and `θ̃` a regular character of level zero of `F_n^×` with reduction `θ` on `k_n^×`
(FiniteReductiveGroups §6.2), let `π_{θ̃}` be the depth-zero supercuspidal representation of that target,
and let `t_n : I_F → k_n^×` send `σ` to the reduction of `Art_{geo,F_n}⁻¹(σ) ∈ 𝒪_{F_n}^×` (`I_F = I_{F_n}`).
(i) `rec_n(π_{θ̃})` is an irreducible representation of `W_F` with `N = 0`, of determinant `θ̃|_{F^×}∘Art_geo⁻¹`.
(ii) For `n ≥ 2` and `ψ` trivial on `𝒪` and not on `ϖ⁻¹𝒪`, `ε(s, π_{θ̃}, ψ) = (−1)^{n−1}θ̃(ϖ)G_n(θ⁻¹)q^{−ns}`, with `G_n` the
Gauss sum of FiniteReductiveGroups §5.10 for the character `ψ₀(x̄) = ψ(x/ϖ)` of `k`; so the conductor of `π_{θ̃}` and of
`rec_n(π_{θ̃})` is `n`, and `rec_n(π_{θ̃})` is trivial on wild inertia.
(iii) `rec_n(π_{θ̃})|_{I_F} ≅ ⊕_{j=0}^{n−1} θ^{q^j}∘t_n`.
(iv) `rec_n(π_{θ̃}) = Ind_{W_{F_n}}^{W_F}((Δ_n θ̃)∘Art_{geo,F_n}⁻¹)`, `Δ_n` the unramified character of `F_n^×` with
`Δ_n(ϖ) = (−1)^{n−1}`; that is, `π_{θ̃} = A_{F_n/F}(Δ_nθ̃)` (10.33a).
The route below proves (iii) and (iv) in every rank by unramified base change of prime degree (10.33d). For `n ≤ 3` a
second route, by the `ε`-factors of twists by characters, is recorded; in rank three it rests on two cited theorems: the
local converse theorem with twists by characters in its half range (LocalFactorsOfTwistsAndTypes §6.4,
characteristic zero) and the Deligne–Henniart twist formula with its explicit threshold (EndoscopicTransferAndUnitaryTraceComparison §10.26a) (for a representation `V`
of `W_F`, characters whose ramification break exceeds twice the largest break of the constituents of `V − (dim V)·1`).

*Route.* (i) `π_{θ̃}` is supercuspidal (FiniteReductiveGroups §6.1), so EndoscopicTransferAndUnitaryTraceComparison §§10.21, 10.26 give irreducibility and `N = 0`; the
determinant is the central character (EndoscopicTransferAndUnitaryTraceComparison §10.28) with `ω_{π_{θ̃}} = θ̃|_{F^×}` (FiniteReductiveGroups §§6.1–6.2). (ii) The matrix coefficient
`β(g) = ⟨π(g)v, ṽ⟩` of vectors in the `Λ`-isotypic parts (functions supported on `F^×K`) is supported on `F^×K`, with
`β(ϖ^a k) = θ̃(ϖ)^a⟨σ_θ(k̄)v, ṽ⟩`. The `L`-factors are trivial: by (i), `ρ = rec_n(π_{θ̃})` is irreducible of dimension `n ≥ 2`
with `N = 0`; its inertia invariants form a `W_F`-stable subspace (`I_F` is normal in `W_F`), which is `0`, since otherwise `ρ`
would factor through `W_F/I_F ≅ ℤ` and, being irreducible, be a character; the same holds for the irreducible
`ρ^∨ = rec_n(π_{θ̃}^∨)` (EndoscopicTransferAndUnitaryTraceComparison §10.28). So `L(s, ρ) = L(s, ρ^∨) = 1`, and the identity of standard `L`-factors of EndoscopicTransferAndUnitaryTraceComparison §10.30
gives `L(s, π_{θ̃}) = L(s, π_{θ̃}^∨) = 1` for the Godement–Jacquet factors (AutomorphicLFunctionsAndLocalFactors
AL.2.1.2–AL.2.1.4), so that the factor in their functional equation (AL.2.1.5) is `ε(s, π_{θ̃}, ψ)`. Let `ψ₀(x̄) = ψ(x/ϖ)` on `k`, a nontrivial
character, and take `Φ` supported on `M_n(𝒪)`, constant on cosets of `ϖM_n(𝒪)`, equal there to `Φ₀(x mod ϖ)` with `Φ₀` the
complex conjugate of the character of `σ_θ` on `GL_n(k)` and `0` on singular matrices. By Schur orthogonality
`Z(s, β, Φ) = vol(K)⟨v, ṽ⟩/ψ_{n−1}(q)`. The Fourier transform of `Φ` for the trace pairing and `ψ` (self-dual measure, `M_n(𝒪)` of
volume `1`) is supported on `ϖ⁻¹M_n(𝒪)` and equals `q^{−n²}Φ̂₀(ȳ)` at `ϖ⁻¹y`, `Φ̂₀(ȳ) = Σ_x Φ₀(x)ψ₀(tr(xȳ))` the finite Fourier
transform for `ψ₀`, which vanishes at singular matrices: for `ȳ` singular with kernel `W ≠ 0`, `x ↦ ψ₀(tr(xȳ))` is invariant
under left multiplication by the unipotent radical of the stabiliser of `W` when `W ≠ k^n`, and averaging the character of
`σ_θ` over that radical gives `0` by cuspidality (FiniteReductiveGroups §§1.1, 5.2), while for `ȳ = 0` the sum of the character of
the nontrivial `σ_θ` is `0`. So `Φ̂` is supported on `ϖ⁻¹K`. There `β̌(ϖ⁻¹k) = θ̃(ϖ)⟨σ_θ(k̄⁻¹)v, ṽ⟩`, `|det(ϖ⁻¹k)| = q^n`, and the
substitution `z = xy` gives `Σ_y Φ̂₀(y)σ_θ(y⁻¹) = w(σ_θ^∨)·|GL_n(k)|/ψ_{n−1}(q)` with `w` the Gauss sum of FiniteReductiveGroups §5.10;
so `Z(1 − s, β̌, Φ̂) = θ̃(ϖ)q^{n(1−s) + n(n−1)/2 − n²}w(σ_θ^∨)vol(K)⟨v, ṽ⟩/ψ_{n−1}(q)`. The functional equation (AL.2.1.5) gives
`ε(s, π_{θ̃}, ψ) = θ̃(ϖ)q^{−n(n−1)/2}w(σ_θ^∨)q^{−ns}`, and FiniteReductiveGroups §5.10 (a) with `σ_θ^∨ = σ_{θ⁻¹}` (FiniteReductiveGroups §5.2) gives the formula; `G_n(θ⁻¹) ≠ 0`. EndoscopicTransferAndUnitaryTraceComparison §10.30
identifies the standard `ε`-factors and conductors of `π_{θ̃}` and `ρ = rec_n(π_{θ̃})`; as `N = 0` and `ρ^{I_F} = 0` (above),
`a(ρ) = n + Sw(ρ)`, so `Sw(ρ) = 0`.

(iii), (iv). For `n = 1` both are rank-one reciprocity: `π_{θ̃} = θ̃`, `rec_1(θ̃) = θ̃∘Art_geo⁻¹` (EndoscopicTransferAndUnitaryTraceComparison §10.20, rank one, with
EndoscopicTransferAndUnitaryTraceComparison §10.26), whose
restriction to `I_F` is `θ∘t₁` (`Art_geo⁻¹` maps `I_F` onto `𝒪^×`, on which `θ̃` is `θ` of the reduction), and `Δ_1 = 1`. (Formula (ii) is
not available there: for `θ̃ = 1` it would give `G_1(1)q^{−s} = −q^{−s}`, while the `ε`-factor is `1`.) Let `n ≥ 2` in what follows.
By (i) and (ii), `ρ = rec_n(π_{θ̃})` is irreducible, tame and has `N = 0`. Clifford theory for the tame quotient
(InductionRestriction Layer 5): `ρ|_{I_F}` is a sum of characters of the procyclic tame inertia permuted transitively by
Frobenius, the stabiliser of one of them, `W_{F_d}`, acts on its isotypic part through an abelian quotient, so that part is a
line and `d = n`; thus `ρ = Ind_{W_{F_n}}^{W_F}(ξ'∘Art_{geo,F_n}⁻¹)` with `ξ'` a tame character of `F_n^×` whose reduction `ξ̄'` is
regular, and `π_{θ̃} = A(ξ')` by 10.33a (a). The determinant in (i) and `det Ind(ξ') = ξ'|_{F^×}·det(Ind 1)` (10.33a (a)) give
`ξ̄'|_{k^×} = θ|_{k^×}` and `ξ'(ϖ) = (−1)^{n−1}θ̃(ϖ)`. Next, for a tamely ramified character `χ` of `F^×` with reduction `α` on `k^×`:
on the automorphic side `π_{θ̃} ⊗ χ∘det = π_{θ̃·χ∘N}` (FiniteReductiveGroups §6.2), so (ii) gives
`ε(s, π_{θ̃} ⊗ χ∘det, ψ) = (−1)^{n−1}θ̃(ϖ)χ(ϖ)^nG_n(θ⁻¹·α⁻¹∘N)q^{−ns}`; on the Galois side the twists of EndoscopicTransferAndUnitaryTraceComparison §10.20 and EndoscopicTransferAndUnitaryTraceComparison §10.30
give the constant of `ρ ⊗ rec_1(χ) = Ind(ξ'·χ∘N_{F_n/F})`, the Langlands–Deligne constants are inductive in degree zero with
`λ(F_n/F, ψ) = 1` for the unramified `F_n/F` and this `ψ` (ClassicalArithmeticCompletion §7.12b: `Ind 1` is a sum of unramified
characters), and Tate's constant of the tame `ξ'·χ∘N` for `ψ∘Tr_{F_n/F}` (ArithmeticGaloisRepresentations §2.7) is
`ξ'(ϖ)χ(ϖ)^nG_n(ξ̄'⁻¹·α⁻¹∘N)q^{−ns}`. With the value of `ξ'(ϖ)`:
`G_n(θ⁻¹·β∘N) = G_n(ξ̄'⁻¹·β∘N)` for every character `β` of `k^×`. (∗)
It remains to show that `ξ̄'` is a Frobenius conjugate of `θ`: then, replacing `ξ'` by `ξ'∘φ^{−j}`, `ξ̄' = θ`, which is (iii), and
`F_n^× = ϖ^ℤ × 𝒪_{F_n}^×` gives `ξ' = Δ_nθ̃`, which is (iv).

*In every rank: unramified base change.* An unramified twist changes neither side of (iii) (FiniteReductiveGroups §6.2; the
twists of EndoscopicTransferAndUnitaryTraceComparison §10.20), so assume `|θ̃(ϖ)| = 1`; then `π_{θ̃}` is unitary. Choose fields `F = F^{(0)} ⊂ F^{(1)} ⊂ ⋯ ⊂ F^{(s)} = F_n`,
each unramified of prime degree over the previous one, put `π^{(0)} = π_{θ̃}` and let `π^{(i+1)}` be the base change of `π^{(i)}`
to `F^{(i+1)}` (EndoscopicTransferAndUnitaryTraceComparison §6.12, AutomorphicSpectralTheory §7.0b). By induction each `π^{(i)}` is an irreducible unitary normalised
induction of unitary supercuspidal representations, hence tempered: the lift of a unitary supercuspidal representation in
prime degree is supercuspidal or the induction of the orbit of its distinct conjugate supercuspidal representations of
lower rank (EndoscopicTransferAndUnitaryTraceComparison §6.12), and the tempered lift of such a product is the product of the lifts of its members (AutomorphicSpectralTheory §7.0b; products of
unitary supercuspidal representations of `GL` are irreducible, so both irreducibility hypotheses there hold). By EndoscopicTransferAndUnitaryTraceComparison §10.20,
applied at each step to the supercuspidal members and added over normalised induction,
`σ_ss(π^{(s)}) = σ_ss(π_{θ̃})|_{W_{F_n}} = ρ|_{W_{F_n}}` (EndoscopicTransferAndUnitaryTraceComparison §10.26: `rec_n = σ_ss` on supercuspidal representations). By 10.33d at each
step, `π^{(s)}` has depth zero and its label is the iterated lift of the label `{[θ]}` of `π_{θ̃}` (FiniteReductiveGroups §6.3), which
over `k_n` consists of the `n` orbits `{θ^{q^j}}`, `0 ≤ j < n`, of size one (FiniteReductiveGroups §5.11). By FiniteReductiveGroups §6.3
(and FiniteReductiveGroups §6.2 in rank one) the supercuspidal support of `π^{(s)}` consists of `n` tamely ramified characters `ξ_j` of `F_n^×` with
`ξ_j|_{𝒪_{F_n}^×}` reducing to `θ^{q^j}`, and by EndoscopicTransferAndUnitaryTraceComparison §10.20 in rank one and additivity `σ_ss(π^{(s)}) = ⊕_j ξ_j∘Art_{geo,F_n}⁻¹`. Restricting
to `I_{F_n} = I_F`: `ρ|_{I_F} ≅ ⊕_j θ^{q^j}∘t_n`, which is (iii). As `ρ|_{I_F} = ⊕_j ξ̄'^{q^j}∘t_n` and `t_n` maps `I_F` onto `k_n^×`, the
multisets `{ξ̄'^{q^j}}` and `{θ^{q^j}}` agree, so `ξ̄'` is a Frobenius conjugate of `θ`, and (iv) follows as above. Only the label
is carried from step to step: the twisted character identities of the steps do not compose to an identity for `F_n/F`, and
none is used.

*Second route for `n ≤ 3`: twists by characters.* (`n = 1` is rank-one reciprocity, above.) For `n = 2`,
FiniteReductiveGroups §5.10 (b), applied to the regular characters `θ⁻¹` and `ξ̄'⁻¹`, which have the same restriction to `k^×`,
turns (∗) into the conclusion.

For `n = 3` (where `Δ_3 = 1`) put `θ̃′ = ξ′`, a regular character of level zero of `F_3^×` with reduction `ξ̄′`. By the values
of `ξ̄′|_{k^×}` and `ξ′(ϖ)` above, `θ̃′(ϖ) = θ̃(ϖ)` and `θ̃′|_{F^×} = θ̃|_{F^×}`, so `π_{θ̃′}` and `π_{θ̃}` have the same central
character (FiniteReductiveGroups §§6.1–6.2). Fix `ψ` as in (ii). For every character `χ` of `F^×` the pairs `(π_{θ̃}, χ)` and
`(π_{θ̃′}, χ)` have the same `γ`-factor. Their `L`-factors and those of the dual pairs are `1` (supercuspidals of unequal
ranks, EndoscopicTransferAndUnitaryTraceComparison §10.28), so `γ = ε`, and `ε(s, π × χ, ψ) = ε(s, rec_3(π) ⊗ rec_1(χ), ψ) = ε(s, π ⊗ χ∘det, ψ)` for both (EndoscopicTransferAndUnitaryTraceComparison §§10.26, 10.28;
the twists of EndoscopicTransferAndUnitaryTraceComparison §10.20; EndoscopicTransferAndUnitaryTraceComparison §10.30). For tamely ramified `χ` with reduction `α`, `π_{θ̃} ⊗ χ∘det = π_{θ̃·χ∘N}` and
`π_{θ̃′} ⊗ χ∘det = π_{θ̃′·χ∘N}` (FiniteReductiveGroups §6.2), and (ii) gives `θ̃(ϖ)χ(ϖ)³q^{−3s}` times `G_3(θ⁻¹·α⁻¹∘N)`,
respectively `G_3(ξ̄′⁻¹·α⁻¹∘N)`, which agree by (∗). For `χ` with `a(χ) ≥ 2`, `rec_3(π_{θ̃})` and `rec_3(π_{θ̃′})` are tame by
(ii), with the same determinant by (i); the Deligne–Henniart formula with its threshold, EndoscopicTransferAndUnitaryTraceComparison §10.26a, `ε(V ⊗ χ, ψ) = ε(χ, ψ)^{dim V}·det V(c_χ)`
for `χ` whose break exceeds twice the largest break of the constituents of `V − (dim V)·1` (here at most `0`, while `χ` has
break `a(χ) − 1 ≥ 1`), gives the same value for both (with `c_χ` defined on the ideal `v(x) ≥ ⌈a(χ)/2⌉` as in
EndoscopicTransferAndUnitaryTraceComparison §10.26a, one choice for both, and `det V(c_χ)` independent of that choice for these tame `V`). The two representations are supercuspidal, hence generic
(SmoothRepresentationsOfLocalGroups SR.5.2 *segment-representations*: `L(Δ)` is generic, and every supercuspidal
representation is `L([x, x]_ρ) = ρν^x` for a unitary supercuspidal `ρ` and a real `x`), and `F` has characteristic zero, so the local converse theorem with twists by `GL_r(F)`, `r ≤ ⌊3/2⌋ = 1`
(LocalFactorsOfTwistsAndTypes §6.4), gives `π_{θ̃′} ≅ π_{θ̃}`. By FiniteReductiveGroups §6.2, `θ̃′` is a
`Gal(F_3/F)`-conjugate of `θ̃`, so `ξ̄′` is a Frobenius conjugate of `θ`.

The argument by twists by characters does not extend to every rank: in ranks `5`, `6` and `8` twists by characters do not
separate depth-zero supercuspidal representations (Checks). The conclusion of (iii)–(iv) is the explicit local Langlands
correspondence at depth zero of the literature (Henniart, 1992, for the unramified case; C. J. Bushnell, G. Henniart, *The
essentially tame local Langlands correspondence, I*, J. Amer. Math. Soc. 18 (2005), for essentially tame representations;
for the unramified extension of degree `n` the rectifier is unramified with value `(−1)^{n−1}` at `ϖ`). For (iii) the form that
the family uses is [FormalProof], `Development/AutomorphicArithmetic/Foundations/LocalLanglands/IsRecTOfIsRec.lean`
(`UpperTheory.Zero.LLC.TypeLaw`).

*Needs:* 10.33a, 10.33b, 10.33d; EndoscopicTransferAndUnitaryTraceComparison §§6.12, 10.20, 10.21, 10.26, 10.26a (the explicit threshold), 10.28, 10.30; AutomorphicSpectralTheory §7.0b;
FiniteReductiveGroups §§1.1, 5.2, 5.10, 5.11, 6.1–6.3; DeligneLusztigTheory §2.9 (the Harish-Chandra series of
a label over `k_n`); AutomorphicLFunctionsAndLocalFactors AL.2.1.2–AL.2.1.5, LocalFactorsOfTwistsAndTypes
§6.4 and SmoothRepresentationsOfLocalGroups SR.5.2 *segment-representations* (second route, rank three); ArithmeticGaloisRepresentations
§2.7 (Tate's local constants); ClassicalArithmeticCompletion §7.12b (inductivity of the Langlands–Deligne constants in degree zero);
InductionRestriction Layer 5; ClassFieldTheory Layer 9.

**Checks.**
- `n = 1`: `π_{θ̃} = θ̃` and `Δ_1 = 1`; for `θ ≠ 1` the conductor is `1`, for `θ = 1` it is `0`, so (ii) is stated for `n ≥ 2`.
- `n = 2`: `Δ_2(ϖ) = −1`; with `Δ_2 = 1` the determinant of the parameter would be `θ̃|_{F^×}` times the unramified
  quadratic character, which is not the central character of `π_{θ̃}`.
- The inertial type `θ∘t₂ ⊕ θ^q∘t₂` does not change when `θ̃(ϖ)` changes; the Frobenius eigenvalues do.
- Rank one and `t₁`: for a tamely ramified `χ`, `χ∘Art_geo⁻¹|_{I_F} = (χ|_{𝒪^×})∘t₁`; with `Art_ar` in place of `Art_geo` the
  same definition would give the inverse.
- (ii) for `n = 2`: the conductor of a depth-zero supercuspidal representation of `GL₂(F)` is `2`, that of a principal
  series built from two ramified tamely ramified characters is `2` as well, that of `1 × α` with `α` ramified and tamely
  ramified is `0 + 1 = 1`, and that of the Steinberg representation `1`.
- (ii) for `n = 2`: `ε(s, π_{θ̃}, ψ) = −θ̃(ϖ)G_2(θ⁻¹)q^{−2s}`, while the constant of `Ind(θ̃∘Art⁻¹)` is `+θ̃(ϖ)G_2(θ⁻¹)q^{−2s}`; the
  sign is the rectifier `Δ_2`.
- Two independent determinations of `Δ_n(ϖ)`: given (iii), the determinant (i) and the `ε`-factor (ii), compared with the
  Galois constant `ξ'(ϖ)G_n(θ⁻¹)q^{−ns}` of `Ind(ξ'∘Art⁻¹)`, each force `ξ'(ϖ) = (−1)^{n−1}θ̃(ϖ)`.
- Characters of `A(ξ)`, `ξ` regular of level zero: by (iv) and 10.33b, at `ϖ^a u` with `u ∈ GL_n(𝒪)` of regular elliptic
  reduction and eigenvalue `z ∈ 𝒪_{F_n}^×`, `Θ_{A(ξ)}(ϖ^a u) = (−1)^{(n−1)(a+1)}Σ_{j=0}^{n−1} ξ(φ^j(ϖ^a z))`. At units (`a = 0`) this is
  `(−1)^{n−1}Σ_j ξ(φ^j(z))`, the sign of Green's character; the formula `(−1)^{n−1}Σ_j ξ(φ^j(ϖ^a z))` would be false for `a` odd
  and `n` even, the rectifier being invisible on units only.
- Twists by characters, which suffice in rank three, do not suffice in every rank: for `(q, n) = (4, 5)` and `θ` of
  order `11` on `k_5^×`, the characters `θ̃`, `θ̃′` of level zero with reductions `θ`, `θ²` and `θ̃(ϖ) = θ̃′(ϖ)` give
  `π_{θ̃} ≇ π_{θ̃′}` (FiniteReductiveGroups §6.2) with the same central character and the same `ε(s, π × χ, ψ)` for every
  character `χ` of `F^×`: for tame `χ` by (ii), the twisted Gauss sums
  `G_5(θ⁻¹·β∘N)` and `G_5(θ⁻²·β∘N)` being equal for every `β`. Indeed, `ψ₀` takes the values `±1` in characteristic `2`, so
  `G_5(θ⁻¹·β∘N) = conj G_5(θ·β⁻¹∘N)` and `G_5(θ⁻²·β∘N) = conj G_5(θ²·β⁻¹∘N)`, conjugation inverting the twist as well, and
  the twisted sums of `θ` and `θ²` agree for every twist and every `ψ₀` (FiniteReductiveGroups §5.10, Checks). The reindexing
  `β ↦ β⁻¹` matters: for `ψ₀(x) = (−1)^{Tr_{k/𝔽₂}(ax)}` with `a` a generator of `k^× = 𝔽₄^×` and `β(a) = e^{2πi/3}`, `G_5(θ·β∘N)` and
  `G_5(θ⁻¹·β∘N)` both equal `32e^{2πi/3}` (by computation), so the second is not the conjugate of the first. For the other `χ` by (i),
  (ii) and EndoscopicTransferAndUnitaryTraceComparison §10.26a as in the route. Likewise in ranks `6` (`q = 3`) and `8` (`q = 2`). In these ranks the `ε`-factors of twists by
  characters do not determine a depth-zero supercuspidal representation.
- For `F = ℚ_x` and `n = 2`, (iii) is the forward direction of GL2AutomorphicRepresentationsAndTransfer §R16.3.9 with `a(θ) = 1`
  (stated there in CDT's reciprocity convention), and (ii) gives the conductor `2` of GL2AutomorphicRepresentationsAndTransfer §R16.3.8.

### 10.35 The correspondence on representations of depth zero up to twist

*Origin:* published: Henniart (1992) and Bushnell and Henniart (2005), the explicit correspondence at depth zero, with
the classification by segments: the local Langlands correspondence on representations of depth zero up to twist.

*Method of the formal proof:* on the map of 10.29a, constructed with the laws it needs: `χ∘Art⁻¹` on characters, on a
depth-zero supercuspidal representation over a field isomorphic to `ℚ_p` the irreducible tame representation with the
determinant and the inertial type prescribed by its cuspidal type, compatibility with twists, and the segment rule; on
the other supercuspidal representations its value is irreducible and not a twist of a tame representation. Clauses (a),
(b) and, over a field isomorphic to `ℚ_p`, (c) and the direction "depth zero ⇒ tame" of (d) hold by construction, and
the converse for supercuspidal
representations is a count of labels against irreducible tame parameters.

For `F/ℚ_p` finite and `t_m` as in 10.34:
- (a) characters: `rec_1(χ) = χ∘Art_geo⁻¹`;
- (b) an irreducible `π` whose supercuspidal support consists of characters `χ_1, …, χ_n` has
  `rec_n(π)` with Weil semisimplification `⊕_i rec_1(χ_i)`, monodromy given by the segment rule of EndoscopicTransferAndUnitaryTraceComparison §10.23; if the
  `χ_i` are pairwise unlinked, `π = χ_1 × ⋯ × χ_n` is irreducible and `rec_n(π) = ⊕_i rec_1(χ_i)` with `N = 0`;
- (c) for `π` of depth zero up to twist (FiniteReductiveGroups §6.4) with supercuspidal support
  `{χ_i ⊗ π_{θ̃_i}}`, the Weil semisimplification of `rec_n(π)` is `⊕_i rec_1(χ_i) ⊗ rec_{n_i}(π_{θ̃_i})`, and its
  restriction to inertia is `⊕_i ⊕_{j<n_i} (χ_i∘Art_geo⁻¹|_{I_F})·θ_i^{q^j}∘t_{n_i}` (10.34 (iii)); `N = 0` when the members of
  the support are pairwise unlinked;
- (d) for every irreducible `π`: `rec_n(π)` is unramified with `N = 0` iff `π` has a nonzero `GL_n(𝒪)`-fixed vector;
  `rec_n(π)` is trivial on wild inertia iff `π` has depth zero (the direction "tame ⇒ depth zero" by 10.34 (iv) in the
  ranks of the members of the supercuspidal support).

*Route.* (a)–(c) from EndoscopicTransferAndUnitaryTraceComparison §10.26 (segment rule), EndoscopicTransferAndUnitaryTraceComparison §10.20 (rank one; twists of supercuspidal representations by characters) and 10.34 (i), (iii); the inertia formula of (c) uses
10.34 (iii) in each rank `n_i` that occurs. (d): the unramified direction from the Satake description of spherical
representations (SmoothRepresentationsOfLocalGroups SR.4.3) and (b); "depth zero ⇒ tame" from the segment rule and
10.34 (iii) for the members of the supercuspidal support, which have depth zero (FiniteReductiveGroups §6.3), in every rank
including one (the restriction to inertia of the parameter of each member is a sum of characters `θ^{q^j}∘t_{n_i}`, trivial
on wild inertia; in rank one this is rank-one reciprocity, (a), since `Art_geo⁻¹` maps wild inertia into `1 + 𝔭`, on which a
depth-zero character is trivial; 10.34 (ii) is stated for ranks `≥ 2` only); the converse
because an irreducible tame Weil representation of dimension `n` is induced from a tame character of `F_n^×` regular on
`k_n^×` (Clifford theory for the tame quotient, as in 10.34), hence by 10.34 (iv) in rank `n` and bijectivity the
parameter of a depth-zero supercuspidal representation up to unramified twist, and depth is read off the supercuspidal
support (FiniteReductiveGroups §6.3). For supercuspidal `π` over `ℚ_p` the form of this converse that the family uses is
[FormalProof], `Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/InertCharpoly/CharPolOfInert.lean`
(`UpperTheory.Gal.Int.Row.dz_of_cusp`).

*Needs:* 10.34; EndoscopicTransferAndUnitaryTraceComparison §§10.20, 10.26; SmoothRepresentationsOfLocalGroups SR.4.3; FiniteReductiveGroups §§6.3–6.4;
InductionRestriction Layer 5.

**Checks.**
- (d) for `GL₂`: the Steinberg representation has `N ≠ 0` and no `GL₂(𝒪)`-fixed vector, though its Weil part is
  unramified; it has depth zero and a tame parameter.
- (d): AutomorphicGaloisRepresentationsPartII AG2.5 *Comparison of the early polynomial with normalized local Langlands* gives the
  direction "`GL_n(𝒪)`-fixed vector ⇒ unramified" with the Frobenius polynomial, and EndoscopicTransferAndUnitaryTraceComparison
  §10.20 the weaker converse that an unramified `σ_ss(π)` forces an Iwahori-fixed vector, which (d) sharpens to `GL_n(𝒪)` with `N = 0`.

### Examples

For `n = 1`: `A(ξ) = ξ` (10.33a); `π_θ̃ = θ̃` with `Δ_1 = 1`, of conductor `1` for `θ ≠ 1` and `0` for `θ = 1` (10.34); and `Θ_π(ϖ^a u) = c(ϖ^a u)` (10.33b). For `n = 2`: the central character of `A(ξ)` is `ξ|_{F^×}` times the unramified quadratic character (10.33a); `ε(s, π_θ̃, ψ) = −θ̃(ϖ)G_2(θ⁻¹)q^{−2s}`, the sign being the rectifier `Δ_2` (10.34); and at a unit whose reduction has eigenvalue `z̄ ∈ k_2 ∖ k`, `Θ = −(θ(z̄) + θ(z̄^q))` (10.33b). For `n = l = 2` the base change of a unitary `π_θ̃` to `F_2` is the principal series of two tamely ramified characters with reductions `θ` and `θ^q` (10.33d, 10.33a (b)). Over `ℚ_3`, with `ψ` trivial on `ℤ_3` and not on `3⁻¹ℤ_3`, the element `c_χ` has valuation `a(χ)` for `a(χ) = 2, 3, 4`, while for `a(χ) = 1` both `c = 1` and `c = 3` satisfy the defining relation on `3ℤ_3` (the Checks of 10.27, on the `c_χ` of EndoscopicTransferAndUnitaryTraceComparison §10.26a). The Steinberg representation of `GL₂(F)` has depth zero and a tame parameter with `N ≠ 0`, and no `GL₂(𝒪)`-fixed vector (10.35).

### Dependencies

EndoscopicTransferAndUnitaryTraceComparison §§2.16, 6.12, 6.24, 10.1, 10.20–10.30; FiniteReductiveGroups §§1.1, 5.2, 5.10, 5.11, 6.1–6.4; DeligneLusztigTheory §§2.6, 2.9; AutomorphicLFunctionsAndLocalFactors AL.2.1.2–AL.2.1.5, AL.3.2–AL.3.3 and LocalFactorsOfTwistsAndTypes §§6.4, 6.5; AutomorphicSpectralTheory §§7.0a–7.0b; SmoothRepresentationsOfLocalGroups SR.2.1, SR.3.1, SR.3.3, SR.4.3, SR.5.2; ClassicalArithmeticCompletion §7.12b; ArithmeticGaloisRepresentations §2.7; InductionRestriction Layers 4–6; ReductiveGroups Layer 7a; ClassFieldTheory Layer 9; GL2AutomorphicRepresentationsAndTransfer §R16.1.7.

## Layer 13: Cuspidal multiplicities of inner forms of unitary groups

Two unitary groups in an odd number of variables that are isomorphic at every finite place have the same cuspidal multiplicities for matching discrete series at the real places and finite parts that are unramified outside a nonempty set of split places and carry a jointly cuspidal family of types there. 13.0a is the structure of the shuffle algebra that the separation of representations by their Jacquet modules uses.

### 13.0a The shuffle algebra is a polynomial algebra on the Lyndon words

*Origin:* published: Radford (1979), the shuffle algebra over a field of characteristic zero is the polynomial algebra
on the Lyndon words; Hoffman (1999), Theorem 2.2, states it over a subfield of `ℂ`.

*Method of the formal proof:* every word factors uniquely as a non-increasing product of Lyndon words; the shuffle
product of these factors is the word itself, with a positive integer coefficient, plus rearrangements of it that are
smaller in the lexicographic order; this triangularity gives that the Lyndon words generate the shuffle algebra and are
algebraically independent in characteristic zero.

*Corollary of:* AnabelianGeometryAndNonabelianChabauty §2.0a (Radford's theorem: over a field of characteristic zero
the shuffle algebra on a linearly ordered alphabet is the polynomial algebra on the Lyndon words).

Over a field of characteristic zero and for a linearly ordered alphabet, the shuffle algebra is the polynomial algebra on
the Lyndon words.

*Sources:* (Radford; Hoffman, Theorem 2.2, for a subfield of `ℂ` and a locally finite graded alphabet, from which the
statement follows by extension of scalars from `ℚ` and by passing to finite subalphabets; [FormalProof],
`Development/AbelianVarietyTheory/PublishedTheorems/TwistedTraceFormula/RadfordShufflePolynomialHolds.lean`
(`GlobalTheory.Published.RadfordShufflePolynomial`)). *Route.* Not given here.

### 13.8a Equal cuspidal multiplicities of inner forms in an odd number of variables

*Origin:* adapted from the comparison of simple trace formulas for inner forms of unitary groups (Kottwitz, Clozel,
Harris and Taylor, Labesse): jointly cuspidal depth-zero types at split places take the place of a supercuspidal
component, and the multiplicities of the two inner forms are compared directly, in an odd number of variables.

*Method of the formal proof:* a comparison of two simple trace formulas with pseudo-coefficients at the real places,
type idempotents at the places of `S` and a regularising function at one auxiliary split place: the constant terms
vanish by joint cuspidality, the trace is a finite sum over characteristic polynomials of a torus volume times a
product of local stable orbital integrals, the real ones being Weyl characters of `GL_r` at the roots because `r` is
odd, the finite ones being carried to each other by the lattice isometries; the multiplicities are then separated by
varying the finite test functions.

Let `E/F` be a CM extension unramified at every finite place, `r` odd, `V`, `V′` nondegenerate Hermitian spaces of
dimension `r` over `E`, `L ⊂ V`, `L′ ⊂ V′` self-dual `𝒪_E`-lattices, and for every finite place `v` of `F` an isometry
`a_v : V_v → V′_v` with `a_v(L_v) = L′_v`. Put `G = U(V)`, `G′ = U(V′)`, `K_v = Stab_{G(F_v)}(L_v)`, and let `Φ : G(𝔸_f) → G′(𝔸_f)` be the
isomorphism of topological groups with components `g ↦ a_vga_v^{−1}`.

*Real places.* For every real place `τ` of `F` let `λ_τ = (λ_{τ,1}, …, λ_{τ,r}) ∈ ℤ^r` with `λ_{τ,i} − λ_{τ,i+1} ≥ 100r⁴` for `1 ≤ i < r`,
and let `π_τ`, `π′_τ` be discrete series representations of `G(F_τ)`, `G′(F_τ)` with Harish-Chandra parameter `λ_τ` (any
members of the two packets; the signatures of `V` and `V′` at `τ` need not agree). Put `π_∞ = ⊗_τπ_τ`, `π′_∞ = ⊗_τπ′_τ`.

*Types.* Let `S` be a finite set of finite places of `F` that split in `E`. For `v ∈ S` choose a place `w` of `E` above `v`;
then `V_v = V_w ⊕ V_{w̄}`, restriction to `V_w` is an isomorphism `G(F_v) ≅ GL(V_w)`, the component `L_w` of `L_v` is an
`𝒪_v`-lattice with `K_v = GL(L_w)`, and reduction modulo `v` is a surjection `red_v : K_v → GL(L_w/𝔭_vL_w) ≅ GL_r(k_v)`, `k_v` the
residue field. A *family of types on `S`* is a family `(τ_v)_{v∈S}` of irreducible complex representations `τ_v` of
`GL_r(k_v)`. For `0 < a < r` let `N_a(k) ⊂ GL_r(k)` be the group of the matrices `[[1_a, ∗], [0, 1_{r−a}]]`, the unipotent radical
of the standard parabolic subgroup with blocks of sizes `(a, r − a)`. The family is *jointly cuspidal* if `S` is
nonempty and for every `0 < a < r` there is `v ∈ S` such that `τ_v` has no nonzero vector fixed by `N_a(k_v)`. (The
condition does not depend on the bases nor on the choices of `w`: the other place replaces `τ_v` by `g ↦ τ_v(^tg^{−1})`
and `N_a` by a conjugate of `N_{r−a}`. One cuspidal `τ_v` makes the family jointly cuspidal; no member need be cuspidal.)
An irreducible admissible representation `σ` of `G(𝔸_f)` *has a type vector* for `(τ_v)_{v∈S}` if its space contains a
nonzero vector that is fixed by `K_v` for every finite place `v ∉ S` and that lies, for every `v ∈ S`, in the
`τ_v∘red_v`-isotypic subspace of the restriction of `σ` to `K_v`.

Prove that for every jointly cuspidal family of types on `S` and every irreducible admissible representation `σ` of
`G(𝔸_f)` with a type vector for it,
`m_cusp(π_∞ ⊗ σ) = m_cusp(π′_∞ ⊗ σ∘Φ^{−1})`,
where `m_cusp(π_∞ ⊗ σ)` is the dimension, which is finite, of the space of `G(𝔸)`-homomorphisms from `π_∞ ⊗ σ` to the
cuspidal subspace of `L²(G(F)\G(𝔸))`.
[FormalProof] has the case in which `E` is one of the cyclic hosts of FrobeniusRestrictedRieszSums §0.4 that its host record
admits and `F` is the maximal totally real subfield of `E`:
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/TraceEqXOfGeomExpansionX.lean` (`GlobalTheory.PsCo.Pc.TRCusp'`), with the gap
`100r⁴` of `Development/AbelianVarietyTheory/Definitions/Divisors/RangeShape.lean` (`GlobalTheory.PsCo.Pc.GapG`) and the type vectors
of `Development/AbelianVarietyTheory/Definitions/Divisors/HasTypeVec.lean` (`GlobalTheory.TrMult.HasTypeVec`). For the other CM
extensions the statement is this roadmap's, by the route below.

*Route.* A comparison of two simple trace formulas. (1) *Test functions* `f = ⊗_τf_τ ⊗ ⊗_vf_v` on `G(𝔸)`: `f_τ` a
pseudo-coefficient of `π_τ` (smooth of compact support and `K`-finite, of trace `1` on `π_τ` and `0` on every other
irreducible unitary representation, with orbital integral `0` at the regular semisimple elements with non-compact
centraliser and `conj Θ_{π_τ}/vol` at the regular elliptic ones: AutomorphicSpectralTheory §6.18, with trace `0` on every other
tempered representation; the orbital integrals are among the steps not given below; the vanishing on the
other unitary representations uses the gap, between entries of `λ_τ` of different sign); `f_v = e_v ∗ h ∗ e_v` at `v ∈ S`,
`e_v` the idempotent of `τ_v∘red_v` on `K_v` and `h` arbitrary; at one further
split place `u ∉ S` the indicator of an Iwahori double coset of `diag(ϖ^{a_1}, …, ϖ^{a_r})`, `a_1 > ⋯ > a_r`; at the other places
bi-`K_v`-invariant of compact support, `1_{K_v}` for almost all `v`. (2) A proper parabolic subgroup over `F` stabilises an
isotropic flag; at `v ∈ S` its unipotent radical contains a conjugate of `N_a(F_v)`, `a` the dimension of the first step,
and the integral of `e_v ∗ h ∗ e_v` over the cosets of `N_a(F_v)` vanishes when `τ_v` has no `N_a(k_v)`-fixed vector. By joint
cuspidality all constant terms of `f` vanish: `R(f)` is of trace class with image in the cusp forms, and its trace is
the integral of the diagonal kernel. (3) *Spectral side:* `tr R(f) = Σ_σ m_cusp(π_∞ ⊗ σ)·tr σ(f^∞)`, a finite sum (the
pseudo-coefficients select `π_∞`; finiteness of the cuspidal spectrum of given level and infinity type). (4)
*Geometric side:* by the place `u` only regular semisimple classes meet the support (Newton polygon of the
characteristic polynomial), finitely many, each with an integrable class kernel (reduction theory and the decay
of functions with vanishing constant terms). A class with reducible characteristic polynomial contributes `0`: if
its centraliser is anisotropic, the local orbital integral vanishes at a place `v ∈ S` where `τ_v` has no `N_a`-fixed
vector, `a` the degree of a factor (descent to the Levi subgroup `GL_a × GL_{r−a}`); otherwise the class lies in a proper
Levi subgroup over `F`, its centraliser is not compact at the real places, the orbital integral of the
pseudo-coefficient vanishes, and an invariant functional carried by one orbit vanishes with the orbital integral.
(5) For an irreducible characteristic polynomial `P`, with the norm-one torus `T_P` of the quadratic extension it
defines, the classes over `F` correspond to the families of local classes in `V` (Hasse's norm theorem for that
quadratic extension, the Hasse principle for Hermitian forms, existence of elements with prescribed norm residue
symbols), so the class contributes `vol([T_P])` times the product of the STABLE local orbital integrals. (6) At a real
place the stable orbital integral of `f_τ` is `0` if `T_P(F_τ)` is not compact and
`conj s_{λ_τ−ρ}(roots of P)/vol(T_P(F_τ))` otherwise, `s` the Weyl character of `GL_r` and `ρ = ((r − 1)/2, …, −(r − 1)/2)`: the sum
of the discrete series characters over the conjugates of a torus point is `(−1)^{pq}` times the alternating sum over
`S_r`, `(p, q)` the signature at `τ` (Harish-Chandra's formula `Θ_π = (−1)^{pq}Σ_{w ∈ W_K} ε(w)e^{wλ_τ}/Δ` on the compact Cartan,
`W_K = S_p × S_q`, EndoscopicTransferAndUnitaryTraceComparison §2.3(c), summed over the cosets of `W_K` in `S_r`), and `pq` is
even and `ρ` integral because `r` is odd. It depends on `P` and `λ_τ` only, not on the signature. (7) The
finite stable orbital integrals are carried to each other by the isometries `a_v`, so `tr R_G(f) = tr R_{G′}(f′)` for
`f′ = f′_∞ ⊗ Φ_*(f^∞)`. (8) *Separation:* for a finite list of pairwise inequivalent `σ_i` containing every finite part
that occurs on either side at the level of the admitted functions, `Σ_i(m_G(σ_i) − m_{G′}(σ_i∘Φ^{−1}))·tr σ_i(f^∞) = 0` for all
admitted `f^∞`. With the idempotents `e_v` this is a relation between the functions `g ↦ tr(P_iσ_i(g)P_i)`, `P_i` the
projector onto the type vectors, with coefficients the traces of the Iwahori coset functions at `u`; these traces
separate the irreducible representations of `GL_r(F_u)` with Iwahori-fixed vectors (their Jacquet modules along the
Borel subgroup; the geometric lemma and the classification by segments; the separation by Jacquet modules uses that the
shuffle algebra over a field of characteristic zero is a polynomial algebra on the Lyndon words, 13.0a), and projected
characters of pairwise
inequivalent irreducible representations are linearly independent. So the coefficient of every `σ_i` with a type
vector vanishes. The following steps are not given here: the bound for the class kernel on a Siegel set; the existence of the weight in the vanishing argument for classes in a Levi subgroup; the family of test functions realising `g ↦ P_iσ_i(g)P_i`; the local statement that the Iwahori coset functions of strictly dominant elements are supported on regular elements with eigenvalues of distinct valuations; the orbital integrals of the pseudo-coefficient of one discrete series representation (`0` at regular elements with
non-compact centraliser, `conj Θ_{π_τ}/vol` at regular elliptic ones), which EndoscopicTransferAndUnitaryTraceComparison §2.10
states for the average over the packet and derives for one member only inside its route; and the vanishing of the trace
of the pseudo-coefficients on the non-tempered unitary representations (through the gap).

*Needs:* AutomorphicFormsOnReductiveGroups §§2.4, 2.7, 4.2; AutomorphicSpectralTheory §§4.5, 6.18,
EndoscopicTransferAndUnitaryTraceComparison §2.3 and DiscreteSeriesCoefficientsAndAutomorphicMetrics §9.1;
SmoothRepresentationsOfLocalGroups SR.2.2 (*geometric-lemma*), SR.5.2 (*segment-representations*);
ClassFieldTheory Layer 13 (Hasse's norm theorem for quadratic extensions) and Layer 11 (elements with prescribed norm
residue symbols: an idele of the base field whose local norm residue symbols have product one lies in the kernel of the
global Artin map of the quadratic extension, which is the base field's multiplicative group times the norms of ideles); HermitianFormsAndLattices §3.1 (the Hasse principle for Hermitian forms); 13.0a.

**Checks.**

- `r = 3`, `S = {v}` with `k_v = 𝔽_2`: `GL_3(𝔽_2)` has order `168` and irreducible representations of degrees `1, 3, 3, 6, 7, 8`. In
  its group algebra the functions `φ` with `Σ_{n ∈ N_1(𝔽_2)} φ(xny) = 0` for all `x, y` form a two-sided ideal of dimension
  `18 = 3² + 3²` (the same for `N_2`): the two representations of degree `3` are the only ones without nonzero
  `N_1`-fixed vectors, and without nonzero `N_2`-fixed vectors. Each of them alone is a jointly cuspidal family. The
  dimensions of the `N_1`-fixed vectors are `1, 0, 0, 3, 1, 2`, in agreement with `1·1 + 6·3 + 7·1 + 8·2 = 42 = 168/4` and with
  the `15 = 1 + 9 + 1 + 4` double cosets of `N_1(𝔽_2)`.
- `r = 1`: there is no `a`, the condition is `S ≠ ∅`, both groups are the norm-one torus of `E/F`, `Φ` is the identity, the
  packets are singletons, and both sides are the multiplicity, `0` or `1`, of the same character.
- EndoscopicTransferAndUnitaryTraceComparison §§13.6, 13.8 compare multiplicities of unitary inner forms for relevant generic
  parameters, whose Harish-Chandra parameters at infinity have gaps `1`, under the unitary classification contract of that roadmap;
  13.8a, with gaps at least `100r⁴`, does not use that contract and gives an equality of multiplicities, not multiplicity one.

### Examples

Two instances, stated without proof. For `V′ = V`, isometries the identity and `π′_τ = π_τ`, `Φ` is the identity and the two sides of 13.8a coincide. For `r = 1` both groups are the norm-one torus of `E/F`, its discrete series packets at the real places are singletons, so `π′_τ = π_τ`, and `Φ` is the identity of the finite adelic points of that torus.

### Dependencies

AutomorphicFormsOnReductiveGroups §§2.4, 2.7, 4.2; AutomorphicSpectralTheory §§4.5, 6.18, EndoscopicTransferAndUnitaryTraceComparison §2.3 and DiscreteSeriesCoefficientsAndAutomorphicMetrics §9.1; SmoothRepresentationsOfLocalGroups SR.2.2 (*geometric-lemma*), SR.5.2 (*segment-representations*); ClassFieldTheory Layers 11 and 13; HermitianFormsAndLattices §3.1.

## Layer 14: Local–global compatibility away from the coefficient prime

These statements extend Layer AG2.5 of AutomorphicGaloisRepresentationsPartII: the away-prime comparison for polarized representations, and the inertial type at places of depth zero up to twist. 14.0a is the contragredient of a cuspidal representation of `GL_n` by transpose-inverse.

*The formal proof's own route.* [FormalProof] does not take `r_{ℓ,ι}(π)` from the theorems cited here: it constructs it,
by a route different from that of AutomorphicGaloisRepresentationsPartII, and this roadmap does not follow it. In outline:
for `n` odd, a form on the definite unitary group in `n` variables is moved, by a holomorphic Lefschetz fixed-point formula
for finite étale correspondences, to the coherent cohomology of fibre powers of the universal abelian scheme over a
compact unitary Shimura variety of signature `(1, n − 1)` at one place; the Hecke eigen-pieces of the `ℓ`-adic étale
cohomology of these smooth projective fibre powers are unramified at the places `w ∤ ℓ` prime to the level, with geometric
Frobenius annihilated by the Hecke polynomial (a congruence relation between Frobenius and the Hecke correspondences on
the integral model), and crystalline at the places `w ∣ ℓ` prime to the level, with crystalline Frobenius annihilated by
the same polynomial, the clauses at `ℓ` coming from the crystalline and Hodge–Tate comparison theorems for smooth
projective schemes over the integers of a finite extension of `ℚ_ℓ`; when the weight at one place above `ℓ` is such that
no two disjoint nonempty sets of Hodge–Tate weights have the same mean, a constituent of rank `n` is singled out; general
forms are reached by congruences in `ℓ`-adic weight families and limits of traces, even `n` from odd `n` by two theta
lifts in the stable range, forms on `GL_n` by descent to the definite group, all CM fields by cyclic base change and
patching, and the ramified places of 14.2 and 15.1 by the base changes written in their routes. [FormalProof],
`Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/GaloisRepresentationsOfThetaLift.lean`
(`UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift`), with
`Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/GeometricFlagBases/HodgeTrAt.lean`
(`UpperTheory.Gal.Int.Geo.GeoOne`),
`Development/WeilBound/CoreStatements/PadicHodgeComparison/EtaleCohomologyComparison/CstSmooth.lean`
(`CrystallineSemistableComparison.Out.CstSmooth`) and
`Development/WeilBound/CoreStatements/PadicHodgeComparison/HodgeSurjectivity/HtBijOfParts.lean`
(`CrystallineSemistableComparison.Onto.HTBij`).

### 14.0a The contragredient of a cuspidal representation by transpose-inverse

*Origin:* published: Cogdell, Fields Institute lectures (2003), Lecture 5, Proposition 5.3 (iii) with the remark after
Proposition 5.1, for unitary cuspidal `π`; the general case after a twist by a power of `|det|`.

*Method of the formal proof:* after a twist making the central character unitary, the complex conjugates of the
functions `g ↦ φ(ᵗg⁻¹)` form a cuspidal representation with the Satake parameters of `π` at almost every place, hence
isomorphic to `π` by strong multiplicity one; composing with the Petersson inner product, for which cusp forms are
square integrable, gives a nondegenerate pairing between `π` and its transform by `g ↦ ᵗg⁻¹`.

*Corollary of:* AutomorphicLFunctionsAndLocalFactors AL.3.7.1a (for a unitary cuspidal `π` over a number field, the
functions `g ↦ φ(ᵗg⁻¹)` form the cusp realization of `π^∨`).

For a number field `E` and a cuspidal automorphic representation `π` of `GL_n(𝔸_E)`, the functions
`g ↦ φ(ᵗg⁻¹)`, `φ ∈ π`, form the contragredient `π^∨`. The form of [FormalProof] is the case of a totally complex `E`.

*Sources:* (Gelfand–Kazhdan; Cogdell, Lecture 5, Proposition 5.3 (iii) with the remark after Proposition 5.1, for unitary
`π`; [FormalProof],
`Development/AbelianVarietyTheory/PublishedTheorems/GaloisGeometry₂/GelfandKazhdanDual.lean`
(`GlobalTheory.Published.GelfandKazhdanDual`)). *Route.* With `θ(g) = ᵗg⁻¹`, the functions `φ∘θ` form a cuspidal
automorphic representation (`θ` is an automorphism of `GL_n` over `E`, preserves the standard maximal compact subgroups
and permutes the parabolic subgroups defined over `E`); at a finite place where `π_v` is unramified with Satake
parameters `α_1, …, α_n` it is unramified with parameters `α_1⁻¹, …, α_n⁻¹` (`θ` inverts the diagonal torus), as is
`π_v^∨`; `π^∨` is cuspidal automorphic (complex conjugates of cusp forms, after a twist by a power of `|det|` that makes
the central character unitary); and strong multiplicity one makes the two cusp realizations equal.

*Needs:* AutomorphicLFunctionsAndLocalFactors AL.3.4.3 and AL.3.7.1 (multiplicity one and strong multiplicity one).

### 14.1 Polarized away-prime comparison

*Origin:* published: Shin (2011), Chenevier and Harris (2013) and Caraiani (2012), the Galois representations of
regular algebraic polarized cuspidal representations over a CM field and their compatibility with the local
correspondence at every place away from the coefficient prime, monodromy included.

*Method of the formal proof:* for odd rank and lacunary weight, Galois representations are cut out of the étale
cohomology of fibre powers of an abelian scheme over a compact unitary Shimura variety, with Frobenius annihilated by
the Hecke polynomial, the automorphic side being matched with the definite unitary group through a holomorphic
Lefschetz formula; congruences and limits of traces reach all regular weights, two theta lifts reach even rank, and
solvable base change and unramified towers give the comparison at the places where the local parameter is a sum of
characters or tame, the part of the statement that [FormalProof] has (the preamble of this layer). The published
proof of Shin, Chenevier and Harris, and Caraiani uses the comparison of the cohomology of unitary Shimura varieties
with the stable trace formula through point counts, in place of which this route has the holomorphic Lefschetz formula
and the congruence relation.

For `E` CM, `(π, χ)` regular algebraic polarized cuspidal of `GL_n(𝔸_E)`, every `ℓ`,
`ι` and every finite place `w ∤ ℓ`: `WD(r_{ℓ,ι}(π)|_{G_{E_w}})^{F-ss} ≅ ι⁻¹rec^T(π_w)`, including the monodromy. In
particular (by AutomorphicGaloisRepresentationsPartII AG2.5 *Comparison of the early polynomial with normalized local Langlands*)
`r_{ℓ,ι}(π)` is unramified at every `w ∤ ℓ` at which `π_w` is unramified, with
`ι det(X − r(Frob_w)) = P_w(π_w; X)`.
This is the away-from-`ℓ` part of AutomorphicGaloisRepresentationsPartII AG2.7 *Polarized Hodge and Weil–Deligne export*, whose
irreducibility premise for `n ≥ 2` is proved by ModularityAndLanglandsExtensions §2.43. The form that the family uses is
[FormalProof], `Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/TypeConditions/WeightsConjBis.lean`
(`UpperTheory.GalStar.Row0b`), with
`Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/WeightsConj.lean` (`UpperTheory.GalS.PairUAlt`).
That form does not have the display at every `w ∤ ℓ`. It compares `WD(r_{ℓ,ι}(π)|_{G_{E_w}})` with the image `y` of
`π_w ⊗ |det|^{(1−n)/2}` under a map with the laws of 10.29a, and asserts at every `w ∤ ℓ` that the dimensions agree, the
isomorphism when `y` is trivial on the commutators of the Weil group and has `N = 0`, and, when `E_w ≅ ℚ_p` and `y` is
tame with `N = 0` and satisfies a condition on the multiplicities of its eigenvalues on tame inertia, `N = 0` and the
characteristic polynomials on inertia. The comparison of the display, with the monodromy, at every `w ∤ ℓ` is also stated
in [FormalProof] (`GlobalTheory.Published.GaloisRepOfPolarizedPair`); its main theorems do not depend on it.
In the form that the family uses the clauses for tame parameters at places `E_w ≅ ℚ_p` (14.2, 15.1) are stated for `n = 1` or `p > 16n²`;
[FormalProof] also has them without that bound.

*Route.* AutomorphicGaloisRepresentationsPartII AG2.7 *Polarized Hodge and Weil–Deligne export* with ModularityAndLanglandsExtensions
§2.43; what follows is an alternative route that does not use that irreducibility input.
By AutomorphicGaloisRepresentationsPartII AG2.2 *Twisting an essentially self-dual form into unitary type* choose an algebraic Hecke character `ψ`
with `π′ = π ⊗ ψ⁻¹∘det` conjugate self-dual, regular algebraic and cuspidal, and `r_{ℓ,ι}(π) = r_{ℓ,ι}(π′) ⊗ r_{ℓ,ι}(ψ)`.
AutomorphicGaloisRepresentationsPartII AG2.5 *Caraiani's full away-prime compatibility* gives `WD(r_{ℓ,ι}(π′)|_{G_{E_w}})^{F-ss} ≅ ι⁻¹rec^T(π′_w)`; the local compatibility at `w ∤ ℓ` of AutomorphicGaloisRepresentationsPartII AG2.0
*The `l`-adic character `r_{l,ι}(χ)`* gives `ι∘r_{ℓ,ι}(ψ)|_{W_{E_w}}∘Art_{E_w} = ψ_w` with `Art` sending uniformisers to geometric
Frobenius; and `rec^T(π_w) = rec^T(π′_w) ⊗ ψ_w∘Art_{E_w}⁻¹` (compatibility of `rec` with twists,
EndoscopicTransferAndUnitaryTraceComparison §10.30). Tensoring a Weil–Deligne representation with a character
twists both sides alike. [FormalProof] passes between its two forms of the polarisation condition by 14.0a.

*Needs:* AutomorphicGaloisRepresentationsPartII AG2.7 *Polarized Hodge and Weil–Deligne export*; ModularityAndLanglandsExtensions §2.43;
AutomorphicGaloisRepresentationsPartII AG2.5 *Comparison of the early polynomial with normalized local Langlands*; for the alternative
route, AutomorphicGaloisRepresentationsPartII AG2.5 *Caraiani's full away-prime compatibility*; AutomorphicGaloisRepresentationsPartII AG2.2 *Twisting an essentially self-dual form into
unitary type*; AutomorphicGaloisRepresentationsPartII AG2.0 *The `l`-adic character `r_{l,ι}(χ)`* (its local compatibility away from `l`); EndoscopicTransferAndUnitaryTraceComparison
§10.30; 14.0a.

**Checks.**
- Tame case: if `rec^T(π_w)` is trivial on wild inertia with `N = 0`, then `N(r|_{G_{E_w}}) = 0` and
  `r|_{I_w} ≅ ι⁻¹rec^T(π_w)|_{I_w}`; if moreover `rec^T(π_w) = ⊕_j χ_j` is a sum of characters, the Weil–Deligne
  representation has Frobenius semisimplification `⊕_j ι⁻¹χ_j` (14.1 says nothing about the Frobenius
  semisimplicity of `WD(r|_{G_{E_w}})` itself: an unramified representation with Frobenius `[[1, 1], [0, 1]]` has `N = 0`
  and semisimplification `1 ⊕ 1`, and is not a sum of characters).
- `n = 1`: the rank-one dictionary at `w ∤ ℓ` (AutomorphicGaloisRepresentationsPartII AG2.0 *The `l`-adic character `r_{l,ι}(χ)`*).
- `n = 2`, `π_w` the depth-zero supercuspidal attached to a regular `θ` of `k_{w,2}^×`: `r|_{I_w} ≅ ι⁻¹∘(θ∘t₂) ⊕ ι⁻¹∘(θ^q∘t₂)` (with
  `t₂` as in 14.2), irreducible over the decomposition group and reducible over inertia.

### 14.2 Depth-zero away-prime comparison

*Origin:* adapted from Caraiani (2012), local–global compatibility away from `ℓ` with monodromy, read through the
explicit parameters at depth zero (10.34–10.35); the second route reaches the inertial type by base change to a
principal series, following the label of the local component.

*Method of the formal proof:* when the completion is `ℚ_p`, the representation is carried by cyclic base changes of
prime degree, all cuspidal, to a field with a place above `w` that is unramified of degree `n!` over `w`; by the labels
under unramified base change (10.33d) the component there is a principal series of pairwise unlinked tamely ramified
characters whose restrictions to inertia give the type of 10.34; the comparison for sums of characters is applied at
that place, and `N = 0` and the characteristic polynomials on inertia descend because the place is unramified over
`w`. This is the second route written below; the first deduces the statement from 14.1 and 10.35 (c).

*Corollary of:* AutomorphicGaloisRepresentationsPartII AG2.5 *Caraiani's full away-prime compatibility* (for a regular
algebraic conjugate self-dual cuspidal representation over a CM field, the Weil–Deligne comparison with monodromy at
every place away from `ℓ`; the polarized form through AG2.2 *Twisting an essentially self-dual form into unitary
type* and AG2.0 *The `l`-adic character `r_{l,ι}(χ)`*), read through 10.35 (c).

For `t_m : I_{E_w} → k_{w,m}^×` define `t_m(σ)` as the reduction modulo
`𝔭` of `Art_{E_{w,m}}⁻¹(σ) ∈ 𝒪_{E_{w,m}}^×`, `E_{w,m}/E_w` unramified of degree `m` (so `I_{E_w} = I_{E_{w,m}}`) and `Art`
sending uniformisers to geometric Frobenius. For `(π, χ)`, `ℓ`, `ι` as in 14.1 and `w ∤ ℓ` such that `π_w` is of depth
zero up to twist (FiniteReductiveGroups §6.4) with supercuspidal support
`{χ_i ⊗ π_{θ̃_i}}` (`θ_i` of degree `n_i` on `k_{w,n_i}^×`) whose members are pairwise unlinked:
`N(r|_{G_{E_w}}) = 0` and `r|_{I_w} ≅ ⊕_i ⊕_{j<n_i} ι⁻¹∘((χ_i∘Art_{E_w}⁻¹|_{I_w}) · (θ_i^{q^j}∘t_{n_i}))`, the field
isomorphism `ι⁻¹` applied to the whole complex-valued character of `I_w` (the characters `θ_i` take complex values).
[FormalProof] has the case in which `π_w` has depth zero, the image of `π_w ⊗ |det|^{(1−n)/2}` under a map with the laws
of 10.29a has `N = 0`, and either its supercuspidal support consists of pairwise unlinked characters, or `E_w ≅ ℚ_p` and
the members of rank at least two of the support are pairwise not unramified twists of one another (in this second case
the support is not assumed pairwise unlinked); it states the conclusion as `N = 0` together with the characteristic
polynomial of every element of inertia. The form that the family uses is [FormalProof],
`Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/SphericalGaloisCompatibility/PAdicSplitting/LocalGlobalCompatAtIwahoriFixedPlaces.lean`
(`UpperTheory.Gal.ToralGalois.R2.LocalGlobalCompatAtIwahoriFixedPlaces`), with
`Development/AbelianVarietyTheory/Definitions/GaloisGeometry/CyclicStrongAtCusp.lean` (`GlobalTheory.RoadU.PlainTor`).

*Route.* 14.1 and 10.35 (c) (through 10.34 (i), (iii) in each rank `n_i`); the
twist by `|det|^{(1−n)/2}` in `rec^T` is unramified.

*Second route when `π_w` has depth zero (not using the comparison 14.1 at `w`, nor 10.34–10.35 (c)).* Let `π_w` have depth
zero (the `χ_i` tamely ramified, absorbed into the `θ̃_i` by FiniteReductiveGroups §6.2) with pairwise unlinked supercuspidal
support, and let `f` be a common multiple of the ranks `n_i`. (1) Let `t ∈ ℝ` be such that `π ⊗ |det|^{−t}` is unitary. Its
component `π_w ⊗ ν^{−t}` is generic and unitary, so its supercuspidal support is `{y_iν^{α_i}}` with `y_i` unitary depth-zero
supercuspidal and `|α_i| < 1/2` (LocalFactorsOfTwistsAndTypes §6.3; the blocks are supercuspidal as the support is
unlinked), and the supercuspidal support of `π_w` is `{y_iν^{t+α_i}}`. The unitary twist serves only to locate these exponents:
everything below is done with `π` itself, which is regular algebraic, while `π ⊗ |det|^{−t}` need not be (for `n = 1`, an algebraic
Hecke character of infinity type `(1, 0)` at a complex place has unitary twist of type `(1/2, −1/2)`). (2) Construct, as in steps
(3)–(4) of the route of 15.1 but for the chain `E_w = L_0 ⊂ ⋯ ⊂ L_m = E_{w,f}` of unramified extensions of prime degree (and with `π` itself: no
twist into conjugate self-dual type is needed below), a CM field `M` reached from `E` by cyclic steps of prime degree and a place
`u | w` of `M` with `M_u ≅ E_{w,f}`, such that at each step the place below `u` is split (the first step) or inert, and the successive
base changes `π_i` of `π` stay cuspidal (at each step the self-twist fields of the current `π_i` are avoided; AutomorphicGaloisRepresentationsPartII AG2.3 *The automorphic
S-general extension family*). (3) At an inert step the component above `w` is the local base change of the component below
(EndoscopicTransferAndUnitaryTraceComparison §6.24), the irreducible product of the lifts of the `y_iν^{t+α_i}` (the exponents
`t + α_i` are kept, `ν^s∘N = ν^s` of the extension, and their pairwise differences stay below `1` in absolute value); by 10.33d (b)
(global form, applied to the unitary `π_i ⊗ |det|^{−t}`, whose base changes are those of `π_i` twisted by `|det|^{−t}`; the
unramified twist by `ν^t` changes neither depth nor label) it has depth zero and the lifted label; at a split step the component
is unchanged. (4) At `u` the label of `P_u = BC_{M/E}(π)_u` consists of the characters `θ_i^{q^j}∘N_{k_{w,f}/k_{w,n_i}}`, `j < n_i`, each an orbit of size one; so (FiniteReductiveGroups §6.3) the supercuspidal
support of `P_u` consists of tamely ramified characters `ξ_{ij}ν^{t+α_i}`, `ξ_{ij}` unitary with `ξ_{ij}|_{𝒪^×}` reducing to
`θ_i^{q^j}∘N`. These are pairwise unlinked (a linked pair has quotient `ν^{±1}`, whose absolute value would force
`|α_i − α_{i′}| = 1`, while `|α_i − α_{i′}| < 1`), so `P_u` is the irreducible principal series of these characters and `rec(P_u)` is
their sum with `N = 0` (10.35 (b)). (5) `r|_{G_M}` is semisimple (every step is normal) and attached to the cuspidal regular
algebraic `BC_{M/E}(π)` (AutomorphicGaloisRepresentationsPartII AG2.2 *Attachment under cuspidal solvable base change*), so AutomorphicGaloisRepresentationsPartII AG2.5 *Varma's semisimplified comparison and
monodromy bound* at `u` gives
`WD(r|_{G_{M_u}})^{ss} ≅ ι⁻¹rec^T(P_u)^{ss}` and `N = 0` (monodromy dominated by a parameter with `N = 0`). (6) `M_u/E_w` is
unramified, so `I_w = I_u` and `N(r|_{G_{E_w}}) = N(r|_{G_{M_u}}) = 0`; on inertia, `ξ_{ij}∘Art_{M_u}⁻¹` is `(θ_i^{q^j}∘N)∘t_f = θ_i^{q^j}∘t_{n_i}`
(norm compatibility of the local Artin maps, ClassFieldTheory Layer 9) and the unramified twists are trivial, which is the
formula of the statement. This route covers depth zero only (the statement covers depth zero up to twist), and it uses the
away-prime comparison only at a place whose component is an irreducible principal series of tamely ramified characters.

*Needs:* 14.1, 10.35; FiniteReductiveGroups §6.2 (the
`π_{θ̃}`), FiniteReductiveGroups §6.4 (depth zero up to twist). For the second route: 10.33d, 10.35 (b), the construction of 15.1; EndoscopicTransferAndUnitaryTraceComparison §6.24; FiniteReductiveGroups §6.3 with DeligneLusztigTheory §2.9 (the Harish-Chandra series of a label over `k_{w,f}`); AutomorphicGaloisRepresentationsPartII AG2.2 *Attachment under cuspidal solvable base change*; AutomorphicGaloisRepresentationsPartII AG2.3 *The automorphic S-general
extension family*; AutomorphicGaloisRepresentationsPartII AG2.5 *Varma's semisimplified comparison and monodromy bound*; LocalFactorsOfTwistsAndTypes
§6.3; ArithmeticGaloisDuality §R02.4.6 (Grunwald–Wang, through the construction of 15.1); ClassFieldTheory Layer 9.

**Checks.**
- Rank one: for a tamely ramified character `χ` of `E_w^×`, `r|_{I_w} = ι⁻¹∘χ∘Art⁻¹|_{I_w} = ι⁻¹∘(χ|_{𝒪^×})∘t₁`; with the
  arithmetic normalisation of `Art` one would get `ι⁻¹∘(χ|_{𝒪^×})⁻¹∘t₁` instead, so the definition of `t_m` fixes the
  exponent.
- The transport by `ι⁻¹` is part of the answer: for `q = 2` and `θ` of order `7` on `k_{w,3}^×`, the Frobenius orbit
  `{θ, θ², θ⁴}` does not contain `θ⁻¹` (`−1 ∉ ⟨2⟩ ⊂ (ℤ/7)^×`), so transporting `θ` by `ι⁻¹` composed with complex
  conjugation, instead of by `ι⁻¹`, gives a different inertial type.
- Unlinkedness is needed for `N = 0`: for `π_w` the Steinberg representation (support `{ν^{1/2}, ν^{−1/2}}`, linked)
  the monodromy is nonzero.
- The second route for `n = 2`, `π_w = π_{θ̃}` with `θ` of order `3` on `k_{w,2}^×` (`q = 2`): `f = 2`, one inert quadratic step; `P_u` is
  the principal series of two tame characters with reductions `θ`, `θ²` (10.33a (b),
  10.33d), and `r|_{I_w} = ι⁻¹∘(θ∘t₂) ⊕ ι⁻¹∘(θ²∘t₂)`, as in the third Check of 14.1. No condition on members of rank `≥ 2` with the same
  label is needed: their lifts have the same reductions, with exponents `t + α`, `|α| < 1/2`, and stay unlinked (equal
  characters are not linked, and two exponents differ by less than `1`).
- PotentialAutomorphyInfrastructurePartII §3.6 (iv) gives the characteristic polynomial of `r` on inertia at the places of its set
  `R`; where its representation is attached to a cuspidal `π` satisfying the hypotheses of 14.2 with every `n_i = 1`, 14.2 refines it
  to the isomorphism class on inertia, with `N = 0` (the inverse `χ_{v,j}^{−1}` there belongs to the dual normalisation of
  PotentialAutomorphyInfrastructurePartII §3.6 (i)).

### Examples

For `n = 1` the comparison is the rank-one dictionary at `w ∤ ℓ` (14.1). For `n = 2` and `π_w` the depth-zero supercuspidal representation attached to a regular character `θ` of `k_{w,2}^×`, `r|_{I_w} ≅ ι⁻¹∘(θ∘t₂) ⊕ ι⁻¹∘(θ^q∘t₂)`, irreducible over the decomposition group and reducible over inertia (14.1, 14.2); for `q = 2` and `θ` of order `3` the second route of 14.2 takes one inert quadratic step, at whose top the component is the principal series of two tame characters with reductions `θ` and `θ²`. For the Steinberg representation, whose support `{ν^{1/2}, ν^{−1/2}}` is linked, the monodromy is nonzero (14.2).

### Dependencies

Layer 10 (10.33a, 10.33d, 10.34, 10.35); for the second route of 14.2, the construction of steps (3)–(4) of the route of 15.1; AutomorphicGaloisRepresentationsPartII AG2.0, AG2.2, AG2.3, AG2.5, AG2.7; ModularityAndLanglandsExtensions §2.43; AutomorphicLFunctionsAndLocalFactors AL.3.4.3, AL.3.7.1; EndoscopicTransferAndUnitaryTraceComparison §§6.24, 10.30; FiniteReductiveGroups §§6.2–6.4; DeligneLusztigTheory §2.9; LocalFactorsOfTwistsAndTypes §6.3; ArithmeticGaloisDuality §R02.4.6; ClassFieldTheory Layer 9.

## Layer 15: Coefficient-prime comparison and weight symmetry

These statements extend Layer AG2.6 of AutomorphicGaloisRepresentationsPartII: a comparison at the coefficient prime with trivial monodromy that needs no irreducibility of `r`, and the symmetry of the Hodge–Tate weights under complex conjugation.

### 15.1 Trivial-monodromy comparison at the coefficient prime for parameters induced from unramified extensions

*Origin:* adapted from the local–global compatibility at `ℓ` of Barnet-Lamb, Gee, Geraghty and Taylor (2014) and of
Caraiani (2014): here for parameters with `N = 0` whose irreducible constituents are induced from unramified
extensions, with the comparison on the Weil group of an unramified extension, by cyclic base change to the crystalline
case.

*Method of the formal proof:* for a sum of characters, each Weil element of nonzero degree lies in the Weil group of a
place of a solvable CM extension at which the cuspidal lift is spherical; there the representation is crystalline with
crystalline Frobenius given by the Satake parameters, so at `w` it is potentially crystalline, `N = 0`, and the
characteristic polynomial of the element is that of the sum of characters; equality at all elements of nonzero degree
gives equality on the Weil group. For a tame parameter over `ℚ_ℓ` the unramified tower of 14.2 reduces to this case,
and the conclusions on inertia descend. The route written below is not that of [FormalProof] throughout: it begins
with the deduction from AG2.6 *Full polarized local–global compatibility at `ℓ`*; for a sum of characters its steps
(2)–(7) follow [FormalProof] in outline, with AG2.6 *Polarized admissibility at the coefficient prime* where that proof
has the spherical clauses of its own Galois representations; and it treats the tame case by traces over
`W_{E_{w,N₀}}` and Frobenius reciprocity (steps (2)–(8)), where [FormalProof] runs the unramified tower.

*Corollary of:* AutomorphicGaloisRepresentationsPartII AG2.6 *Full polarized local–global compatibility at `ℓ`* (the
comparison `WD(D_pst(r|_{G_{E_w}}))^{F-ss} ≅ ι⁻¹rec^T(π_w)` with monodromy at every `w ∣ ℓ`, under the irreducibility
premise that ModularityAndLanglandsExtensions §2.43 proves for `n ≥ 2`), with AG2.6 *Polarized admissibility at the
coefficient prime* for the potential crystallinity.

For `E` CM, `(π, χ)` regular algebraic polarized cuspidal of
`GL_n(𝔸_E)`, every `ℓ`, `ι` and `w ∣ ℓ` such that `rec^T(π_w)` has `N = 0` and each of its irreducible constituents is
induced from a character of the Weil group of an unramified extension of `E_w` (equivalently: the restriction of
`rec^T(π_w)` to `W_{E_{w,N}}` is a sum of characters for some unramified `E_{w,N}/E_w` of degree `N`), let `N₀` be the least
common multiple of the dimensions of the irreducible constituents of `rec^T(π_w)` and `E_{w,N₀}/E_w` unramified of
degree `N₀`. Then `r = r_{ℓ,ι}(π)` restricted to `G_{E_w}` is potentially crystalline, `WD(D_pst(r|_{G_{E_w}}))` has `N = 0`,
and `WD(D_pst(r|_{G_{E_w}}))^{F-ss}|_{W_{E_{w,N₀}}} ≅ ι⁻¹rec^T(π_w)|_{W_{E_{w,N₀}}}`; in particular the restrictions to `I_w`
agree. If `rec^T(π_w)` is a sum of characters (`N₀ = 1`) or is irreducible, then
`WD(D_pst(r|_{G_{E_w}}))^{F-ss} ≅ ι⁻¹rec^T(π_w)`. The class of parameters allowed is stable under twisting by characters and
contains every sum of characters with `N = 0`, tamely or wildly ramified, and every tame parameter with `N = 0`. No
irreducibility hypothesis on `r`.
[FormalProof] has two cases: `rec^T(π_w)` a sum of characters with `N = 0`, with the equality on all of `W_{E_w}`; and
`E_w ≅ ℚ_ℓ`, `rec^T(π_w)` tame with `N = 0` and no two members of rank at least two of the support unramified twists of one
another, with `N = 0` and the equality on inertia. The form that the family uses is [FormalProof],
`Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/TypeConditions/WeightsConjBis.lean`
(`UpperTheory.GalStar.AboveB`).
This is the case of these parameters of AutomorphicGaloisRepresentationsPartII AG2.6 *Full polarized local–global compatibility
at `ℓ`*, whose irreducibility premise for `n ≥ 2` is proved by ModularityAndLanglandsExtensions §2.43, and which gives
`WD(D_pst(r|_{G_{E_w}}))^{F-ss} ≅ ι⁻¹rec^T(π_w)` on all of `W_{E_w}`, with monodromy, for every `π_w`.

*Route.* AutomorphicGaloisRepresentationsPartII AG2.6 *Full polarized local–global compatibility at `ℓ`* with
ModularityAndLanglandsExtensions §2.43: `N = 0` in `rec^T(π_w)` gives `N = 0` in `WD(D_pst(r|_{G_{E_w}}))`, so `r|_{G_{E_w}}`, de Rham
(AutomorphicGaloisRepresentationsPartII AG2.6 *Polarized admissibility at the coefficient prime*) and hence potentially semistable
(NoncommutativeAndEquivariantIwasawa §F.6), is potentially crystalline. Steps (0)–(8) are an alternative route that does not use
that irreducibility input.
(0) The equivalence in the hypothesis: an irreducible `Ind_{W_{E_{w,d}}}^{W_{E_w}}η` with `E_{w,d}/E_w` unramified
restricts to `W_{E_{w,N}}`, `d ∣ N`, as the sum of the conjugates of `η|_{W_{E_{w,N}}}` (Mackey); conversely, if an irreducible
`ρ` restricts to a sum of characters on the normal subgroup `W_{E_{w,N}}`, the stabiliser `H` of one of them, `η`, has cyclic
quotient by `W_{E_{w,N}}`, so `η` extends to `H` and the `η`-isotypic part is a character of `H`; Clifford theory makes `ρ`
induced from it, and `H = W_{E_{w,d}}`. Twisting by `χ` replaces `η` by `η·χ|_{W_{E_{w,d}}}`. Tame irreducible parameters are
induced from tame characters of unramified extensions (Clifford theory for the tame quotient). (1) Twisting: as in
14.1, with the twist matched at `w ∣ ℓ` by the rank-one compatibility (AutomorphicGaloisRepresentationsPartII AG2.0 *The `l`-adic character `r_{l,ι}(χ)`* and the rank-one clause of AutomorphicGaloisRepresentationsPartII AG2.6 *Full polarized local–global compatibility at `ℓ`*) and the compatibility of `D_pst` with tensor products
(PadicHodgeTheory §5.3), reduce to `π` conjugate self-dual; the hypothesis is preserved by (0). (2) Local extension:
let `σ ∈ W_{E_{w,N₀}}` have nonzero degree. By (0), `rec^T(π_w)|_{W_{E_{w,N₀}}} = ⊕_k η_k` with characters `η_k`. For
`x = Art⁻¹(σ) ∈ E_{w,N₀}^×` the subgroup `H = ⟨x⟩·∩_k ker(η_k|_{𝒪^×})` is open (the `η_k` are continuous) of finite index and
contains `x`; its class field `M′/E_{w,N₀}` is abelian, `σ ∈ W_{M′}`, and every `η_k∘N_{M′/E_{w,N₀}}` is unramified, as
`N(𝒪_{M′}^×) ⊂ H ∩ 𝒪^× = ∩_k ker(η_k|_{𝒪^×})` (`x` has nonzero valuation). Refine `E_w ⊂ E_{w,N₀} ⊂ M′` into a chain
`E_w = L_0 ⊂ L_1 ⊂ ⋯ ⊂ L_m = M′` of cyclic extensions of prime degree (composition series of the cyclic group
`Gal(E_{w,N₀}/E_w)` and of the abelian group `Gal(M′/E_{w,N₀})`). (3) Globalisation, one prime-degree step at a time, after the
reduction (1) to conjugate self-dual `π`; at each step the self-twists to be avoided are those of the current cuspidal base
change, not those of `π` (Checks). *Splitting the place.* If `w` does not split over `E⁺`, choose by Grunwald–Wang in its
prime-degree case (ArithmeticGaloisDuality §R02.4.6) a quadratic totally real extension `F′/E⁺` whose completion at the place
below `w` is `E_w`, with trivial characters at the real places, and with `EF′` none of the quadratic extensions of `E` cut
out by a character `η` with `π ≅ π ⊗ η∘det` (finitely many); replace `E`, `π`, `w` by `EF′`, the base change of `π`, and
a place above `w`, which has completion `E_w` and splits over `F′`. *The steps.* Given a CM field `E_i` with a place `u_i`
above `w` that splits over `E_i⁺`, `(E_i)_{u_i} ≅ L_i`, and the cuspidal regular algebraic conjugate self-dual base change
`π_i` of `π` to `E_i`, choose by Grunwald–Wang in its prime-degree case a cyclic totally real extension `F_i′/E_i⁺` of degree
`[L_{i+1} : L_i]`, with local character at the place below `u_i` cutting out `L_{i+1}/L_i`, trivial characters at the real
places, and such that `E_{i+1} = E_iF_i′` is none of the cyclic extensions of prime degree of `E_i` cut out by a character `η`
with `π_i ≅ π_i ⊗ η∘det` (finitely many; this is AutomorphicGaloisRepresentationsPartII AG2.3 *The automorphic S-general extension family* with the self-twist fields
of `π_i` as forbidden fields). `E_{i+1}` is CM, cyclic of prime degree over `E_i`, and has a place `u_{i+1}` above `u_i` with
completion `L_{i+1}`, split over `E_{i+1}⁺ = F_i′`. (4) Base change: at each step the character of `E_{i+1}/E_i` is not a
self-twist of `π_i`, so `π_{i+1} = BC_{E_{i+1}/E_i}(π_i)` is cuspidal (EndoscopicTransferAndUnitaryTraceComparison §6.24, its
self-twist alternative, applied in prime degree), regular algebraic and conjugate self-dual. With `M = E_m` and `u = u_m`,
`M_u ≅ M′`, the base change `BC_{M/E}(π) = π_m` along the tower is cuspidal, `r|_{G_M}` is attached to it (AutomorphicGaloisRepresentationsPartII AG2.2 *Attachment
under cuspidal solvable base change*), and `rec(BC(π)_u)` has Weil semisimplification `rec(π_w)^{ss}|_{W_{M_u}}`
(EndoscopicTransferAndUnitaryTraceComparison §6.24 at every place of each step, EndoscopicTransferAndUnitaryTraceComparison §10.20); so the supercuspidal support of
`BC(π)_u` consists of unramified characters. (5) Sphericity without any monodromy input on local base change:
`π_w` is generic, unitary after the unitary twist of `π`, and has supercuspidal blocks (`N = 0`), so its supercuspidal
support `ρ_iν^{α_i}` has `|α_i| < 1/2` (LocalFactorsOfTwistsAndTypes §6.3), and the characters of the support
of `BC(π)_u`, of absolute values `ν_{M_u}^{α_i}`, are pairwise unlinked; the generic `BC(π)_u` is then the irreducible
unramified principal series (SmoothRepresentationsOfLocalGroups *modular-generic-segments*), spherical. (6) By
AutomorphicGaloisRepresentationsPartII AG2.6 *Polarized admissibility at the coefficient prime* at `u`, `r|_{G_{M_u}}` is crystalline (so `r|_{G_{E_w}}` is potentially
crystalline), and its Iwahori case gives `WD(D_cris(r|_{G_{M_u}}))^{F-ss} ≅ ι⁻¹rec^T(BC(π)_u)`, unramified with `N = 0`.
(7) `D_pst` is compatible with restriction to `G_{M_u}` (PadicHodgeTheory §5.3), so the trace of `σ` on
`WD(D_pst(r|_{G_{E_w}}))`, which is its trace on the Frobenius semisimplification, equals its trace on `ι⁻¹rec^T(π_w)`, for
every `σ ∈ W_{E_{w,N₀}}` of nonzero degree; two Frobenius-semisimple representations of `W_{E_{w,N₀}}` whose traces agree off
inertia are isomorphic (for `g` in inertia, `j ↦ tr(gφ^{jm})`, with `φ^m` central, is a finite exponential sum determined
by its values at `j ≠ 0`), which gives the isomorphism over `W_{E_{w,N₀}}` for `WD(D_pst(r|_{G_{E_w}}))^{F-ss}`; Frobenius
semisimplification does not change `N` or the restriction to inertia, and `N = 0` because it vanishes after restriction
to the finite-index subgroup `W_{M_u}`. (8) Full equality: for `N₀ = 1` this is (7). If `rec^T(π_w) = Ind_{W_{E_{w,n}}}^{W_{E_w}} ξ`
is irreducible, Frobenius reciprocity and (7) give a nonzero map from the semisimple `WD(D_pst(r|_{G_{E_w}}))^{F-ss}` to the
irreducible `ι⁻¹Ind ξ` of the same dimension.

*Needs:* AutomorphicGaloisRepresentationsPartII AG2.6 *Full polarized local–global compatibility at `ℓ`*; ModularityAndLanglandsExtensions §2.43;
AutomorphicGaloisRepresentationsPartII AG2.2 *Twisting an essentially self-dual form into unitary type*, *Attachment under cuspidal solvable base
change*; AutomorphicGaloisRepresentationsPartII AG2.3 *The automorphic S-general extension family*; AutomorphicGaloisRepresentationsPartII AG2.6 *Polarized admissibility at the coefficient prime*; AutomorphicGaloisRepresentationsPartII AG2.0 *The `l`-adic character `r_{l,ι}(χ)`*;
PadicHodgeTheory §5.3 (`WD(D_pst)` and restriction); NoncommutativeAndEquivariantIwasawa §F.6
(stage 3: a de Rham representation is potentially semistable); ArithmeticGaloisDuality §R02.4.6 (Grunwald–Wang);
EndoscopicTransferAndUnitaryTraceComparison §6.24, EndoscopicTransferAndUnitaryTraceComparison §10.20; LocalFactorsOfTwistsAndTypes §6.3;
SmoothRepresentationsOfLocalGroups SR.5.2 (*modular-generic-segments*); ArithmeticGaloisRepresentations §§2.4–2.6;
InductionRestriction Layer 3 (the Mackey decomposition) and Layer 5 (Clifford theory).

**Checks.**
- `n = 2`, `π_w` depth-zero supercuspidal with `θ` of order `3` on `k_{w,2}^×` (`q = 2` or `5`): `N₀ = 2`; for a Frobenius
  lift `σ` of degree one no cyclic tower contains `σ` and kills the type (the fixed field of `⟨σ⟩·ker(rec^T(π_w)|_I)` is a
  non-Galois cubic extension with closure of group `S₃`), so (7) is stated over `W_{E_{w,2}}` only, and the full
  equality comes from (8) because `rec^T(π_w)` is irreducible.
- `n = 2`, `rec^T(π_w) = χ₁ ⊕ χ₂` with `χ₁` wildly ramified (`ℓ = p`): `N₀ = 1`, the parameter is allowed and 15.1 gives the
  full equality; a statement restricted to tame parameters would not cover this case of the class of parameters allowed in 15.1.
- `n = 2`, `rec^T(π_w) = χ₁ ⊕ χ₂` with `χ₁/χ₂` an unramified character of order `2` times `ν`: over `E_w` the two
  characters are unlinked, after the unramified quadratic base change they would be linked; (5) excludes this case
  because `|α₁ − α₂| = 1` violates LocalFactorsOfTwistsAndTypes §6.3.
- An irreducible parameter of dimension `2` at `p = 2` that is primitive (not induced from any quadratic extension) is not
  in the class.
- Why (3) avoids the self-twists of the current base change at each step (a finite-group model of the inference, not a
  counterexample to 15.1): the standard representation `ρ` of `S₄` has no nontrivial self-twist (`ρ ⊗ sgn ≇ ρ`); its
  restriction to `A₄`, of index `2`, is irreducible and is fixed by the twists by the three cubic characters of `A₄/V₄`; its
  restriction to `V₄`, of index `3` in `A₄`, is the sum of the three nontrivial characters. Both steps are cyclic of prime
  degree and neither is cut out by a self-twist of `ρ` (it has none); the second is cut out by a self-twist of the current
  restriction `ρ|_{A₄}`, and irreducibility is lost there.
- Rank one: 15.1 is the rank-one compatibility at `ℓ` (AutomorphicGaloisRepresentationsPartII AG2.0 *The `l`-adic character `r_{l,ι}(χ)`*).

### 15.2 Weight symmetry

*Origin:* published: Barnet-Lamb, Gee, Geraghty and Taylor (2014), *Potential automorphy and change of weight*,
Theorem 2.1.1: the symmetry under complex conjugation of the Hodge–Tate weights of the Galois representations of
regular algebraic polarized cuspidal representations.

*Method of the formal proof:* the multiset `HT_τ` is defined from the infinitesimal character of `π` at `ι∘τ`; the
polarization by `χ` sends the infinitesimal character at `τ` to its negative at `τ∘c`, shifted by the exponent of `χ`
composed with the norm, and this exponent is one integer `wt` for all embeddings because an algebraic Hecke character
of a totally real field has parallel weight. The route written below is not that of [FormalProof]: it takes the weight
`a ∈ (ℤⁿ)_w` as given, reads the labelled weights of `r_{ℓ,ι}(π)` off AG2.6 *Polarized admissibility at the
coefficient prime* and applies the conjugation formula of AG2.0 *The Hodge–Tate multiset attached to a weight*.

*Corollary of:* AutomorphicGaloisRepresentationsPartII AG2.0 *The Hodge–Tate multiset attached to a weight* (for `E`
CM and `a ∈ (ℤⁿ)_w`, `HT_{τ∘c}(a) = {w + n − 1 − h : h ∈ HT_τ(a)}`), with AG2.6 *Polarized admissibility at the
coefficient prime*.

For `(π, χ)` regular algebraic polarized of weight `a ∈ (ℤⁿ)_w` and every `τ`,
`HT_{τ∘c}(r_{ℓ,ι}(π)) = {w + n − 1 − h : h ∈ HT_τ(r_{ℓ,ι}(π))}`.
[FormalProof] has it as `HT_{τ∘c} = {wt − h : h ∈ HT_τ}` for an integer `wt`:
`Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/TypeConditions/WeightsConjBis.lean`
(`UpperTheory.GalStar.PropsB`).

*Route.* The labelled weights at the places above `ℓ` (AutomorphicGaloisRepresentationsPartII AG2.6 *Polarized admissibility at the coefficient prime*: de Rham with `HT_τ = {a_{τ,i} + n − i}` for every `τ`) and the conjugation formula of AutomorphicGaloisRepresentationsPartII AG2.0's Hodge multiset.

*Needs:* AutomorphicGaloisRepresentationsPartII AG2.0 *The Hodge–Tate multiset attached to a weight*, AutomorphicGaloisRepresentationsPartII AG2.6 *Polarized admissibility at the coefficient prime*.

### Examples

For `n = 2` and `π_w` a depth-zero supercuspidal representation with `θ` of order `3` on `k_{w,2}^×` (`q = 2` or `5`), `N₀ = 2`: the comparison holds over `W_{E_{w,2}}`, and in full because `rec^T(π_w)` is irreducible. For `rec^T(π_w) = χ₁ ⊕ χ₂` with `χ₁` wildly ramified and `ℓ = p`, `N₀ = 1` and 15.1 gives the full equality. An irreducible parameter of dimension `2` at `p = 2` that is not induced from any quadratic extension is outside the class of 15.1.

### Dependencies

Layer 14 (14.1); AutomorphicGaloisRepresentationsPartII AG2.0, AG2.2, AG2.3, AG2.6; ModularityAndLanglandsExtensions §2.43; PadicHodgeTheory §5.3; NoncommutativeAndEquivariantIwasawa §F.6; ArithmeticGaloisDuality §R02.4.6; EndoscopicTransferAndUnitaryTraceComparison §§6.24, 10.20; LocalFactorsOfTwistsAndTypes §6.3; SmoothRepresentationsOfLocalGroups SR.5.2; ArithmeticGaloisRepresentations §§2.4–2.6; InductionRestriction Layers 3 and 5.

## Layer 16: Galois representations of definite unitary groups

This statement extends Layer AG2.7 of AutomorphicGaloisRepresentationsPartII to unitary groups that are compact at infinity, with any number of Speh blocks.

### 16.1 Galois representations of definite unitary groups

*Origin:* adapted from Guerberoff (2011), Theorem 2.3 and its proof, with Theorem 2.2, after Labesse (2011): for the
standard Hermitian form over a CM extension unramified at every finite place, the Galois representation of an
automorphic representation of the definite unitary group as the sum, over the Speh blocks of its base change, of the
twisted Galois representations of the cuspidal constituents, for `ℓ` odd with every place above `ℓ` split; here every
`ℓ`, with the twists `s_{ij}` written out. The remark below (every Hermitian space definite at every infinite place
over every CM extension with `[E⁺:ℚ] ≥ 2`, the polynomial at every unramified place away from `ℓ`, de Rham at every
place above `ℓ`) is this roadmap's own formulation.

*Method of the formal proof:* the weak base change is proved for the group (below); for each block of the base change
and each shift of its Speh segment, the Galois representation of the shifted cuspidal constituent is taken from the
existence theorem for conjugate self-dual cuspidal representations; their direct sum has the Hodge–Tate weights of the
given representation because the infinitesimal characters of the blocks add up to `λ + ρ`, and its Frobenius
polynomials are read off from the Satake parameters of an induced product of Speh representations.

Let `E/E⁺` be a CM extension with `[E⁺:ℚ] ≥ 2`, unramified at every finite place, `V` the standard Hermitian space over `E`
of dimension `n`, definite at every infinite place, and `Π` an automorphic representation of `U(V)(𝔸_{E⁺})` whose
archimedean component is algebraic: for every embedding `τ : E → ℂ`, with `v` the place of `E⁺` below it, `Π_v` is the
restriction to `U(V)(E⁺_v) ⊂ GL(V ⊗_{E,τ} ℂ) ≅ GL_n(ℂ)` of the irreducible algebraic representation of dominant highest weight
`λ_τ ∈ ℤⁿ`. Then `λ_{τ∘c} = −w₀λ_τ`, where `w₀λ = (λ_n, …, λ_1)` (on `U(V)(E⁺_v)` the two embeddings above `v` give complex
conjugate, hence dual, representations). Let
`BC(Π) = ⊞_i Speh(π_i, d_i)` be its weak base change to `GL_n(𝔸_E)` (EndoscopicTransferAndUnitaryTraceComparison
§6.29), with `π_i` conjugate self-dual cuspidal of `GL_{n_i}`, `Σ n_i d_i = n`. Then for every `ℓ` and `ι` the
representation
`r_{ℓ,ι}(Π) = ⊕_i ⊕_{j=0}^{d_i−1} r_{ℓ,ι}(π_i ⊗ |det|^{s_{ij}})`, `s_{ij} = (d_i − 1)/2 − j − (n − n_i)/2`,
where `π_i ⊗ |det|^{s_{ij}}` is regular algebraic (the `j`-th block `π_i ⊗ |det|^{(d_i−1)/2−j}` of the Speh segment has as
infinitesimal character a sub-multiset of that of `BC(Π)_∞`, which at `τ` is `λ_τ + ρ`, regular, with entries in `ℤ + (n − 1)/2`;
moving it from the normalisation of `GL_n` to that of `GL_{n_i}`, the twist by `|det|^{−(n−n_i)/2}`, shifts that sub-multiset
by `−(n − n_i)/2`, so the infinitesimal character of `π_i ⊗ |det|^{s_{ij}}` has distinct entries in `ℤ + (n_i − 1)/2`), is
continuous and semisimple, unramified at every place `w ∤ ℓ` split over `E⁺` at which `Π` is
unramified, with `ι det(X − r(Frob_w)) = P_w(BC(Π)_w; X)`, and, when `Π` is unramified at every place above `ℓ`,
crystalline at every `w ∣ ℓ` with labelled weights
`{i − 1 − λ_{ι∘τ,i} : 1 ≤ i ≤ n}` at `τ : E → ℚ̄_ℓ`, where for an embedding `σ : E → ℂ` the weight
`λ_σ = (λ_{σ,1} ≥ ⋯ ≥ λ_{σ,n})` of `Π` at `σ` is the one for which the infinitesimal character of `BC(Π)` at `σ` is
`λ_σ + ρ`, `ρ = ((n − 1)/2, (n − 3)/2, …, (1 − n)/2)`; these are the weights `{a_{ι∘τ,i} + n − i}` of the base-changed weight
`a_{ι∘τ,i} = −λ_{ι∘τ,n+1−i}`. Here `a` is the
weight of `BC(Π)` in the sense of AutomorphicGaloisRepresentationsPartII AG2.0 (the infinitesimal character of `BC(Π)_∞` at `σ`
is that of `Ξ_a^∨`): `a_σ = −w₀λ_σ = (−λ_{σ,n}, …, −λ_{σ,1})`, equivalently `a_σ = λ_{σ∘c}`, so that `a ∈ (ℤⁿ)_0`.
It differs from AutomorphicGaloisRepresentationsPartII AG2.7 *Unitary discrete-parameter export*, which concerns the quasi-split unitary datum of [CS],
Corollary 5.5.5 with two blocks and no comparison at `ℓ`: here the group is compact at infinity, any number of
Speh blocks occurs with all their twists, and the comparison at `ℓ` (de Rham with the labelled weights, AutomorphicGaloisRepresentationsPartII AG2.6 *Polarized admissibility at the coefficient prime*) holds for every block (in the remark; in the statement, crystalline with these weights where `Π` is unramified at every place above `ℓ`).
For the definite unitary group of PotentialAutomorphyInfrastructurePartII §3.1 with `S(B) = ∅` (the standard
Hermitian form over a CM extension unramified at every finite place) and `ℓ` odd with every place of `E⁺` above it
split in `E`, `r_{ℓ,ι}(Π)` is the representation that §3.6 of that roadmap attaches to the finite part of `Π`, built by
the same route (both are semisimple with the same characteristic polynomials of Frobenius at the split places at which
`BC(Π)` is unramified). §3.6 takes `Π_∞ ≅ ξ_{ιλ}^∨`, the dual of the representation of highest weight `λ`, so its `λ` at an
embedding `τ` of its `Ĩ_l` is `−w₀λ_{ι∘τ} = a_{ι∘τ}` in the notation here, and its labelled weights `{λ_{τ,j} + n − j}` are
the ones above. 16.1 adds every `ℓ` and the explicit twists `s_{ij}` of the Speh blocks; the remark below adds every
Hermitian space definite at every infinite place over every CM extension with `[E⁺:ℚ] ≥ 2`, the polynomial
`P_w(BC(Π)_w; X)` at every `w ∤ ℓ` at which `BC(Π)_w` is unramified, not only at the split ones, and the comparison at
every `w ∣ ℓ`.
[FormalProof] has the case of the standard Hermitian form over a CM field unramified over its totally real subfield at
every finite place: crystalline with these weights when `Π` is unramified at every place above `ℓ`, and the polynomial
`P_w(BC(Π)_w; X)` at the split places `w ∤ ℓ` at which `Π` is unramified. The form that the family uses is [FormalProof],
`Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/GaloisRepDefiniteUnitary.lean`
(`GlobalTheory.GalAut.galoisRep_definiteUnitary_tyz`), with
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/HasString.lean` (`GlobalTheory.GalDef.FrobSat`) and
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/HasString.lean` (`GlobalTheory.GalDef.jumpsOf`).
The weak base change that [FormalProof] uses, and proves, is for the standard Hermitian form over a CM field `E` unramified
over `E⁺` at every finite place, every `n ≥ 1` and every automorphic representation `Π` of its unitary group: there are `m`
and integers `N_i = n_id_i ≥ 1` (`1 ≤ i ≤ m`) with `Σ_i N_i = n`, discrete automorphic representations `Π_1, …, Π_m` of
`GL_{N_i}(𝔸_E)`, each embedded in the forms induced from the Speh segment of `(π_i, d_i)` for a unitary, normalised,
conjugate self-dual cuspidal `π_i` of `GL_{n_i}`, and for every finite place `w` an irreducible smooth representation `P_w`
of `GL_n(E_w)`, a subquotient of the normalised induction of `Π_{1,w} ⊗ ⋯ ⊗ Π_{m,w}`, such that: `P_w` is spherical when `Π`
is unramified at `w`; at a place `w` fixed by `c` at which `Π` has Satake parameter `α`, `P_w` has the base change of `α` as
Satake parameter; at every `w` split over `E⁺`, ramified or not, `P_w` is the component of `Π` at the place `v` below, through
`U(E⁺_v) ≅ GL_n(E_w)`; and for every `τ` and every weight `λ` of `Π` at `τ` the infinitesimal characters of the `Π_i` at `τ`
add up to `λ + ρ` ([FormalProof],
`Development/WeilBound/RepresentationTheoryGL/ArchimedeanBaseChange/ArchimedeanBaseChangeProof/BaseChangeIsobaricNOf.lean`
(`PositivityTheory.Rg.BcN.BaseChangeIsobaricN`, `PositivityTheory.Rg.BcN.IsBaseChangeN`, `PositivityTheory.Rg.BcN.CsdAsc`),
proved in `Development/AutomorphicArithmetic/Foundations/BaseChangeIdentities/DefiniteNHolds.lean`
(`UpperTheory.BaseChangeIdentities.baseChangeN`)). It is EndoscopicTransferAndUnitaryTraceComparison §6.29 for this group.

*Remark* (this roadmap's own formulation, not a statement of [FormalProof]). By the route below the statement holds for
every Hermitian space `V` over `E` of dimension `n`, definite at every infinite place, over every CM extension `E/E⁺`
with `[E⁺:ℚ] ≥ 2`, with `BC(Π)` the weak base change of EndoscopicTransferAndUnitaryTraceComparison §6.29: for every
`ℓ` and `ι`, `r_{ℓ,ι}(Π)` is then unramified with `ι det(X − r(Frob_w)) = P_w(BC(Π)_w; X)` at every `w ∤ ℓ` at which
`BC(Π)_w` is unramified, de Rham at every `w ∣ ℓ` with the labelled weights above, and crystalline at `w ∣ ℓ` where
`BC(Π)_w` is unramified.

*Route.* Each block by AutomorphicGaloisRepresentationsPartII AG2.3 *Arbitrary regular conjugate-self-dual existence* with AutomorphicGaloisRepresentationsPartII AG2.2 *Twisting an essentially self-dual form into unitary type* and the uniqueness of a semisimple attached representation in AutomorphicGaloisRepresentationsPartII AG2.0 *A Galois representation attached to `π` at the good places* (existence, continuity, semisimplicity, uniqueness), 14.1 at every unramified `w ∤ ℓ` (with AutomorphicGaloisRepresentationsPartII AG2.5 *Comparison of the early polynomial with normalized local Langlands*), and AutomorphicGaloisRepresentationsPartII AG2.6 *Polarized admissibility at the coefficient prime*; the Frobenius eigenvalues of the block
`(i, j)` are `q_w^{(n_i−1)/2}·α·q_w^{−s_{ij}} = q_w^{(n−1)/2}·α·q_w^{−(d_i−1)/2+j}` for the Satake parameters `α` of `π_{i,w}`,
exactly the factor of `P_w(BC(Π)_w; X)` contributed by that block of the Speh segment; assembly and the Satake
identity at unramified places as in AutomorphicGaloisRepresentationsPartII AG2.2's discrete assembly, the definite group replacing the quasi-split one of [HLTT].

*Needs:* 14.1; AutomorphicGaloisRepresentationsPartII AG2.2 (twisting; the assembly pattern), AutomorphicGaloisRepresentationsPartII AG2.3, AutomorphicGaloisRepresentationsPartII AG2.5 *Comparison of
the early polynomial with normalized local Langlands*, AutomorphicGaloisRepresentationsPartII AG2.6 *Polarized admissibility at the
coefficient prime*; EndoscopicTransferAndUnitaryTraceComparison §6.29; AutomorphicFormsOnReductiveGroups
§§7.4–7.5 (automorphic forms on groups compact at infinity).

**Checks.**
- `n = 2`, `Π` trivial of weight `0`: `BC(Π) = Speh(1, 2)`, Satake parameters `{q^{1/2}, q^{−1/2}}` at split `w`,
  `P_w = (X − q)(X − 1)`, and `r = 1 ⊕ ε_ℓ^{−1}`, with labelled weights `{0, 1}` (`HT(ε_ℓ^{−1}) = 1`; `λ = 0`: the
  weights are `{0, 1} = {i − 1}`; for `n = 1` and `Π` of weight `λ` the weight is `−λ_{ι∘τ}`). The
  representation `1 ⊕ ε_ℓ` would have polynomial `(X − 1)(X − q⁻¹)`.
- One copy per Speh block instead of `d_i` twisted copies gives the wrong dimension.
- `n = 1`, `U(V)` the norm-one torus of `E/E⁺`, and `Π_v(z) = τ(z)^m` on `U(V)(E⁺_v) = {z ∈ E_v^× : zz^c = 1}` for `τ` above `v`,
  so `λ_τ = m` and `λ_{τ∘c} = −m` (`(τ∘c)(z) = τ(z)⁻¹` there): `BC(Π)(x) = Π(x/x^c)` has archimedean component
  `τ(x)^m (τ∘c)(x)^{−m}`, of weight `a_τ = −m`, `a_{τ∘c} = m` (AutomorphicGaloisRepresentationsPartII AG2.0: weight `a` for the
  infinity type `∏_σ σ(x)^{−a_σ}`), so `HT_τ = {−m}` and `HT_{τ∘c} = {m}`, as the formula above gives. Reading `a_τ = λ_τ`
  would give the dual weights `{m}` and `{−m}`, and base change of weights by restriction of embeddings would give
  `a_τ = a_{τ∘c} = m`, outside `(ℤ¹)_0` for `m ≠ 0`, although `BC(Π)` is conjugate self-dual.
- `λ = 0` is not regular, while `λ + ρ` is: the regularity used is that of the infinitesimal character.
- The shift in the trivial example: `λ + ρ = {1/2, −1/2}`, the blocks before the shift are `|·|^{1/2}`, `|·|^{−1/2}` (entries
  `1/2`, `−1/2`), and after it `s_{10} = 0`, `s_{11} = −1`: the trivial character and `|·|^{−1}` of `GL_1`, with integral
  entries `0`, `−1`; the unshifted sub-multisets are not the infinitesimal characters of the `π_i ⊗ |det|^{s_{ij}}`.

The hypothesis `[E⁺:ℚ] ≥ 2` is that of EndoscopicTransferAndUnitaryTraceComparison §6.29 (Labesse).

### Examples

For `n = 2` and `Π` trivial of weight `0`: `BC(Π) = Speh(1, 2)`, the Satake parameters at a split `w` are `{q^{1/2}, q^{−1/2}}`, `P_w = (X − q)(X − 1)`, and `r = 1 ⊕ ε_ℓ^{−1}`, with labelled weights `{0, 1}`; the shifts are `s_{10} = 0` and `s_{11} = −1` (16.1).

### Dependencies

Layer 14 (14.1); AutomorphicGaloisRepresentationsPartII AG2.0, AG2.2, AG2.3, AG2.5, AG2.6, AG2.7; PotentialAutomorphyInfrastructurePartII §§3.1, 3.6 (compared with 16.1); EndoscopicTransferAndUnitaryTraceComparison §6.29; AutomorphicFormsOnReductiveGroups §§7.4–7.5.

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

This roadmap owns: the existence of splitting characters for every quadratic extension of number fields (6.3a); the form of [FormalProof] of the Deligne–Henniart twist formula, in rank one at conductor exponent `2` (10.27, a corollary of EndoscopicTransferAndUnitaryTraceComparison §10.26a); the map of [FormalProof] with its laws (10.29a, a corollary of EndoscopicTransferAndUnitaryTraceComparison §§10.20–10.30 with 10.34 (iii) and 10.35 (d)); local automorphic induction from unramified extensions (10.33a); characters of depth-zero supercuspidal representations at very regular elements (10.33b); the matching of functions inflated from the residue field (10.33c); the labels of depth-zero representations under unramified base change of prime degree (10.33d); the explicit parameters, `ε`-factors and conductors of depth-zero supercuspidal representations (10.34); the correspondence on representations of depth zero up to twist (10.35); the equality of cuspidal multiplicities of inner forms in an odd number of variables (13.8a); the depth-zero away-prime comparison (14.2, a corollary of AutomorphicGaloisRepresentationsPartII AG2.5 *Caraiani's full away-prime compatibility* read through the explicit parameters of 10.34–10.35); routes for the polarized away-prime comparison (14.1) and for the trivial-monodromy comparison at the coefficient prime for parameters induced from unramified extensions (15.1) that avoid the irreducibility input of AutomorphicGaloisRepresentationsPartII AG2.6; the weight symmetry (15.2, a corollary of AutomorphicGaloisRepresentationsPartII AG2.0 *The Hodge–Tate multiset attached to a weight*; the form of [FormalProof] is recorded there); the Galois representations of definite unitary groups where they go past Guerberoff's Theorem 2.3 (`ℓ` odd with every place above `ℓ` split), with the twists `s_{ij}` written out, and in the generality of the remark of 16.1 (16.1); and three published results in the forms stated here, corollaries of the general theorems stated in InductionRestriction §6.2, AnabelianGeometryAndNonabelianChabauty §2.0a and AutomorphicLFunctionsAndLocalFactors AL.3.7.1a: Brauer's theorem in degree zero (10.0a), the shuffle algebra as a polynomial algebra on the Lyndon words (13.0a) and the contragredient of a cuspidal representation of `GL_n` by transpose-inverse (14.0a).

The theory these statements extend is owned by [EndoscopicTransferAndUnitaryTraceComparison](../../EndoscopicTransferAndUnitaryTraceComparison/README.md) and [AutomorphicGaloisRepresentationsPartII](../../AutomorphicGaloisRepresentationsPartII/README.md). EndoscopicTransferAndUnitaryTraceComparison owns the trace-defined correspondence and its compatibilities (its Layer 10), the Hecke character extending the quadratic character of a CM extension of an imaginary quadratic field (EndoscopicTransferAndUnitaryTraceComparison §6.3), local and global cyclic base change (EndoscopicTransferAndUnitaryTraceComparison §§6.12, 6.24) and weak base change from unitary groups (EndoscopicTransferAndUnitaryTraceComparison §6.29 and its Layer 13); the explicit threshold on the Weil side is its §10.26a, of which 10.27 above is a corollary, and the remark of 10.29a and 10.30 restate EndoscopicTransferAndUnitaryTraceComparison §§10.20–10.30 in the terms of LocalFactorsOfTwistsAndTypes §6.5. AutomorphicGaloisRepresentationsPartII owns the existence and the properties of the attached Galois representations (Layers AG2.0–AG2.7), among them the full polarized comparison at `ℓ` with monodromy of AG2.6 *Full polarized local–global compatibility at `ℓ`*, which takes an irreducibility input that ModularityAndLanglandsExtensions §2.43 proves in every rank `m ≥ 2`; 15.1 is a case of that comparison and 14.1 the away-from-`ℓ` part of AG2.7 *Polarized Hodge and Weil–Deligne export*, each with an alternative route here that does not use that input; the comparison of 14.2 is a corollary of AG2.5 *Caraiani's full away-prime compatibility*, and 15.2 of the conjugation formula of AG2.0 *The Hodge–Tate multiset attached to a weight*. Brauer's theorem in degree zero is owned by InductionRestriction §6.2, Radford's theorem on the shuffle algebra by AnabelianGeometryAndNonabelianChabauty §2.0a, and the contragredient by transpose-inverse by AutomorphicLFunctionsAndLocalFactors AL.3.7.1a. The representations of `GL_n` over finite fields, their Gauss sums and Shintani lifts, and the depth-zero representations of `GL_n(F)` with their labels are owned by [FiniteReductiveGroups](../FiniteReductiveGroups/README.md); the Harish-Chandra series of a label of `GL_n` over a finite field are DeligneLusztigTheory §§2.6 (d), 2.9. The characterisation of local Langlands correspondences by `ε`-factors of pairs and its uniqueness, the local converse theorem and the exponent bound for unitary generic representations are owned by [LocalFactorsOfTwistsAndTypes](../LocalFactorsOfTwistsAndTypes/README.md). The Galois representations attached to automorphic representations of the definite unitary group of PotentialAutomorphyInfrastructurePartII §3.1 are owned by its §3.6; 16.1 agrees with them on that group, for the primes `ℓ` that §3.6 admits (`ℓ` odd with every place above `ℓ` split), adds the other primes and the twists `s_{ij}`, and its remark states the general case. The classical correspondence is owned by SmoothRepresentationsOfLocalGroups SR.5.2. Fields of positive characteristic (Laumon–Rapoport–Stuhler) are not treated.

In this family, ThetaLiftsForDefiniteUnitaryGroups uses 6.3a for the splitting data of a definite pair, and ThetaChainsOnDefiniteUnitaryGroups and RowTowerAndRallisIdentities use it for the characters along a chain; RowTowerAndRallisIdentities uses 13.8a for its comparison of multiplicities; CongruenceModulesOfThetaLifts uses 10.33d, 10.34 and 10.35 for the local parameters at the level, type and twist primes, and 14.1, 14.2, 15.1, 15.2 and 16.1 for the Galois representations of its eigensystems; HeckeIdealsAndTaylorWilesRelations and UniformWildKernelBounds use 16.1.

## Exact supplier contracts

### From Mathlib

`groupCohomology.exists_div_of_norm_eq_one` (Hilbert's theorem 90 for a finite cyclic Galois extension) and `MonoidHom.isOpenMap_of_sigmaCompact` (a continuous surjective homomorphism from a σ-compact group onto a Hausdorff Baire group is open) (6.3a).

### From Tau Ceti

`FDRep.exists_character_eq_indClassFun_of_isNilpotent` (over an algebraically closed field of characteristic zero, the character of an irreducible representation of a finite nilpotent group is induced from a linear character of a subgroup) and `TauCeti.IsElementary.isNilpotent` (a finite elementary group is nilpotent) (10.0a).

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

§2.3(c): Harish-Chandra's formula for the characters of discrete series on the compact Cartan (13.8a). §2.16: local constancy of the Harish-Chandra character near regular semisimple elements. §6.3: a Hecke character of an imaginary quadratic field extending the quadratic character of that field over `ℚ`, the case of the first Check of 6.3a. §6.12: local cyclic base change of prime degree, with the lift of a supercuspidal representation supercuspidal or the induction of the orbit of its distinct conjugates of lower rank, and its Checks for unramified principal series. §6.24: all-place compatibility of global cyclic base change of prime degree, with its self-twist alternative. §6.29: weak base change from unitary groups to isobaric sums of Speh blocks, for `[E⁺:ℚ] ≥ 2`. §10.1: the normalisation. §10.20: functoriality of `σ_ss` (restriction under base change, additivity over normalised induction, rank one). §10.21: a unique supercuspidal representation with given irreducible semisimple parameter of finite inertia image. §10.23: the segment rule. §10.25: special-block factors and conductors. §10.26: `LLC_WD`, a bijection onto Frobenius-semisimple Weil–Deligne classes, equal to `σ_ss` with `N = 0` on supercuspidal representations. §10.26a: the Deligne–Henniart twist formula on the Weil side, with its explicit threshold and `c_χ` fixed on a specified ideal (the general theorem of which 10.27 is a corollary; 10.34). §10.28: central characters, duals and pair factors on supercuspidal representations. §10.29: factors through Langlands data. §10.30: the identification `LLC_WD = C_geo` (10.30), with the dual, twist and determinant properties it gives `LLC_WD` (the remark of 10.29a), the identities of standard and pair factors and conductors, and the compatibility of `rec` with twists.

### From TauCetiRoadmap.AutomorphicGaloisRepresentationsPartII

AG2.0: *The `l`-adic character `r_{l,ι}(χ)`* (with its local compatibility at the places away from `l`), *The Hodge–Tate multiset attached to a weight* (its conjugation formula, the general theorem of which 15.2 is a corollary), *A Galois representation attached to `π` at the good places* (the uniqueness of a semisimple attached representation). AG2.2: *Twisting an essentially self-dual form into unitary type*, *Galois assembly for discrete unitary transfer* (the assembly pattern), *Attachment under cuspidal solvable base change*. AG2.3: *Arbitrary regular conjugate-self-dual existence* (the existence of `r_{ℓ,ι}(π)`, used in every statement on it in Layers 14–16; for a polarized pair with the twist of AG2.2), *The automorphic S-general extension family*. AG2.5: *Comparison of the early polynomial with normalized local Langlands* (14.1, 16.1), *Caraiani's full away-prime compatibility* (the general theorem of which 14.2 is a corollary), *Varma's semisimplified comparison and monodromy bound*. AG2.6: *Polarized admissibility at the coefficient prime* (de Rham with the labelled weights at every `w ∣ ℓ`, crystalline at the spherical ones: used as stated, and in 15.1 (6), 15.2 and 16.1), with its Iwahori case, and *Full polarized local–global compatibility at `ℓ`* (15.1, of which it gives the general case; its rank-one clause in the alternative route). AG2.7: *Polarized Hodge and Weil–Deligne export* (14.1, its away-from-`ℓ` part), and *Unitary discrete-parameter export*, compared with 16.1.

### From TauCetiRoadmap.ModularityAndLanglandsExtensions

§2.43: the irreducibility of `r_{l,ι}(π)` for a set of primes `l` of Dirichlet density one, which proves the irreducibility premise of AutomorphicGaloisRepresentationsPartII AG2.6 *Full polarized local–global compatibility at `ℓ`* and AG2.7 *Polarized Hodge and Weil–Deligne export* in every rank `n ≥ 2` (14.1, 15.1).

### From TauCetiRoadmap.PotentialAutomorphyInfrastructurePartII

§3.1 (the definite unitary group of a CM extension unramified at every finite place, with `S(B) = ∅`) and §3.6 (the Galois representations attached to the constituents of its algebraic modular forms), compared with 16.1, which agrees with §3.6 on that group for the primes `ℓ` that §3.6 admits (`ℓ` odd with every place above `ℓ` split).

### From FiniteReductiveGroups, a sub-roadmap of this family

§1.1 (cuspidal representations of `GL_n(k)`: no nonzero vector fixed by the unipotent radical of a proper parabolic subgroup), §5.2 (the cuspidal representations `σ_θ` of `GL_n(k)` and their characters at regular elliptic elements, `σ_θ^∨ = σ_{θ⁻¹}`), §5.10 (the Gauss sums `G_n` and `w`, with (a) their relation and (b) the comparison of regular characters with the same restriction to `k^×`), §5.11 (norm classes, the Shintani lift `Sh_d` and the lift `m^{(l)}` of labels, with (e) its detection by twisted characters), §§6.1–6.4 (the depth-zero supercuspidal representations `π(σ, c)` and `π_θ̃`, their twists and central characters, labels of depth-zero representations, depth zero up to twist).

### From HermitianFormsAndLattices, a sub-roadmap of this family

§3.1: Landherr's theorem, the Hasse principle for Hermitian forms over a quadratic extension of number fields (13.8a).

### From LocalFactorsOfTwistsAndTypes, a sub-roadmap of this family

§6.3: the exponent bound `|α_i| < 1/2` for the supercuspidal support of a unitary generic representation. §6.4: the local converse theorem with twists in its half range, in characteristic zero. §6.5: local Langlands correspondences, their characterisation by `ε`-factors of pairs, and uniqueness (10.29a: the numbering of its properties in the statement; the characterisation and the uniqueness in the remark), and the transport `π ↦ (rec_n⁻¹(π))^∨` of a family in the arithmetic normalisation (10.30).

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

AL.2.1.2–AL.2.1.5: the Godement–Jacquet zeta integrals, standard factors and functional equation. AL.3.2–AL.3.3: Rankin–Selberg factors of pairs. AL.3.4.3 and AL.3.7.1: multiplicity one and strong multiplicity one for cuspidal representations of `GL_n` over a number field (14.0a). AL.3.7.1a: the contragredient of a unitary cuspidal representation of `GL_n` by transpose-inverse (the general theorem of which 14.0a is a corollary).

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

SR.2.1 (compact induction), SR.3.1 (supercuspidal support), SR.3.3 (the Langlands classification), SR.4.3 (the Satake description of spherical representations), SR.5.2 (the classical correspondence, *classical-llc-normalization*; *modular-generic-segments*; *segment-representations*, with the genericity of `L(Δ)`, which for the one-term segments `[x, x]_ρ` is the genericity of every supercuspidal representation), and SR.2.2 (*geometric-lemma*) (13.8a).

### From TauCetiRoadmap.AutomorphicSpectralTheory

§§7.0a–7.0b: twisted objects, measures, matching of functions and the character identity of cyclic base change. §4.5: finite multiplicity in the discrete spectrum (13.8a). §6.18: pseudo-coefficients of discrete series, with trace `0` on the other tempered representations (13.8a).

### From DiscreteSeriesCoefficientsAndAutomorphicMetrics, a sub-roadmap of this family

§9.1: the trace class property on the cuspidal and discrete spectrum (13.8a).

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

§§2.4, 2.7, 4.2 (discrete series and their lowest `K`-types, finiteness, rapid decay), §§7.4–7.5 (automorphic forms on groups compact at infinity).

### From TauCetiRoadmap.GlobalNumberFields

Layers 8–10: idele classes and norms, Hecke characters, infinity types.

### From TauCetiRoadmap.VonNeumannAlgebras

Layer 11: the Pontryagin duality theorem for Hausdorff locally compact abelian groups (the inversion, Plancherel and duality target that follows V11.FourierUniqueness: evaluation into the bidual is an isomorphism of topological groups), and the separation of points by characters (V11.DoubleDualEmbedding) (6.3a).

### From TauCetiRoadmap.ClassFieldTheory

Layer 9: local reciprocity and the Weil group, norm compatibility of the local Artin maps. Layer 11: global Artin reciprocity, with the kernel of the global Artin map of a quadratic extension, which gives the elements of a number field with prescribed norm residue symbols (13.8a). Layer 13: the cyclic Hasse norm theorem (13.8a).

### From TauCetiRoadmap.ClassicalArithmeticCompletion

§7.12b: the Langlands–Deligne local constants and their inductivity in degree zero.

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

§§2.4–2.6: Weil–Deligne representations attached to `p`-adic representations. §2.7: Tate's local constants.

### From TauCetiRoadmap.PadicHodgeTheory

§5.3: `WD(D_pst)` and its compatibility with restriction and tensor products.

### From TauCetiRoadmap.NoncommutativeAndEquivariantIwasawa

§F.6, stage 3: a de Rham representation of the absolute Galois group of a finite extension of `ℚ_p` is potentially semistable.

### From TauCetiRoadmap.ArithmeticGaloisDuality

§R02.4.6: the Grunwald–Wang theorem in its prime-degree case.

### From TauCetiRoadmap.DeligneLusztigTheory

§2.6 (d): for a label `κ` of `GL_n` over a finite field, the irreducible characters of label `κ` form the
Harish-Chandra series of `(L_κ, σ_κ)`, and each is a constituent of `R_{L_κ}^G σ_κ` (10.33d). §2.9: over every finite
field, the semisimple label of an irreducible character, the characters of one label forming one Harish-Chandra series
(the labels of FiniteReductiveGroups §6.3 over residue fields that are not prime fields: 10.33d, 10.34, 14.2).

### From TauCetiRoadmap.RepresentationTheory.InductionRestriction

Layer 3: the Mackey decomposition (15.1). Layer 4: Mackey's irreducibility criterion (10.33a). Layer 5: Clifford theory. Layer 6: Brauer's induction theorem (10.0a). §6.2: Brauer's theorem in degree zero, with `H` elementary (the general theorem of which 10.0a is a corollary).

### From TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty

§2.0a: Radford's theorem, the shuffle algebra over a field of characteristic zero on a linearly ordered alphabet is the polynomial algebra on the Lyndon words (the general theorem of which 13.0a is a corollary).

### From TauCetiRoadmap.ReductiveGroups

Layer 7a: Lang's theorem.

### From TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer

§R16.1.7: for a number field, a finitely generated subgroup `E` of its multiplicative group, `n > 0` and a finite set `T`
of finite places, a modulus with support disjoint from `T` whose congruence subgroup meets `E` inside `E^n` (Chevalley);
for the unit group and the places above the primes dividing `b` it gives the theorem on units of 10.29a.

## References

- Erich Hecke, Eine neue Art von Zetafunktionen und ihre Beziehungen zur Verteilung der Primzahlen, Math. Z. 1 (1918) and 6 (1920): Hecke characters with infinity type (6.3a).
- Stephen S. Kudla, Splitting metaplectic covers of dual reductive pairs, Israel J. Math. 87 (1994), §1: the splitting conditions (6.3a).
- Michael Harris, Stephen S. Kudla and William J. Sweet, Theta dichotomy for unitary groups, J. Amer. Math. Soc. 9 (1996), §1 (6.3a).
- Pierre Deligne, Les constantes des équations fonctionnelles des fonctions L, in Modular Functions of One Variable II, Lecture Notes in Mathematics 349 (1973), Proposition 1.5, p. 510: Brauer's theorem in degree zero, with `H` elementary (10.0a).
- Pierre Deligne and Guy Henniart, Sur la variation, par torsion, des constantes locales d'équations fonctionnelles de fonctions L, Invent. Math. 64 (1981), Theorem 4.6 and Lemma 4.7 (10.27, 10.34).
- Michael Harris and Richard Taylor, The geometry and cohomology of some simple Shimura varieties, Annals of Mathematics Studies 151, 2001, and Guy Henniart, Une preuve simple des conjectures de Langlands pour GL(n) sur un corps p-adique, Invent. Math. 139 (2000): the classical correspondence (10.29a, 10.30).
- G. Henniart, Caractérisation de la correspondance de Langlands locale par les facteurs ε de paires, Invent. Math. 113 (1993): the uniqueness of the local Langlands correspondence (10.29a).
- P. Scholze, The local Langlands correspondence for GL_n over p-adic fields, Invent. Math. 192 (2013), arXiv:1010.1540: the local Langlands correspondence (10.29a); Theorem 1.2 (10.30).
- G. Henniart, Une caractérisation de la correspondance de Langlands locale pour GL(n), Bull. Soc. Math. France 130 (2002), Theorem 1.8 (10.30).
- Robert E. Kottwitz, Base change for unit elements of Hecke algebras, Compositio Math. 60 (1986): the case `f = 1` of 10.33c.
- J. A. Green, The characters of the finite general linear groups, Trans. Amer. Math. Soc. 80 (1955): the sign of the characters at units (10.34, Checks).
- Guy Henniart, Correspondance de Langlands–Kazhdan explicite dans le cas non ramifié, Math. Nachr. 158 (1992): the explicit correspondence in the unramified case (10.29a, 10.33a, 10.34, 10.35).
- Colin J. Bushnell and Guy Henniart, The essentially tame local Langlands correspondence, I, J. Amer. Math. Soc. 18 (2005): essentially tame representations (10.29a, 10.34, 10.35).
- S. DeBacker and M. Reeder, Depth-zero supercuspidal L-packets and their stability, Ann. of Math. (2) 169 (2009), 795–901, Lemmas 9.3.1 and 10.0.4 with Proposition 10.1.1: characters of depth-zero supercuspidal representations of unramified groups at very regular elements (10.33b).
- C. Yang, Gamma factors of level zero supercuspidal representations, arXiv:1903.11497 (2019): local automorphic induction from unramified extensions at level zero, with its base change (10.33a).
- A. Silberger and E.-W. Zink, Explicit Shintani base change and the Macdonald correspondence for characters of GL_n(k), J. Algebra 319 (2008), 4147–4176: Shintani base change against restriction of tame parameters (10.33a, 10.33d).
- J. Adler and J. Lansky, Depth-zero base change for unramified U(2,1), J. Number Theory 114 (2005), 324–360 (10.33a).
- Gérard Laumon, Michael Rapoport and Ulrich Stuhler, `D`-elliptic sheaves and the Langlands correspondence, Invent. Math. 113 (1993): positive characteristic (Scope).
- David E. Radford, A natural ring basis for the shuffle algebra and an application to group schemes, J. Algebra 58 (1979), and Michael E. Hoffman, Quasi-shuffle products, arXiv:math/9907173v1 (1999), Theorem 2.2, which states Radford's theorem for a subfield of `ℂ` (13.0a).
- James W. Cogdell, Lectures on L-functions, converse theorems, and functoriality for GL(n), the author's notes of his Fields Institute lectures, Lecture 5, Proposition 5.3 (iii) with the remark after Proposition 5.1, pp. 38–39 of those notes, for unitary cuspidal representations (14.0a).
- A. Caraiani, Local-global compatibility and the action of monodromy on nearby cycles, Duke Math. J. 161 (2012): local–global compatibility away from the coefficient prime, with monodromy (14.1, 14.2).
- S. W. Shin, Galois representations arising from some compact Shimura varieties, Ann. of Math. 173 (2011), 1645–1741, and G. Chenevier and M. Harris, Construction of automorphic Galois representations, II, Camb. J. Math. 1 (2013), 53–73: with Caraiani (2012), the Galois representations of regular algebraic polarized cuspidal representations over CM fields and their compatibility with the local correspondence away from the coefficient prime (14.1).
- Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, Potential automorphy and change of weight, Ann. of Math. 179 (2014), 501–609, Theorem 2.1.1: the Hodge–Tate weights and their symmetry under complex conjugation (15.2, through AutomorphicGaloisRepresentationsPartII AG2.0).
- Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, Local-global compatibility for l = p, II, Ann. Sci. ÉNS 47 (2014), 165–179, and A. Caraiani, Monodromy and local-global compatibility for l = p, Algebra Number Theory 8 (2014), 1597–1646: local–global compatibility at the coefficient prime (15.1, through AutomorphicGaloisRepresentationsPartII AG2.6).
- Jean-Pierre Labesse, Changement de base CM et séries discrètes, in On the stabilization of the trace formula, International Press, 2011: the hypothesis `[E⁺:ℚ] ≥ 2` (16.1); Corollaire 5.3 and Théorème 5.4, the base change on which Guerberoff (2011) rests (16.1).
- C. Mœglin and J.-L. Waldspurger, Le spectre résiduel de GL(n), Ann. Sci. École Norm. Sup. 22 (1989): the discrete spectrum of `GL_n` as Speh representations (16.1), stated here through EndoscopicTransferAndUnitaryTraceComparison §6.29.
- D. Guerberoff, Modularity lifting theorems for Galois representations of unitary type, Compositio Math. 147 (2011), 1022–1058, arXiv:0906.4189, Theorems 2.2 and 2.3 with Remarks 2.4–2.5: the Galois representations of automorphic representations of a totally definite unitary group over a CM extension unramified at every finite place, obtained in the proof of Theorem 2.3 as sums over the Speh blocks of the base change, for `ℓ` odd with every place above `ℓ` split (16.1).
- [CS] Ana Caraiani and Peter Scholze, On the generic part of the cohomology of compact unitary Shimura varieties, Ann. of Math. 186 (2017), Corollary 5.5.5 in the published numbering, the locator of AutomorphicGaloisRepresentationsPartII AG2.7 (16.1).
- [HLTT] Michael Harris, Kai-Wen Lan, Richard Taylor and Jack Thorne, On the rigid cohomology of certain Shimura varieties, Res. Math. Sci. 3 (2016) (16.1).
- **[FormalProof]** Levent Alpöge, the Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet L-functions announced in [Announcement]; source with a public verification setup: <https://github.com/leanprover-community/riemann-hypothesis>. The file paths given above are relative to the directory `src/` of the first commit of that repository, the source as published: <https://github.com/leanprover-community/riemann-hypothesis/tree/40e56bab026552e089d7afcfeff08d2defb9c005/src>. It is the source of the matching of functions inflated from the residue field (10.33c) and of the case of 13.8a over the cyclic hosts, and it has the forms of the splitting characters (6.3a), of the twist formula in rank one (10.27), of the map of 10.29a with its laws, of the global form 10.33d (b), of 10.34 (i), (iii), (iv) and the tameness in (ii), of 10.35 (a)–(c) and the depth-zero criterion in (d), of 10.0a, 13.0a and 14.0a, and of 14.1, 14.2, 15.1, 15.2 and 16.1 that the family uses; it constructs the representations themselves by its own route (Layer 14).
- **[Announcement]** Levent Alpöge, the announcement of that proof, 20 November 2026: <https://alpo.ge/remark.pdf>.
