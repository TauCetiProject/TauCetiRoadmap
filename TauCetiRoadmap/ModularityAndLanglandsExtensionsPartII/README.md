# Roadmap: modularity and Langlands extensions, part II — the proof of symmetric power functoriality

**Summary.** This roadmap proves symmetric power functoriality for Hilbert modular forms. Let `F`
be a totally real field and `π` a regular algebraic cuspidal automorphic representation of
`GL_2(𝔸_F)` that is not CM. Then for every `n ≥ 1` the symmetric power `Sym^{n−1}π` exists as an
automorphic representation of `GL_n(𝔸_F)`, with the expected local component at every place, and for
every prime `p` its `p`-adic Galois representation is `Sym^{n−1}` of that of `π`. The statement
`SP_n` and its cases `n ≤ 5`, from which the induction starts, come from
ModularityAndLanglandsExtensions; the theorem for every `n`, with its proof and its consequences over
`ℚ`, is stated and proved here.

The proof is Newton–Thorne's induction on `n`. Write `n = p + r` with `p` a prime in the range
`n/2 < p < n`. Modulo `p`, the residual representation of `Sym^{n−1}` has, after semisimplification,
two blocks. One is a twist of a smaller symmetric power. The other is the tensor product of a
coefficient Frobenius twist of the residual representation of `π` with a symmetric power of it. Given
ordinary automorphic witnesses for the two blocks, Thorne's `p`-adic level raising on definite unitary
groups and residually reducible automorphy lifting give the automorphy of `Sym^{n−1}`.

The witness for the twisted tensor is obtained in two steps. First, an untwisted tensor of `π` with a
symmetric power of a congruent companion form is proved automorphic, by comparing deformation
problems whose local conditions have the same reduced special fibre. Second, a functoriality lifting
theorem for tensor products with one factor fixed is proved, by patching a rank-two deformation ring
simultaneously with a pseudodeformation ring of the tensor, and is propagated over the Galois group
of the coefficient field.

Over `ℚ` the theorem gives symmetric power functoriality for every non-CM newform of weight at least
`2`. In particular it gives Newton–Thorne's Theorems A and E for level-one eigenforms, and their
Theorem B for forms without supercuspidal local components. Consequently the symmetric power Euler
products of level-one eigenforms extend to entire functions, and so do those of non-CM newforms of
weight at least `2` away from their level. These last statements are the ones this roadmap's Lean
file records.

Besides that roadmap, this one builds on four others. PotentialAutomorphyInfrastructurePartII provides the residually
reducible deformation theory, the definite unitary Hecke algebras and the Taylor–Wiles data.
GL2ModularityLifting and DeformationAndDerivedPatchingAlgebra provide the patching templates.
PotentialModularityAndCompatibleSystems provides the companion forms and the lifts of prescribed
type.

Layer 6 is Thorne's level raising. Layer 9 is the simultaneous patching for symmetric powers. Layers
11 and 12 treat the untwisted tensor and tensor functoriality lifting. Layer 13 produces the residual
witnesses and runs the induction. Layer 14 draws the consequences over `ℚ`.

| Layer | Title | What it builds |
|---|---|---|
| 6 | Level raising to Steinberg | Thorne's `p`-adic level raising of an ordinary isobaric sum of two conjugate self-dual blocks to a cuspidal representation Steinberg at a prescribed place |
| 9 | Automorphy lifting for symmetric powers | simultaneous patching of the rank-two deformation ring and the symmetric-power pseudodeformation ring, regularity at an automorphic point |
| 11 | The untwisted tensor | automorphy of `r_π ⊗ Sym^{r−1} r_σ` by congruent special fibres and generic primes |
| 12 | Tensor functoriality lifting | automorphy lifting for `r_π ⊗ r_σ` with `σ` fixed, by simultaneous patching |
| 13 | Residual twisted tensors and the induction | large image from tamely dihedral places, residual witnesses for the coefficient-Frobenius twisted tensor, lifting from two ordinary blocks, `SP_n` for all `n` |
| 14 | Endpoints over `ℚ` | Theorems A, B, E, symmetric power functoriality for every non-CM newform, holomorphy of `L(s, Sym^n f)` in level one and, away from the level, for non-CM newforms of weight at least `2` |

## How to read the build

Layer 6 is Thorne's `p`-adic level raising on definite unitary groups. Layer 9 patches the rank-two
deformation ring of a weight-two Hilbert modular form simultaneously with the conjugate self-dual
pseudodeformation ring of its symmetric power and shows that regularity of the latter at an
automorphic point transfers automorphy; Layer 12 runs the same patching for a tensor product with a
fixed factor. Layer 11 proves automorphy of the untwisted tensor `r_π ⊗ Sym^{r−1} r_σ`, with
Layer 6 supplying a Steinberg seed. Layer 13 combines Layers 6, 11 and 12 into ordinary residual
witnesses for the two blocks of `Sym^{p+r−1}` modulo `p` and proves `SP_n` for all `n` over every
totally real field, by induction from the cases `n ≤ 5` of ModularityAndLanglandsExtensions.
Layer 14 specialises `SP_n` to `ℚ` and deduces the holomorphy of symmetric power `L`-functions.
Each target's `*Needs:*` line lists what its statement and its route use, so an implementer who
proves it another way is not blocked behind an unrelated layer. Layer and section numbers are
identifiers, not a count: the layers are 6, 9 and 11–14, Layer 6 has the single section §6.9, and
Layer 13 has no §13.9; nothing is missing at these gaps.

## Conventions

- Galois conventions follow ModularityAndLanglandsExtensions (its Conventions and §0.2):
  geometric Frobenius; local reciprocity sends uniformisers to geometric Frobenius;
  `rec^T(π_v) = rec(π_v ⊗ |det|^{(1−n)/2})`; the cyclotomic character `ε` has Hodge–Tate weight
  `−1`. RAESDC, RACSDC, RAECSDC and ι-ordinary are as in PotentialAutomorphyInfrastructurePartII
  Layer 0. For a cuspidal `π` of `GL_2`, `r_{π,ι}` is its `p`-adic Galois representation.
  "`Sym^{n−1} r_{π,ι}` is automorphic" means it is `r_{Π,ι}` for a RAESDC (totally real base) or
  RACSDC (CM base) `Π` of `GL_n`, as in ModularityAndLanglandsExtensions §0.2; "`Sym^{n−1}π`
  exists" means the all-place lift of its §1.10. `SP_n` is its §1.12 statement: for every totally
  real `F` and every non-CM RAESDC `π` of `GL_2(𝔸_F)`, `Sym^{n−1}π` exists. `TP_r` is tensor
  functoriality `GL_2 × GL_r → GL_{2r}` for RAECSDC representations over CM fields whose tensor is
  irreducible and Hodge–Tate regular (Clozel–Thorne's conjecture, as used in th24 §7, p. 42).
- `𝒢_n = (GL_n × GL_1) ⋊ {1, j}` is the group of Clozel–Harris–Taylor with multiplier `ν`;
  polarized representations take values in `𝒢_n` (GlobalGaloisDeformations §8.1).
  Pseudocharacters are Chenevier determinants (IntegralHeckeAndGaloisDeterminants §0.2); when `n!`
  is invertible they are determined by their traces (§0.5 there).
- `φ_p ∈ G_{ℚ_p}` is a lift of arithmetic Frobenius acting on coefficients; `φ_p r̄` and
  `^{φ_p} r̄` denote the coefficient twist, never evaluation at a Frobenius element. `a₀(p) ≥ 3` is
  the adequacy threshold of ArithmeticGaloisRepresentations §7.9 (Newton–Thorne 2026 Lemma 2.3,
  Thorne 2024 Lemma 7.3).
- Symmetric powers `Sym^d` of integral representations are the quotient symmetric powers of
  ArithmeticGaloisRepresentations §7.1; the mod-`p` decompositions of §7.8 there are statements
  about semisimplifications.
- In residually reducible arguments "primitive" means weakly primitive in the sense of
  PotentialAutomorphyInfrastructurePartII Layer 7, tested over an algebraic closure of the residue
  field. Before integral coefficient rings are fixed, the residue field is enlarged to a common
  finite splitting field for every subgroup of the residual image ("Weak primitivity over a
  splitting coefficient field", Layer 7); primitivity over an arbitrary finite field is never used
  in place of this.
- Locators are to the versions listed under References: arXiv versions by PDF page for
  Newton–Thorne I (arXiv v3), Newton–Thorne II (arXiv v2), Newton–Thorne 2026 (arXiv v2) and Thorne
  2024 (arXiv v2). Where a printed argument needs repair, the target says what the printed text does
  and what is used instead, at the claim.

## Layer 6: level raising to Steinberg by p-adic methods

This layer proves Thorne's level raising by `p`-adic methods (th24 Theorem 6.11, pp. 38–41): an
ι-ordinary regular algebraic isobaric sum of two conjugate self-dual cuspidal representations whose
components at a place `ṽ_0` are unramified Steinberg twists satisfying the level-raising congruence is
congruent to a cuspidal representation that is an unramified Steinberg twist at `ṽ_0`. Layer 11 uses
it for a Steinberg seed (§11.6) and Layer 13 for the lifting from two ordinary blocks (§13.8).

### 6.9 Level raising to an ordinary Steinberg lift by p-adic methods (Thorne 2024 Theorem 6.11)

Let `F = F⁺F_0` be CM with `F_0` imaginary quadratic and `F/F⁺` everywhere unramified, `p` and `q`
primes split in `F_0`, `v_0` a `q`-adic place of `F⁺`, `ṽ_0` the place of `F` above `v_0` lying above a
fixed `q`-adic place `u_0` of `F_0`, and `ι : ℚ̄_p ≅ ℂ`. Let `n = n_1 + n_2` and `π_1`, `π_2` cuspidal
conjugate self-dual on `GL_{n_1}(𝔸_F)`, `GL_{n_2}(𝔸_F)` with `π = π_1 ⊞ π_2` regular algebraic and
ι-ordinary, and `S` a finite set of places of `F⁺` containing `S_p`, `v_0` and the places below the
ramification of `π`, with no other `q`-adic places, such that (1) `π` is ramified only at places split
over `F⁺`; (2) writing `λ_{i,τ}` for the dominant weight of `π_i|·|^{(n_i−n)/2}`, for each embedding
`τ_0 : F_0 → ℂ` and each pair of dominant weights `(μ_1, μ_2)` the number of `τ : F → ℂ` restricting
to `τ_0` with `(λ_{1,τ}, λ_{2,τ}) = (μ_1, μ_2)` is even; (3) at some finite place `w ∉ S` split over
`F⁺`, `r̄_ι(π)|^{ss}_{G_{F_w}} ≅ ⊕ χ̄_i` with unramified `χ̄_i` and `χ̄_i/χ̄_j ≠ ε̄` for `i ≠ j`; (4)
`π_{1,ṽ_0} ≅ St_{n_1}(ψ_1)`, `π_{2,ṽ_0} ≅ St_{n_2}(ψ_2)` with `ψ_1`, `ψ_2` unramified and
`ι^{−1}(ψ_1 ψ_2^{−1} |·|^{−n/2})` valued in `1 + 𝔪_{ℤ̄_p}`; (5) `π` is unramified at the `q`-adic places
not above `v_0`. Prove that there is an ι-ordinary RACSDC `Π` on `GL_n(𝔸_F)` with
`r̄_ι(Π) ≅ r̄_ι(π)`, `Π_{ṽ_0}` an unramified twist of `St_n`, unramified at the other `q`-adic places
and ramified only at places split over `F⁺` (th24 Theorem 6.11 and its assumptions, pp. 39–40;
proof, pp. 40–41; Lemma 6.10, p. 39).

*Proof sketch.* Suppose not; th24 Proposition 6.5 gives a maximal ideal `𝔪` in the support of the
`p`-adic forms `S(K^p, k)` with the residual eigensystem of `π` (PotentialAutomorphyInfrastructurePartII
Layer 3; CompletedCohomologyAndLocalGlobalCompatibility §0.7). The concentration of the
Hecke-localized derived tensor product of Drinfeld-space cohomology with the automorphic module
(th24 Theorem 5.2, using the genericity place `w`) and Steinberg detection (Theorem 3.4) show that a
non-zero middle-degree part would detect a Steinberg constituent, contrary to assumption; hence the
tensor vanishes, and Corollary 6.3 gives the vanishing of twisted `Hom`-spaces at every weight.
Choose an anticyclotomic `ψ ≡ 1` with the Frobenius value of Lemma 6.10 and twist the first block
only: `(r_{π_1|·|^{(n_1−n)/2}} ⊗ ψ) ⊕ r_{π_2|·|^{(n_2−n)/2}}`. Proposition 6.7 and Corollary 6.6
give its Hecke eigensystem, and Corollary 6.8 (with Lemma 6.9) reduces its Iwahori-spherical local
constituents at `ṽ_0` to Steinberg or the specified two-block constituent, either of which gives
non-zero derived `Hom` in a degree forbidden by that vanishing. The inputs from th24 §§3–6 are
supplied by CompletedCohomologyAndLocalGlobalCompatibility (supplier contracts).

**Checks.**

- For `n_1 = n_2 = 1`, (4) says `ψ_1 ψ_2^{−1} |·|^{−1} ≡ 1` modulo `𝔪` at `ṽ_0`: the classical
  level-raising congruence for `GL_2` in conjugate self-dual form.
- Condition (4) is ordered and sufficient, not necessary. Take `n_1 = n_2 = 1`, `ṽ_0` of norm
  `q_{ṽ_0} = 2`, `p = 5`, and residual values `ψ_1(ϖ) = 2`, `ψ_2(ϖ) = 1` in `𝔽_5`. The value of
  `ψ_1 ψ_2^{−1}|·|^{−1}` at `ϖ` is `2 · 2 = 4 ≠ 1`, yet `{2, 1}` is a `q_{ṽ_0}`-string; after exchanging
  `π_1` and `π_2` (the other hypotheses are symmetric in the two blocks) the value is `3 · 2 = 6 = 1`
  in `𝔽_5`, and the theorem applies.
- A necessary condition is that the residual Frobenius eigenvalues at `ṽ_0` form a single
  `q_{ṽ_0}`-string, as those of an unramified twist of `St_n` do; for `n_1 = n_2 = 1` their ratio must
  be `q_{ṽ_0}` or `q_{ṽ_0}^{−1}` in `k`. For `q_{ṽ_0} = 2` and `k = 𝔽_7`, the pair `{3, 1}` has ratios
  `3` and `5`, neither of which lies in `{2, 4}`, so no Steinberg lift exists, in either order.
- The conclusion is residual: `Π` is cuspidal while `π` is an isobaric sum.

*Needs:* PotentialAutomorphyInfrastructurePartII Layer 0 ("Algebraic characters with
prescribed conjugate norm and local behaviour"), Layer 3 ("Algebraic modular forms on a definite
unitary group"; "The big ordinary Hecke algebra over `Λ`"); SmoothRepresentationsOfLocalGroups SR.3;
CompletedCohomologyAndLocalGlobalCompatibility §0.7 (gap:drinfeld-steinberg-detection).

### Examples

- In §11.6 the theorem is applied to `π′_1 ⊞ π′_2`, of ranks `r + 1` and `r − 1`, at an auxiliary
  place `v_2` with `q_{v_2} ≡ 1` modulo `p`.
- In §13.8 it is applied to `σ_1 ⊞ σ_2`, of ranks `p − r` and `2r`, at the place above `v_1`.

### Dependencies

PotentialAutomorphyInfrastructurePartII Layers 0, 3; SmoothRepresentationsOfLocalGroups SR.3;
CompletedCohomologyAndLocalGlobalCompatibility §0.7.

## Layer 9: automorphy lifting for symmetric powers

This layer builds the simultaneous patching behind automorphy lifting for `Sym^{n−1}` of
non-ordinary weight-two Hilbert modular forms with large projective image (nt21b §2, pp. 5–19),
valid for every `p` including `p = 2` and `p ≤ n`, without any vanishing of the dual Selmer group of
the residual symmetric power: the rank-two deformation ring and the conjugate self-dual
pseudodeformation ring of `Sym^{n−1}` are patched simultaneously, and regularity of the latter at an
automorphic point transfers automorphy (§9.7). Layer 12 runs the same simultaneous patching for a
tensor product with a fixed factor.

### 9.1 The setting: congruent non-ordinary weight-two forms with large projective image

Fix a prime `p`, a totally real field `F`, `ι : ℚ̄_p ≅ ℂ` and `n ≥ 1`. Define the setting as pairs
`(π, π′)` of regular algebraic cuspidal automorphic representations of `GL_2(𝔸_F)` of weight two,
non-CM, with `r_{π,ι}|_{G_{F_v}}` and `r_{π′,ι}|_{G_{F_v}}` not ordinary (hence potentially
Barsotti–Tate) at every `v | p`, `r̄_{π,ι} ≅ r̄_{π′,ι}`, `π_v` a twist of Steinberg exactly when `π′_v`
is for every `v ∤ p`, and for some `a ≥ 1` with `p^a > max(5, 2n − 1)`,
`PSL_2(𝔽_{p^a}) ⊂ Proj r̄_{π,ι}(G_F) ⊂ PGL_2(𝔽_{p^a})` up to conjugacy (ModularityAndLanglandsExtensions
§1.7). Prove that after a soluble totally real base change, which preserves the hypotheses and from
which automorphy of `Sym^{n−1} r_{π,ι}` descends, one may assume: (6) `4 | [F : ℚ]` (nt21b asks
only that `[F : ℚ]` be even; divisibility by `4` gives `4 | n[F : ℚ]` for every `n`, the standing hypothesis of
the `p = 2` supplier of §9.4); (7) `det r_{π,ι} = det r_{π′,ι} = ε^{−1}`; (8) `π`, `π′` unramified
at `p`; (9) Iwahori-spherical away
from `p` with an even number of ramified places; (10) `r̄` trivial on `S = S_p ∪ Σ`, with
`q_v ≡ 1` modulo `p` and `π_v`, `π′_v` Steinberg on `Σ`; (11) an everywhere unramified CM quadratic
`K/F` in which `S` splits (nt21b §2, setting and Theorem 2.1, p. 5; reductions (6)–(11), p. 6).
One then works with `Π = π_K` and the pseudodeformation ring `P` of `Sym^{n−1} r̄|_{G_K}`.

*Proof sketch.* The soluble totally real extension is built from cyclic steps with prescribed split
places (PotentialAutomorphyInfrastructure §2.5) and steps with prescribed completions at `S`
(PotentialModularityAndCompatibleSystems §2.16), linearly disjoint from the field cut out by `r̄`.
Soluble base change and descent (PotentialAutomorphyInfrastructurePartII Layer 0;
EndoscopicTransferAndUnitaryTraceComparison §6.24) preserve all hypotheses and the conclusion; the
sandwich hypothesis is stable under base change disjoint from the residual field.

**API.**

- The data `(p, F, ι, n, π, π′)` with the hypotheses above.
- The integer `a` with `PSL_2(𝔽_{p^a}) ⊂ Proj r̄(G_F) ⊂ PGL_2(𝔽_{p^a})` and `p^a > max(5, 2n − 1)`.
- A soluble totally real `E/F` after which (6)–(11) hold, with the conclusion descending.
- The everywhere unramified CM quadratic `K/F` in which `S` splits, and `Π = π_K`.

**Checks.**

- For `n = 2` the bound is `p^a > 5`, so `𝔽_7` qualifies and `𝔽_5` does not; for `n = 10` it is
  `p^a > 19`, so `𝔽_{23}` and `𝔽_{25}` qualify and `𝔽_{19}` does not.
- A pair with `r_{π,ι}|_{G_{F_v}}` ordinary at some `v | p` is not in the setting.
- Evenness of `[F : ℚ]` alone is too weak at `p = 2`: for `n = 3` and `[F : ℚ] = 2`,
  `n[F : ℚ] = 6 ≢ 0` modulo `4`, while after (6) `n[F : ℚ]` is a multiple of `4` for every `n`.
- For `n = 1`, `Sym^0 r` is the trivial character and its automorphy is tautological; for `n = 2`
  the setting is a rank-two modularity lifting problem in weight two.

*Needs:* ModularityAndLanglandsExtensions §§0.2, 1.7; PotentialAutomorphyInfrastructurePartII Layer
0 ("Soluble base change and descent of polarized automorphy"); PotentialAutomorphyInfrastructure
§2.5; PotentialModularityAndCompatibleSystems §2.16; EndoscopicTransferAndUnitaryTraceComparison
§6.24.

### 9.2 Symmetric powers of Barsotti–Tate lifts and the morphism P → R

In the setting of §9.1 after the reductions, let `A` be an Artinian object of `𝒞_𝒪`, `v ∈ S_p`, and
`r̃ : G_{F_v} → GL_2(A)` a lift of `r̄` of determinant `ε^{−1}` through `R_v`, the ring of non-ordinary
crystalline lifts with Hodge–Tate weights `{0, 1}`. Prove that `A^n`, with `G_{F_v}` acting through
`Sym^{n−1} r̃`, is isomorphic to a subquotient of a lattice in a crystalline representation with
Hodge–Tate weights in `[0, n − 1]`; consequently `Sym^{n−1}` of the universal deformation restricted
to `G_K` defines a morphism `P → R` from the conjugate self-dual pseudodeformation ring, with
torsion-semistable conditions at `p`, to the rank-two deformation ring (nt21b Lemma 2.2 and proof,
p. 7; the construction of `P → R` from it, p. 8).

*Proof sketch.* The `ℤ_p[G_{F_v}]`-dual `(A²)^∨` of `A²` is the generic fibre of a finite flat group
scheme `𝒢` over `𝒪_{F_v}` (Kisin's construction of `R_v`). Raynaud's embedding of `𝒢`, dualised, gives
a Galois-stable lattice `L` in a crystalline representation with Hodge–Tate weights in `{0, 1}` and a
`G_{F_v}`-equivariant surjection `L ↠ A²` (FiniteFlatGroupsAndIntegralPadicHodgeTheory Layer R07.4,
supplier contracts): the quotient is `A²` itself, not its dual. Hence
`Sym^{n−1}_{ℤ_p} L ↠ Sym^{n−1}_{ℤ_p} A² ↠ Sym^{n−1}_A A² = A^n`, the second map being the change of
coefficient ring from `ℤ_p` to `A`, and `Sym^{n−1}_{ℤ_p} L` is a lattice in a crystalline representation
with weights in `[0, n − 1]` (ArithmeticGaloisRepresentations §7.1). The pseudodeformation ring `P` is
defined by exactly this torsion-semistable condition (PotentialAutomorphyInfrastructurePartII Layer
9; LocalGaloisDeformationRings §8.14), so its universal property gives `P → R`.

**Checks.**

- For `n = 1`, `Sym^0 r̃` is trivial and `P → R` classifies the constant trivial pseudocharacter.
- For `n = 2` the weights of `Sym^1` are `[0, 1]`: the Barsotti–Tate condition itself.
- The quotient must be `A²`, not its dual. For `1 ⊕ ε^{−1}` (Hodge–Tate weights `{0, 1}`, since `ε` has
  weight `−1`), `Sym²` has weights `{0, 1, 2} ⊂ [0, 2]`; the dual `1 ⊕ ε` has weights `{0, −1}` and its
  `Sym²` has weights `{0, −1, −2}`, outside `[0, 2]`. Taking symmetric powers of a quotient onto the dual
  would land in the wrong interval.
- For `n = 3` the weights of `Sym²` lie in `{0, 1, 2}`, an interval of length `2 ≤ p − 2` only for
  `p ≥ 5`; the torsion-semistable formalism is what allows `p ≤ n`.

*Needs:* §9.1; PotentialAutomorphyInfrastructurePartII Layer 9 ("Semistable conjugate self-dual
pseudodeformation rings"); FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.20
(gap:artinian-crystalline-quotients); LocalGaloisDeformationRings §8.14;
ArithmeticGaloisRepresentations §7.1.

### 9.3 Taylor–Wiles data for symmetric powers and the rings P_Q

Let `n ≥ 2` and `N ≥ 1`. Define a Taylor–Wiles datum of level `N` as `(Q, Q̃, (α_v, β_v)_{v ∈ Q})`
with `Q` a finite set of places of `F` split in `K` and not in `S`, `q_v ≡ 1` modulo `p^N`, a chosen
factorisation `v = ṽṽ^c`, and `α_v`, `β_v` the eigenvalues of `r̄(Frob_v)` such that
`α_v^{n−1}, α_v^{n−2}β_v, …, β_v^{n−1}` are pairwise distinct. With `Δ_Q = ∏_{v ∈ Q} k(v)^×(p)`, the
deformation ring `R_Q` is an `𝒪[Δ_Q]`-algebra with `R_Q ⊗_{𝒪[Δ_Q]} 𝒪 ≅ R`. Define `P_Q` as the
quotient of the pseudodeformation ring of `G_{K,S∪Q}` parametrising pseudodeformations whose
restriction to each `G_{K_ṽ}` is the determinant of characters `χ_{v,1} ⊕ ⋯ ⊕ χ_{v,n}` lifting the
unramified characters with Frobenius `α^{n−i}β^{i−1}` (unique by the uniqueness of decompositions of
residually multiplicity-free pseudocharacters), with `χ_{v,i}|_I = χ_{v,m}^{n+1−2i}|_I` for `n = 2m`
and `χ_{v,i}|_I = χ_{v,m}^{(n+1−2i)/2}|_I` for `n = 2m + 1`; this makes `P_Q` an `𝒪[Δ_Q]`-algebra with
a map `P_Q → R_Q`, `𝒪[Δ_Q]`-linear for even `n` (nt21b §2, Taylor–Wiles data and the rings `P_Q`,
pp. 8–9).

*Proof sketch.* The decomposition into characters uses uniqueness for residually multiplicity-free
pseudocharacters (IntegralHeckeAndGaloisDeterminants §1.4). The inertial relations are those
obtained by applying `Sym^{n−1}` to the rank-two local characters (GlobalGaloisDeformations §5.5).

**API.**

- A level-`N` datum `(Q, Q̃, (α_v, β_v))` with the distinctness condition.
- `Δ_Q = ∏_{v ∈ Q} k(v)^×(p)` and the `𝒪[Δ_Q]`-structures on `R_Q` and `P_Q`, with
  `R_Q ⊗_{𝒪[Δ_Q]} 𝒪 ≅ R` and `P_Q ⊗_{𝒪[Δ_Q]} 𝒪 ≅ P`.
- The map `P_Q → R_Q` induced by `Sym^{n−1}`: at each auxiliary place it sends the two ordered
  rank-two characters to the ordered monomials, and it is `𝒪[Δ_Q]`-linear for `n` even.

**Checks.**

- For `n = 3` the condition is that `α², αβ, β²` are distinct, i.e. `α ≠ ±β`.
- For `n = 2` the monomials are `α`, `β`, the inertial characters satisfy
  `χ_{v,1}|_I = χ_{v,2}^{−1}|_I`, and this is the rank-two Taylor–Wiles condition with fixed
  determinant.
- If `α_v/β_v` is a primitive cube root of unity and `n = 4`, then `α³ = β³`, distinctness fails, and
  `v` is not a Taylor–Wiles place for `n = 4`; for `n = 1` the formula for `χ_{v,m}` would involve
  `m = 0`, which is why `n ≥ 2`.

*Needs:* §9.2; GlobalGaloisDeformations §§5.5, 8.5; PotentialAutomorphyInfrastructurePartII Layer 4
("Taylor–Wiles data with a residual eigenspace"), Layer 9 ("Semistable conjugate self-dual
pseudodeformation rings"); IntegralHeckeAndGaloisDeterminants §1.4.

### 9.4 Definite unitary Hecke modules with twisted Taylor–Wiles level

Let `G` be the definite unitary group over `F` split by `K` (PotentialAutomorphyInfrastructurePartII
Layer 3), `H_G(V)` the `𝒪`-valued functions on `G(F) \ G(𝔸_F^∞)/V`, `V_0` Iwahori at `Σ`, `n ≥ 2`,
`N ≥ 1`, and assume `Sym^{n−1} r_{π′,ι}` automorphic (this supplies the non-zero localised unitary
module). A Taylor–Wiles datum gives `V_0(Q)` (Iwahori at `Q`) and `V_1(Q; N) ⊂ V_0(Q)`, cut out at
`v ∈ Q` by requiring `∏_i a_{ii}^{n+1−2i}` (`n` even) or `∏_i a_{ii}^{(n+1−2i)/2}` (`n` odd) to map
to `1` in `k(ṽ)^×(p)/(p^N)`, so `V_0(Q)/V_1(Q; N) ≅ Δ_Q/(p^N)`; with Hecke operators `T_w^{(i)}`,
`U_{ϖ_ṽ}^{(i)}`, maximal ideals `𝔪_G` (Hecke eigenvalues of `Sym^{n−1} r̄`) and `𝔪_{G,Q}`, and
twisting by characters `θ` of `U_1` through `det`. Prove: (Lemma 2.4) for `n` even and `p = 2`, each
quadratic `χ` of `F^× \ (𝔸_F^∞)^×/det U_1(Q; N)` has a unique `θ_χ` with `θ_χ(z/z^c) = χ(z z^c)`;
(Proposition 2.5) for a datum of level `N + c_G`, where `p^{c_G}` kills the `p`-primary parts of the
finitely many base-level stabilisers, `𝔪_G` and `𝔪_{G,Q}` are in the supports, `H_G(V_1(Q; N))_{𝔪_{G,Q}}`
is free over `𝒪[Δ_Q/(p^N)]` with coinvariants `H_G(V_0)_{𝔪_G}`, and it is a `P_Q`-module on which
the universal characteristic-polynomial coefficients at `Frob_w` act by `q_w^{i(i−1)/2} T_w^{(i)}`,
compatibly with the `Δ_Q`-actions (nt21b §2, unitary Hecke modules, pp. 10–11; Lemma 2.4, p. 11;
Proposition 2.5, p. 11).

*Proof sketch.* At level `N + c_G` the congruence conditions put the `p`-primary stabiliser images in
`V_1(Q; N)`, so the deck group `Δ_Q/(p^N)` acts freely on the localised double quotient; exactness and
freeness (PotentialAutomorphyInfrastructurePartII Layer 3) give a free module whose coinvariants are
`H_G(V_0)_{𝔪_G}` by the trace. Support of `𝔪_G`: Labesse's descent of `Sym^{n−1}` of the automorphic
`π′_K` to `G` (EndoscopicTransferAndUnitaryTraceComparison §6.29). The `P_Q`-module structure: the
Hecke-valued determinant restricted at `ṽ ∈ Q` decomposes into characters by uniqueness, matching
the definition of `P_Q`. Lemma 2.4: Hilbert 90 for `0 → 𝔾_m → Res_{K/F} 𝔾_m → U_1 → 0`.

For `p = 2`, where PotentialAutomorphyInfrastructurePartII Layer 3 is stated only for odd `l`, the
inputs are replaced as follows (supplier contracts). `H_G(V)` is the weight-`0` space of
OrdinaryAutomorphicFormsAndModularityLiftingPartII §2.1, the carrier of
AutomorphicFormsOnReductiveGroups §7.4 with trivial coefficients: `𝒪`-valued functions on a finite
set, so exactness is automatic, and freeness is the free action of the deck group above, the
stabilizers being finite (§7.5 there). The Hecke algebra generated by the `T_w^{(i)}` is finite free
over `𝒪` and reduced, because by the automorphic realization of §7.5 there it acts on each
constituent through the scalars of its spherical vectors; the determinants of the Galois
representations of the constituents (OrdinaryAutomorphicFormsAndModularityLiftingPartII §2.3) have
the Hecke polynomials as characteristic polynomials at the split Frobenius elements, which are dense
(Chebotarev Layer 10), so they glue to the Hecke-valued determinant over the localized Hecke algebra
(IntegralHeckeAndGaloisDeterminants §4.1); no `𝒢_n`-valued lift is needed. The comparison of the
levels `V_0(Q)` and `V_0` at `𝔪_{G,Q}` takes place at the places of `Q`, which are prime to `p`, and
uses the Iwahori invariants of SmoothRepresentationsOfLocalGroups SR.1.5, SR.2.3 and SR.3.4 with
local–global compatibility at `Q` (OrdinaryAutomorphicFormsAndModularityLiftingPartII §2.3); the
parity of `p` plays no role in it.

**API.**

- The level `V_1(Q; N)` with `V_0(Q)/V_1(Q; N) ≅ Δ_Q/(p^N)`.
- The maximal ideals `𝔪_G` and `𝔪_{G,Q}`.
- Freeness of `H_G(V_1(Q; N))_{𝔪_{G,Q}}` over `𝒪[Δ_Q/(p^N)]` with coinvariants `H_G(V_0)_{𝔪_G}`.
- The `P_Q`-module structure, with `Λ_i^{univ}(Frob_w)` acting as `q_w^{i(i−1)/2} T_w^{(i)}`.
- For `p = 2` and `n` even, the unique quadratic `θ_χ` with `θ_χ(z/z^c) = χ(z z^c)`.

**Checks.**

- For `n = 2` the exponents `n + 1 − 2i` are `1, −1`: `V_1` is the kernel of
  `a_{11}/a_{22} ↦ k(ṽ)^×(p)/(p^N)`.
- For `n = 3` the exponents `(n + 1 − 2i)/2` are `1, 0, −1`: the character `a_{11}/a_{33}`.
- If the congruence level is only `N` and a `p`-primary stabiliser has non-trivial image in the deck
  group, its action on the double quotient has a fixed orbit and freeness fails; the offset `c_G`
  removes this.
- At `N = 1`, tensoring with `𝒪` along the augmentation of `𝒪[Δ_Q/(p)]` gives `H_G(V_0)_{𝔪_G}` with its
  Hecke action.

*Needs:* §9.3; PotentialAutomorphyInfrastructurePartII Layer 3 ("Algebraic modular forms on a
definite unitary group"; "Exactness and group-ring freeness at level without `l`-torsion"; "Residual
and `𝒢_n`-valued Galois representations of Hecke maximal ideals"; "Base change and descent between
definite unitary groups and `GL_n`"), Layer 4 ("Taylor–Wiles level structures and the parahoric
projection"); for `p = 2`, AutomorphicFormsOnReductiveGroups §§7.4–7.5,
OrdinaryAutomorphicFormsAndModularityLiftingPartII §§2.1, 2.3, IntegralHeckeAndGaloisDeterminants
§4.1, SmoothRepresentationsOfLocalGroups SR.1.5, SR.2.3, SR.3.4 and Chebotarev Layer 10;
EndoscopicTransferAndUnitaryTraceComparison §6.29.

### 9.5 Patching for symmetric powers, p > 2

In the setting of §9.1 with `p > 2`, `n ≥ 2` and `Sym^{n−1} r_{π′,ι}` automorphic, let
`q = dim_k H¹(F_S/F, ad⁰ r̄(1))` and `g = q + |S ∪ S_∞| − 1`. Prove: (Lemma 2.7) for every `N` there is
a Taylor–Wiles datum of level `N` with a surjection `R^{loc}[[X_1, …, X_g]] → R^□_Q`; (Proposition
2.6) there are `W_∞ = 𝒪[[Y_1, …, Y_q, Z_1, …, Z_{4|S∪S_∞|−1}]]`, complete Noetherian local
`W_∞`-algebras `P_∞`, `R_∞` with `P_∞ ⊗ 𝒪 ≅ P` and `R_∞ ⊗ 𝒪 ≅ R`, a surjection
`R^{loc}[[X_1, …, X_g]] → R_∞`, a `P_∞`-module `H_{G,∞}` and an `R_∞`-module `H_{D,∞}`, both finite free
over `W_∞`, specialising to `H_G = H_G(V_0)_{𝔪_G}` and to `H_D` (quaternionic forms of level `U_0`
localised at `𝔪_D`), and a morphism `P_∞ → R_∞` compatible with `P → R` (nt21b Proposition 2.6,
p. 13; Lemma 2.7, p. 14; proof, pp. 14–17).

*Proof sketch.* Lemma 2.7: Chebotarev and the vanishing of `H¹(PSL_2(𝔽_{p^a}), ad⁰)` give
Taylor–Wiles primes with `Frob_v` regular for `Sym^{n−1}` (`(α/β)^i ≠ 1` for `i < n`), as in
GlobalGaloisDeformations §5.7 with the stronger distinctness condition (GlobalGaloisDeformations
Layer G7, supplier contracts). Patch the modules of §9.4 and the quaternionic modules
(GL2ModularityLifting Layers 2–3) simultaneously over the framed rings
(DeformationAndDerivedPatchingAlgebra §5.6), with a uniform bound on the generators of `P_N`.

**Checks.**

- `dim W_∞ = 1 + q + 4|S ∪ S_∞| − 1`, which equals `dim R^{loc}[[X_1, …, X_g]]` when the local rings
  have the expected dimensions.
- For `n = 2`, `P_∞ → R_∞` is the inclusion of the trace subring and the statement is the rank-two
  patching of GL2ModularityLifting Layer 3.
- For `p = 3`, `p^a > max(5, 2n − 1)` forces `a ≥ 2`: projective image `PSL_2(𝔽_3) ≅ A_4` is never in
  the setting.

*Needs:* §§9.3, 9.4; GL2ModularityLifting Layers 2–3; DeformationAndDerivedPatchingAlgebra §5.6;
GlobalGaloisDeformations §5.7 (gap:tensor-taylor-wiles-primes); Chebotarev Layer 10.

### 9.6 Patching for symmetric powers, p = 2

In the setting of §9.1 with `p = 2`, `n ≥ 2` and `Sym^{n−1} r_{π′,ι}` automorphic, let
`q = dim_k H¹(F_S/F, ad r̄) − 2`, `g = 2q + 1` and `γ = 2 − |S ∪ S_∞| + q`. Prove: (Lemma 2.9)
`q ≥ |S ∪ S_∞| − 2`, and for every `N` there is a Taylor–Wiles datum of level `N` with `|Q| = q`, a
surjection `R^{loc}[[X_1, …, X_g]] → R′^□_Q`, and `Θ_Q/(2^N) ≅ (ℤ/2^N)^γ` for `Θ_Q` the Galois group of
the maximal abelian pro-`2` extension of `F` unramified outside `Q` and `(S ∪ S_∞)`-split;
(Proposition 2.8) there are data as in §9.5 but with surjections
`R^{loc}[[X_1, …, X_g]] → R′_∞ → R_∞`, a free action of `Ĝ_m^γ` on `Sp R′_∞` with an equivariant
`δ : Sp R′_∞ → Ĝ_m^γ` (`Ĝ_m^γ` acting on itself by the square), `δ^{−1}(1) = Sp R_∞`, the action of
`Ĝ_m^γ[2](𝒪)` on `R_∞` lifting to `H_{D,∞}`, and an action of `Ĝ_m^γ[2]` on `Sp P_∞` making
`Sp R_∞ → Sp P_∞` equivariant and lifting to `H_{G,∞}` (nt21b Proposition 2.8, p. 17; Lemma 2.9, p. 18;
proof, pp. 18–19).

*Proof sketch.* Lemma 2.9: the dyadic Taylor–Wiles sets (GlobalGaloisDeformations §§5.3–5.4) with the
stronger distinctness condition (GlobalGaloisDeformations Layer G7, supplier contracts). Patch as in
GL2ModularityLifting §§6.1, 6.6, 6.7: import the compatible free action chunks detecting
Artinian stabilizers, their free patched action and determinant-fibre comparison. Retain the
quadratic twists from `Θ_Q`, the twisting characters of §9.4 on the unitary side, and their
compatible actions on the pseudodeformation ring and both modules through
DeformationAndDerivedPatchingAlgebra (gap:formal-torus-patching).

**Checks.**

- For `γ = 0` there is no twisting action and `R′_∞ = R_∞`.
- The free rank-two patched action, quotient and torsor are imported; the simultaneous
  actions on `P_∞` and both modules and component transitivity are the additional input. In rank one,
  squaring on `Ĝ_m` is `1 + x ↦ (1 + x)²`, that is `y = 2x + x²`: finite flat of degree `2` at `p = 2` and an
  invertible substitution at odd `p` (GlobalGaloisDeformations §4.11). This degree computation alone
  supplies neither the action on `H_{D,∞}`, `H_{G,∞}` nor the transitivity on components of `Spec R_∞`.
- `Sp R_∞ = δ^{−1}(1)` is a fibre of a map to the `γ`-dimensional `Ĝ_m^γ`, so
  `dim R_∞ ≥ dim R′_∞ − γ`, with equality because the action is free and `δ` is equivariant for the
  square map, which is finite flat.
- Square-equivariance alone does not imply freeness: on `ℤ₂[[y]]`, with `δ = 1 + y`
  and `1 + y ↦ λ²(1 + y)`, `λ = −1` fixes `y`; over `ℤ/4`, `−1 = 3 ≠ 1`, so
  the free-action-chunk premise fails. In contrast, translation on `1 + x` sends it to
  `−1 − x`, different modulo `4`, while `δ = (1 + x)²` is square-equivariant. Its
  determinant-one fibre is `ℤ₂[[x]]/(x² + 2x)`, finite flat of degree `2`.
- The quadratic `θ_χ` of §9.4 is what lets `Ĝ_m^γ[2]` act on `H_{G,∞}`; for odd `n` no such twisting
  is needed on the unitary side.

*Needs:* §§9.3, 9.4; GL2ModularityLifting §§6.1, 6.6, 6.7; GlobalGaloisDeformations §§4.6, 4.11, 5.3–5.4
(gap:tensor-taylor-wiles-primes); DeformationAndDerivedPatchingAlgebra §5.4
(gap:formal-torus-patching); ArithmeticGaloisDuality §R02.3.5.

### 9.7 Regularity of P at an automorphic point transfers automorphy

Let `p_∞`, `p′_∞` be the points of `Spec P_∞` defined by the pseudocharacters
`t = Sym^{n−1} r|_{G_K}` and `t′ = Sym^{n−1} r′|_{G_K}`, with `t′` automorphic. Prove: (`p > 2`)
`H_{G,∞}` and `H_{D,∞}` are Cohen–Macaulay with all components of their supports of dimension
`q + 4|S ∪ S_∞|`, so `R^{loc}[[X]] → R_∞` is an isomorphism, `R_∞` is a domain and `H_{D,∞}` is
faithful; since the localisation `P_{(p′)}` is its residue field `E`, `P_∞` is regular of dimension
`q + 4|S ∪ S_∞| − 1` at `p′_∞`, a unique component of `Spec P_∞` through `p′_∞` lies in
`Supp H_{G,∞}`, `Spec R_∞` maps into it, and `p ∈ Supp_P H_G`; (`p = 2`) the dimension argument gives
`R^{loc}[[X]] ≅ R′_∞`; `Spec R′_∞` and the invariant ring `R_∞^{inv}` are irreducible,
`Sp R_∞ → Sp R_∞^{inv}` is a `Ĝ_m^γ[2]`-torsor on represented complete-local functors whose
`𝒪`-points act transitively on components; a translate of the automorphic point on a component
containing the target point lies in the support by equivariance, regularity transfers to it, and the
unique-component argument puts `p_∞` in the support (nt21b proof of Theorem 2.1 for `p > 2`,
pp. 12–13; for `p = 2`, pp. 17–18). No assertion that `R_∞` is a domain is made for `p = 2`.

*Proof sketch.* Let `Π′_n` be the RACSDC representation of `GL_n(𝔸_K)` with
`r_{Π′_n,ι} ≅ Sym^{n−1} r′|_{G_K}` (the automorphy of `t′`). `P_{(p′)} = E` because the adjoint
Bloch–Kato Selmer group of `Π′_n` vanishes (ModularityAndLanglandsExtensions §4.1;
PotentialAutomorphyInfrastructurePartII §9.7); counting dimensions lifts this to regularity of
`P_∞` at `p′_∞`. The enormous-image hypothesis of that section, that `r_{Π′_n,ι}(G_{K(ζ_{p^∞})})` is
enormous, holds. Let `G` be the Zariski closure of `r′(G_F)` over `Ē`; `G⁰` is reductive because `r′`
is irreducible. If `G⁰` were a torus, then either it is scalar, which the distinct Hodge–Tate weights
`{0, 1}` exclude (Sen's theorem puts a non-scalar element in `Lie G`, PadicHodgeTheory §4.4), or `G`
permutes its two eigenlines, so that `r′` is reducible or induced from an index-two subgroup and
`Proj r̄_{π′,ι}(G_F)` has a soluble subgroup of index at most `2` (the image of a subgroup acting by
upper triangular matrices) and is soluble, which is impossible as it contains the non-soluble group
`PSL_2(𝔽_{p^a})`, `p^a > 5`. Hence `G` contains `SL_2`
(ArithmeticGaloisRepresentations §7.6). `K(ζ_{p^∞})/F` is abelian, being the compositum of `K` and the
cyclotomic tower, so `r′(G_{K(ζ_{p^∞})})` contains the commutator subgroup of `r′(G_F)` and its
Zariski closure contains the derived group of `G`, hence `SL_2` (§7.6 there: the closure of a
commutator subgroup is the derived group of the closure). The identity component of the Zariski
closure of `Sym^{n−1} r′(G_{K(ζ_{p^∞})})` therefore contains `Sym^{n−1}(SL_2)`, which acts absolutely
irreducibly in characteristic zero and contains `Sym^{n−1} diag(a, a^{−1})`, of eigenvalues
`a^{n−1−2j}` (`0 ≤ j ≤ n − 1`), distinct when `a` is not a root of unity. After enlarging `E` so that
the characteristic polynomial of every element of the image splits (possible because `E` has only
finitely many extensions of degree at most `n`), the criterion of ArithmeticGaloisRepresentations
§7.10 makes the image enormous. Cohen–Macaulay modules finite free over `W_∞` have full-dimensional support
components (DeformationAndDerivedPatchingAlgebra §§5.5, 6.1, 6.7). The dyadic case uses the torsor of
GlobalGaloisDeformations §4.11 and the component transitivity of the formal-torus contract.

**Checks.**

- If `P` were not regular at `p′_∞` (non-zero adjoint Selmer group), several components of
  `Spec P_∞` could pass through `p′_∞` and the argument would give nothing.
- For `n = 2`, `P_∞ ⊂ R_∞` and the statement is the rank-two `R = T` support argument.
- For `p > 2` the dimension `q + 4|S ∪ S_∞|` of the support components equals
  `dim W_∞ = 1 + q + 4|S ∪ S_∞| − 1`, as it must for a Cohen–Macaulay module finite free over `W_∞`.
- The regular witness depends on `n`: the eigenvalues `a^{n−1−2j}` of `Sym^{n−1} diag(a, a^{−1})` are
  distinct exactly when `a^{2m} ≠ 1` for `1 ≤ m ≤ n − 1`, which every `a` of infinite order satisfies.
  For `n = 2` this is `a² ≠ 1`, the first Check of ArithmeticGaloisRepresentations §7.10. For `n = 3`,
  `a = 2` gives eigenvalues `4, 1, 1/4`, distinct, while `a = −1` gives `1, 1, 1` and `a = i` gives
  `−1, 1, −1` (`i⁴ = 1`, `m = 2`).
- For a CM form, `r′ = Ind_{G_L}^{G_F} χ`, the hypothesis fails and the non-CM condition of §9.1
  excludes it: the Zariski closure of the image is the normaliser of a torus, and `Sym² r′` contains
  the line on which `G_L` acts by `χ χ^c`, so it is reducible (dimensions `2 + 1`) and its image is not
  enormous.

*Needs:* §§9.5, 9.6; §9.1; PotentialAutomorphyInfrastructurePartII Layer 9 ("The pseudodeformation ring is
its residue field at an automorphic point"); ModularityAndLanglandsExtensions §4.1;
ArithmeticGaloisRepresentations §§7.6, 7.10; PadicHodgeTheory §4.4; GlobalGaloisDeformations §4.11;
DeformationAndDerivedPatchingAlgebra §§5.5, 5.6, 6.1, 6.7 (gap:formal-torus-patching).

### Examples

- `F = ℚ`, `p = 7`, `n = 3`: two non-ordinary weight-two newforms with the same residual
  representation of projective image `PGL_2(𝔽_7)` and the same Steinberg primes are a pair in the
  setting of §9.1.
- `p = 2`, `n = 4`: `2^a > 7` needs `a ≥ 3`; the twisting characters of Lemma 2.4 enter since `n` is
  even.

### Dependencies

ModularityAndLanglandsExtensions §§0.2, 1.7; PotentialAutomorphyInfrastructurePartII Layers 0, 3,
4, 9; AutomorphicFormsOnReductiveGroups §§7.4–7.5; OrdinaryAutomorphicFormsAndModularityLiftingPartII
§§2.1, 2.3; SmoothRepresentationsOfLocalGroups SR.1.5, SR.2.3, SR.3.4;
PotentialAutomorphyInfrastructure §2.5;
PotentialModularityAndCompatibleSystems §2.16; GlobalGaloisDeformations §§4.6, 4.11, 5.3–5.5, 5.7, 8.5; FiniteFlatGroupsAndIntegralPadicHodgeTheory
Layer R07.4; LocalGaloisDeformationRings §8.14; IntegralHeckeAndGaloisDeterminants §§1.4, 4.1;
GL2ModularityLifting Layers 2, 3, 6; DeformationAndDerivedPatchingAlgebra §§5.4, 5.5, 5.6, 6.1, 6.7;
EndoscopicTransferAndUnitaryTraceComparison §§6.24, 6.29; ArithmeticGaloisRepresentations §§7.1,
7.6, 7.10; PadicHodgeTheory §4.4; ArithmeticGaloisDuality §R02.3.5; Chebotarev Layer 10.

## Layer 11: the untwisted tensor product `r_π ⊗ Sym^{r−1} r_σ`

This layer proves automorphy of `r_π ⊗ Sym^{r−1} r_σ` for a weight-zero `π` and a congruent ordinary
companion `σ` of weights `{0, 2}`, assuming `SP_{r−1}` and `SP_{r+1}` (nt26 Theorem 3.2, pp. 12–25).
The tensor is residually reducible (its residual representation is that of an isobaric sum of rank
`r + 1` and `r − 1`); the proof compares deformation problems whose local conditions above an
auxiliary place `v_0` have congruent reduced special fibres, uses Thorne's level raising (§6.9) for a
Steinberg seed, and propagates automorphy over all components by generic primes. Fixed types include
monodromy throughout.

### 11.1 Standing hypotheses and auxiliary data

Let `F` be totally real, `p ≥ 5`, `1 < r < p`, `n = 2r`, `ι : ℚ̄_p ≅ ℂ`. Define the standing
hypotheses on a regular algebraic cuspidal `π` of `GL_2(𝔸_F)`: (1) `det r_{π,ι} = ε^{−1}`; (2) weight
`0` and `π_v` an unramified twist of Steinberg at each `v | p`; (3) a place `v_0` with
`q_{v_0} ≡ −1` modulo `p` where `π_{v_0}` is tamely dihedral of order `p`
(GL2AutomorphicRepresentationsAndTransfer §R16.3.7); (4) `r̄_{π,ι}(G_F)` containing a conjugate of
`SL_2(𝔽_{p^a})` with `a > a₀(p)`; (5) `π_v` potentially unramified at every `v ∤ p`. Define the
auxiliary data: a place `v_a ∤ p` where `π` is unramified and the eigenvalue ratio of `r̄(Frob_{v_a})`
satisfies `(α/β)^i ≢ q_{v_a}^{±1}` modulo `p` for `i = 0, …, r`, so that
`H²(F_{v_a}, ad(r̄ ⊗ Sym^{r−1} r̄)^{ss}) = 0` (Lemma 3.3); `M` the extension of `F(ζ_p)` cut out by `r̄`;
a finite set `X_0 ∋ v_a` of prime-to-`p` places such that every Galois subextension `M/M′/F` of degree
`> 1` has a non-split place in `X_0` (so `X_0`-split extensions are linearly disjoint from `M`); an
imaginary quadratic `K_0` in which `p` and the residue characteristics of `X_0 ∪ {v_0}` split, with a
place `u_0 | p`; and soluble totally real `F_2/F_1/F` as in Lemma 3.4: `X_0`-split, `K_1 = K_0F_1`
unramified over `F_1`, `[F_1 : F]` even, trivial residual representation and
`[F_{1,v} : ℚ_p] > n(n + 1)/2 + 1` at every `v | p`, the base change of `π` unramified away from
`p v_0` over `F_1`, `v_0` split in `F_1/F`; over `F_2`, the base change of `π` unramified at every
place above `v_0`, and at those places `q ≡ 1` modulo `p^N` for an `N` with `p^N > n` and trivial
residual representation, the `p`-adic places of `F_1` split in `F_2`, `d_{0,F_2} > 1`; and
everywhere unramified characters `X`, `Y` of `K_1` of type `A_0` whose `p`-adic characters
`x = r_{X,ι}`, `y = r_{Y,ι}` satisfy `x x^c = ε`, `y y^c = ω_p` (`ω_p` the Teichmüller lift of `ε`
modulo `p`), `x̄ = ȳ` and have Hodge–Tate weight `0` at `u_0` (nt26 §3, standing
hypotheses, pp. 12–13; Lemma 3.3, p. 15; auxiliary data, p. 16; Lemma 3.4, p. 16). The printed
Lemma 3.4 names the characters as characters "of `K_1`" in one clause and an undefined field `K` in
another; `K_1` is meant. For `r = 1` the theorem of §11.10 is trivial and none of this is needed.
The character `Y` is `Y′ ∘ N_{K_1/K_0}` for a character `Y′` of `K_0` of type `A_0` unramified above
the residue characteristics of `X_0 ∪ {v_0}` (nt26 proof of Lemma 3.4, pp. 16–17), so
`ȳ|_{G_{K_1}} = ȳ′|_{G_{K_1}}`. Require in addition: `ȳ` is trivial on `G_{K_{1,ṽ}}` for every place
`ṽ | p` of `K_1` (each `F_{1,v}`, `v | p`, contains the abelian extensions of `K_{0,u} = ℚ_p` cut out
by `ȳ′|_{G_{K_{0,u}}}` at both places `u | p` of `K_0`; this is compatible with `X_0`-splitness because
`X_0` is prime to `p`), and `ȳ` is trivial on `G_{K_{2,ṽ}}` for every place `ṽ` of `K_2` above `v_0`
(`ȳ′` is unramified at the two places `λ` of `K_0` above the residue characteristic `ℓ_0` of `v_0`,
the completion `K_{2,ṽ} = F_{2,w}` (`w` the place of `F_2` below `ṽ`, split in `K_2` because `ℓ_0`
splits in `K_0`) contains `K_{0,λ} = ℚ_{ℓ_0}`, and the absolute residue degrees of `F_2` at
the places above `v_0` are taken divisible by the orders of both values `ȳ′(Frob_λ)`). nt26
Lemma 3.4(2)–(3) asks for the triviality of `r̄_{π,ι}` only, and the proof of its Proposition 3.9 (p. 21) notes that `s̄` of §11.3 is then scalar above `p`; the
triviality of `ȳ` is added here because the ordinary and Steinberg local conditions of §11.4 and the
finiteness theorem used in §11.6 (PotentialAutomorphyInfrastructurePartII §3.10 and §8.7, hypotheses
(1) and (3)) are stated for a trivial residual local representation. The `p`-adic places of `F_1` split
in `F_2`, so the property above `p` persists over `F_2` and over the field `F_3 ⊇ F_2` of §11.8, and the
property above `v_0` persists over `F_3` by restriction.

*Proof sketch.* Lemma 3.3 by Chebotarev in the image of `r̄`, which contains `SL_2(𝔽_{p^a})`. Lemma 3.4
by successive soluble base changes with prescribed completions (PotentialModularityAndCompatibleSystems
§2.16, with complete splitting at `X_0` as the trivial prescribed completion) and cyclic steps of
prescribed degree (PotentialAutomorphyInfrastructure §2.5), with the characters from
PotentialAutomorphyInfrastructurePartII Layer 0 and ModularityAndLanglandsExtensions §2.13, and the
lower bound on the antiunit class-field rank `d_0` (ArithmeticGaloisDuality §R02.3.5) for
`d_{0,F_2} > 1`. The triviality of `ȳ` above `p` and `v_0` is one more prescribed completion at each
of these finitely many places.

**API.**

- The data `(F, p, r, ι, π)` with conditions (1)–(5).
- The place `v_a` with `H²(F_{v_a}, ad(r̄ ⊗ Sym^{r−1} r̄)^{ss}) = 0`.
- The set `X_0` and the notion of an `X_0`-split extension, linearly disjoint from `M`.
- The fields `K_0`, `F_1`, `F_2`, `K_1 = K_0F_1`, `K_2 = K_0F_2` and the characters `X`, `Y`, with
  the properties of Lemma 3.4; in particular, at every place of `F_2` above `v_0` the base change of
  `π` is unramified, `r̄` is trivial and the exact power of `p` dividing `q − 1` exceeds `n`.
- `ȳ` is trivial on `G_{K_{1,ṽ}}` for `ṽ | p` and on `G_{K_{2,ṽ}}` for `ṽ` above `v_0`; with the
  triviality of `r̄_{π,ι}` there, the residual representation `s̄` of §11.3 is trivial, not only
  scalar, at these places.

**Checks.**

- For `r = 1`, `r_π ⊗ Sym^0 r_σ = r_π` is automorphic.
- `q_{v_0} ≡ −1` modulo `p` makes `p | q_{v_0} + 1`, so the tamely dihedral type of order `p` exists at
  `v_0`; e.g. `q_{v_0} = 19` for `p = 5`.
- A place with `α/β ≡ q_v^{±1}` modulo `p` is not allowed as `v_a`: then `H²` of the adjoint can be
  non-zero and ramified deformations exist there. For `p = 5`, `r ∈ {2, 3, 4}` and `a > a₀(5) ≥ 3`
  gives `a ≥ 4`.
- The unramifiedness of the base change above `v_0` is a separate condition on `F_2`: the tamely
  dihedral type reduces to an unramified induced representation with Frobenius ratio `−1`, so an
  unramified extension of `F_{v_0}` of suitable even degree makes `q ≡ 1` modulo `p^N` and `r̄`
  trivial; but its inertia group is that of `F_{v_0}`, on which the parameter of `π_{v_0}` is the sum
  of two characters of order `p`, so the base change stays ramified. Only an extension whose
  ramification index is divisible by `p` (prime to the residue characteristic, since
  `q_{v_0} ≡ −1` modulo `p`) makes it unramified.
- The triviality of `r̄_{π,ι}` above `p` does not make `s̄` trivial there. With `r̄_{π,ι}` trivial on
  `G_{K_{1,ṽ}}`, `ṽ | p`, and `ȳ` unramified there with `ȳ(Frob_ṽ) = c`, the twist `ȳ^{1−r}` gives
  `s̄|_{G_{K_{1,ṽ}}} = c^{1−r}·1_{2r}`; for `r = 2` and `c ≠ 1` this is `c^{−1}·1_4`, scalar and
  non-trivial, and neither the ordinary condition `R^Δ_v` nor hypothesis (1) of
  PotentialAutomorphyInfrastructurePartII §8.7 applies to it. With `c = 1`, which the choice of `F_1`
  ensures, `s̄|_{G_{K_{1,ṽ}}} = 1_4`.

*Needs:* GL2AutomorphicRepresentationsAndTransfer §R16.3.7; ArithmeticGaloisRepresentations §7.9;
PotentialAutomorphyInfrastructure §2.5 ("Auxiliary soluble and cyclic extensions");
PotentialModularityAndCompatibleSystems §2.16 (soluble prescribed-completion extensions);
PotentialAutomorphyInfrastructurePartII Layer 0 ("Algebraic characters with prescribed conjugate
norm and local behaviour"); ArithmeticGaloisDuality §R02.3.5; ModularityAndLanglandsExtensions
§2.13; Chebotarev Layer 10.

### 11.2 A congruent ordinary companion of weights {0, 2}

Under §11.1, let `σ` be the companion of PotentialModularityAndCompatibleSystems §9.2 (nt26 Lemma 3.1,
pp. 13–14): a RAESDC representation of `GL_2(𝔸_F)` which is ι-ordinary, has `HT_τ(r_{σ,ι}) = {0, 2}`
for every `τ`, determinant `ε^{−2} ω_p` (`ω_p` the Teichmüller lift of `ε` modulo `p`), residual
representation `r̄_{σ,ι} ≅ r̄_{π,ι}`, an unramified Steinberg twist at `v_0`, and
`r_{σ,ι}|_{G_{F_v}} ∼ r_{π,ι}|_{G_{F_v}}` at every finite `v ∤ p v_0`, all for the same `σ`. Prove the
determinant-corrected form of the last property: at every finite `v ∤ p v_0`,
`r_{σ,ι}|_{G_{F_v}} ∼ r_{π,ι}|_{G_{F_v}} ⊗ χ_v`, where `χ_v` is the unramified character with
`χ_v ≡ 1` modulo `ϖ` and `χ_v² = ε^{−1} ω_p`, so that both sides have determinant `ε^{−2}ω_p`. The
printed proof uses the local representation of `π` itself as a point of a ring with the new
determinant; the determinants `ε^{−1}` and `ε^{−2}ω_p` differ, and the correcting twist `χ_v` (which
exists since `p` is odd and the ratio is residually trivial and unramified) is used here.

*Proof sketch.* `π_v` is generic, so `r_{π,ι}|_{G_{F_v}}` lies on a unique component of the
unrestricted lifting ring and strongly connects to every lift it connects to
(PotentialAutomorphyInfrastructurePartII §1.3(1)); it connects to its twist by the unramified,
residually trivial `χ_v` (§1.2(4) there); and `r_{σ,ι}|_{G_{F_v}} ∼ r_{π,ι}|_{G_{F_v}}` together with
`r_{π,ι}|_{G_{F_v}} ⇝ r_{π,ι}|_{G_{F_v}} ⊗ χ_v` gives the claim (§1.2(1) there). The existence of `σ`
is PotentialModularityAndCompatibleSystems §9.2; its Khare–Wintenberger route, which §11.6 reruns
over `F_2` with one more prescribed component, is as follows. Local lifts at `p`: Hida families of
Hilbert modular forms (OrdinaryAutomorphicFormsAndModularityLifting §2.11) specialise `π` to weights
`{0, 2}` with determinant `ε^{−2}ω_p`. Global lifts with prescribed components
(PotentialAutomorphyInfrastructurePartII Layer 8, "Global lifts with prescribed local components
(Schur form)"): at `v ∤ p v_0` the component through `r_{π,ι}|_{G_{F_v}} ⊗ χ_v`, at `v | p`
the ordinary potentially crystalline component through the local lift, at `v_0` a unipotent
component with generically non-zero monodromy, which exists because the tamely dihedral type of
order `p` reduces to an unramified induced representation with Frobenius ratio `−1 ≡ q_{v_0}` modulo
`p`. The Khare–Wintenberger method: finiteness over `𝒪` (Layer 5) gives a characteristic-zero point,
and ordinary automorphy lifting after soluble base change (Layer 5) makes it `r_{σ,ι}`. The image
hypothesis of these two theorems holds: `r̄_{π,ι}(G_{F(ζ_p)})` contains the commutator subgroup of
`r̄_{π,ι}(G_F)`, hence the perfect group `SL_2(𝔽_{p^a})` of (4), so it is adequate
(ArithmeticGaloisRepresentations §7.9, rank two, `p^a ≥ 6`) and hence relaxed-adequate
(PotentialAutomorphyInfrastructurePartII §5.4); the soluble base changes are taken linearly disjoint
from the field cut out by `r̄_{π,ι}` over `F(ζ_p)`, so they keep this image, and `ζ_p ∉ F` as `F` is
totally real and `p ≥ 5`.

**API.**

- The companion `σ` with the properties above.
- `HT_τ(r_{σ,ι}) = {0, 2}`; `r̄_{σ,ι} ≅ r̄_{π,ι}`; `det r_{σ,ι} = ε^{−2} ω_p`.
- `σ_{v_0}` is an unramified twist of Steinberg.
- At `v ∤ p v_0`, `r_{σ,ι}|_{G_{F_v}}` is strongly connected to the determinant-corrected local lift
  of `π`; in particular their inertial Weil–Deligne data and monodromy agree, so `σ` is unramified
  wherever `π` is (away from `p v_0`).

**Checks.**

- For `r = 2`, `HT(r_π ⊗ r_σ) = {0, 1} + {0, 2} = {0, 1, 2, 3}`, distinct.
- The reduction of `ε^{−2}ω_p` is `ε̄^{−2} ε̄ = ε̄^{−1} = det r̄_{π,ι}`, as the residual isomorphism
  requires.
- Taking `σ = π` (weights `{0, 1}`) makes `r_π ⊗ Sym^{r−1} r_π` irregular for `r ≥ 2`: for `r = 2`,
  `{0, 1} + {0, 1}` repeats `1`.

*Needs:* §11.1; PotentialModularityAndCompatibleSystems §9.2; PotentialAutomorphyInfrastructurePartII
Layer 1 ("Properties of strong connection; Choi's lemma and the filtration lemma"; "Generic local
representations are smooth points, and smooth points are dense").

### 11.3 The polarized representation s and its residual decomposition

With `σ` from §11.2, define over `K_1`
`π_1 = BC(Sym^r σ) ⊗ X Y^{−r} |·|^{(r−1)/2}`, `π_2 = BC(Sym^{r−2} σ) ⊗ X^{−1} Y^{2−r} |·|^{(r−1)/2}` and
`s = (r_{π,ι} ⊗ Sym^{r−1} r_{σ,ι})|_{G_{K_1}} ⊗ y^{1−r}`, assuming `SP_{r−1}` and `SP_{r+1}` (to define
`π_2` and `π_1`). Prove (Lemma 3.5) that `s^c ≅ s^∨ ⊗ ε^{1−2r}`; that `π_1`, `π_2` are cuspidal
conjugate self-dual; that `π_1 ⊞ π_2` is regular algebraic and ι-ordinary; that
`r̄_{π_1 ⊞ π_2,ι} ≅ s̄`; that after conjugation `s` takes values in `GL_n(𝒪)` and extends to
`s : G_{F_1} → 𝒢_n(𝒪)` with multiplier `ε^{1−n} δ^n_{K_1/F_1}`; and that, with `S_{p,F_1}` the
`p`-adic places, `T_{F_1}` (resp. `T′_{F_1}`) the places above `v_0` (resp. `v_a`),
`S_{F_1} = S_{p,F_1} ∪ T_{F_1}` and `S̃_{F_1}` a choice of places of `K_1` above them, `s` is a lift of
`s̄` of type `𝒮_{F_1}` (§11.4): ordinary at `p`, of inertial type `τ_s` at `T_{F_1}`, unramified
outside `S_{F_1}` (nt26 Lemma 3.5, p. 17; the polarized `s` and the sets of §3, p. 17; final step of
the proof of Theorem 3.2, p. 25). Unramifiedness outside `S_{F_1}` uses that `σ` is unramified away
from `p v_0` (§11.2), which the printed proof uses after arranging it only for `π`.

*Proof sketch.* Conjugate self-duality from `det r_π = ε^{−1}`, `det r_σ = ε^{−2} ω_p` and
`y y^c = ω_p`: `s^c ≅ s^∨ ⊗ ε^{1−2r} ω_p^{r−1} (y y^c)^{1−r} = s^∨ ⊗ ε^{1−2r}`. The residual
decomposition is the mod-`p` Clebsch–Gordan formula
`r̄ ⊗ Sym^{r−1} r̄ ≅ Sym^r r̄ ⊕ (det r̄ ⊗ Sym^{r−2} r̄)` for `r < p` (ArithmeticGaloisRepresentations
§7.8) after twisting. Cuspidality of `π_1`, `π_2` from large image of `Sym^r r̄` and `Sym^{r−2} r̄`;
regularity from the weights `{0, 2}`; ordinarity from that of `σ` (PotentialAutomorphyInfrastructurePartII
Layer 0, "Ordinarity of a regular algebraic isobaric sum"). The multiplier of tensor products is
computed from the multipliers of the factors (GlobalGaloisDeformations §8.1).

**API.**

- `s = (r_π ⊗ Sym^{r−1} r_σ)|_{G_{K_1}} ⊗ y^{1−r}` with its `𝒢_n`-extension of multiplier
  `ε^{1−n} δ^n`.
- `s^c ≅ s^∨ ⊗ ε^{1−2r}`.
- `s̄ ≅ r̄_{π_1 ⊞ π_2,ι}`, a sum of constituents of dimensions `r + 1` and `r − 1`.
- `s` is a lift of `s̄` of type `𝒮_{F_1}`.

**Checks.**

- `dim s = 2r = (r + 1) + (r − 1)`; for `r = 2` the constituents have dimensions `3` and `1`
  (`Sym² r̄` and `det r̄`, twisted).
- `s̄` is reducible although `s` is irreducible: the residual decomposition is what the residually
  reducible theory of PotentialAutomorphyInfrastructurePartII Layers 2, 7 and 8 uses.
- For `r = 1` there is no `π_2` (rank `0`), which is why `r > 1` here.

*Needs:* §§11.1, 11.2; ArithmeticGaloisRepresentations §7.8; ModularityAndLanglandsExtensions §1.12;
GlobalGaloisDeformations §8.1; PotentialAutomorphyInfrastructurePartII Layer 0 ("Ordinarity of a
regular algebraic isobaric sum").

### 11.4 The deformation problems `𝒮_{F₁}`, `𝒮′_{F₁}`, `𝒮′_{F₂}`, `𝒮_{F₃}`

For `F′ ∈ {F_1, F_2, F_3}` (`F_3` from §11.8) with `K′ = K_0 F′`, define the polarized deformation
problem `𝒮 = (K′/F′, S_{F′}, S̃_{F′}, Λ_{F′}, s̄|_{G_{F′}}, ε^{1−n} δ^n_{K′/F′}, {R^Δ_v}_{v ∈ S_{p,F′}} ∪ {R^?_v}_{v ∈ T_{F′}})` with `S_{F′} = S_{p,F′} ∪ T_{F′}` (the places above `v_a`
are not in `S`), `Λ_{F′} = ⊗̂_{v ∈ S_{p,F′}} 𝒪[[I^{ab}_{K′_ṽ}(p)^n]]` of dimension `n[F′ : ℚ] + 1`,
`R^Δ_v` the ordinary condition at `p`, and at `T_{F′}`: the fixed Weil–Deligne type `τ_s` of `s`,
including its monodromy partition (`𝒮_{F_1}`), the type of the special representation `Sp_n`,
including its regular nilpotent monodromy (`𝒮′_{F_1}`), the Steinberg ring `R^{St}_v` (`𝒮′_{F_2}`), or
the unipotently ramified ring `R^1_v` (`𝒮_{F_3}`). The ordinary, Steinberg and unipotent rings are
those of a trivial residual local representation, which `s̄` is at `S_{p,F′}` for every `F′` and at
`T_{F′}` for `F′ ∈ {F_2, F_3}`, where these rings are used (§11.1); the fixed-type rings at `T_{F_1}`
ask for no such condition.
Prove (Lemma 3.7) that for `X_0`-split totally real
`F′ ⊇ F_1`: `K′ ⊄ F′(ζ_p)`; `s̄|_{G_{K′}} ≅ ρ̄_1 ⊕ ρ̄_2` with `ρ̄_i^c ≅ ρ̄_i^∨ ε^{1−n}`, of dimensions
`r + 1` and `r − 1`, non-isomorphic over `K′(ζ_p)`; `s̄|_{G_{K′}}` is primitive; and `s̄(G_{K′})` has
no quotient of order `p` (nt26 §3 after Lemma 3.7, deformation problems, pp. 19–20; Lemma 3.7,
p. 19). The printed proof of Lemma 3.7 asserts an equality of images that includes the twist `ȳ`;
`X_0` controls only the image of `r̄_π`, and that equality is what is used, for `F′ ⊇ F_1` (where `s̄`
is defined).

*Proof sketch.* Polarized deformation problems with `Λ`-structure (GlobalGaloisDeformations §8.1;
PotentialAutomorphyInfrastructurePartII Layer 3, "Ordinary deformation data and their Hecke
comparison"); local rings from LocalGaloisDeformationRings §§2.18, 2.24, 2.26. Lemma 3.7 from
`X_0`-splitness (linear disjointness from `M`), large image and `r + 1 ≠ r − 1`.

**API.**

- The four problems `𝒮_{F_1}` (type `τ_s` at `T_{F_1}`), `𝒮′_{F_1}` (special type), `𝒮′_{F_2}`
  (Steinberg rings at `T_{F_2}`), `𝒮_{F_3}` (unipotently ramified rings at `T_{F_3}`).
- Restriction maps `R_{𝒮_{F_3}} → R_{𝒮′_{F_2}}` and `R_{𝒮_{F_3}} → R_{𝒮_{F_1}}` of
  `Λ_{F_3}`-algebras.
- Maps from each universal ring classify lifts of the fixed polarized residual extension over the
  named field with ordinary characters and the precise local quotient, monodromy included; pullback
  along a restriction map agrees with Galois restriction.

**Checks.**

- `dim Λ_{F′} = n[F′ : ℚ] + 1`; for `n = 4`, `[F′ : ℚ] = 2` this is `9`.
- The places above `v_a` are not in `S_{F′}`: lifts are unramified there automatically by Lemma 3.3,
  so no local condition is imposed.
- For `r = 3`, `s̄|_{G_{K′}} = ρ̄_1 ⊕ ρ̄_2` with `dim ρ̄_1 = 4` and `dim ρ̄_2 = 2`.

*Needs:* §11.3; GlobalGaloisDeformations §8.1; PotentialAutomorphyInfrastructurePartII Layer 3
("Ordinary deformation data and their Hecke comparison"), Layer 7 ("Weakly and strongly primitive
representations"); LocalGaloisDeformationRings §§2.18, 2.24, 2.26.

### 11.5 Two inertial types with the same reduced special fibre, and the comparison of deformation rings

For `v ∈ T_{F_1}`, let `R^□_v` be the unrestricted lifting ring of `s̄|_{G_{K_{1,ṽ}}}`, `R_v` its
quotient for the inertial type `τ_s` of `s` and `R′_v` its quotient for the type of `Sp_n`. Prove
(Lemma 3.6) that `R_v` and `R′_v` are non-zero and `(R_v/(ϖ))^{red} ≅ (R′_v/(ϖ))^{red}` as
`R^□_v`-algebras, and (Lemma 3.8) that consequently
`(R_{𝒮_{F_1}}/(ϖ))_{red} ≅ (R_{𝒮′_{F_1}}/(ϖ))_{red}` and restriction gives a finite morphism
`R_{𝒮′_{F_2}} → R_{𝒮′_{F_1}}` (nt26 Lemma 3.6, p. 18; Lemma 3.8, p. 20).

*Proof sketch.* Under Jacquet–Langlands for the division algebra the two types correspond to
characters of order `p` and order `1`, which have the same reduction modulo `p`; Breuil–Mézard cycles
for division algebras away from `p` (LocalGaloisDeformationRings §2.27) are then equal for these
types (not for arbitrary congruent inertial restrictions). Both rings are `𝒪`-flat, reduced and
equidimensional of dimension `1 + n²` with special fibres pure of dimension `n²`
(LocalGaloisDeformationRings §§2.13, 2.24), so equal cycles give the same generic points and equal
reduced special fibres in the common unrestricted special fibre; non-emptiness from the exhibited
characteristic-zero types. Present the global problems with the same auxiliary global relations over
the local rings to transfer the equality; finiteness of restriction is PotentialAutomorphyInfrastructurePartII
Layer 7 ("Restriction of pseudodeformations to a finite-index subgroup is finite").

**Checks.**

- Equality of mod-`p` inertial restrictions alone is insufficient: the cycle equality and purity of
  dimension `n²` are what give equality of reduced special fibres.
- Both `R_v` and `R′_v` have dimension `1 + n²`; for `r = 2` (`n = 4`) their reduced special fibres
  are pure of dimension `16`.
- The characteristic-zero fibres differ: `R_v[1/p]` and `R′_v[1/p]` have no common points, since
  their inertial types differ.

*Needs:* §11.4; LocalGaloisDeformationRings §§2.13, 2.24, 2.27; PotentialAutomorphyInfrastructurePartII
Layer 7 ("Restriction of pseudodeformations to a finite-index subgroup is finite").

### 11.6 Finiteness of `R_{𝒮′_{F₂}}` and a Steinberg automorphic lift

Assume `SP_{r−1}` and `SP_{r+1}` (ModularityAndLanglandsExtensions §1.12). Prove that `R_{𝒮′_{F_2}}` is
finite over `Λ_{F_2}`, and that there is an ι-ordinary RACSDC `Π` of `GL_n(𝔸_{K_2})`, unramified outside
`S_{F_2}`, with `r̄_{Π,ι} ≅ s̄|_{G_{K_2}}` and `Π_ṽ` an unramified twist of Steinberg for each
`v ∈ T_{F_2}` (nt26 Proposition 3.9 and proof, pp. 20–21). Primitivity is geometric weak primitivity
with the common splitting field. Finiteness is PotentialAutomorphyInfrastructurePartII §8.16 as
stated, applied twice, with auxiliary place above `v_a` (non-scalar Frobenius is allowed there). Its
added hypothesis, that `s̄(G_{K_2(ζ_p)})` has no non-trivial quotient of `p`-power order, holds. As
`F_2` is `X_0`-split, `r̄_{π,ι}(G_{F_2}) = r̄_{π,ι}(G_F)`; after conjugation this group lies between
`SL_2(𝔽_{p^b})` and `k^× GL_2(𝔽_{p^b})` for some `b ≥ a` and a finite field `k ⊇ 𝔽_{p^b}`, which
we take to contain the values of `ȳ` (ArithmeticGaloisRepresentations §4.4, as in the last Check of
§13.8). The group
`A = r̄_{π,ι}(G_{K_2(ζ_p)})` has index at most `2` in a normal subgroup of `r̄_{π,ι}(G_F)` with abelian
quotient, so it contains the perfect group `SL_2(𝔽_{p^b})`, and `[A, A] = SL_2(𝔽_{p^b})`. The image
`H` of `(r̄_{π,ι}, ȳ)` on `G_{K_2(ζ_p)}` has `[H, H] = [A, A] × 1`, perfect, and `H/[H, H]` embeds in
`A/SL_2(𝔽_{p^b}) × k^×`, of order dividing `(|k| − 1)²`, prime to `p`. A quotient of `H` of `p`-power
order has trivial abelianization, hence is trivial, and `s̄(G_{K_2(ζ_p)})` is a quotient of `H`.

*Proof sketch.* Choose by Chebotarev a place `v_2 ∉ S_{F_2} ∪ X_0` of `F_2`, split in `K_0`, whose
residue characteristic differs from those of `X_0 ∪ {v_0}`, with `q_{v_2} ≡ 1` modulo `p` and
`r̄_{π,ι}|_{G_{F_{2,v_2}}}`, `s̄|_{G_{K_{2,ṽ_2}}}` trivial. (1) Run the Khare–Wintenberger argument
recalled in §11.2 (PotentialModularityAndCompatibleSystems §9.2) over `F_2`, prescribing in addition
the unramified Steinberg component at `v_2` (non-empty, as `r̄` is trivial and `q_{v_2} ≡ 1` modulo
`p` there), to obtain an ι-ordinary RAESDC `σ_2` of `GL_2(𝔸_{F_2})` with `HT_τ = {0, 2}`,
determinant `ε^{−2}ω_p`, `r̄_{σ_2,ι} ≅ r̄_{σ,ι}|_{G_{F_2}}` and an unramified Steinberg twist at `v_2`; it is non-CM, being Steinberg at `v_2`. `SP_{r+1}`, `SP_{r−1}`,
base change to `K_2` and the twists of §11.3 give ι-ordinary conjugate self-dual cuspidal `π′_1`,
`π′_2` lifting the two constituents of `s̄|_{G_{K_2}}`, Steinberg at `ṽ_2`. (2) §6.9, applied to
`π′_1 ⊞ π′_2` at `v_2` (genericity place from Lemma 3.3; the other places of the residue
characteristic of `v_2` are unramified), gives an ι-ordinary RACSDC `Π_2` with
`r̄_{Π_2,ι} ≅ s̄|_{G_{K_2}}`, Steinberg at `ṽ_2`. (3) With `Π_2` as automorphic input, §8.16 with
Steinberg place `v_2` makes finite over `Λ_{F_2}` its ring, unrestricted at `T_{F_2}`, and hence its
quotient with Steinberg conditions at `T_{F_2} ∪ {v_2}`. The crystalline ordinary weight-`0` quotient of
the latter is non-zero (at `v | p`, `s̄` is trivial (§11.1) and `ζ_p ∈ F_{2,v}`, so
`⊕_{i=0}^{n−1} ε^{−i}`, which reduces to `1_n`, is an ordinary lift), finite over `𝒪` and of Krull dimension at least one
(PotentialAutomorphyInfrastructurePartII Layer 8, "Global lifts with prescribed local components
(Schur form)"), so it has a characteristic-zero point. The auxiliary-place lifting theorem
(gap:auxiliary-place-reducible-lifting, with `Π_2` as input) makes this point `r_{Π′_2,ι}` for an
ι-ordinary RACSDC `Π′_2`, unramified outside `S_{F_2} ∪ {v_2}` and Steinberg at `T_{F_2} ∪ {v_2}`.
(4) With `Π′_2` as input, §8.16 with its Steinberg place in `T_{F_2}` makes finite the ring of `𝒮′_{F_2}`
enlarged by `v_2` with the unrestricted condition there, of which `R_{𝒮′_{F_2}}` is the quotient by the
unramified condition at `v_2`; a second characteristic-zero point and the same lifting theorem, with
`Π′_2` as input, give `Π`. A single finiteness application does not suffice: the automorphic input of
§8.16 must be Steinberg at the Steinberg place of the problem, and `Π_2` is Steinberg only at `ṽ_2`.

**Checks.**

- For the auxiliary comparison in its arithmetic-Frobenius normalization, over `𝔽_7` take
  `q = 3`, `Φ = diag(1, 2)`.
  The adjoint-twist eigenvalues are `3, 3, 6, 5`, none `1`; non-scalar Frobenius is
  already allowed by PotentialAutomorphyInfrastructurePartII §8.16, and is not an extra gap.
- The cyclotomic hypothesis of §8.16 in the `PGL_2` case, where `det r̄_{π,ι} = ε̄^{−1}` is trivial on
  `G_{F(ζ_p)}`: for `p = 7`, a non-square `ν ∈ 𝔽_{7^a}` and `λ ∈ 𝔽_{7^{2a}}` with `λ² = ν^{−1}`, the
  group `A` generated by `SL_2(𝔽_{7^a})` and `λ·diag(ν, 1)` lies in `SL_2(𝔽_{7^{2a}})` (the generator has
  determinant `λ²ν = 1` and square `diag(ν, ν^{−1})`), has projective image `PGL_2(𝔽_{7^a})`,
  `[A, A] = SL_2(𝔽_{7^a})` and `A/[A, A]` of order `2`; with `ȳ` of order `m` on `G_{K_2(ζ_7)}` (prime
  to `7`, as `ȳ` takes values in the units of a finite field of characteristic `7`), the group
  `H/[H, H]` has order dividing `2m`, prime to `7`. The upper unipotent
  group of order `7` has a quotient of order `7`; the large image excludes it.
- For `r = 2` the constituents are twists of `Sym² r̄_σ` and of a character; `SP_1` and `SP_3` hold
  unconditionally (ModularityAndLanglandsExtensions §1.15).
- The Steinberg condition at `T_{F_2}` is possible because `q ≡ 1` modulo `p^N` and `r̄` and `ȳ`, hence
  `s̄`, are trivial at the places above `v_0` over `K_2` (§11.1); with `r̄` trivial alone and
  `ȳ(Frob_ṽ) = c`, `c^{r−1} ≠ 1`, the residual representation there would be the unramified scalar
  `c^{1−r}·1_n`, outside the Steinberg ring of a trivial residual representation.
- Without the auxiliary place `v_2` the residual constituents would need automorphic lifts Steinberg
  at `T` directly, which `SP_{r±1}` does not supply.

*Needs:* §§11.1–11.4; §6.9; ModularityAndLanglandsExtensions §§1.12, 1.15;
PotentialModularityAndCompatibleSystems §9.2 (its Khare–Wintenberger route);
OrdinaryAutomorphicFormsAndModularityLifting §2.11; PotentialAutomorphyInfrastructurePartII Layer 0
("Soluble base change and descent of polarized automorphy"), Layer 1 ("Strong connection and
component deformation problems"), Layer 5 ("Finiteness of ordinary polarized deformation rings with
relaxed-adequate image"; "Characteristic-zero lifts from finiteness and the dimension bound";
"Ordinary automorphy lifting with relaxed-adequate image"; "Adequacy relaxed to the vanishing of
`H¹(H, ad)`"), Layer 7 ("Weak
primitivity over a splitting coefficient field"), Layer 8 ("Finiteness of ordinary locally Steinberg
deformation rings"; "Finiteness with an unobstructed auxiliary place"; "Global lifts with prescribed
local components (Schur form)"; gap:auxiliary-place-reducible-lifting); LocalGaloisDeformationRings
§2.26; ArithmeticGaloisRepresentations §§4.4, 7.9; Chebotarev Layer 10.

### 11.7 Generic primes on every component

Prove (Proposition 3.10) that the graph whose vertices are the minimal primes of `R_{𝒮′_{F_2}}/(ϖ)`,
with `Q`, `Q′` joined when `Q + Q′` lies in a generic prime of dimension `1`, is connected; and
(Proposition 3.11) that `R_{𝒮_{F_1}}` is finite over `Λ_{F_1}`, each of its minimal primes has dimension
`dim Λ_{F_1}` and characteristic `0` and lies in a generic prime of dimension `1` and characteristic
`p`. Consequently there is a finite set `𝒫` of generic primes of `R_{𝒮′_{F_2}}` of dimension `1` and
characteristic `p` witnessing every edge of the graph, such that every minimal prime of `R_{𝒮_{F_1}}`
lies in a generic `𝔭` with `𝔭_{F_2} ∈ 𝒫` (nt26 Proposition 3.10, p. 21; Proposition 3.11, p. 22; the
set `𝒫`, pp. 22–23). The bound `d_{0,F_2} > 1` of §11.1 controls the reducible locus.

*Proof sketch.* Proposition 3.10: the connectedness dimension of `R_{𝒮′_{F_2}}/(ϖ)`
(DeformationAndDerivedPatchingAlgebra §6.6, "Connectedness dimension and arithmetic rank", with the
bound from the local and global presentations as in PotentialAutomorphyInfrastructurePartII §8.5)
with the bound on the reducible locus by `d_{0,F_2}` (Layer 7, "The reducible locus is small in the
presence of Steinberg places"). Proposition 3.11: §11.5 transfers finiteness and components from
`𝒮′_{F_1}` to `𝒮_{F_1}`; large quotients contain generic primes (Layer 7). `𝒫`: the splitting of the
`p`-adic places of `F_1` in `F_2` lets generic primes over `F_2` restrict to generic primes over
`F_1`.

**Checks.**

- If `R_{𝒮′_{F_2}}/(ϖ)` had two components meeting only in the reducible locus, the graph would be
  disconnected; `d_{0,F_2} > 1` excludes this.
- A single component gives a graph with one vertex and no edges, and `𝒫` may be taken to contain one
  generic prime on it.
- Containment goes from the minimal prime up to the generic prime: each minimal prime `Q` (characteristic
  `0`, dimension `dim Λ_{F_1}`) is contained in a characteristic-`p` generic prime `𝔭` of dimension `1`,
  so `Q ⊂ 𝔭` and, for the closed subsets, `V(𝔭) ⊂ V(Q)`. In `𝒪[[T]]` with `Q = (0)` and `𝔭 = (ϖ)`:
  `dim 𝒪[[T]]/Q = 2`, `dim 𝒪[[T]]/𝔭 = 1`, `ϖ ∈ 𝔭` and `ϖ ∉ Q`, so `(0) ⊂ (ϖ)` and `(ϖ) ⊄ (0)`; a
  dimension-one prime of characteristic `p` never lies inside a characteristic-`0` prime.

*Needs:* §§11.5, 11.6; DeformationAndDerivedPatchingAlgebra §6.6 ("Connectedness dimension and
arithmetic rank"); PotentialAutomorphyInfrastructurePartII Layer 7 ("The reducible locus is small in
the presence of Steinberg places"; "Large quotients contain generic primes"; "Generic primes of an
ordinary deformation ring").

### 11.8 An extension making generic points scalar, and the generic R = T theorem

Prove (Proposition 3.12) that there is a totally real `F_3/F_2`, soluble and `X_0`-split over `F`, in
which each `p`-adic place of `F_2` splits, such that for every `𝔭 ∈ 𝒫` and `v ∈ T_{F_3}`,
`r_𝔭|_{G_{K_3,ṽ}}` is unramified with scalar Frobenius; and (Proposition 3.13) that if
`𝔭 ⊂ R_{𝒮_{F_3}}` is a generic prime of dimension `1` and characteristic `p` with `J_{𝒮_{F_3}} ⊂ 𝔭` and
`r_𝔭|_{G_{K_3,ṽ}}` scalar for each `v ∈ T_{F_3}`, then every prime `Q ⊂ 𝔭` contains `J_{𝒮_{F_3}}` (nt26
Proposition 3.12, p. 23; Proposition 3.13, p. 24). The residual coefficient field is chosen at the
start to split every subgroup of the residual image, and geometric weak primitivity is verified
before this choice.

*Proof sketch.* Proposition 3.12: adjoin an `X_0`-split soluble extension of `F` sufficiently tamely
ramified at `v_0`, so that the finitely many local representations `r_𝔭|_{G_{K_ṽ}}` become unramified
with scalar Frobenius. Proposition 3.13: for trivial restriction this is the weak-primitive generic
`R = T` theorem (PotentialAutomorphyInfrastructurePartII Layer 7); the scalar case reduces to it by
twisting (Layer 7, "Twisting and soluble base change for residually reducible rings and Hecke
algebras").

**Checks.**

- Trivial restriction at `T_{F_3}` is the scalar case with scalar `1`.
- `𝒫` is finite, which is what allows a single `F_3` to work for all its members.
- If the restriction at some `v ∈ T_{F_3}` were non-scalar unipotent, the generic `R = T` theorem
  would not apply directly.

*Needs:* §11.7; PotentialAutomorphyInfrastructurePartII Layer 7 ("The weak-primitive generic `R = T`
theorem"; "Twisting and soluble base change for residually reducible rings and Hecke algebras";
"Absolute irreducibility at a generic prime survives restriction"; "Weak primitivity over a splitting coefficient field").

### 11.9 Every component of the Steinberg problem is automorphic after restriction

Prove that there are `Λ_{F_3}`-algebra maps `R_{𝒮_{F_3}} → R_{𝒮′_{F_2}}` and
`R_{𝒮_{F_3}} → R_{𝒮_{F_1}}` by restriction (`τ_s` becomes unipotent over `F_3` because the base change
of `π` to `F_2` is unramified above `v_0`), compatible maps of the pseudodeformation subrings, and
`𝕋_{F_3} → 𝕋_{F_2}` by soluble base change, so that `J_{𝒮_{F_3}} P_{𝒮′_{F_2}} ⊂ J_{𝒮′_{F_2}}`; and
(Proposition 3.14) that for every prime `Q ⊂ R_{𝒮′_{F_2}}/(ϖ)` its pullback `Q_{F_3}` to `R_{𝒮_{F_3}}`
contains `J_{𝒮_{F_3}}` (nt26 the comparison diagram, p. 24; Proposition 3.14 and proof, p. 24).

*Proof sketch.* The restriction and ordinary Hecke base-change diagram, with the same
pseudodeformation subrings (PotentialAutomorphyInfrastructurePartII Layer 2), and the two Hecke
maps. For `𝒮_{F_3}`, whose local rings at `T_{F_3}` are unipotent, `P_{𝒮_{F_3}} → 𝕋_{F_3}` is the
surjection of PotentialAutomorphyInfrastructurePartII §3.10. That section excludes Steinberg choices,
so for the Steinberg problem `𝒮′_{F_2}` the map `P_{𝒮′_{F_2}} → 𝕋_{F_2}` is the map `η` of the ANT
set-up of PotentialAutomorphyInfrastructurePartII Layer 8, with `B = T_{F_2}` (so `𝕋_{F_2}` is the
ordinary Hecke algebra of the definite unitary group of the algebra ramified at `T_{F_2}`) and with the
places above `v_a` in place of `A`, as in §8.16 there (nt26 p. 23). The ordinary Hecke algebra of the
Steinberg seed of §11.6 is faithful over `Λ`; with finiteness and equidimensionality this gives a
minimal characteristic-`p` component containing the Hecke kernel. Propagate along the connected
graph of §11.7: at each edge, pull its witness in `𝒫` back to `F_3`, where it is locally scalar by
Proposition 3.12; Proposition 3.13 puts the Hecke kernel into both
adjacent component primes. Every vertex, and hence every prime above a vertex, contains the
pulled-back kernel.

**Checks.**

- One automorphic component plus connectivity gives all components.
- If the graph had two connected components, only the one containing the seed would be reached.
- The inclusion `J_{𝒮_{F_3}} P_{𝒮′_{F_2}} ⊂ J_{𝒮′_{F_2}}` is the compatibility of Hecke kernels with
  base change; without it the propagation would not return to `F_2`.

*Needs:* §§11.6–11.8; PotentialAutomorphyInfrastructurePartII Layer 3 ("Ordinary deformation data and
their Hecke comparison", §3.10), Layer 7 ("Twisting and soluble base change for residually reducible
rings and Hecke algebras"), Layer 8 ("The ANT set-up", with the auxiliary place of "Finiteness with an
unobstructed auxiliary place", §8.16).

### 11.10 Automorphy of the untwisted tensor `r_π ⊗ Sym^{r−1} r_σ` (Newton–Thorne 2026 Theorem 3.2)

Under §11.1, assume `SP_{r−1}` and `SP_{r+1}`. Prove that for any `σ` with the properties of §11.2,
`r_{π,ι} ⊗ Sym^{r−1} r_{σ,ι} ≅ r_{Π,ι}` for an ι-ordinary RAESDC `Π` on `GL_{2r}(𝔸_F)` (nt26 Theorem 3.2,
p. 13; completion of the proof, p. 25). For `r = 1` the statement is trivial. This is the tensor
theorem for the prescribed `π` and `σ`, not general `GL_2 × GL_r` functoriality.

*Proof sketch.* `s` gives `f : R_{𝒮_{F_1}} → 𝒪` (§11.3). Choose a minimal prime `Q ⊂ ker(f)`;
Proposition 3.11 puts `Q` in a characteristic-`p` dimension-one generic prime `𝔭` with `𝔭_{F_2} ∈ 𝒫`.
Proposition 3.14 gives `J_{𝒮_{F_3}} ⊂ 𝔭_{F_3}`; Proposition 3.12 makes the local restrictions of this
generic representation scalar; Proposition 3.13, applied to `Q_{F_3} ⊂ 𝔭_{F_3}`, gives
`J_{𝒮_{F_3}} ⊂ Q_{F_3} ⊂ ker(f)_{F_3}` (membership in the larger generic prime alone does not give
automorphy of `f`). The Hecke support criterion gives automorphy of `s|_{G_{K_3}}`; undo `X`, `Y` and
descend from `K_3` to `K_1` and then to `F` (PotentialAutomorphyInfrastructurePartII Layer 0).

**Checks.**

- For `r = 2` the tensor `r_π ⊗ r_σ` is automorphic by Ramakrishnan (ModularityAndLanglandsExtensions
  §1.11), a consistency check.
- For `r = 1` the conclusion is the automorphy of `r_π`, and `SP_0` is never invoked.
- Hodge–Tate weights of `r_π ⊗ Sym^{r−1} r_σ` are `{0, 1, …, 2r − 1}`, so `Π` is regular algebraic.

*Needs:* §§11.3, 11.5, 11.8, 11.9; PotentialAutomorphyInfrastructurePartII Layer 0 ("Soluble base
change and descent of polarized automorphy"; "Automorphy of an induced representation descends";
"Automorphy is invariant under algebraic twists"); ModularityAndLanglandsExtensions §1.11.

### Examples

- `p = 5`, `r = 2`: `n = 4`, `s̄` splits as `3 + 1`, and the theorem uses `SP_1`, `SP_3`.
- `p = 7`, `r = 3`: `n = 6`, `s̄` splits as `4 + 2`, and the theorem uses `SP_2`, `SP_4`.

### Dependencies

Layer 6; GL2AutomorphicRepresentationsAndTransfer §R16.3.7; ArithmeticGaloisRepresentations §§4.4,
7.8, 7.9; ArithmeticGaloisDuality §R02.3.5; ModularityAndLanglandsExtensions §§1.11, 1.12, 1.15, 2.13;
PotentialAutomorphyInfrastructurePartII Layers 0, 1, 2, 3, 5, 7, 8
(gap:auxiliary-place-reducible-lifting); PotentialAutomorphyInfrastructure §2.5;
PotentialModularityAndCompatibleSystems §2.16; DeformationAndDerivedPatchingAlgebra §6.6;
GlobalGaloisDeformations §8.1; LocalGaloisDeformationRings §§2.13, 2.18, 2.24, 2.26, 2.27;
OrdinaryAutomorphicFormsAndModularityLifting §2.11; PotentialModularityAndCompatibleSystems §9.2;
Chebotarev Layer 10.

## Layer 12: functoriality lifting for tensor products

This layer proves that automorphy of `r_π ⊗ r_σ` passes to `r_{π′} ⊗ r_σ` for congruent `π`, `π′`
with `σ` fixed (nt26 Theorem 4.1, pp. 25–37), by the simultaneous patching of Layer 9: the rank-two
deformation ring of `r̄_π` and the rank-`2r` conjugate self-dual pseudodeformation ring of the tensor
are patched simultaneously, and regularity at the automorphic point (from characteristic-zero
enormous image and adjoint Selmer vanishing) transfers automorphy. Throughout `Σ_π` is the
ramification set of `π` (and `π′`) and `Σ = Σ_π ∪ Σ_σ`; the quaternion algebra is ramified only at
`Σ_π` away from `p`, while `S` and the unitary level use all of `Σ`. The printed proof takes
`S = S_p ∪ Σ_π` only, which does not cover the application in §13.4, where `σ = Sym^{r−1} σ′` is ramified where `π` is not. The places of `Σ_σ − Σ_π`
away from `p` are added to `S` and to the unitary Iwahori level, with unramified rank-two local
conditions and split quaternion algebra. The places of `Σ_σ` above `p` lie in `S_p` already and are in
the unitary Iwahori level; there the rank-two local condition is the one `π` determines (crystalline,
ordinary crystalline, or semistable non-crystalline, with Hodge–Tate weights `{0, 1}`), whatever the
ramification of `σ`, and the exclusion of `p = 2` concerns `Σ_π ∩ S_p` only.

### 12.1 Preliminary reductions and the CM set-up for tensor functoriality lifting

In the situation of §12.7, prove that after a soluble totally real base change (from which the
conclusion descends) one may assume in addition: (10) `det r_π = det r_{π′} = ε^{−1}`; (11) `[F : ℚ]`
even; (12) `π_v`, `π′_v` and `σ_v` Iwahori-spherical at every finite `v`, with an even number of places
where `π`, `π′` are ramified; (13) with `S = S_p ∪ Σ`, `r̄_{π,ι}|_{G_{F_v}}` trivial for `v ∈ S`, and
for `v ∈ Σ` away from `p`, `q_v ≡ 1` modulo `p` with `π_v`, `π′_v` Steinberg or unramified as the case
may be (if `Σ_π ∩ S_p ≠ ∅` then `p > 2`, since at such a place `π_v` is an unramified twist of
Steinberg, so `r_{π,ι}|_{G_{F_v}}` is not potentially crystalline and (4) of §12.7 excludes `p = 2`);
(14) an `S`-split everywhere unramified quadratic CM `K/F` with
CM type `Φ` and places `S̃`; (15) everywhere unramified type-`A_0` characters `X`, `Y` of `K` with
`X ∘ N = χ ∘ N` (where `σ ≅ σ^∨ ⊗ χ`), `Y ∘ N = |·|` and prescribed infinity types; (16)
`(r_π ⊗ r_σ)|_{G_{K(ζ_{p^∞})}}` and `(r_{π′} ⊗ r_σ)|_{G_K}` irreducible. Define `π_K = BC(π)`,
`π′_K = BC(π′)`, `σ_K = BC(σ) ⊗ X^{−1}`, the RACSDC representation `T` of `GL_n(𝔸_K)` of weight `0`
with `r_T ≅ r_{π_K} ⊗ r_{σ_K} ⊗ r_Y^{1−r}`, integral models `r`, `r′`, `s` (`r̄ = r̄′`), and the group
determinants `t`, `t′` of `(r ⊗ s)|_{G_K} ⊗ r_{X^{−1}Y^{1−r}}` and its `π′`-analogue, with common
reduction `t̄` (nt26 proof of Theorem 4.1, reductions (10)–(16), pp. 26–27; the CM set-up,
pp. 27–28).

*Proof sketch.* The soluble totally real extension is built from cyclic steps with prescribed split
places (PotentialAutomorphyInfrastructure §2.5) and steps with prescribed completions at `S`
(PotentialModularityAndCompatibleSystems §2.16), which give (11)–(13). Soluble base change preserves
(1)–(9) of §12.7 and the conclusion descends (PotentialAutomorphyInfrastructurePartII Layer 0). `X X^c = χ ∘ N` and `Y Y^c = |·|_K` give
`r_T^c ≅ r_T^∨ ⊗ ε^{1−2r}`, and `X^{−1} Y^{1−r}` has trivial infinity type (Layer 0, auxiliary
characters).

**API.**

- The base changes `π_K = BC_{K/F}(π)` and `π′_K = BC_{K/F}(π′)` are cuspidal automorphic
  representations of `GL_2(𝔸_K)`, with `r_{π_K,ι} ≅ r_{π,ι}|_{G_K}` and `r_{π′_K,ι} ≅ r_{π′,ι}|_{G_K}`
  (cuspidal because these restrictions are irreducible, by (16)).
- The twisted base change `σ_K = BC_{K/F}(σ) ⊗ X^{−1}` is a cuspidal automorphic representation of
  `GL_r(𝔸_K)` with `r_{σ_K,ι} ≅ r_{σ,ι}|_{G_K} ⊗ r_{X,ι}^{−1}` (cuspidal because `r_{σ,ι}|_{G_K}` is
  irreducible, by (16)); it is conjugate self-dual, since
  `σ ≅ σ^∨ ⊗ χ` and `X X^c = χ ∘ N_{K/F}` give `σ_K^c ≅ σ_K^∨`.
- `T` is a RACSDC automorphic representation of `GL_{2r}(𝔸_K)` of weight `0` with
  `r_{T,ι} ≅ r_{π_K,ι} ⊗ r_{σ_K,ι} ⊗ r_{Y,ι}^{1−r}`.
- After enlarging the coefficient field `E`, the integral models `r, r′ : G_F → GL_2(𝒪)` and
  `s : G_F → GL_r(𝒪)` are conjugate to `r_{π,ι}`, `r_{π′,ι}`, `r_{σ,ι}`, the characters `r_{X,ι}`,
  `r_{Y,ι}` take values in `𝒪^×`, the reductions satisfy `r̄ = r̄′` as homomorphisms (not only up to
  conjugacy), and the eigenvalues of the images of `r̄` and `s̄` lie in the residue field `k`.
- The group determinants `t`, `t′` of `G_K` over `𝒪` are those of the `2r`-dimensional
  representations `(r ⊗ s)|_{G_K} ⊗ r_{X^{−1}Y^{1−r},ι}` and `(r′ ⊗ s)|_{G_K} ⊗ r_{X^{−1}Y^{1−r},ι}`;
  `t` is the determinant attached to `r_{T,ι}`, and `t ≡ t′` modulo `ϖ`, with common reduction `t̄`,
  because
  `r̄ = r̄′`.

**Checks.**

- For `r = 1`, `σ` is a character, `T = π_K ⊗ σ_K`, and the argument is rank-two modularity lifting.
- At a place of `Σ_σ − Σ_π` away from `p` the quaternion algebra is split and the rank-two condition
  is unramified; putting the place into the quaternionic ramification instead would change the
  rank-two automorphic input.
- At a place `v | p` of `Σ_σ − Σ_π` the rank-two condition is not the unramified one. Take `p = 2`,
  `r ≥ 2`, `r_{π,ι}|_{G_{F_v}}` crystalline with Hodge–Tate weights `{0, 1}` and `σ_v` an unramified
  twist of Steinberg, so that `r_{σ,ι}|_{G_{F_v}}` is semistable with monodromy of rank `r − 1 ≥ 1`
  while that of `r_{π,ι}|_{G_{F_v}}` is `0`. Then `Σ_π ∩ S_2 = ∅` and `Σ ∩ S_2 ≠ ∅`: hypothesis (4)
  of §12.7 holds and `p = 2` is allowed, which the implication with `Σ ∩ S_p` in place of `Σ_π ∩ S_p` would wrongly exclude.
  The rank-two condition at `v` is the crystalline one of weights `{0, 1}`, which contains `r_{π,ι}`;
  an unramified lift of the trivial residual representation has Hodge–Tate weights `{0, 0}` and
  misses it.
- `n = 2r` and `T` has weight `0`, so its Hodge–Tate weights are the `2r` distinct integers
  `{0, …, 2r − 1}` up to a common shift, by (7) of §12.7.

*Needs:* PotentialAutomorphyInfrastructurePartII Layer 0 ("Soluble base change and descent of
polarized automorphy"; "Algebraic characters with prescribed conjugate norm and local behaviour");
PotentialAutomorphyInfrastructure §2.5 ("Auxiliary soluble and cyclic extensions");
PotentialModularityAndCompatibleSystems §2.16; GL2ModularityLifting Layer 2.

### 12.2 Artinian points are torsion semistable, and the tensor map P → R

In the setting of §12.1, prove (Lemma 4.2) that for Artinian `A ∈ 𝒞_𝒪`, `v ∈ S_p` and a lift `r̃_A` of
`r̄|_{G_{F_v}}` of determinant `ε^{−1}` of the given type at `v`, the module `A^{2r}` with the action
`r̃_A ⊗ s|_{G_{K_ṽ}} ⊗ r_{X^{−1}Y^{1−r},ι}` is a subquotient of a lattice in a semistable
representation with Hodge–Tate weights in a fixed interval `[a, b]`; and (Corollary 4.3) that
`r̃ ↦ (r̃ ⊗ s)|_{G_K} ⊗ r_{X^{−1}Y^{1−r},ι}` defines a morphism `P → R` in `𝒞_𝒪` from the conjugate
self-dual pseudodeformation ring of rank `2r` (semistable in the torsion sense at `p`) to the
rank-two deformation ring `R`, and `t`, `t′` give homomorphisms `P → 𝒪` (nt26 Lemma 4.2,
pp. 28–29; Corollary 4.3, p. 29).

*Proof sketch.* At a potentially crystalline place of weights `{0, 1}`, each Artinian rank-two point
is a quotient of a lattice in a crystalline representation with weights `{0, 1}`
(FiniteFlatGroupsAndIntegralPadicHodgeTheory Layer R07.4, supplier contracts); tensor with the fixed
semistable lattice and character, which gives a uniform interval. At a non-crystalline ordinary place
use the closed stable torsion-semistable quotient `R′` of the local ring (LocalGaloisDeformationRings
§§8.12, 8.14): the reduced local ring has dense characteristic-zero semistable points, all of which
factor through `R′`, so the whole map does, and every Artinian specialisation is torsion semistable
(an ordinary filtration alone does not give this). The universal property of the semistable
pseudodeformation ring (PotentialAutomorphyInfrastructurePartII Layer 9) gives `P → R` and the two
`𝒪`-points.

**Checks.**

- At the automorphic point the map `P → 𝒪` given by `t` is the composite of `R → 𝒪` (from `r`) with
  `P → R`.
- For `r = 1` the map `P → R` is the twist of the rank-two trace by the character `s ⊗ r_{X^{−1}}`.
- The interval `[a, b]` depends only on `s` and the fixed character, not on `A`, which is what the
  torsion-semistable condition needs.

*Needs:* §12.1; §9.2; LocalGaloisDeformationRings §§8.12, 8.14; PotentialAutomorphyInfrastructurePartII
Layer 9 ("Semistable conjugate self-dual pseudodeformation rings");
FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.20 (gap:artinian-crystalline-quotients).

### 12.3 Taylor–Wiles data and rings for the tensor product

Let `N ≥ 1`. Define a Taylor–Wiles datum of level `N` for the tensor as
`(Q, Q̃, (α_v, β_v), (γ_{v,1}, …, γ_{v,r}))` with `Q` a finite set of places disjoint from `S`
and split in `K`,
`q_v ≡ 1` modulo `p^N`, a factorisation `v = ṽṽ^c`, `(r̄ ⊗ s̄)(Frob_ṽ)` having `2r` distinct eigenvalues,
`α_v`, `β_v` the eigenvalues of `r̄(Frob_ṽ)` and `γ_{v,i}` those of `(s̄ ⊗ r_{X^{−1}Y^{1−r}})(Frob_ṽ)`.
Attach `Δ_Q`, with `R_Q` an `𝒪[Δ_Q]`-algebra such that `R_Q ⊗_{𝒪[Δ_Q]} 𝒪 ≅ R`; `P_Q`, the quotient of
the pseudodeformation ring of `G_{K,S∪Q}` by the Taylor–Wiles conditions (at `ṽ ∈ Q̃` the residual
characters are `α_v γ_{v,i}` for `i ≤ r` and `β_v γ_{v,i−r}` for `i > r`), with its `𝒪[Δ′_Q]`-structure,
`Δ′_Q = Δ_Q^{2r}`; and the map `P_Q → R_Q` extending §12.2 (nt26 §4 after Corollary 4.3, Taylor–Wiles
data and the rings, pp. 29–30). At the auxiliary places the decomposition is into ordered lifts of the
residual eigencharacters, which may be ramified and encode the diamond action.

*Proof sketch.* As §9.3, with the tensor eigenvalue pattern in place of the symmetric-power monomials,
using uniqueness of decompositions of multiplicity-free pseudocharacters (IntegralHeckeAndGaloisDeterminants
§1.4). The existence of enough data uses the perfect residual subgroup containing an element with
`2r` distinct eigenvalues (hypothesis (6) of §12.7) and rank-two large residual image
(GlobalGaloisDeformations Layer G7, supplier contracts); characteristic-zero enormous image is a
different hypothesis and does not give this.

**API.**

- A level-`N` datum with finite `Q`, `Q ∩ S = ∅`, chosen split lifts, `q_v ≡ 1 mod p^N`
  and the specified ordered `2r` distinct eigenvalues of `(r̄ ⊗ s̄)(Frob_ṽ)`.
- The finite groups `Δ_Q`, `Δ′_Q`, and the rings `R_Q`, `P_Q` with their group-ring structures, and `P_Q → R_Q` extending `P → R`.
- At `ṽ ∈ Q̃` the residual characters of `P_Q` are `α_v γ_{v,i}` (`i ≤ r`) and `β_v γ_{v,i−r}`
  (`i > r`).
- Specialising all rank-two diamond characters to the identity gives `R_Q ⊗_{𝒪[Δ_Q]} 𝒪 ≅ R`; the map
  on rank-`2r` local characters is the ordered tensor product with the fixed factor.

**Checks.**

- If all local `p`-primary factors are `C₂` and `|Q| = k`, then `|Δ_Q| = 2^k`;
  `Q = ∅` gives `|Δ_Q| = 1` and `Δ′_Q = 1`. An infinite such `Q` gives an infinite
  product, so it fails the finite diamond-group datum even if all its places satisfy the
  individual congruence and eigenvalue conditions.
- There are `2r` residual characters at each `ṽ`: `r` of the form `α_v γ_{v,i}` and `r` of the form
  `β_v γ_{v,i}`.
- For `r = 1` the condition is `α_v ≠ β_v`, a rank-two Taylor–Wiles datum with `γ_{v,1}` a fixed
  scalar.
- If `α_v γ_{v,1} = β_v γ_{v,2}`, the `2r` eigenvalues are not distinct and `v` is not a Taylor–Wiles
  place.

*Needs:* §12.2; §9.3; GlobalGaloisDeformations §8.5 (gap:tensor-taylor-wiles-primes);
IntegralHeckeAndGaloisDeterminants §1.4.

### 12.4 Unitary automorphic forms at Taylor–Wiles level for the tensor

Let `G` be the definite unitary group over `F` with
`G(R) = {g ∈ M_n(𝒪_K ⊗ R) : g = (1 ⊗ c)(g)^{−t}}` (`n = 2r`), `H_G(V)` the `𝒪`-valued forms of level `V`,
`V_0 = ∏_v V_{0,v}` Iwahori at `Σ` (including `Σ_σ`) and hyperspecial elsewhere. For a Taylor–Wiles datum
of level `N` (§12.3) define `V_1(Q; N) ⊂ V_0(Q)` place by place: `V_1(Q; N)_v = V_0(Q)_v = V_{0,v}` for
`v ∉ Q`, and for `v ∈ Q`, `V_0(Q)_v = ι_ṽ^{−1}(Iw_ṽ)` and
`V_1(Q; N)_v = ι_ṽ^{−1}{(a_{ij}) ∈ Iw_ṽ : a_{ii} ↦ 1 in k(ṽ)^×(p)/(p^N) for 1 ≤ i ≤ n}`, the kernel of the
ordered diagonal map `Iw_ṽ → (k(ṽ)^×(p)/(p^N))^n` (nt26 pp. 31–32). This is not the level of §9.4,
which imposes a single character of the diagonal; it is the level written `V′_1(Q; N)` in the proof of
nt21b Proposition 2.5. Thus `V_1(Q; N)` is normal in `V_0(Q)` and the ordered diagonal entries give the
diamond isomorphism `V_0(Q)/V_1(Q; N) ≅ Δ′_Q/(p^N)`, `Δ′_Q = Δ_Q^{2r}`, whose `i`-th coordinate at `ṽ`
is the `i`-th factor of the `𝒪[Δ′_Q]`-structure of `P_Q` (§12.3), attached to the `i`-th entry of
the ordering `η = (αγ_1, …, αγ_r, βγ_1, …, βγ_r)` of the residual eigenvalues. Let `𝔪_G`, `𝔪_{G,Q}` be the
maximal ideals where `𝔪_{G,Q}` contains `U^{(i)} − q^{i(1−i)/2} ∏_{j=1}^{i} η_j` at each
auxiliary place; for `i > r` this product is
`α^r β^{i−r} (∏_{j=1}^{r} γ_j)(∏_{j=1}^{i−r} γ_j)`. Prove (Lemma 4.5) that for `p = 2` each quadratic
`χ` of `F^× \ (𝔸_F^∞)^×/det U_1(Q; N)` has a unique quadratic `θ_χ` with
`θ_χ(z/z^c) = χ ∘ N_{K/F}(z)`; and (Proposition 4.6) that for a datum of level `N + c_G`, where
`p^{c_G}` kills the `p`-primary base-level stabilisers, `𝔪_G` and `𝔪_{G,Q}` are in the supports,
`H_G(V_1(Q; N))_{𝔪_{G,Q}}` is free over `𝒪[Δ′_Q/(p^N)]` with coinvariants `H_G(V_0)_{𝔪_G}`, and it
carries a compatible `P_Q`-module structure (nt26 §4, unitary forms, pp. 31–32; Lemma 4.5, p. 32;
Proposition 4.6, p. 33). The diamond action is compatible with the ordering: the `i`-th coordinate
of `Δ′_Q` acts on `H_G(V_1(Q; N))_{𝔪_{G,Q}}` as it acts on `P_Q`, through the inertial character of the
lift of `η_i`. The printed generator of `𝔪_{G,Q}` for `i > r` omits the factor `∏_{j=1}^{r} γ_j`; the
product of the first `i` entries of `η` is meant.

*Proof sketch.* As §9.4: at level `N + c_G` the deck group acts freely, exactness gives freeness and
the trace identifies the coinvariants (PotentialAutomorphyInfrastructurePartII Layer 3). Support
from Labesse's descent of the automorphic `T` (EndoscopicTransferAndUnitaryTraceComparison §6.29).
The ordered cumulative products `η_1 ⋯ η_i` define `𝔪_{G,Q}`, and the multiplicity-free
decomposition of the Hecke determinant gives the `P_Q`-action. Lemma 4.5 by Hilbert 90. For `p = 2`
the inputs are those of §9.4 at `p = 2`; their supplier's hypothesis `4 | n[F : ℚ]` holds because
`n = 2r` and `[F : ℚ]` is even by (11) of §12.1.

**API.**

- The levels `V_0(Q) ⊃ V_1(Q; N)`: `ι_ṽ^{−1}(Iw_ṽ)` at `v ∈ Q`, and inside it the kernel of the ordered
  diagonal map to `(k(ṽ)^×(p)/(p^N))^{2r}`; equal to `V_{0,v}` away from `Q`.
- The diamond isomorphism `V_0(Q)/V_1(Q; N) ≅ Δ′_Q/(p^N)`, its `i`-th coordinate at `ṽ` matched with the
  `i`-th residual character `η_i` of `P_Q`.
- The maximal ideals `𝔪_G`, `𝔪_{G,Q}`, the latter generated with the cumulative products `η_1 ⋯ η_i`.
- Freeness of `H_G(V_1(Q; N))_{𝔪_{G,Q}}` over `𝒪[Δ′_Q/(p^N)]` with coinvariants `H_G(V_0)_{𝔪_G}`, and its
  `P_Q`-module structure compatible with the diamond action.
- For `p = 2`, the unique quadratic `θ_χ` with `θ_χ(z/z^c) = χ ∘ N_{K/F}(z)`.

**Checks.**

- For `N = 1`, augmentation from `𝒪[Δ′_Q/(p)]` recovers `H_G(V_0)_{𝔪_G}` with its Hecke action.
- The full ordered quotient is required. For `r = 1`, `p = 2` and a place `v ∈ Q` with
  `k(ṽ)^×(2)/(2^N)` of order `2`, `V_0(Q)_v/V_1(Q; N)_v ≅ C_2 × C_2` has order `4`, matching the two
  coordinates of `Δ′_Q` at `v`. The kernel of the determinant `a_{11}a_{22}` alone, or of the single
  character `a_{11}/a_{22}` of §9.4, has quotient of order `2` and does not give `Δ′_Q/(p^N)`.
- The ambient level is the Iwahori. The subgroup of `GL_n(𝒪_{K_ṽ})` with entries below the diagonal in
  `ϖ_ṽ²𝒪_{K_ṽ}` has the same ordered diagonal quotient but is strictly smaller than `Iw_ṽ`; with it the
  `U^{(i)}` and the coinvariants change, and `V_0(Q)_v = ι_ṽ^{−1}(Iw_ṽ)` excludes it.
- The ordering matters. For `r = 1`, `α = 2`, `β = 3`, `γ_1 = 5`: `η = (10, 15)`, `𝔪_{G,Q}` contains
  `U^{(1)} − 10` and `U^{(2)} − q_v^{−1}·150`, and the first diagonal coordinate acts through the lift of
  the character with residual value `10`. Exchanging the two coordinates while keeping these generators
  would match the diamond action with the wrong eigencharacter.
- For `r = 1`, `i = 2`: `η_1 η_2 = αγ_1 · βγ_1 = αβγ_1²`, which the corrected formula gives; the
  printed formula, without `∏_{j ≤ r} γ_j`, gives `αβγ_1`.
- With `σ`-only places omitted from the Iwahori level, the form `T` (ramified there) would not
  contribute to `H_G(V_0)`, and `𝔪_G` would not be in the support.

*Needs:* §§9.4, 12.3; PotentialAutomorphyInfrastructurePartII Layer 3 ("Algebraic modular forms on a
definite unitary group"; "Exactness and group-ring freeness at level without `l`-torsion"; "Base
change and descent between definite unitary groups and `GL_n`"); for `p = 2`,
AutomorphicFormsOnReductiveGroups §§7.4–7.5, OrdinaryAutomorphicFormsAndModularityLiftingPartII
§§2.1, 2.3, IntegralHeckeAndGaloisDeterminants §4.1 and SmoothRepresentationsOfLocalGroups SR.1.5,
SR.2.3, SR.3.4; EndoscopicTransferAndUnitaryTraceComparison §6.29.

### 12.5 The tensor image is enormous

Prove that the image of `(r ⊗ s)|_{G_K} ⊗ r_{X^{−1}Y^{1−r},ι}` restricted to `G_{K(ζ_{p^∞})}` is enormous
in the sense of ArithmeticGaloisRepresentations §7.10 (as used in ModularityAndLanglandsExtensions
§4.1), after enlarging the coefficient field so that every characteristic polynomial splits (nt26
Lemma 4.7 and proof, pp. 33–34). The inputs are hypothesis (8) of §12.7 (strong irreducibility of
`r_π ⊗ r_σ`) and Hodge–Tate regularity of the tensor (weights `{0, 1, …, 2r − 1}` by (7)).

*Proof sketch.* By the criterion of ArithmeticGaloisRepresentations §7.10 it suffices that the
derived subgroup `G^1` of the identity component `G^0` of the Zariski closure of the image contains
regular semisimple elements and acts absolutely irreducibly; `G^1` lies in the Zariski closure of the
image of `G_{K(ζ_{p^∞})}` (§7.6 there). `G^0` acts irreducibly because the representation is strongly
irreducible, so its centre is scalar and `G^0 = G^1` or `G^1 𝔾_m`, hence `G^1` acts irreducibly. At
`v ∈ S_p` the Sen operator lies in `Lie G^0` (PadicHodgeTheory §4.4) and has `n` distinct eigenvalues
by Hodge–Tate regularity; a maximal-torus argument gives regular semisimple elements in `G^0`, hence in
`G^1`. Enormousness is the input to adjoint Selmer vanishing (ModularityAndLanglandsExtensions §4.1) at the automorphic point.

**Checks.**

- A tensor that is not Hodge–Tate regular (`σ` of weights `{0, 1, …, r − 1}` instead of
  `{0, 2, …, 2r − 2}`) need not have a Sen operator with distinct eigenvalues: for `r = 2`,
  `{0, 1} + {0, 1}` repeats `1`, and the criterion fails.
- `SO(Q)`-valued images show why the coefficient field must split the characteristic polynomials
  (the hypothesis of ArithmeticGaloisRepresentations §7.10).
- For `r = 1` the tensor is a twist of `r_π`, and enormousness of an image containing `SL_2` up to
  scalars is the classical rank-two statement.

*Needs:* §12.1; ArithmeticGaloisRepresentations §§7.6, 7.10; PadicHodgeTheory §4.4;
ModularityAndLanglandsExtensions §4.1.

### 12.6 Patching for tensor functoriality lifting

Prove (`p > 2`, Proposition 4.8) that there are `W_∞ = 𝒪[[Y_1, …, Y_q, Z_1, …, Z_{4|S∪S_∞|−1}]]` and
`W′_∞` (with `n` copies of the `Y`-variables), a `W′_∞`-algebra `P_∞` and a `W_∞`-algebra `R_∞` with
`P_∞ ⊗ 𝒪 ≅ P` and `R_∞ ⊗ 𝒪 ≅ R`, a surjection `R^{loc}[[X_1, …, X_g]] → R_∞` with
`g = q + |S ∪ S_∞| − 1`, patched modules `H_{G,∞}`, `H_{D,∞}` finite free over `W′_∞`, `W_∞`
specialising to `H_G`, `H_D`, and `P_∞ → R_∞` compatible with `P → R`; and (`p = 2`, Proposition 4.9)
with `q ≥ |S ∪ S_∞|` and `γ = 2 − |S ∪ S_∞| + q`, the same with `R^{loc}[[X_1, …, X_g]] → R′_∞ → R_∞`
(`g = 2q + 1`), a free action of `Ĝ_m^γ` on `Sp R′_∞` with an equivariant `δ : Sp R′_∞ → Ĝ_m^γ` for the
square action and `δ^{−1}(1) = Sp R_∞`, and compatible actions of `Ĝ_m^γ[2]` lifting to `H_{D,∞}` and
`H_{G,∞}` (nt26 Proposition 4.8, p. 34; Proposition 4.9, pp. 35–36). For odd `p`, `q ≥ 0` is the common
size of the Taylor–Wiles sets of §12.3 used in the patching, as in §9.5 (nt26 Proposition 4.8 asks
only for an integer `q ≥ 0`).

*Proof sketch.* As §§9.5–9.6, patching the quaternionic modules for `r̄` (GL2ModularityLifting Layers
2–3, 6) and the unitary modules of §12.4 simultaneously, with the Taylor–Wiles data of §12.3
(DeformationAndDerivedPatchingAlgebra §5.6 and the formal-torus contract for `p = 2`); the rank `2r` of
the pseudocharacter side enters only through `P`, the data and the unitary module. This step does not
follow from §12.5.

**Checks.**

- `dim W′_∞ − dim W_∞ = (n − 1)q`, the extra `Y`-variables of the rank-`n` unitary side.
- For `r = 1` (`n = 2`), `W′_∞ = W_∞ ⊗̂ 𝒪[[Y′_1, …, Y′_q]]` and the construction is rank-two patching
  with a redundant copy of the diamond variables.
- Since `q ≥ |S ∪ S_∞|`, `γ ≥ 2`: for `q = |S ∪ S_∞| = 3`, `γ = 2 − 3 + 3 = 2` and
  `Ĝ_m^γ[2](𝒪) = {±1}²` has order `4` (`−1 ∈ 1 + 𝔪_𝒪` as `p = 2`). Without the bound the formula
  would give `γ = 2 − 3 + 0 = −1` for `q = 0`, which is why the bound on `q` is part of the statement.

*Needs:* §§9.5, 9.6, 12.3, 12.4; GL2ModularityLifting Layers 2, 3, 6; DeformationAndDerivedPatchingAlgebra
§5.6 (gap:formal-torus-patching); GlobalGaloisDeformations §4.11.

### 12.7 Functoriality lifting for a tensor with one factor fixed (Newton–Thorne 2026 Theorem 4.1)

Let `F` be totally real, `r ≥ 1`, `p` any prime, `ι : ℚ̄_p ≅ ℂ`, `π`, `π′` RAESDC on `GL_2(𝔸_F)` and `σ`
RAESDC on `GL_r(𝔸_F)` with (1) `π`, `π′` of weight `0` and non-CM; (2) `r̄_{π,ι} ≅ r̄_{π′,ι}`; (3)
`r̄_{π,ι}(G_F)` containing a conjugate of `SL_2(𝔽_{p^a})`, `p^a > 5`; (4) at each `v | p`,
`r_{π,ι}|_{G_{F_v}}` ordinary (resp. potentially crystalline) exactly when `r_{π′,ι}|_{G_{F_v}}` is, both
potentially crystalline if `p = 2`; (5) at each `v ∤ p`, `π_v` a twist of Steinberg exactly when `π′_v`
is; (6) a perfect subgroup of `(r̄_{π,ι} ⊗ r̄_{σ,ι})^{ss}(G_F)` containing an element with `2r` distinct
eigenvalues; (7) `HT_τ(r_{σ,ι}) = {0, 2, …, 2r − 2}` for every `τ`; (8) `r_{π,ι} ⊗ r_{σ,ι}` automorphic
and strongly irreducible; (9) `r_{π′,ι} ⊗ r_{σ,ι}` irreducible. Prove that `r_{π′,ι} ⊗ r_{σ,ι}` is
automorphic (nt26 Theorem 4.1, pp. 25–26; proof and component argument, pp. 34–36). The theorem
includes the case where `σ` is ramified at places where `π` is not.

*Proof sketch.* Reduce by §12.1. Characteristic-zero enormousness (§12.5) and adjoint Selmer vanishing
give `P_{(𝔭)} = E` at the automorphic characteristic-zero prime (PotentialAutomorphyInfrastructurePartII
Layer 9), and the patched specialisation gives regularity of `(P_∞)_{𝔭_∞}`, so `𝔭_∞` lies on a
unique component of `Supp H_{G,∞}`. For odd `p` the rank-two patched support is irreducible and
`H_{D,∞}` is faithful, so its image contains the target point on the same unitary component; for `p = 2`
the free action of `Ĝ_m^γ` on `Sp R′_∞` (`γ = 2 − |S ∪ S_∞| + q`, §12.6) and the `Ĝ_m^γ[2]`-torsor
`Sp R_∞ = δ^{−1}(1)` make `Ĝ_m^γ[2](𝒪)` act transitively on the irreducible components of
`Spec R_∞`, compatibly with its actions on `Spec P_∞` and on both patched modules; the unique
component of `Spec P_∞` through `𝔭_∞` has dimension `qn + 4|S ∪ S_∞| = dim W′_∞` and lies in
`Supp H_{G,∞}`, the component of `Spec R_∞` through the point of `t` maps into it and meets the orbit
of the point of `t′`, and as `Supp H_{G,∞}` is stable under the group, the point of `t′` lies in it,
as in §9.7. Hence `t′` is
automorphic: `r_{π′_K} ⊗ r_{σ_K} ⊗ r_Y^{1−r}` comes from a RACSDC representation of `GL_n(𝔸_K)`;
descend to `F` (PotentialAutomorphyInfrastructurePartII Layer 0).

**Checks.**

- `r = 1`: modularity lifting for weight-zero non-CM Hilbert forms twisted by a character.
- (7) with `π` of weights `{0, 1}` gives the tensor weights `{0, 1, …, 2r − 1}`, all distinct; with `σ`
  of weights `{0, 1, …, r − 1}` the weight `1` would repeat for `r ≥ 2`.
- (9) cannot be dropped: if `r_{π′} ⊗ r_σ` were reducible, it would not be the Galois representation of
  a cuspidal `Π`, and the conclusion would be false in the sense of ModularityAndLanglandsExtensions
  §0.2.

*Needs:* §§12.1, 12.5, 12.6; §9.7; PotentialAutomorphyInfrastructurePartII Layer 0 ("Soluble base
change and descent of polarized automorphy"; "Automorphy of an induced representation descends"),
Layer 9 ("The pseudodeformation ring is its residue field at an automorphic point");
ModularityAndLanglandsExtensions §§0.2, 4.1.

### Examples

- `r = 2`, `p = 5`: `σ` a weight-`{0, 2}` companion; `r_π ⊗ r_σ` of weights `{0, 1, 2, 3}`.
- In §13.4 the theorem is applied with `σ = Sym^{r−1} σ′` (rank `r`, weights `{0, 2, …, 2r − 2}`),
  Steinberg at a place where `π` is unramified.

### Dependencies

Layer 9; PotentialAutomorphyInfrastructurePartII Layers 0, 3, 9; AutomorphicFormsOnReductiveGroups
§§7.4–7.5; OrdinaryAutomorphicFormsAndModularityLiftingPartII §§2.1, 2.3;
SmoothRepresentationsOfLocalGroups SR.1.5, SR.2.3, SR.3.4; PotentialAutomorphyInfrastructure §2.5;
PotentialModularityAndCompatibleSystems §2.16; GlobalGaloisDeformations §§4.11, 8.5;
LocalGaloisDeformationRings §§8.12, 8.14;
FiniteFlatGroupsAndIntegralPadicHodgeTheory Layer R07.4; IntegralHeckeAndGaloisDeterminants §§1.4, 4.1;
GL2ModularityLifting Layers 2, 3, 6; DeformationAndDerivedPatchingAlgebra §5.6;
EndoscopicTransferAndUnitaryTraceComparison §6.29; ArithmeticGaloisRepresentations §§7.6, 7.10;
PadicHodgeTheory §4.4; ModularityAndLanglandsExtensions §§0.2, 4.1.

## Layer 13: residual twisted tensors and the induction on n

This layer proves `SP_n` for every `n` over every totally real field (nt26 Theorem 6.4, pp. 37–50;
th24 Theorems 7.1 and 7.6, pp. 42–47). Write `n = p + r` with `n/2 < p < n` prime. Modulo `p`,
`(Sym^{p+r−1} r̄)^{ss} ≅ (φ_p r̄ ⊗ Sym^{r−1} r̄) ⊕ (det r̄)^r ⊗ Sym^{p−r−1} r̄`
(ArithmeticGaloisRepresentations §7.8); Thorne's level raising (§6.9) and residually reducible lifting
turn ordinary automorphic witnesses for the two blocks into automorphy of `Sym^{p+r−1}` (§13.8). The
second block comes from `SP_{p−r}`; the first, the coefficient-Frobenius twisted tensor, comes from §11
and §12 by propagation over the Galois group of the coefficient field (§§13.3–13.6). The reciprocity
of the two auxiliary splitting conditions (nt26 Lemma 5.3) is ArithmeticGaloisDuality §R02.3.5. For
`r = 1` the twisted tensor is a coefficient conjugate of `π` and no `SP_0` occurs. The modular
two-block decomposition is an identity of semisimplifications, not a splitting of `Sym^{p+r−1} r̄`.

### 13.1 Large image at every prime from two tamely dihedral places

Fix `M > 5`. Let `π` be RAESDC on `GL_2(𝔸_F)` of weight `0` with (1) primes `t_1, t_2 > M` and places
`v_1`, `v_2` of residue characteristics `p_1, p_2 > 3`, unramified in `F`, with `π_{v_i}` tamely dihedral
of order `t_i` and `p_1, p_2, t_1, t_2` distinct; (2) with `S` the finite places `v ≠ v_1, v_2` where `π`
is ramified or `v` is ramified over `ℚ`, together with the places above `2` and `3`, `v_1` splits in
`F(S ∪ {v_2})` and `v_2` splits in `F(S ∪ {v_1})`, where for a set `T` of finite places `F(T)` is the
maximal abelian extension of `F` of exponent two unramified at every finite place outside `T`, the real
places being allowed to ramify (nt26 p. 38; ArithmeticGaloisDuality §R02.3.5). Prove that for every
prime `p` and `ι : ℚ̄_p ≅ ℂ`, `r̄_{π,ι}(G_F)` contains a conjugate of `SL_2(𝔽_{p^a})` for some
`p^a > M` (nt26 Proposition 5.4 and proof, pp. 39–40). The printed proof infers the strict bound `q > t − 1` on the projective field size
from one projective element of order `t`; for odd residual characteristic parity excludes `q = t − 1`,
and in characteristic two both places are used.

*Proof sketch.* Away from `{p_1, t_1}` the local representation at `v_1` is irreducible with a projective
element of order `t_1 > 5` (GL2AutomorphicRepresentationsAndTransfer §R16.3.8). Dickson's
classification (ArithmeticGaloisRepresentations §4.4) leaves `PSL_2(𝔽_q)`, `PGL_2(𝔽_q)` or a dihedral
image; in the former cases `t_1 | q ± 1`. In odd residual characteristic `q` is odd, so `q = t_1 − 1` is
impossible and `q > M`. In residual characteristic `2`, if `q ≤ M` then the distinct odd primes
`t_1, t_2 > M` can divide `q ± 1` only by both equalling `q + 1`, a contradiction. For `p ∈ {p_1, t_1}`
use `v_2` (these `p` are odd). If the residual representation is induced from `K/F`, Fontaine–Laffaille
(FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.5.11) and the tame local conditions bound the
ramification of `K` by `S ∪ {v_2}` (dyadic places are in `S`), and the splitting of `v_1` in this
exponent-two extension (ArithmeticGaloisDuality §R02.3.5) contradicts local irreducibility at `v_1`;
exchange the places in the other case.

**Checks.**

- Without the splitting hypothesis, a quadratic inducing field can be non-split at `v_1` (for
  example unramified quadratic locally); odd-order tame inertia does not force ramification of that
  field at `v_1`.
- Characteristic `2` with `M = 6`: if `q ≤ 6` then `q ∈ {2, 4}` and `q ± 1 ∈ {1, 3, 5}`, divisible by no
  prime `t_i > 6`; in general `t_1, t_2 > M ≥ q` could divide `q ± 1` only by both equalling `q + 1`.
- In odd characteristic, `q = t_1 − 1` is even, hence not a power of an odd prime.

*Needs:* GL2AutomorphicRepresentationsAndTransfer §R16.3.8; ArithmeticGaloisRepresentations §4.4;
FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.5.11; ArithmeticGaloisDuality §R02.3.5.

### 13.2 The hypotheses `S5-global` and `S5-local`

Define `S5-global` on `(F, p, r, ι, π)`: `F` totally real, `p ≥ 5`, `0 < r < p`, `SP_r`, `SP_{r+1}` and,
when `r > 1`, `SP_{r−1}`, and `π` RAESDC on `GL_2(𝔸_F)` with (1) `det r_{π,ι} = ε^{−1}`; (2) weight `0` and
`π_v` an unramified twist of Steinberg for every `v | p`; (3) a place `v_0` with `q_{v_0} ≡ −1` modulo `p`
and `π_{v_0}` tamely dihedral of order `p`; (4) for every prime `l` and every `ι_l`, `r̄_{π,ι_l}(G_F)`
containing a conjugate of `SL_2(𝔽_{l^a})` with `l^a > max(4r, 5)`, and `r̄_{π,ι}(G_F)` containing a
conjugate of `SL_2(𝔽_{p^a})` with `a > a₀(p)`; (5) `π_v` potentially unramified at every finite `v ∤ p`.
Define `S5-local` on `(F, p, r, M, ι, π, v_1, w_1, w_2, t_1, t_2)`: as before with `M > p^{a₀(p)}`, `π`
satisfying (1)–(3); (4) a place `v_1` with `q_{v_1} ≡ 1` modulo `p` and `π_{v_1}` an unramified twist of
Steinberg; (5) `π_v` potentially unramified at every `v ∤ p v_1`; (6) primes `t_1, t_2 > M` and places
`w_1`, `w_2` of residue characteristics `p_1, p_2 > 3` unramified in `F`, with `π_{w_i}` tamely dihedral
of order `t_i` and `p_1, p_2, t_1, t_2` distinct; (7) with `H` the ray class field of modulus `(8)∞` and
`S` the places `v ≠ w_1, w_2` where `π` is ramified, `v` is ramified over `ℚ` or has residue
characteristic `2` or `3`: `w_1` splits in `H · F(S)` and `w_2` splits in `H · F(S ∪ {w_1})` (nt26
Theorem 5.5, hypotheses, p. 40; Theorem 5.9, hypotheses, p. 44). Prove that `S5-local` implies the
large-image condition (4) of `S5-global` with `M` in place of `max(4r, 5)`.

*Proof sketch.* By ArithmeticGaloisDuality §R02.3.5 (one new ramified prime and reciprocity), (7)
implies the symmetric splitting condition of §13.1, which gives large image at every prime.

**API.**

- The hypotheses `S5-global` on `(F, p, r, ι, π)`, with `SP_m` the statement of
  ModularityAndLanglandsExtensions §1.12.
- The hypotheses `S5-local`, with the dihedral places and the splitting conditions.
- `S5-local` implies large residual image at every prime with bound `M` (§13.1).
- The coefficient Frobenius `φ_p` and the twisted residual representation `φ_p r̄ ⊗ Sym^{r−1} r̄`.

**Checks.**

- For `r = 3` the global image bound is `l^a > max(12, 5) = 12`.
- `q_{v_1} ≡ 1` modulo `p`: for `p = 5`, `q_{v_1} ∈ {11, 16, 31, 41, …}`.
- `S5-local` without (7) does not give large image at every prime: a dihedral residual representation
  can occur. For `r = 1` the tensor is a coefficient conjugate of `π`, `SP_1` is the trivial character
  and `SP_2` the given form.

*Needs:* §13.1; ArithmeticGaloisDuality §R02.3.5; ModularityAndLanglandsExtensions §1.12;
ArithmeticGaloisRepresentations §7.9; ClassFieldTheory Layers 12, 14.

### 13.3 The companions σ, σ′ and the auxiliary prime t

Prove: (Lemma 5.6) under `S5-global` there is a RAESDC `σ` on `GL_2(𝔸_F)` with the properties of §11.2
and `r_{π,ι} ⊗ Sym^{r−1} r_{σ,ι}` automorphic; (Lemma 5.7) with `K_π` the coefficient field of `π`,
`K̃_π` its Galois closure, `Γ_π = Gal(K̃_π/ℚ)`, `B ≥ 1` such that `K_π` is ramified only at primes
`< B`, and `φ = ιφ_pι^{−1}`, there are a prime `t`, `ι_t` and a RAESDC `σ′` with: `t > max(5, 4r + 2, B)`,
`t` unramified in `F` and all three forms unramified above `t`; the residual tensors of `π` and of `φπ`
with `Sym^{r−1} σ` at `t` absolutely irreducible over `F(ζ_t)`; `r̄_{σ,ι_t} ≅ r̄_{σ′,ι_t}` and `σ′_{v_0}`
an unramified Steinberg twist; `r_π ⊗ Sym^{r−1} r_{σ′}` automorphic, and `r_{φπ} ⊗ Sym^{r−1} r_σ`
automorphic exactly when `r_{φπ} ⊗ Sym^{r−1} r_{σ′}` is; for every `l < B` and `ι_l`, `r̄_{σ′,ι_l}` has
image containing `SL_2(𝔽_{l^a})` with `l^a > max(4r, 5)` and projective fixed field meeting that of `γπ`
in degree at most `2` over `F` for every `γ ∈ Γ_π`; the new auxiliary place `v_1` of the construction
lies away from `p`, `t` and all prescribed bad places, so that `π` and `σ` are unramified there (nt26
Lemma 5.6, p. 40; Lemma 5.7 and proof, pp. 40–42). The printed proof verifies tensor irreducibility over
`F` but not over `F(ζ_t)`, which potentially diagonalizable lifting needs, and does not exclude `v_1 | p`;
both are supplied below.

*Proof sketch.* For `r > 1`, `σ` comes from §11.2 and §11.10 (with `SP_{r±1}`); for `r = 1` the tensor is
`r_π`. Choose `t` outside the exceptional-image sets of `π`, `φπ`, `σ` and unramified in the coefficient
fields and in `F`. If two residual projective fields coincided, Dickson's classification
(ArithmeticGaloisRepresentations §4.4) would identify the adjoint representations up to coefficient
Frobenius; their Fontaine–Laffaille weights `{−1, 0, 1}` and `{−2, 0, 2}` at an unramified `t > 5`
exclude this (FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.5.11). The projective fields therefore
meet in at most a quadratic extension; Goursat (ArithmeticGaloisRepresentations §7.6) gives
`PSL_2(q_π) × PSL_2(q_σ)` in the joint projective image, and commutators lift it to
`SL_2(q_π) × SL_2(q_σ)` in the joint linear image (a subgroup of `SL_2 × SL_2` surjecting onto the
projective product, times the centre, is the whole perfect product, hence equals it). `G_{F(ζ_t)}` is
normal with abelian quotient, so its joint image contains this perfect product, on which
`Std ⊗ Sym^{r−1}` is absolutely irreducible since `r < t ≤ q_σ`. Take moreover `t ≡ 1` modulo `4` and
split in the coefficient field of `σ`, so that `r̄_{σ,ι_t}(G_F)` lies between `SL_2(𝔽_t)` and
`GL_2(𝔽_t)`. Choose `v_1` by Chebotarev outside the finite set over `p`, `t` and the ramification of
`π`, `σ` and the coefficient conjugates, with `q_{v_1} ≡ −1` modulo `t` and `r̄_{σ,ι_t}(Frob_{v_1})` of
eigenvalue ratio `−1`, which a lift of tamely dihedral type of order `t` at `v_1` requires (it exists
as complex conjugation has projective image in `PSL_2(𝔽_t)` for `t ≡ 1` modulo `4`; nt26 p. 42).
Construct `σ′` by the Khare–Wintenberger argument of §11.2 with potentially diagonalizable local
conditions: over a quadratic CM extension `E/F` in which `t` and the prescribed places split, linearly
disjoint from the field cut out by `r̄_{σ,ι_t}` over `F(ζ_t)`, ModularityAndLanglandsExtensions §2.25
gives a lift of `r̄_{σ,ι_t}|_{G_E}` with the multiplier of `r_{σ,ι_t}` connecting, above `t`, to
`r_{σ,ι_t}` itself (crystalline with labelled weights `{0, 2}` in the Fontaine–Laffaille range, as `t > 5`
is unramified in `F`, hence potentially diagonalizable by ModularityAndLanglandsExtensions §2.1), at
`v_1` to a lift of tamely dihedral type of order `t` (GL2AutomorphicRepresentationsAndTransfer
§R16.3.7), and elsewhere to the local components of `r_{σ,ι_t}`; it is automorphic by
ModularityAndLanglandsExtensions §2.16, the residual automorphy coming from `σ_E`, and descends to the
RAESDC `σ′` over `F` (PotentialAutomorphyInfrastructurePartII Layer 0, "Soluble base change and
descent of polarized automorphy"). A weight-two lifting theorem does not apply: it would change the
weights `{0, 2}` above `t`. At small `l` the projective field of `σ′` differs from each
`γπ` field by ramification at `v_1`, and Dickson gives field size `q ≥ t − 1 > 4r`. Potentially
diagonalizable automorphy lifting over `F(ζ_t)` (ModularityAndLanglandsExtensions §2.16)
gives the two comparisons, with coefficient conjugation (AutomorphicGaloisRepresentationsPartII
AG2.6).

**Checks.**

- For `K_π = ℚ`, `Γ_π` is trivial and `B = 1`, so the conditions at small primes are empty.
- The weights distinguishing the adjoints: `ad⁰` of a weight-`{0, 1}` form has weights `{−1, 0, 1}`,
  of a weight-`{0, 2}` form `{−2, 0, 2}`; an isomorphism up to coefficient Frobenius would preserve
  Fontaine–Laffaille weights at unramified `t > 5`.
- For `r = 2`, `Std ⊗ Std` is irreducible of dimension `4` on `SL_2(q_π) × SL_2(q_σ)`, but on a
  diagonal `SL_2(q)` (as would occur if the two projective fields coincided) it splits as `Sym² ⊕ 1`:
  this is why the fields must be shown to be almost disjoint.
- The weights of `σ′` above `t` must stay `{0, 2}`: §13.4 needs `HT(Sym^{r−1} σ′) = {0, 2, …, 2r − 2}`,
  and a weight-two companion (labelled weights `{0, 1}`) would make `r_π ⊗ Sym^{r−1} r_{σ′}` irregular,
  for `r = 2` `{0, 1} + {0, 1}` repeating `1`; with `{0, 2}` the sum `{0, 1} + {0, 2} = {0, 1, 2, 3}` is
  regular.
- The place `v_1` must have `q_{v_1} ≡ −1` modulo `t`: a tamely dihedral type of order `t` is induced
  from a character of the unramified quadratic extension of order `t` on inertia that does not factor
  through the norm, which requires `t | q_{v_1}² − 1` and `t ∤ q_{v_1} − 1`, i.e. `t | q_{v_1} + 1`; its
  residual Frobenius ratio is `−1`. For `t = 13`, `q_{v_1} = 103 ≡ −1` modulo `13` qualifies, while
  `q_{v_1} = 53 ≡ 1` gives only principal-series types.

*Needs:* §§11.2, 11.10; ModularityAndLanglandsExtensions §§2.1, 2.16, 2.25;
GL2AutomorphicRepresentationsAndTransfer §R16.3.7; PotentialAutomorphyInfrastructurePartII Layer 0
("Soluble base change and descent of polarized automorphy"); AutomorphicGaloisRepresentations
§7.4; AutomorphicGaloisRepresentationsPartII AG2.6 ("Complex and local
coefficient conjugation"); ArithmeticGaloisRepresentations §§4.4, 7.6, 7.8;
FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.5.11; Chebotarev Layer 10.

### 13.4 Propagation over the Galois group of the coefficient field

Under `S5-global` with `σ`, `σ′`, `B`, `K̃_π`, `Γ_π` from §13.3, prove (Lemma 5.8) that for `γ ∈ Γ_π`, a
finite place `w | l` of `K̃_π` and `δ` in the inertia group `I_{w/l}`, if
`r_{γπ,ι} ⊗ Sym^{r−1} r_{σ′,ι}` is automorphic then so is `r_{δγπ,ι} ⊗ Sym^{r−1} r_{σ′,ι}` (for `δ ≠ 1`
only `l < B` occurs; the second factor is fixed); hence `r_{γπ,ι} ⊗ Sym^{r−1} r_{σ′,ι}` is automorphic for
every `γ ∈ Γ_π`; and, taking `γ = φ`, with the equivalence of §13.3 and coefficient conjugation, there is
an ι-ordinary RAESDC `Π` on `GL_{2r}(𝔸_F)` with `r_{Π,ι} ≅ φ_p(r_{π,ι}) ⊗ Sym^{r−1} r_{σ,ι}` (nt26
Lemma 5.8 and proof, pp. 42–44; completion of Theorem 5.5, pp. 42–44). The checks in the printed proof
are at the original embedding `ι` where the comparison embedding `ι_l` at `l` is meant.

*Proof sketch.* Change the comparison embedding to one inducing `w`; `δ` acts trivially on the residue
field, so `r̄_{δγπ} ≅ r̄_{γπ}` at the prime above `l`. Apply §12.7 with `σ = Sym^{r−1} σ′` (RAESDC by `SP_r`,
Steinberg at `v_0` where `γπ` is unramified after base change, a case Layer 12 covers because its set
`S` and its unitary level contain the ramification of `σ`, with the rank-two condition at `v_0`
unramified if `v_0 ∤ l` and the one `γπ` determines if `v_0 | l`), checking its nine hypotheses at
`l`: the coefficient inertia gives the residual congruence;
the different weights give regularity; the two projective fields give a perfect product, and a regular
semisimple element `(diag(y, y^{−1}), diag(x, x^{−1}))` is found by choosing `x` of order `> 2r − 2`
in the symmetric-power slot and `y` in the rank-two slot avoiding the at most `4r − 2` elements `±x^i`,
`|i| ≤ r − 1`, that lie in the field from which `y` is chosen, which `q > 4r` permits (nt26 p. 44); ordinarity and Steinberg status are preserved by coefficient
conjugation. Return to `ι` by AutomorphicGaloisRepresentationsPartII AG2.6 (coefficient independence
of untwisted tensor automorphy, both factors RAESDC). `Γ_π` is generated by its inertia subgroups
because `ℚ` has no non-trivial everywhere unramified extension (Mathlib
`NumberField.abs_discr_gt_two`).

**Checks.**

- If `K_π = ℚ`, `Γ_π` is trivial, the propagation is empty, `φ` acts trivially and the conclusion is the
  untwisted tensor of §11.10.
- If `K̃_π/ℚ` were unramified at every prime (impossible for `K̃_π ≠ ℚ`), inertia would generate only the
  trivial group; Hermite–Minkowski excludes this.
- The hypothesis (6) of §12.7 at `l`: with projective images containing `PSL_2(q_{γπ}) × PSL_2(q_{σ′})`,
  `q > 4r`, the element `(diag(y, y^{−1}), diag(x, x^{−1}))` with `x` of order `> 2r − 2` and `y ∉ {±x^i : |i| ≤ r − 1}`
  has the `2r` eigenvalues `y^{±1} x^{r−1−2j}`, `0 ≤ j ≤ r − 1`, all distinct: `y x^a = y x^b`
  forces `a = b` because `|a − b| ≤ 2r − 2` is below the order of `x`, and `y x^a = y^{−1} x^b`
  forces `y = ±x^{(b−a)/2}` with `|(b − a)/2| ≤ r − 1`, which is excluded. The forbidden set has at most
  `4r − 2` elements (fewer when some `±x^i` coincide, and only those in the field of `y` count), so
  `q − 1 ≥ 4r` leaves a choice of `y`.
- The forbidden count is a bound, not an exact value. For `r = 4`, `q = 17`, `x = 2` (of order
  `8 > 6`), the values `±2^i`, `|i| ≤ 3`, are `{1, 2, 4, 8, 9, 13, 15, 16}`: `8` elements, not `14`,
  because `−1 = 2^4`; in characteristic `2` the signs coincide as well. The choice `y = 3` avoids them
  and gives the eight distinct eigenvalues `7, 6, 10, 11, 14, 12, 3, 5` modulo `17`.
- The slots are not interchangeable: with `x` in the rank-two slot the eigenvalues are `x^{±1} y^{r−1−2j}`,
  and for `r = 4`, `q = 43`, `x` of order `7` and `y` of order `3` (which avoids `±x^i`, these
  having orders dividing `7` or `14`), `x y³ = x y^{−3}` is a repeated eigenvalue.

*Needs:* §§13.3, 12.7; AutomorphicGaloisRepresentationsPartII AG2.6 ("Complex and local coefficient
conjugation"; "Coefficient independence of tensor automorphy"); Mathlib `NumberField.abs_discr_gt_two`;
ClassFieldTheory Layer 13.

### 13.5 A residual witness for `φ_p r̄ ⊗ Sym^{r−1} r̄` under global image hypotheses (Newton–Thorne 2026 Theorem 5.5)

Under `S5-global` (with `SP_r`, `SP_{r+1}` and `SP_{r−1}` when `r > 1`), prove that there is an
ι-ordinary RAESDC `Π` on `GL_{2r}(𝔸_F)` with `r̄_{Π,ι} ≅ φ_p(r̄_{π,ι}) ⊗ Sym^{r−1} r̄_{π,ι}` (nt26
Theorem 5.5, p. 40; proof, pp. 40–44). The statement is residual: it does not identify `r_{Π,ι}` with a
Frobenius twist of a characteristic-zero tensor of `π` with itself.

*Proof sketch.* §13.4 gives `Π` with `r_Π ≅ φ_p(r_π) ⊗ Sym^{r−1} r_σ`; reducing, `r̄_σ^{ss} ≅ r̄_π^{ss}` (§11.2),
so `r̄_Π ≅ φ_p(r̄_π) ⊗ Sym^{r−1} r̄_π`; ordinarity from that of `π` and `σ`.

**Checks.**

- For `r = 1` the witness is for `φ_p r̄`, given by the coefficient conjugate of `π`.
- Residual irreducibility: for `a > a₀(p)` the representation `φ_p r̄ ⊗ Sym^{r−1} r̄` of a group
  containing `SL_2(𝔽_{p^a})` is irreducible and adequate (ArithmeticGaloisRepresentations §7.9), so `Π`
  is cuspidal.
- `dim = 2 · r = 2r`, and the Hodge–Tate weights `{0, 1} + {0, 2, …, 2r − 2}` are distinct.

*Needs:* §§13.4, 11.2, 13.2; ArithmeticGaloisRepresentations §7.9.

### 13.6 A residual witness retaining a Steinberg place (Newton–Thorne 2026 Theorem 5.9)

Under `S5-local` (with `SP_r`, `SP_{r+1}` and `SP_{r−1}` when `r > 1`), prove that `r̄_{π,ι}(G_F)` contains
`SL_2(𝔽_{p^a})` with `p^a > M`, and that there is an ι-ordinary RAESDC `Π` on `GL_{2r}(𝔸_F)` with
`r̄_{Π,ι} ≅ φ_p(r̄_{π,ι}) ⊗ Sym^{r−1} r̄_{π,ι}`; `π` remains Steinberg at `v_1` for the later level raising,
while no Steinberg condition at `v_1` is asserted for `Π` (nt26 Theorem 5.9, p. 44; proof, pp. 44–45).

*Proof sketch.* Large image at every prime by §13.2. Remove the extra Steinberg place: a congruent
ι-ordinary RAESDC `π′` of weight `0`, determinant `ε^{−1}`, Steinberg at all `p`-adic places, with
`r_{π,ι}|_{G_{F_v}} ∼ r_{π′,ι}|_{G_{F_v}}` for `v ∤ p v_1`, `π′_{v_1}` a principal series `i(χ_1 ⊗ χ_2)`
with `(χ_1/χ_2)|_{𝒪^×}` of order `p` (residually the same inertial semisimplification as Steinberg since
`q_{v_1} ≡ 1` modulo `p`), and the dihedral types at `w_1`, `w_2` preserved (LocalGaloisDeformationRings
§2.15; PotentialModularityAndCompatibleSystems §10.10; PotentialAutomorphyInfrastructurePartII Layer
1). `π′` satisfies `S5-global`, and §13.5 gives the witness for `π′`, hence for `π`.

**Checks.**

- The witness is residual only, as in §13.5. In characteristic zero, for `r = 2`, `φ_p r_π ⊗ r_π` has
  labelled Hodge–Tate weights `{0, 1} + {0, 1} = {0, 1, 1, 2}` at every `τ` (`π` has weight `0`), a
  repeated weight, so it is the Galois representation of no RAESDC `Π`; for every `r ≥ 2` the weights
  `{0, 1} + {0, …, r − 1}` repeat in the same way.
- `q_{v_1} ≡ 1` modulo `p` is what makes an order-`p` character of `𝒪^×` at `v_1` exist and the principal
  series congruent to Steinberg.
- The output `Π` need not be Steinberg at `v_1`; §13.7 keeps the Steinberg place on `π′` for §13.8.

*Needs:* §§13.5, 13.2; LocalGaloisDeformationRings §2.15; PotentialModularityAndCompatibleSystems
§10.10; PotentialAutomorphyInfrastructurePartII Layer 1 ("Strong connection and component
deformation problems").

### 13.7 Ordinary replacement with a Frobenius-tensor residual witness (Newton–Thorne 2026 Corollary 6.2)

For `F` totally real, `π` non-CM RAESDC on `GL_2(𝔸_F)`, `p ≥ 5`, `0 < r < p`, and `SP_r`, `SP_{r+1}` and
`SP_{r−1}` when `r > 1`, prove that there are a soluble totally real `E/F`, `ι` and RAESDC `π′` over `E`
with: `Sym^{p+r−1} r_{π,ι}` automorphic exactly when `Sym^{p+r−1} r_{π′,ι}` is; `π′` of weight zero and an
unramified Steinberg twist at every `p`-adic place of `E`; `r̄_{π′,ι}` with image containing
`SL_2(𝔽_{p^a})`, `a > a₀(p)`; an unramified Steinberg twist at some `v_1 ∤ p`; and an ι-ordinary RAESDC
representation of `GL_{2r}(𝔸_E)` with residual representation `φ_p(r̄_{π′,ι}) ⊗ Sym^{r−1} r̄_{π′,ι}`
(nt26 Corollary 6.2, p. 49). Prove also the intermediate step of the proof of Proposition 6.1: there are
`ι`, a soluble totally real `E/F` and RAESDC `π_0` over `E` of weight `0`, Steinberg at all `v | p`,
`det r_{π_0} = ε^{−1}`, residual image containing `SL_2(𝔽_{p^a})` with `a > a₀(p)`, Steinberg at some
`v_1 ∤ p` with `q_{v_1} ≡ 1` modulo `p`, potentially unramified away from `p v_1`, and
`Sym^{p+r−1} r_π` automorphic exactly when `Sym^{p+r−1} r_{π_0}` is (nt26 proof of Proposition 6.1,
intermediate claim, pp. 46–48). The printed corollary labels the final `p`-adic places as places of
`F`; they are places of `E`. The printed choice of the auxiliary prime `t` avoids the conductor of `π`;
it must avoid that of `π_a` below.

*Proof sketch.* Intermediate step: a prime `q` from Dimitrov's large-image theorem
(AutomorphicGaloisRepresentations §7.4); an everywhere unramified finite-order character
`χ : G_E → ℚ̄_q^×` whose reduction `χ̄` satisfies the residual identity `χ̄² det r̄_{π,ι_q} = ε̄^{−1}`
(the obstruction to a square root of the totally even residual character `ε̄ det r̄_{π,ι_q}` is a
`2`-torsion class in `Br(F)`, killed by local conditions on `E`; a finite-order lift of the square root
is then chosen, unramified after enlarging `E`) (nt26 proof of Proposition 6.1, p. 47); an ordinary
weight-zero `π_a` with `det r_{π_a,ι_q} = ε^{−1}`, the required local conditions and residual
representation `r̄_{π_a,ι_q} ≅ r̄_{π,ι_q}|_{G_E} ⊗ χ̄` (PotentialModularityAndCompatibleSystems §9.2;
SerreWeightAndLevelOptimisation §6.11). Only the residual representations of `π` and `π_a` are related:
the characteristic-zero determinant of `π_a` is `ε^{−1}` because `π_a` has weight zero, not because it
is a finite twist of `det r_{π,ι_q}`. Then a prime `t` prime to the conductor of `π_a` with tamely
dihedral level raising. Proposition 6.1 (ModularityAndLanglandsExtensions §4.22) then gives `π′` with its eight
conditions, hence `S5-local`, and §13.6 gives the witness.

**Checks.**

- For `r = 1` the witness is `φ_p r̄_{π′}`, a coefficient conjugate.
- The twisting identity is residual, never in characteristic zero. For `Δ` (weight `12`, `F = ℚ`),
  `det r_{Δ,ι_q} = ε^{−11}` has Hodge–Tate weight `11`; a finite-order `χ` has Hodge–Tate weight `0`,
  so `χ² det r_{Δ,ι_q}` has weight `11 ≠ 1`, the weight of `ε^{−1}`, on `G_ℚ` and on `G_E` for every
  finite `E`: no finite-order character satisfies the characteristic-zero identity. Residually the
  exponents give `χ̄ = ε̄⁵` with `2·5 − 11 = −1`, so `χ̄² det r̄_{Δ,ι_q} = ε̄^{−1}` (and `ε̄` is
  unramified at `v | q` once `ζ_q ∈ E_v`).
- `E/F` soluble and totally real keeps `Sym^{p+r−1}` automorphy equivalent over `F` and `E` by soluble
  descent (the representation is irreducible by non-CM large image).
- A prime `t` dividing the conductor of `π_a` would not allow an unramified starting point for the
  dihedral level raising at `t`.

*Needs:* §13.6; ModularityAndLanglandsExtensions §2.1 (potential diagonalizability of ordinary and
Fontaine–Laffaille representations), §4.22; AutomorphicGaloisRepresentations §7.4;
PotentialModularityAndCompatibleSystems §9.2; SerreWeightAndLevelOptimisation §6.11;
PotentialAutomorphyInfrastructurePartII Layer 0 ("Soluble base change and descent of polarized
automorphy").

### 13.8 Symmetric-power lifting from two ordinary residual blocks (Newton–Thorne 2026 Proposition 6.3; Thorne 2024 Proposition 7.4)

Let `F` be totally real, `p ≥ 5`, `0 < r < p`, and `π` RAESDC on `GL_2(𝔸_F)`, ι-ordinary for some `ι`, of
weight zero, with residual image containing `SL_2(𝔽_{p^a})`, `a > a₀(p)`, and an unramified Steinberg
twist at a place `v_1 ∤ p`. Suppose there are ι-ordinary RAESDC `π_1` on `GL_{p−r}(𝔸_F)` and `π_2` on
`GL_{2r}(𝔸_F)` with residual representations `Sym^{p−r−1} r̄_{π,ι}` and
`φ_p(r̄_{π,ι}) ⊗ Sym^{r−1} r̄_{π,ι}`. Prove that there is an ι-ordinary RAESDC `Π` on `GL_{p+r}(𝔸_F)` with
`r_{Π,ι} ≅ Sym^{p+r−1} r_{π,ι}` (nt26 Proposition 6.3 and proof, pp. 49–50; th24 Proposition 7.4 and proof,
pp. 43–44; Theorem 7.5, p. 44, and proof, p. 45). These residual witnesses replace the hypotheses of th24 Proposition 7.4
that `Sym^{r−1} r_π` and `Sym^{p−r−1} r_π` are automorphic and that `TP_r` holds. Primitivity is weak
primitivity over `k̄` with the common splitting field.

*Proof sketch.* Pass to a CM quadratic extension with the conditions of th24 Proposition 7.4, linearly
disjoint over `F` from the extension of `F(ζ_p)` cut out by `r̄|_{G_{F(ζ_p)}}` (soluble base change; th24
proof of Theorem 7.6, p. 45). Twist the witnesses into conjugate self-dual cuspidal `σ_1`, `σ_2` with
`σ_2` Steinberg at the place above `v_1` (Khare–Wintenberger method with PotentialAutomorphyInfrastructurePartII Layer 5),
so that `Σ = σ_1 ⊞ σ_2` is regular algebraic, ι-ordinary of weight `0` and `r̄_Σ ≅ (Sym^{p+r−1} r̄)^{ss}`
(ArithmeticGaloisRepresentations §7.8). §6.9 gives a cuspidal ι-ordinary `Π_0` Steinberg at the
place above `v_1` with the same residual representation (its hypothesis (3) from an element `diag(t, t^{−1})`
with `1, t², …, t^{2(p+r−1)}` distinct, which exists since `a ≥ 3`). Residually reducible ordinary
lifting with a Steinberg place and an unobstructed auxiliary place
(PotentialAutomorphyInfrastructurePartII, gap:auxiliary-place-reducible-lifting, which is th24
Theorem 7.5; the form of ModularityAndLanglandsExtensions §4.2 does not apply, since over the CM
extension the cyclotomic field can lie in the field cut out by `ad r̄`, as a Check below shows) shows
`Sym^{p+r−1} r_π` automorphic; descend. The auxiliary place `w ∤ p` is chosen by Chebotarev with
Frobenius conjugate to some `σ ∈ G_F` such that `ε̄(σ) = −1` and `(α/β)^i ≠ −1` for
`1 ≤ i ≤ p + r − 1`, where `α`, `β` are the eigenvalues of `r̄(σ)`; then the eigenvalues of `σ` on
`ad(Sym^{p+r−1} r̄)(1)` are `−(α/β)^j` with `|j| ≤ p + r − 1`, none equal to `1`. Such `σ` exists: the
image of `(ad r̄, ε̄)` contains `(gh, −1)` for every `h ∈ PSL_2(𝔽_{p^a})` (enlarging `a` so that the
projective image is `PSL_2(𝔽_{p^a})` or `PGL_2(𝔽_{p^a})`; `PSL_2(𝔽_{p^a})` is simple), with `g` the image
of a complex conjugation, and an `h` in the centralizer of `g` makes the ratio of the eigenvalues of `gh` of
order larger than `2(p + r − 1)`; by the linear disjointness of the first step, `σ` may be taken in
the absolute Galois group of the CM extension (th24 proof of Theorem 7.6, pp. 46–47).

**Checks.**

- `p = 5`, `r = 1`: blocks `Sym³ r̄` (rank `4`) and `φ_5 r̄` (rank `2`), giving `Sym⁵` (rank `6`).
- Ranks: `(p − r) + 2r = p + r`.
- The decomposition is of semisimplifications only: `Sym^{p+r−1} r̄` is a non-split extension in general
  (ArithmeticGaloisRepresentations §7.8 gives an exact sequence), so `Σ` is congruent to
  `Sym^{p+r−1} r_π` only after semisimplification.
- The cyclotomic clause of ModularityAndLanglandsExtensions §4.2 can fail here, which is why the
  auxiliary-place form is used. Take `p = 7`, `F ⊇ ℚ(ζ_7)⁺` (so `[F(ζ_7) : F] = 2`), `a` odd with
  `a > a₀(7)`, and `r̄(G_F) = {g ∈ GL_2(𝔽_{7^a}) : det g = ±1}` with `det r̄ = ε̄^{−1}`; its projective
  image is `PGL_2(𝔽_{7^a})`. Since `7^a ≡ 3 mod 4`, `−1` is not a square in `𝔽_{7^a}`, so the only
  scalars in the image are `±1`, of determinant `1`, and `ε̄` is trivial on `ker ad r̄`. That kernel
  is the kernel of `ad (Sym^{p+r−1} r̄)^{ss}` (a scalar value of `(Sym^{p+r−1} r̄)^{ss}(σ)` forces the
  eigenvalues `α`, `β` of `r̄(σ)` to be equal, and then the factor
  `φ_p r̄` of the constituent `φ_p r̄ ⊗ Sym^{r−1} r̄` forces `r̄(σ)` scalar), so for every CM extension
  `K` of `F`, `K(ζ_7)` lies in the field cut out by `ad (Sym^{p+r−1} r̄)^{ss}|_{G_K}`, and no soluble
  base change restores the clause. The auxiliary place of the sketch still exists: `ε̄(σ) = −1` and the
  eigenvalues `−(α/β)^j` are never `1` (`j = 0` gives `−1`). For `n = 11`, §13.10 has only `p = 7`
  (`11/2 < p < 11`), so the choice of `p` does not avoid this case.
- The cyclotomic hypothesis of gap:auxiliary-place-reducible-lifting holds in this application:
  `r̄(G_{F(ζ_p)})` has index at most `p − 1 < 2p` in `r̄(G_F)`, so it contains a conjugate of
  `SL_2(𝔽_{p^a})`; after conjugation its projective image is `PSL_2(𝔽_{p^b})` or `PGL_2(𝔽_{p^b})` for
  some `b ≥ a`, and it lies between `SL_2(𝔽_{p^b})` and `k^× GL_2(𝔽_{p^b})` for a finite field
  `k ⊇ 𝔽_{p^b}` (ArithmeticGaloisRepresentations §§4.4, 7.9; th24 Lemma 7.3(3) and proof, pp. 42–43,
  whose proof writes the upper bound as `k^× SL_2(𝔽_{p^b})`, valid only in the `PSL_2` case). The
  `PGL_2` case occurs: in the setting of the preceding Check with `det r̄ = ε̄^{−1}χ̄`, `χ̄` quadratic
  and non-trivial on `G_{F(ζ_7)}`, the group `r̄(G_{F(ζ_7)})` is `{g ∈ GL_2(𝔽_{7^a}) : det g = ±1}`, of
  projective image `PGL_2(𝔽_{7^a})` of order `q(q² − 1)`, `q = 7^a`; a copy of `SL_2(𝔽_{7^b})` inside it
  forces `b ≤ a`, and the projective image of `k^× SL_2(𝔽_{7^b})` has order
  `7^b(7^{2b} − 1)/2 < q(q² − 1)`, so no sandwich with `k^× SL_2` exists. A quotient of `p`-power order
  kills the perfect group `SL_2(𝔽_{p^b})` and is then a quotient of a subgroup of
  `k^× GL_2(𝔽_{p^b})/SL_2(𝔽_{p^b})`, an abelian group (a quotient of
  `k^× × GL_2(𝔽_{p^b})/SL_2(𝔽_{p^b}) ≅ k^× × 𝔽_{p^b}^×`) of order dividing `(|k| − 1)(p^b − 1)`, prime
  to `p`, hence trivial; in the `PGL_2` instance above the quotient by `SL_2(𝔽_{7^a})` is `{±1}`, of
  order `2`, prime to `7`. The image of `(Sym^{p+r−1} r̄)^{ss}` on
  `G_{F(ζ_p)}` is a quotient of this group, and a twist by a character changes the image only by
  scalars, so the argument applies unchanged over the CM extension.

*Needs:* §6.9; PotentialAutomorphyInfrastructurePartII Layer 0, Layer 5, Layer 7 ("Weak primitivity
over a splitting coefficient field"), Layer 8 (gap:auxiliary-place-reducible-lifting, the lifting form
beside "Finiteness with an unobstructed auxiliary place", §8.16); ArithmeticGaloisRepresentations
§§4.4, 7.8, 7.9; Chebotarev Layer 10.

### 13.10 The induction proving SP_n for all n (Newton–Thorne 2026 Theorem 6.4)

Prove that `SP_n` holds for every `n ≥ 1`: for every totally real `F` and every non-CM RAESDC `π` on
`GL_2(𝔸_F)` there is a RAESDC `Π` on `GL_n(𝔸_F)` with `r_{Π,ι} ≅ Sym^{n−1} r_{π,ι}` for every `ι` (nt26
Theorem 6.4 and proof, p. 50). The printed list of induction hypotheses contains `SP_0` when
`r = 1`, which is not a statement; the case `r = 1` uses the coefficient-conjugate branch directly. The
ordinarity of the smaller witness is supplied by the Steinberg-at-`p` condition.

*Proof sketch.* Induction on `n`, with base cases `n ≤ 5` (ModularityAndLanglandsExtensions §1.15). For
`n ≥ 6` choose a prime `p` with `n/2 < p < n` (Mathlib `Nat.exists_prime_lt_and_le_two_mul` applied to
`⌊n/2⌋`) and write `n = p + r` with `0 < r < p`; the indices `r`, `r + 1`, `p − r` (and `r − 1` when `r > 1`)
are positive and smaller than `n`. By the one-prime criterion (ModularityAndLanglandsExtensions §4.15)
it suffices to prove automorphy of `Sym^{p+r−1} r_{π,ι}` for one `ι`. §13.7 gives `π′` over a soluble `E`
with the residual witness for `φ_p r̄ ⊗ Sym^{r−1} r̄`; `SP_{p−r}` gives a witness for `Sym^{p−r−1} r̄`,
ordinary since `π′` is Steinberg at `p`. §13.8 gives `Sym^{p+r−1} r_{π′}` automorphic, hence
`Sym^{p+r−1} r_π` by §13.7.

**Checks.**

- `n = 6`: `p = 5`, `r = 1`; the induction uses `SP_1`, `SP_2` and `SP_4`, with no `SP_0`.
- `n = 7`: `p = 5`, `r = 2`; it uses `SP_1`, `SP_2`, `SP_3` and `SP_{p−r} = SP_3`.
- `n = 12`: `p ∈ {7, 11}`; with `p = 7`, `r = 5` it uses `SP_4`, `SP_5`, `SP_6` and `SP_2`; with `p = 11`,
  `r = 1` it uses `SP_1`, `SP_2`, `SP_{10}`.

*Needs:* §§13.7, 13.8; ModularityAndLanglandsExtensions §§1.12, 1.15, 4.15; Mathlib
`Nat.exists_prime_lt_and_le_two_mul`.

### Examples

- `SP_6` over `ℚ`: `p = 5`, `r = 1`; witnesses for `Sym³ r̄` (from `SP_4`) and for `φ_5 r̄` (a coefficient
  conjugate), combined by §13.8.
- `SP_{11}`: `p = 7`, `r = 4` is the only choice with `n/2 < p < n`; it uses `SP_3`, `SP_4`, `SP_5` and
  `SP_3`, and needs no `TP_4`.

### Dependencies

Layers 6, 11, 12; ArithmeticGaloisRepresentations §§4.4, 7.6, 7.8, 7.9; ArithmeticGaloisDuality
§R02.3.5; GL2AutomorphicRepresentationsAndTransfer §§R16.3.7, R16.3.8; FiniteFlatGroupsAndIntegralPadicHodgeTheory
§R07.5.11; AutomorphicGaloisRepresentations §7.4; AutomorphicGaloisRepresentationsPartII AG2.6;
PotentialModularityAndCompatibleSystems §§9.2, 10.10; SerreWeightAndLevelOptimisation §6.11;
PotentialAutomorphyInfrastructurePartII Layers 0, 1, 5–8 (gap:auxiliary-place-reducible-lifting); LocalGaloisDeformationRings §2.15; ModularityAndLanglandsExtensions §§1.12, 1.15, 2.1, 2.16, 2.25,
4.15, 4.22; ClassFieldTheory Layers 12–14; Chebotarev Layer 10; Mathlib `NumberField.abs_discr_gt_two`,
`Nat.exists_prime_lt_and_le_two_mul`.

## Layer 14: endpoints over ℚ

This layer specialises §13.10 to `F = ℚ`: it proves Newton–Thorne's Theorems A, B and E and
symmetric power functoriality for every non-CM newform, and deduces the holomorphy of symmetric power
`L`-functions of level-one eigenforms and of non-CM newforms away from their level, which are the
statements of this roadmap's Lean file.

### 14.1 Theorem E in every rank

Prove that for every `n ≥ 3` there is a cuspidal, everywhere unramified `π` of `GL_2(𝔸_ℚ)` of weight
`k ≥ 2` with `Sym^{n−1} r_{π,ι}` automorphic for every `ι` (Theorem E); indeed every such `π` has
this property (nt21 Theorem 7.6, p. 90; nt26 Theorem 6.4, p. 50).

*Proof sketch.* Level-one eigenforms are non-CM and regular algebraic, so §13.10 over `F = ℚ` gives
`SP_n` for them.

**Checks.**

- `n = 3, 4, 5`: this also follows from ModularityAndLanglandsExtensions §1.15.
- The non-CM hypothesis of §13.10 holds: a level-one `π` is unramified everywhere, while its twist
  by a quadratic character ramifies at the primes dividing the conductor of that character, so `π`
  has no quadratic self-twist (§14.5).

*Needs:* §13.10; ModularityAndLanglandsExtensions §1.15.

### 14.2 Theorem A in level one and Theorem B

Prove: (1) for every `n ≥ 2` and every RAC automorphic `π` of `GL_2(𝔸_ℚ)` of level one,
`Sym^{n−1} π` exists as a cuspidal automorphic representation of `GL_n(𝔸_ℚ)` (Theorem A); (2) for
every `n ≥ 2` and every non-CM cuspidal `π` of `GL_2(𝔸_ℚ)` of weight `≥ 2` with no supercuspidal local
component, `Sym^{n−1} π` exists (Theorem B) (nt21 Theorem A, p. 2, Theorem 7.7, p. 91, Theorem 8.1,
p. 91; nt26 Theorem 6.4, p. 50).

*Proof sketch.* Both are specialisations of §13.10 to `F = ℚ`, with the all-place lift of
ModularityAndLanglandsExtensions §4.15. Cuspidality: for a non-CM `π` the image of `r_{π,ι}` is
Zariski dense in `GL_2` (AutomorphicGaloisRepresentations §7.5), so `Sym^{n−1} r_{π,ι}` is
irreducible and `Sym^{n−1} π` is not an isobaric sum of smaller blocks.

**Checks.**

- Every level-one form is non-CM, so (1) is the case of (2) with no ramification at all.
- A CM form has `Sym² π` non-cuspidal; it is excluded from (2) and treated by
  ModularityAndLanglandsExtensions §4.13.
- A semistable elliptic curve over `ℚ` has no supercuspidal component, so (2) applies to it.

*Needs:* §13.10; AutomorphicGaloisRepresentations §7.5; ModularityAndLanglandsExtensions §§4.13,
4.15.

### 14.3 Symmetric power functoriality for every non-CM newform (Newton–Thorne II Theorem A)

Prove that for every `n ≥ 1` and every non-CM regular algebraic cuspidal `π` of `GL_2(𝔸_ℚ)`, `Sym^{n−1} π`
exists (nt21b Theorem A, p. 1; nt26 Theorem 6.4, p. 50). Non-CM is the self-twist condition of
GL2AutomorphicRepresentationsAndTransfer §R16.4.6; the consequence for the Euler products of
newforms away from their level is §14.5.

*Proof sketch.* §13.10 over `F = ℚ`.

**Checks.**

- `n = 1, 2` are trivial.
- A non-CM elliptic curve over `ℚ` with supercuspidal reduction at `2` or `3` is covered: §13.10
  imposes no condition on the local components.
- The statement is about existence at every place (ModularityAndLanglandsExtensions §1.10); at the
  ramified primes the local components are `Sym^{n−1}` of `rec(π_l)`, which need not be determined by
  the Fourier coefficients alone.

*Needs:* §13.10; ModularityAndLanglandsExtensions §1.10; GL2AutomorphicRepresentationsAndTransfer
§R16.4.6.

### 14.4 Holomorphy of symmetric power L-functions of level-one eigenforms

Let `f` be a normalised Hecke eigenform of level one and weight `k` (Tau Ceti `HeckeRing.GL2.Newform`
with `N = 1`), `{α_p, β_p}` its Satake parameters at the prime `p`
(`HeckeRing.GL2.Newform.satakeParameters`, the roots of `X² − a_p X + p^{k−1}`), and `n ≥ 1`. Define
the Euler factor `symPowerEulerFactor n α β x = ∏_{j=0}^{n} (1 − α^j β^{n−j} x)`. Prove that the Euler
product `∏_p symPowerEulerFactor n α_p β_p (p^{−s})^{−1}` converges for `Re s > n(k − 1)/2 + 1` to a
function which extends to an entire function on `ℂ` (`symPowerEulerProduct_levelOne_entire`; nt21
Theorem A, p. 2; the entire continuation follows by Godement–Jacquet, as nt21 Corollary C, p. 2,
records for semistable elliptic curves). The factor is symmetric in `α` and `β`, so the statement
does not depend on the ordering of the Satake parameters.

**API.**

- `symPowerEulerFactor n α β x` is a finite product of `n + 1` linear factors in `x`, a polynomial of
  degree at most `n + 1` with value `1` at `x = 0`; at `n = 0` it is `1 − x`.
- It is symmetric under exchanging `α` and `β` (reindex `j ↦ n − j`), so it depends only on the
  unordered pair of Satake parameters; the Lean file proves this symmetry.
- For `n = 1` and Satake parameters `{α_p, β_p}` it is `1 − a_p x + α_p β_p x²`, the reciprocal Euler
  factor of `L(s, f)` (Tau Ceti `HeckeRing.GL2.Newform.prod_map_one_sub_mul_satakeParameters`).
- At `x = p^{−s}` with the Satake parameters of `f` at an unramified prime it is the reciprocal of the
  local factor at `p` of `L(s − n(k − 1)/2, Sym^n π_f)`.
- `symPowerEulerProduct_levelOne_entire`: for level one and `n ≥ 1` the product over all primes
  converges for `Re s > n(k − 1)/2 + 1` and extends to an entire function.

*Proof sketch.* By §14.2(1) applied with `n + 1`, `Π = Sym^n π_f` is a cuspidal automorphic
representation of `GL_{n+1}(𝔸_ℚ)`, unramified at every prime, with Satake parameters
`α_p^j β_p^{n−j} p^{−n(k−1)/2}` at `p`. Its finite standard `L`-function is entire, because the
completed function is entire for cuspidal `Π` of `GL_m`, `m ≥ 2`, and the archimedean factor has no
zeros (AutomorphicLFunctionsAndLocalFactors AL.2.4.1). Its Euler product converges absolutely for
`Re s > 1` (AL.3.6.1, the Jacquet–Shalika boundary after the Rankin–Selberg pole criterion), and no
local factor vanishes or has a pole there, since `|α_p^j β_p^{n−j} p^{−n(k−1)/2}| < p^{1/2}` (AL.3.3.8);
so the product of the inverted factors converges unconditionally. The Euler product of the statement
at `s` is `L(s − n(k − 1)/2, Π)`.

**Checks.**

- `n = 0` is excluded: the product is then `∏_p (1 − p^{−s})^{−1} = ζ(s)`, which has a pole at `s = 1`.
- `n = 1`: the statement is the entirety of `L(s, f)`, which Tau Ceti already records
  (`hasEntireExtension_qExpansion_coeff` in `TauCeti/NumberTheory/ModularForms/LFunction/Basic.lean`); the
  region `Re s > (k + 1)/2` is that of absolute convergence given Deligne's bound
  `|α_p| = p^{(k−1)/2}`.
- For `Δ` (`k = 12`) and `n = 2`, the factor at `p = 2` is
  `(1 − α²x)(1 − αβx)(1 − β²x)` with `α + β = −24`, `αβ = 2^{11}`, that is
  `1 − (α² + αβ + β²)x + αβ(α² + αβ + β²)x² − (αβ)³x³` with `α² + αβ + β² = 576 − 2048 = −1472`.

*Needs:* §14.2; AutomorphicLFunctionsAndLocalFactors AL.2.4.1, AL.3.3.8, AL.3.6.1; Tau Ceti `HeckeRing.GL2.Newform`,
`HeckeRing.GL2.Newform.satakeParameters`, `HeckeRing.GL2.Newform.exists_satakeParameters_eq_pair`;
Mathlib `HasProd`, `Differentiable`.

### 14.5 Holomorphy of symmetric power L-functions of non-CM newforms

Let `f` be a newform of level `N` and weight `k ≥ 2` (Tau Ceti `HeckeRing.GL2.Newform`, with
nebentypus `χ_f`), `a_p` its `q`-expansion coefficients (Mathlib `UpperHalfPlane.qExpansion` with
period `1`), and `{α_p, β_p}` its Satake parameters at the primes `p ∤ N`, the roots of
`X² − a_p X + χ_f(p) p^{k−1}`. Define `HasQuadraticSelfTwist f` to mean that for some modulus `M > 0`
there is a Dirichlet character `ψ` modulo `M` (Mathlib `DirichletCharacter ℂ M`) with `ψ ≠ 1`,
`ψ² = 1` and `a_p ψ(p) = a_p` at every prime `p ∤ NM`. The non-CM condition itself is owned by
GL2AutomorphicRepresentationsAndTransfer §R16.4.6 on cuspidal classes of `GL_2`; this predicate is
its coefficient form on newforms, the carrier that Tau Ceti provides: for `k ≥ 2`, `π_f` is CM in that
sense exactly when `HasQuadraticSelfTwist f` holds (nt21 p. 2, footnote 1). Prove
(`symPowerEulerProduct_entire_of_not_hasQuadraticSelfTwist`) that if `f` has no quadratic self-twist
and `n ≥ 1`, the Euler product over the primes `p ∤ N` of
`symPowerEulerFactor n α_p β_p (p^{−s})^{−1}` converges for `Re s > n(k − 1)/2 + 1` to a function
which extends to an entire function on `ℂ` (nt21b Theorem A, p. 1, with Godement–Jacquet). Only the
Satake parameters at `p ∤ N` enter; the factors at `p | N` are omitted.

*Proof sketch.* If `π_f ≅ π_f ⊗ χ` for a quadratic Hecke character `χ ≠ 1` of `ℚ`, let `ψ` be the
primitive Dirichlet character of `χ`, of conductor `M > 1`; comparing the Hecke eigenvalues of
`π_f ⊗ χ` and `π_f` at the primes `p ∤ NM` (GL2AutomorphicRepresentationsAndTransfer §R16.4.4,
newform adapter) gives `a_p ψ(p) = a_p`, so `HasQuadraticSelfTwist f`. Hence `π_f` is non-CM, and it is
regular algebraic since `k ≥ 2`. By §14.3, `Π = Sym^n π_f` is a cuspidal automorphic representation
of `GL_{n+1}(𝔸_ℚ)`, unramified at `p ∤ N` with Satake parameters `α_p^j β_p^{n−j} p^{−n(k−1)/2}`. Its
finite `L`-function is entire (AutomorphicLFunctionsAndLocalFactors AL.2.4.1) and its Euler product
converges absolutely for `Re s > 1` with non-zero factors (AL.3.6.1, AL.3.3.8). The product of the
statement at `s` is
`L(s − n(k − 1)/2, Π) ∏_{p | N} L_p(s − n(k − 1)/2, Π_p)^{−1}`, and each `L_p(·, Π_p)^{−1}` is a
polynomial in `p^{−s}`, so the product extends to an entire function.

**API.**

- `HasQuadraticSelfTwist f` is a predicate on Tau Ceti newforms of any level and weight, defined
  from the prime-indexed `q`-expansion coefficients and Mathlib's Dirichlet characters, with real
  body: a positive modulus, a non-trivial character of order dividing `2`, and the identity at every
  prime coprime to `NM`.
- If it holds with `(M, ψ)`, it holds with `(MM′, ψ′)` for every `M′ > 0`, where
  `ψ′ = DirichletCharacter.changeLevel h ψ` for `h : M ∣ MM′` (Mathlib): on the units of `ℤ/MM′`
  it is `ψ` composed with the unit-group map `(ℤ/MM′)^× → (ℤ/M)^×` (`ZMod.unitsMap`), and it
  vanishes on the non-units. Then `ψ′ ≠ 1` because `changeLevel` is injective for the non-zero
  modulus `MM′` (`DirichletCharacter.changeLevel_eq_one_iff`), `ψ′² = 1` because `changeLevel` is a
  monoid homomorphism, `ψ′(p) = ψ(p)` at every prime `p` prime to `MM′`
  (`DirichletCharacter.changeLevel_eq_cast_of_dvd'`), and fewer primes are tested.
- For `k ≥ 2`, `π_f` is CM in the sense of GL2AutomorphicRepresentationsAndTransfer §R16.4.6 exactly
  when `HasQuadraticSelfTwist f` holds; the direction "CM implies a quadratic self-twist" is the
  eigenvalue comparison above, and the converse is strong multiplicity one (§R16.4.4, via
  AutomorphicLFunctionsAndLocalFactors AL.3.7.1).
- `symPowerEulerProduct_entire_of_not_hasQuadraticSelfTwist`: the analytic conclusion above, for
  every level `N`, weight `k ≥ 2` and `n ≥ 1`.

**Checks.**

- The condition `M > 0` is needed: modulo `0` the coprimality `p ⊥ N · 0` forces `p = 1`, so no
  prime is tested, and the sign character of `ℤ^× = {±1}` is a non-trivial Dirichlet character
  modulo `0` with square `1`; without `M > 0` every newform would have a quadratic self-twist.
- Modulo `1` and modulo `2` every Dirichlet character is trivial, since `(ℤ/1)^×` and `(ℤ/2)^×` are
  trivial; the smallest moduli that can witness a self-twist are `3` and `4`.
- Enlarging the modulus goes through the unit groups, not through the ring map `ℤ/12 → ℤ/4`. For
  `ψ = χ_{−4}` (Mathlib's `ℤ`-valued `ZMod.χ₄` composed with `ℤ → ℂ`, values `0, 1, 0, −1`) and
  `M′ = 3`, the composite with the ring
  map takes the value `χ_{−4}(3) = −1` at the non-unit `3` of `ℤ/12`, where every Dirichlet
  character modulo `12` vanishes (`MulChar.map_nonunit`); so it is not a Dirichlet character modulo
  `12`, and its square is `1` at `3` while the principal character modulo `12` is `0` there.
  `changeLevel` gives `ψ′(3) = 0` and `ψ′(7) = χ_{−4}(3) = −1`.
- The newform of level `32` and weight `2` attached to `y² = x³ − x` has `a_p = 0` for `p ≡ 3`
  modulo `4` and `a_5 = −2`; with `ψ = χ_{−4}` modulo `4`, `0 · (−1) = 0` and `(−2) · 1 = −2`, and in
  general `a_p ψ(p) = a_p` at every odd prime, so it has a quadratic self-twist and is excluded. The
  exclusion is needed: for `n = 4`, `α_p² β_p² = p²` at every odd `p`, so the product contains
  `ζ(s − 2)(1 − 2^{2−s})`, with a pole at `s = 3 = n(k − 1)/2 + 1`, while the remaining factor is a
  product of Hecke `L`-functions of `ℚ(i)` at the edge of absolute convergence, non-zero at `s = 3`;
  so no entire extension exists. (For `n = 2` the product of a CM form is still entire, so `n = 2`
  does not detect the hypothesis.)
- For `Δ` (`N = 1`, `k = 12`) the candidate `ψ = χ_{−4}` fails at `p = 3`: `252 · (−1) = −252 ≠ 252`.
  No level-one form has a quadratic self-twist, since `π_f` is unramified everywhere while
  `π_f ⊗ χ` ramifies at the primes dividing the conductor of `χ`; for `N = 1` the statement contains
  that of §14.4.
- The weight bound is needed. A weight-one newform with icosahedral projective image has no
  quadratic self-twist, but its Galois representation has finite image, so some symmetric power
  contains the trivial representation and the product then contains `ζ(s)` up to finitely many
  factors, with a pole at `s = 1 = n(k − 1)/2 + 1`.
- `n = 0` is excluded: the product is `ζ(s) ∏_{p | N} (1 − p^{−s})`, with a pole at `s = 1` because
  `∏_{p | N} (1 − p^{−1}) ≠ 0`.

*Needs:* §14.3; §14.4 (`symPowerEulerFactor`); AutomorphicLFunctionsAndLocalFactors AL.2.4.1, AL.3.3.8,
AL.3.6.1, AL.3.7.1;
GL2AutomorphicRepresentationsAndTransfer §§R16.4.4, R16.4.6; Tau Ceti `HeckeRing.GL2.Newform`,
`HeckeRing.GL2.Newform.satakeParameters`; Mathlib `DirichletCharacter`,
`DirichletCharacter.changeLevel`, `UpperHalfPlane.qExpansion`, `HasProd`, `Differentiable`.

### Examples

- `Δ`, `n = 2`: `L(s, Sym² Δ)` is entire; its Euler factor at `2` is computed in §14.4.
- `E: y² + y = x³ − x² − 10x − 20` (conductor `11`, semistable): §14.2(2) gives every `Sym^{n−1}`,
  and §14.5 applied to its weight-two newform of level `11` gives entire `L`-functions of `Sym^n E`
  away from `11`.

### Dependencies

Layer 13; AutomorphicGaloisRepresentations §7.5;
AutomorphicLFunctionsAndLocalFactors AL.2.4.1, AL.3.3.8, AL.3.6.1, AL.3.7.1;
GL2AutomorphicRepresentationsAndTransfer §§R16.4.4, R16.4.6;
ModularityAndLanglandsExtensions §§1.10, 1.15, 4.13, 4.15; Tau Ceti `HeckeRing.GL2.Newform`; Mathlib
`DirichletCharacter`, `UpperHalfPlane.qExpansion`.

## Downstream consumers

- Roadmaps on the cuspidal cohomology of `GL_n(ℤ)` and level-one change of weight consume §§13.10 and
  14.2.
- The technique of Layer 9 and Layer 12 (patching a pseudodeformation ring against a rank-two
  deformation ring) is reused wherever functoriality lifting is proved without residual adequacy of the
  target.

## Worked examples

- **Bertrand at `n = 11`.** The only prime with `11/2 < p < 11` is `7`, so `r = 4`; Thorne 2024's route
  would need `TP_4`, while §13.10 uses `SP_3`, `SP_4`, `SP_5` and `SP_3`.

## Scope and ownership

This roadmap owns the statements and the proofs of Thorne's level raising to Steinberg (§6.9), the
automorphy of the untwisted tensor (§11.10), tensor-product functoriality lifting with one factor
fixed (§12.7), the residual twisted-tensor witnesses (§§13.5–13.6), `SP_n` for every `n` over every
totally real field (§13.10), and the endpoints over `ℚ` of Layer 14: Newton–Thorne's Theorems A, B
and E, symmetric power functoriality for every non-CM newform and the holomorphy statements of
§§14.4–14.5. ModularityAndLanglandsExtensions, a supplier, formulates `SP_n` (§1.12) and proves it
for `n ≤ 5` (§1.15); no section of that roadmap is proved here. This roadmap also owns every
intermediate object of those proofs that no earlier roadmap states: the deformation data of Layers
9, 11 and 12, the companion forms of Newton–Thorne 2026 Lemmas 5.6 and 5.7 and the hypotheses
`S5-global`, `S5-local`.

It imports, by section and never re-plans:

- from ModularityAndLanglandsExtensions: the automorphy predicate in Newton–Thorne's sense (§0.2),
  the projective image condition (§1.7), the symmetric power lift and `SP_n` (§§1.10, 1.12), the
  tensor and low-rank lifts (§§1.11, 1.15), Moret–Bailly with Galois control (§2.13),
  characteristic-zero enormous image and adjoint Selmer vanishing (§4.1), potential
  diagonalizability and its criteria (§2.1), potentially diagonalizable lifting (§2.16), ordinary
  lifting with several residual constituents (§4.2), the one-prime criterion (§4.15) and the
  Clozel–Thorne reductions with Newton–Thorne 2026 Proposition 6.1 and Thorne 2024 §8 (§4.22);
- from PotentialAutomorphyInfrastructurePartII: ι-ordinarity, soluble descent and auxiliary
  characters (Layer 0), connection of local lifts (Layer 1), the determinant subring (Layer 2),
  definite unitary groups, algebraic modular forms, Hecke algebras and ordinary deformation data
  (Layer 3), Taylor–Wiles data (Layer 4), ordinary automorphy lifting and finiteness (Layer 5),
  residually reducible deformation rings, generic primes and the generic `R = T` theorem (Layers 7,
  8), adjoint Bloch–Kato Selmer groups and semistable pseudodeformation rings (Layer 9); auxiliary
  cyclic CM extensions with prescribed split places from PotentialAutomorphyInfrastructure §2.5, and
  soluble extensions with prescribed completions and the ordinary companion of Newton–Thorne 2026
  Lemma 3.1 from PotentialModularityAndCompatibleSystems §§2.16, 9.2;
- the deformation theory of LocalGaloisDeformationRings, GlobalGaloisDeformations and
  DeformationAndDerivedPatchingAlgebra; cyclic base change for `GL_n` and unitary base change and
  descent from EndoscopicTransferAndUnitaryTraceComparison; Iwahori–Hecke algebras, induction and
  cuspidal support from SmoothRepresentationsOfLocalGroups; adequacy, Clebsch–Gordan
  decompositions, Dickson's classification and enormous subgroups from
  ArithmeticGaloisRepresentations; the exponent-two ramification fields and the reciprocity of the
  two auxiliary splitting conditions from ArithmeticGaloisDuality §R02.3.5 (this is Newton–Thorne
  2026 Lemma 5.3, which is therefore not restated here); quaternionic patching for `GL_2` from GL2ModularityLifting; tamely dihedral local
  representations and the non-CM self-twist condition on cuspidal classes of `GL_2` from
  GL2AutomorphicRepresentationsAndTransfer (§14.5 keeps only the coefficient form of that condition on
  Tau Ceti newforms, the carrier its Lean statement needs); the remaining suppliers are listed with
  their sections below.

The level-one cuspidal cohomology of `GL_n(ℤ)` and the local theory of `GSp_4`, which use symmetric
power functoriality as an input but different methods, are outside this roadmap; Sato–Tate and the
Bianchi and CM-field results of the parent are not touched. Newton–Thorne's proofs over `ℚ` by
continuation of automorphy along eigenvarieties from one level-one form, and Clozel–Thorne's level
raising for the sixth and eighth symmetric powers, are outside this roadmap: every endpoint over `ℚ`
here is a specialisation of §13.10.

## Exact supplier contracts

### From Mathlib

- `Nat.exists_prime_lt_and_le_two_mul` (`Mathlib/NumberTheory/Bertrand.lean`): Bertrand's
  postulate, for the choice `n/2 < p < n` in §13.10 (applied to `⌊n/2⌋`: a prime `p` with
  `⌊n/2⌋ < p ≤ 2⌊n/2⌋` satisfies `p < n` for `n ≥ 6`, since an even `n > 2` is not prime).
- `NumberField.abs_discr_gt_two` (`Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean`):
  a number field of degree `> 1` has `|d_K| > 2`, so some prime ramifies; used in §13.4 to see
  that the Galois group of a coefficient field is generated by its inertia subgroups.
- `HasProd`, `Differentiable`, `Complex.cpow`: the analytic carriers of the statements of §§14.4–14.5.
- `DirichletCharacter` (`Mathlib/NumberTheory/DirichletCharacter/Basic.lean`): `MulChar (ZMod M) ℂ`,
  whose identity `1` is `1` on units and `0` on non-units; modulo `0` it is a character of `ℤ`, which
  is why §14.5 requires a positive modulus. Every character vanishes on non-units
  (`MulChar.map_nonunit`, `Mathlib/NumberTheory/MulChar/Basic.lean`).
- `DirichletCharacter.changeLevel` (`Mathlib/NumberTheory/DirichletCharacter/Basic.lean`): for
  `n ∣ m`, the monoid homomorphism from characters modulo `n` to characters modulo `m` that composes
  with the unit-group map `ZMod.unitsMap` and extends by zero; it is injective for `m ≠ 0`
  (`DirichletCharacter.changeLevel_injective`, `DirichletCharacter.changeLevel_eq_one_iff`) and
  agrees with the original character on integers prime to `m`
  (`DirichletCharacter.changeLevel_eq_cast_of_dvd'`). It is the enlargement of the modulus in the
  API of §14.5.
- `UpperHalfPlane.qExpansion` (`Mathlib/NumberTheory/ModularForms/QExpansion.lean`): the
  `q`-expansion of a function on the upper half-plane with a given period, here `1`; its prime
  coefficients are the `a_p` of §14.5.

### From Tau Ceti

- `HeckeRing.GL2.Newform` (`TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean`): a
  normalised newform of level `Γ₁(N)` and weight `k`, with nebentypus; for `N = 1` these are the
  normalised Hecke eigenforms of level one.
- `HeckeRing.GL2.Newform.satakeParameters`,
  `HeckeRing.GL2.Newform.exists_satakeParameters_eq_pair`,
  `HeckeRing.GL2.Newform.LSeries_eulerProduct_hasProd_satakeParameters`
  (`TauCeti/NumberTheory/ModularForms/Newforms/Satake.lean`): the Satake parameters at `p` are the
  multiset of roots of `X² − a_p X + χ(p) p^{k−1}`, an unordered pair, and they factor the Euler
  product of `L(s, f)` for `Re s > (k + 1)/2`;
  `HeckeRing.GL2.Newform.prod_map_one_sub_mul_satakeParameters` is the factorisation
  `(1 − α_p x)(1 − β_p x) = 1 − a_p x + χ(p) p^{k−1} x²` used in §14.4. At a prime dividing the level
  the parameters are `a_p` and `0`, which is why §14.5 takes its product over `p ∤ N` only. No
  Ramanujan–Deligne bound is supplied and none is used: the half-plane of §§14.4–14.5 comes from
  AutomorphicLFunctionsAndLocalFactors AL.3.6.1.
- `CuspForm.hasEntireExtension_qExpansion_coeff`
  (`TauCeti/NumberTheory/ModularForms/LFunction/Basic.lean`): the `L`-series of a cusp form of positive
  weight has an entire extension; it is the case `n = 1` of §14.4.

### From TauCetiRoadmap.ModularityAndLanglandsExtensions

- §0.2 (automorphy predicate), §1.7 (projective image sandwich), §1.10 (symmetric power lift with
  its all-place predicate), §1.11 (Ramakrishnan's `GL_2 × GL_2`), §1.12 (`SP_n`), §1.15 (`SP_n` for
  `n ≤ 5`), §2.1 (potential diagonalizability for potentially crystalline full character flags and for
  crystalline representations over unramified local fields with labelled weights in an interval
  of length `l − 2`), §2.16 (potentially diagonalizable polarized lifting over imaginary CM fields:
  odd `l`, regular algebraic irreducible polarized lift, potentially diagonalizable above `l`,
  cyclotomically irreducible residual representation, `ζ_l ∉ F`, `l ≥ 2(d + 1)` for the maximal
  constituent dimension `d` on the Sylow-pro-`l`-generated subgroup, and an ordinary or potentially
  diagonalizable automorphic residual pair), §2.25 (lifts with prescribed potentially diagonalizable
  local components over imaginary CM fields: odd `l`, `ζ_l ∉ F`, a polarized
  residual representation unramified outside a finite set of split places, cyclotomically
  irreducible, `l ≥ 2(d + 1)`, and potentially diagonalizable local lifts with `n` distinct labelled
  weights above `l`; no residual automorphy is assumed), §2.13 (Moret–Bailly with prescribed local
  extensions), §4.1 (enormous image and adjoint Selmer vanishing), §4.2 (ordinary lifting with several
  residual constituents, Allen–Newton–Thorne, the template of the auxiliary-place variant requested
  from PotentialAutomorphyInfrastructurePartII below), §4.13 (symmetric powers of CM and weight-one
  forms, the case that §14.2(2) excludes), §4.15 (one prime suffices), §4.22 (Clozel–Thorne
  reductions, Newton–Thorne 2026 Proposition 6.1, Thorne 2024 §8). These are used as stated there.

### From TauCetiRoadmap.PotentialAutomorphyInfrastructure

§2.5 ("Auxiliary soluble and cyclic extensions"): cyclic extensions of a number field of prescribed
degree, disjoint from a given Galois extension, with a given finite set of places split completely,
and CM when the base is imaginary CM. Extensions in which a finite set of places splits completely
come from here; soluble extensions with prescribed non-trivial completions come from
PotentialModularityAndCompatibleSystems §2.16, as §2.5 itself directs.

### From TauCetiRoadmap.PotentialAutomorphyInfrastructurePartII

Cited by layer and by the title of the target in that layer; the titles are those of the
supplier's sections.

- Layer 0: "Ordinarity of a regular algebraic isobaric sum" (§0.7); "Automorphy is invariant under
  algebraic twists" (§0.8); "Soluble base change and descent of polarized automorphy" (§0.9);
  "Automorphy of an induced representation descends" (§0.10); "Algebraic characters with prescribed
  conjugate norm and local behaviour" (§0.11).
- Layer 1: "Strong connection and component deformation problems" (§1.1) and "Properties of
  strong connection; Choi's lemma and the filtration lemma" (§1.2); "Generic local representations
  are smooth points, and smooth points are dense" (§1.3).
- Layer 2: "The subring `P_𝒮` generated by characteristic polynomials" (§2.2).
- Layer 3: the definite unitary group (§3.1), algebraic modular forms (§3.2), "Exactness and
  group-ring freeness at level without `l`-torsion" (§3.4), base change and descent with `GL_n`
  (§3.5), "Residual and `𝒢_n`-valued Galois representations of Hecke maximal ideals" (§3.7), the big
  ordinary Hecke algebra (§3.9), ordinary deformation data with the surjection `P_D → 𝕋_D` when
  every local ring is a fixed-type or unipotent ring (§3.10). These are stated for odd `l`.
- Layer 4: Taylor–Wiles data with a residual eigenspace (§4.1); Taylor–Wiles level structures and
  the parahoric projection (§4.2).
- Layer 5: "Adequacy relaxed to the vanishing of `H¹(H, ad)`" (§5.4), "Ordinary automorphy lifting
  with relaxed-adequate image" (§5.5), "Finiteness of ordinary polarized deformation rings with
  relaxed-adequate image" (§5.7), "Characteristic-zero lifts from finiteness and the dimension bound"
  (§5.8).
- Layer 7: "Weakly and strongly primitive representations" (§7.1), "Restriction of
  pseudodeformations to a finite-index subgroup is finite" (§7.5), "The reducible locus is small in
  the presence of Steinberg places" (§7.7), "Generic primes of an ordinary deformation ring" (§7.8),
  "Large quotients contain generic primes" (§7.9), "Twisting and soluble base change for residually
  reducible rings and Hecke algebras" (§7.11), "Absolute irreducibility at a generic prime survives
  restriction" (§7.13), "Weak primitivity over a splitting coefficient field" (§7.15), "The
  weak-primitive generic `R = T` theorem" (§7.19). "Primitive" below means weakly primitive in the
  sense of §7.1 (Conventions).
- Layer 8: "The ANT set-up" (the ordinary Hecke algebra `𝕋₁` of the definite unitary group of the
  algebra ramified at `B`, and the map `η : P₁ → 𝕋₁` for the problem with Steinberg conditions at
  `B`), "Connectedness: every minimal prime is potentially pro-automorphic" (§8.5, with its
  connectedness bound from the local and global presentations), "Global lifts with prescribed local
  components (Schur form)" (§8.14), "Finiteness of ordinary locally Steinberg deformation rings"
  (§8.7), "Finiteness with an unobstructed auxiliary place" (§8.16).
- Layer 9: "Semistable conjugate self-dual pseudodeformation rings" (§9.4), "The pseudodeformation
  ring is its residue field at an automorphic point" (§9.7). The residue-field theorem retains
  semistability in the fixed Hodge interval, the fixed multiplier, splitting of `S` in the CM field
  and enormous cyclotomic image. Adjoint Selmer vanishing is imported from
  ModularityAndLanglandsExtensions §4.1.

What PotentialAutomorphyInfrastructurePartII must provide (gap:auxiliary-place-reducible-lifting): in Layer 8, beside "Finiteness with an unobstructed auxiliary place" (§8.16), its lifting form, Thorne 2024 Theorem 7.5 (th24 p. 44; proof, p. 45). Let `F` be imaginary CM, `n ≥ 2`, `l > 3` a prime with `l ∤ n`, and `ρ : G_F → GL_n(ℚ̄_l)` continuous, semisimple, ramified at finitely many places, ordinary of some weight, with `ρ^c ≅ ρ^∨ε^{1−n}`. Assume the hypotheses of ModularityAndLanglandsExtensions §4.2: `ρ̄^{ss} ≅ ρ̄_1 ⊕ ⋯ ⊕ ρ̄_d` with the `ρ̄_i` absolutely irreducible, pairwise non-isomorphic and each with `ρ̄_i^c ≅ ρ̄_i^∨ε̄^{1−n}`; a place `v₀ ∤ l` at which `ρ|^{ss}_{G_{F_{v₀}}}` is an unramified twist of `⊕_{i=1}^{n} ε^{1−i}`; an ι-ordinary RACSDC `π` of `GL_n(𝔸_F)` with `r̄_ι(π)^{ss} ≅ ρ̄^{ss}` and `π_{v₀}` an unramified twist of Steinberg; `F ⊄ F⁺(ζ_l)`; the `ρ̄_i|_{G_{F(ζ_l)}}` absolutely irreducible and pairwise non-isomorphic; `ρ̄^{ss}` weakly primitive over `k̄`, with `ρ̄^{ss}(G_F)` without quotient of order `l`. Replace its clause `F(ζ_l) ⊄ F̄^{ker ad(ρ̄^{ss})}` by a place `w ∤ l` of `F` at which `ρ̄^{ss}` is unramified and `H⁰(G_{F_w}, ad ρ̄^{ss}(1)) = 0`, and add the hypothesis of §8.16 that `ρ̄^{ss}(G_{F(ζ_l)})` has no non-trivial quotient of `l`-power order. Then `ρ ≅ r_ι(Π)` for an ι-ordinary RACSDC `Π` of `GL_n(𝔸_F)`. The finiteness of §8.16 and the route of ModularityAndLanglandsExtensions §4.2 are its inputs.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups and OrdinaryAutomorphicFormsAndModularityLiftingPartII

Used at `p = 2` in §§9.4 and 12.4, where the Layer 3 statements of
PotentialAutomorphyInfrastructurePartII, stated for odd `l`, do not apply.

- AutomorphicFormsOnReductiveGroups §7.4 (algebraic modular forms `S(J, M)` of level `J` with
  coefficients in a finite module over an arbitrary commutative `𝒪`-algebra, restriction, trace
  and double coset operators) and §7.5 (the stabilizers `Γ_i` are finite and
  `S(J, M) ≅ ⊕_i M^{Γ_i}`; sufficiently small level, base change of coefficients, and the
  realization in automorphic forms), with no condition on the residue characteristic.
- OrdinaryAutomorphicFormsAndModularityLiftingPartII §2.1 (the forms `S_{λ,{χ_v}}(U, A)` on the
  definite unitary group of PotentialAutomorphyInfrastructurePartII §3.1 at `l = 2`) and §2.3 (every
  irreducible constituent `π` of `S_{λ,{χ_v}}(ℚ̄₂)` has a continuous semisimple
  `r_2(π) : G_K → GL_n(ℚ̄₂)`, unique up to isomorphism, compatible up to semisimplification with
  `π` at every split place prime to `2` outside `R`, so that at a split place where `π` is
  unramified the characteristic polynomial of Frobenius is the Hecke polynomial). That roadmap's
  Layer 2 assumes that the CM extension is unramified at every finite place, that every place above
  `2` splits in it, and that `4 | n[F : ℚ]` for the totally real base `F`; §9.1 (reductions (6) and
  (11)) and §12.1 (reductions (11) and (14), with `n = 2r` even) arrange these.

### From TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants

§0.2 (Chenevier determinants and the determinant of a matrix representation), §0.5 (a determinant
is determined by its trace when `d!` is invertible), §1.4 (reducibility ideals: for a determinant
`D` over a Henselian local ring `A` with split multiplicity-free residual law and a partition `P` of
its residual constituents, an ideal `I_P` such that, for every ideal `J` in the maximal ideal,
`D mod J` is a product of determinants with the prescribed residual products exactly when
`I_P ⊆ J`, and then the factors are unique; so reducibility of type `P` is the Zariski closed
condition `V(I_P)` and the decomposition of a residually multiplicity-free determinant is unique),
§4.1 (compact coefficient-ring gluing: given a compact Hausdorff ring `A`, jointly injective
continuous maps from `A` to Hausdorff rings `B_i` and continuous determinants `D_i` over the `B_i`
such that, at each element of a dense subset of the group, each characteristic coefficient of all
the `D_i` is the image of one element of `A`, there is a unique continuous determinant over `A`
whose coefficient change to each `B_i` is `D_i`).

### From TauCetiRoadmap.LocalGaloisDeformationRings

Layer 2: §2.13 (unrestricted rings away from `p` are complete intersections), §2.15 (Ihara avoidance
components), §2.18 (inertial types with monodromy), §2.24 (fixed-type rings in rank `n`), §2.26 (the
Steinberg ring is a domain), §2.27 (Breuil–Mézard cycles for division algebras away from `p`); §8.12
(Newton–Thorne local quotients), §8.14 (torsion semistable lifts form a stable condition).

### From TauCetiRoadmap.GlobalGaloisDeformations

Layer G7: §8.1 (polarized deformation problems), §8.5 (Taylor–Wiles places in rank `n` and the
diamond action); §§5.3–5.4
(linear disjointness for dyadic auxiliary primes; dyadic Taylor–Wiles sets and their generator
counts), §5.5 (inertia at Taylor–Wiles places and the `Δ_Q`-module structure of the framed and trace
rings), §5.7 (Taylor–Wiles primes for odd `p` in rank two); §4.6 (quotients of complete local
functors by free actions of formally smooth group functors, with formally smooth quotient map) and
§4.11 (for a free `Ĝ_m^γ`-action on `Sp R′` and a map `d` to `Ĝ_m^γ` with `d(λx) = λ²d(x)`, the fibre
`Sp R = d^{−1}(1)` is a `Ĝ_m^γ[2]`-torsor over `Sp (R′)^{Ĝ_m^γ}`, finite flat of degree `2^γ` at `p = 2`).

What GlobalGaloisDeformations must provide (gap:tensor-taylor-wiles-primes): in Layer G7, the Taylor–Wiles prime selection of Newton–Thorne 2026 §4 (nt26 pp. 29–30; Propositions 4.8–4.9, pp. 34–36): from rank-two large residual image and a perfect subgroup of the rank-`2r` tensor image containing an element with `2r` distinct eigenvalues, arbitrarily deep places `q_v ≡ 1 mod p^N` at which the tensor Frobenius has `2r` distinct ordered eigenvalues and which control the rank-two dual Selmer group, for simultaneous patching; together with Newton–Thorne II Lemmas 2.7 and 2.9 (nt21b pp. 14, 18) under `p^a > max(5, 2n − 1)`, including `p = 2`.

### From TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra

§5.4 (the limit presentation and its actions), §5.6 (patching a ring and a based free module), §5.5
(numerical depth), §6.1 (near faithfulness on native support, and support invariance under a group
action transitive on minimal primes), §6.6 (connectedness dimension and arithmetic rank), §6.7 (generic and special
components).

What DeformationAndDerivedPatchingAlgebra must provide (gap:formal-torus-patching): in §5.4 and Layer 6, extend the rank-two free patched torus action of GL2ModularityLifting §§6.1, 6.6 and its determinant-one fibre and torsor of §6.7 and GlobalGaloisDeformations §4.11 to simultaneous patching with the pseudodeformation rings and both modules in Newton–Thorne II Proposition 2.8 and Newton–Thorne 2026 Proposition 4.9 (kw09 Proposition 9.3): assume the supplied compatible free action chunks on cofinal Artinian truncations of `Sp R′_N`, detecting every stabilizer on an Artinian test algebra, square-equivariant determinant maps whose fibre comparison kernels tend to zero, compatible `Ĝ_m^γ[2]`-actions on `Sp P_N` making `Sp R_N → Sp P_N` equivariant, and semilinear `Ĝ_m^γ[2](𝒪)`-actions on both finite-level modules commuting with their scalar and transition maps; retain these actions on `P_∞`, `H_{D,∞}` and `H_{G,∞}` in the simultaneous limit, and prove that if `R′_∞` is an `𝒪`-flat domain then `{±1}^γ` acts transitively on the irreducible components of `Spec R_∞`; the free rank-two action and its torsor are supplied inputs, not conclusions from square-equivariance alone.

### From TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory

§R07.4.20 (crystalline representations with Hodge–Tate weights in `{0,1}` come from
`p`-divisible groups), §R07.1.40 (Raynaud's embedding), §R07.5.11 (Fontaine–Laffaille residual
types).

What FiniteFlatGroupsAndIntegralPadicHodgeTheory must provide (gap:artinian-crystalline-quotients): in Layer R07.4, Raynaud's embedding theorem (bbm82 Théorème 3.1.1; §R07.1.40: a finite flat group scheme over the ring of integers embeds in an abelian scheme) applied as in Newton–Thorne II Lemma 2.2 (nt21b p. 7) and Newton–Thorne 2026 Lemma 4.2: every finite flat Artinian rank-two point of Hodge type `{0,1}` is a quotient of a Galois-stable lattice in a crystalline representation with Hodge–Tate weights in `{0,1}`, functorially in the coefficient quotient and compatibly with tensor products and symmetric powers with fixed lattices.

### From TauCetiRoadmap.GL2ModularityLifting

Layer 2 (§§2.5, 2.8: quaternionic Hecke modules at Taylor–Wiles levels and their freeness),
Layer 3 (§§3.1–3.7: the arithmetic patching template), Layer 6 (§§6.1, 6.6, 6.7: dyadic patching
with the free determinant torus action and the torsor structure).

### From TauCetiRoadmap.OrdinaryAutomorphicFormsAndModularityLifting

§2.11 (Hilbert Hida weight change with fixed residual determinant).

### From TauCetiRoadmap.PadicHodgeTheory

§4.4 (Sen's theorem: the Lie algebra of the inertia image is the smallest subspace whose extension
to `ℂ_p` contains the Sen operator).

### From TauCetiRoadmap.PotentialModularityAndCompatibleSystems

§2.16 (soluble prescribed-completion extensions: for a finite set of places of a number field, a
finite Galois avoidance extension and finite Galois local extensions with soluble groups at those
places, a finite soluble Galois extension linearly disjoint from the avoidance extension whose
completions above each place are the prescribed ones, totally real when the base is and the real
completions are kept real; complete splitting is the trivial prescribed completion), §9.2 (points on
prescribed Newton–Thorne components: Newton–Thorne 2026 Lemma 3.1, the ι-ordinary companion `σ` of
weights `{0, 2}` and determinant `ε^{−2}ω_p` with the residual representation of `π`, an unramified
Steinberg twist at `v_0` and `r_σ ∼ r_π` locally away from `p v_0`, by the Khare–Wintenberger
argument), §10.10 (prescribed-type local-to-global lifting in weight two, `p` odd).

### From TauCetiRoadmap.SerreWeightAndLevelOptimisation

§6.11 (Khare–Wintenberger prescribed-local-type modular lifts).

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

§4.4 (Dickson's classification and its consequences for residual images), §7.1 (continuous
symmetric, exterior and tensor powers), §7.6 (Zariski closures, monodromy groups, Goursat), §7.8
(Clebsch–Gordan and Pieri in characteristic `p`), §7.9 (adequate subgroups, the threshold `a₀(p)`,
and adequacy of `Sym^{n−1}` of a finite image containing `SL_2(𝔽_t)` when `t ≥ 2n + 2`, its
symmetric-power clause (3); `t ∣ n` excludes adequacy), §7.10 (enormous images, with its hypothesis
that every characteristic polynomial splits over the coefficient field).

### From TauCetiRoadmap.ArithmeticGaloisDuality

§R02.3.5: exponent-two ramification fields `F(S)`; one new ramified prime and quadratic
reciprocity (Newton–Thorne 2026 Lemma 5.3, with the symmetric splitting criterion); the antiunit
class-field rank `d₀` and Maire's lower bound.

### From TauCetiRoadmap.AutomorphicGaloisRepresentations and AutomorphicGaloisRepresentationsPartII

AutomorphicGaloisRepresentations §7.4 (Dimitrov's residual large image), §7.5 (Ribet–Momose large
image). AutomorphicGaloisRepresentationsPartII AG2.6 ("Complex and local coefficient conjugation";
"Coefficient independence of tensor automorphy", for untwisted tensors of two RAESDC factors).

### From TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer

§R16.3.7 (tamely dihedral representations of prime order), §R16.3.8 (their supercuspidality),
§R16.4.4 (the comparison of Hecke data of newforms and automorphic representations, with strong
multiplicity one), §R16.4.6 (the non-CM self-twist condition on cuspidal classes of `GL_2`, whose
coefficient form on newforms is the predicate of §14.5).

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

§6.24 (strong cyclic base change for `GL_n`), §6.29 (Labesse's cohomological weak base change and
descent).

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

SR.1.4–SR.1.5 (Iwahori decompositions, Iwahori–Matsumoto and Bernstein presentations, stated for
split groups), SR.2.1–SR.2.3 (smooth and compact induction, the irreducibility criterion for compact
inductions, Jacquet functors, Iwahori invariants), SR.3.1–SR.3.4 (cuspidal support, the Bernstein
decomposition, tempered representations, the Steinberg representation and the Iwahori block).

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

AL.2.4.1 ("The global standard L-function": for unitary cuspidal `π` of `GL_n(𝔸_K)` with `n ≥ 2` the
completed standard `L`-function is entire, its Euler product converging in some right half-plane),
AL.3.3.8 (the Jacquet–Shalika bound: an unramified Satake parameter `α` of a unitary generic
representation satisfies `q^{−1/2} < |α| < q^{1/2}`) and AL.3.6.1 (after the Rankin–Selberg pole
criterion, the finite standard Euler product of a unitary cuspidal `π` of `GL_n`, `n ≥ 2`, converges
absolutely for `Re s > 1`), used in §§14.4–14.5; AL.3.7.1 (strong multiplicity one: cuspidal representations of `GL_n` whose
unramified components agree outside a finite set are isomorphic), used in §14.5 for the
comparison of the self-twist predicate with the non-CM condition.

### From TauCetiRoadmap.CompletedCohomologyAndLocalGlobalCompatibility

§0.7 (definite unitary forms of rank `n` and their completed degree-zero cohomology).

What CompletedCohomologyAndLocalGlobalCompatibility must provide (gap:drinfeld-steinberg-detection): in §0.7, the inputs of Thorne 2024 Theorem 6.11 from its §§3–6: Steinberg detection in `p`-adic automorphic forms on definite unitary groups (th24 Theorem 3.4, p. 16), the even-multiplicity weight theorem (Theorem 4.5, p. 20), concentration in degree `n − 1` of the Hecke-localized derived tensor product `RΓ_c(Ω^{n−1}, k) ⊗^L_{k[GL_n(F_{w₀})^0]} A_𝔪` of Drinfeld-space cohomology with the automorphic module under residual genericity (Theorem 5.2, p. 24; not a concentration statement for bare `RΓ_c(Ω^{n−1}, k)`), and the comparisons of Corollary 6.3 (p. 33) and Proposition 6.5 (p. 35).

### From TauCetiRoadmap.Chebotarev and ClassFieldTheory

Chebotarev Layer 10 (Dirichlet-density Chebotarev). ClassFieldTheory Layer 12 (global existence and
the norm index), Layer 13 (norm theorems and class fields), Layer 14 (Hilbert and quadratic
reciprocity).

## References

- [nt21] James Newton and Jack A. Thorne, *Symmetric power functoriality for holomorphic modular
  forms*, Publ. Math. IHÉS 134 (2021), 1–116; arXiv:1912.11261v3, cited by PDF page.
- [nt21b] James Newton and Jack A. Thorne, *Symmetric power functoriality for holomorphic modular
  forms, II*, Publ. Math. IHÉS 134 (2021), 117–152; arXiv:2009.07180v2, cited by PDF page.
- [nt26] James Newton and Jack A. Thorne, *Symmetric power functoriality for Hilbert modular forms*,
  Ann. of Math. 203 (2026); arXiv:2212.03595v2, cited by PDF page.
- [th24] Jack A. Thorne, *A p-adic approach to the existence of level-raising congruences*, Proc. Lond.
  Math. Soc. 128 (2024), e12584; arXiv:2212.03591v2, cited by PDF page.
- [bbm82] Pierre Berthelot, Lawrence Breen and William Messing, *Théorie de Dieudonné cristalline II*,
  Lecture Notes in Math. 930 (1982); cited by its locator.
- [kw09] Chandrashekhar Khare and Jean-Pierre Wintenberger, *Serre's modularity conjecture (II)*,
  Invent. Math. 178 (2009); cited by its locator.
