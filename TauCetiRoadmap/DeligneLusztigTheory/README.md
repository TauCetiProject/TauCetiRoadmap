# Roadmap: Deligne–Lusztig induction and the characters of `GL_n(𝔽_q)`

**Summary.** Build the complex characters of the finite groups `G^F` of rational points of a
connected reductive group `G` over an algebraic closure of a finite field, for the `q`-Frobenius
of an `𝔽_q`-structure and for every Steinberg endomorphism, through Deligne–Lusztig induction,
and apply them to `GL_n(𝔽_q)`. Deligne–Lusztig induction comprises the varieties, characters and
Green functions, the character and inner product formulas, the compatibility with Harish-Chandra
functors, the Steinberg character, degrees, geometric conjugacy and Lusztig series, cuspidality,
the Green functions at regular unipotent elements and the pairing with Gelfand–Graev characters.
For `GL_n(𝔽_q)` the roadmap states Green's classification of the irreducible complex characters
and the theory around it: the conjugacy classes, the mirabolic subgroup and derivatives, the
cuspidal characters, the Hecke algebras of Harish-Chandra induced cuspidal representations, the
characteristic maps, the parametrisation and degree formula, uniformity and the matching of
Green's virtual characters with Deligne–Lusztig characters, generic and semisimple characters,
the counts, the Gauss sums of cuspidal characters and Shintani descent.

The roadmap builds on ReductiveGroups, which supplies the finite reductive groups `G^F`, Lang's
theorem, rational tori, parabolic and Levi subgroups, the Harish-Chandra functors with their
Mackey formula, Harish-Chandra series and Gelfand–Graev representations; on
EtaleCohomologyFoundations for compactly supported `ℓ`-adic cohomology and on
EtaleDualityAndPerverseSheaves for the Lefschetz numbers of finite-order automorphisms, through
which Deligne–Lusztig characters are defined; and on RepresentationTheory/CharacterTheory for
class functions, the pairing, virtual characters and `GL₂(𝔽_q)`. For `GL_n(𝔽_q)` it takes
symmetric functions from RepresentationTheory/SchurWeyl, Iwahori–Hecke algebras of type A from
TypeAHeckeAlgebras, and the classification of matrices up to similarity from
ClassicalArithmeticCompletion.

Layer 1 constructs Deligne–Lusztig induction. Layer 2 extends the `GL₂(𝔽_q)` theory of
RepresentationTheory/CharacterTheory to `GL_n(𝔽_q)`: Green's classification of its irreducible
characters, with the derivatives, Hecke algebras, Gauss sums and Shintani descent around it.

## How to read the build

Layer 1, after ReductiveGroups Layers 7a–7e, 7h, 7i and 9E, constructs Deligne–Lusztig induction
for the `q`-Frobenius and for every Steinberg endomorphism. Layer 2 builds on Layer 1, on
RepresentationTheory/CharacterTheory Layers 0–3 and 9 and on the finite reductive groups of
ReductiveGroups, applied to `GL_n` with the standard Frobenius. Each layer ends with its Examples
and Dependencies. `Suggested.lean` states the headline statements of Layer 2 that can be stated
with Mathlib alone and says, section by section, which statements of either layer cannot be
stated at the pins and why.

## Conventions

- Representations of finite groups are finite-dimensional and complex, and characters of finite
  groups are complex. Class functions, the pairing `⟨f₁, f₂⟩ = |G^F|⁻¹ Σ_g f₁(g) f₂(g⁻¹)` and
  virtual characters are those of RepresentationTheory/CharacterTheory Layers 0 and 3, Tau Ceti's
  `TauCeti.ClassFunction`, `TauCeti.ClassFunction.characterPairing` and `TauCeti.virtualCharacters`
  (supplier contracts); a *constituent* is an irreducible character with nonzero pairing.
- Finite reductive groups, their Frobenius and Steinberg endomorphisms, rational Borel pairs,
  rational maximal tori and the Harish-Chandra functors `R_L^G` and `*R_L^G` are those of
  ReductiveGroups Layers 7a–7e and 9E.
- Layer 1 fixes at its start its notation, its `ℓ`-adic cohomology, its characters and its signs,
  and Layer 2 its notation for `GL_n(𝔽_q)`; each holds throughout its layer.

## Layer 1: Deligne–Lusztig induction

Let `k` be an algebraic closure of a finite field of characteristic `p`, `G` a connected reductive group over `k`, and
`F : G → G` either the `q`-Frobenius of an `F_q`-structure `G₀` (ReductiveGroups Layer 7a) or a Steinberg endomorphism (ReductiveGroups Layer 9E); in
the second case `q` is the positive real number with `F^m` the `q^m`-Frobenius of an `F_{q^m}`-structure.
§§1.1–1.9 are targets for both; §§1.10 and 1.11 are stated for the `q`-Frobenius. The sources are Deligne–Lusztig
1976 and Carter for the Frobenius of an `F_q`-structure; the lectures of Dudas and Michel (2015), whose §14 works with
an isogeny some power of which is a Frobenius and whose §15 with a Frobenius endomorphism; and, for Frobenius roots,
which include the Suzuki and Ree groups, the second edition of Digne–Michel, cited as a whole†; each section names the
locators of the other sources.

*Notation.* "Rational" means `F`-stable. `(T₀, B₀ = T₀ ⋉ U₀)` is a rational Borel pair (ReductiveGroups §7a.1), `W = N_G(T₀)/T₀` with its
action of `F`, simple reflections `S`, length function `ℓ` and `|Φ⁺|` positive roots, `T_w` a rational maximal torus of
type `w` (ReductiveGroups §7a.2), and `L_J` the standard rational Levi subgroup of an `F`-stable `J ⊂ S`, with `|J/F|` the number of
`F`-orbits in `J`. A *rational Levi subgroup* is a rational Levi complement of a rational parabolic subgroup; `R_L^G` and
`*R_L^G` are the Harish-Chandra functors of ReductiveGroups Layer 7c with `Λ = ℂ`, independent of the parabolic subgroup by ReductiveGroups Layer 7e,
and also denote the maps they induce on class functions (`R_L^G = Ind_{P^F}^{G^F} ∘ Inf_{L^F}^{P^F}`). Every `g ∈ G^F`
is `g = su = us` with `s` semisimple and `u` unipotent in `G^F` (ReductiveGroups Layer 4's Jordan decomposition). For semisimple
`s ∈ G^F`, `C°(s) = C_G(s)°` (ReductiveGroups §7.1) is a rational connected reductive subgroup: `F(C_G(s)°) = C_G(F(s))°`.

*Cohomology.* `ℓ ≠ p` is a prime and `H^i_c(X) = H^i_c(X, ℚ̄_ℓ)` is the compactly supported `ℓ`-adic cohomology of a
quasi-projective `k`-scheme `X` (EtaleCohomologyFoundations §§F.2.5, F.3 and F.4.5). A group acting on `X` acts on
`H^i_c(X)` by `γ ↦ (γ⁻¹)^*`, and `Lef(γ, X) = Σ_i (−1)^i tr(γ | H^i_c(X))` is the Lefschetz number of an automorphism
`γ` of finite order, a rational integer independent of `ℓ` (EtaleDualityAndPerverseSheaves §7.6, *Lefschetz numbers of
finite-order automorphisms*). `ℚ̄_ℓ` is compared with `ℂ` through a field isomorphism `ι : ℚ̄_ℓ ≅ ℂ`, with no continuity
condition; every statement in which `ℓ` or `ι` appears is independent of both.

*Characters.* Characters of finite groups are complex. Class functions, the pairing
`⟨f₁, f₂⟩ = |G^F|⁻¹ Σ_g f₁(g) f₂(g⁻¹)` and virtual characters are Tau Ceti's `TauCeti.ClassFunction`,
`TauCeti.ClassFunction.characterPairing` and `TauCeti.virtualCharacters` (supplier contracts); a *constituent* is an
irreducible character with nonzero pairing. `|G^F|_p` and `|G^F|_{p′}` are the `p`-part and the prime-to-`p` part of
`|G^F|`, and `conj(z)` is the complex conjugate of `z ∈ ℂ`.

*Signs.* For a rational maximal torus `T`, `F` acts on `X*(T) ⊗ ℝ` as `q·φ_T` with `φ_T` of finite order (`F^m`
restricted to `T` is the `q^m`-Frobenius of an `F_{q^m}`-structure on `T`, so `F^m = q^m·ρ` on `X*(T)` with `ρ` of
finite order); put `r(T) = dim (X*(T) ⊗ ℝ)^{φ_T}`. For a rational connected reductive subgroup `H`, `r(H) = r(T_H)` for a
rational maximal torus `T_H` of `H` contained in a rational Borel subgroup of `H`, and `ε_H = (−1)^{r(H)}`. For the
`q`-Frobenius of an `F_q`-structure, `r(H)` is the `F_q`-rank of `H`, the dimension of a maximal `F_q`-split torus.

### 1.1 Deligne–Lusztig varieties

Let `T` be a rational maximal torus, `B = T ⋉ U ⊃ T` a Borel subgroup, not necessarily rational, and `w` the relative
position of `B` and `F(B)`. The variety

    Y_U = {gU ∈ G/U : g⁻¹F(g) ∈ U·F(U)}

is smooth, quasi-projective and of pure dimension `ℓ(w)`; `G^F` acts on it by left and `T^F` by right multiplication,
and `Y_U → X_B = {gB ∈ G/B : g⁻¹F(g) ∈ B·F(B)}` is a `T^F`-torsor.

*Route.* `ℒ⁻¹(U·F(U))` is étale over the smooth variety `U·F(U)`, an orbit of `U × F(U)` acting by `(u, v)·x = uxv⁻¹`
(ReductiveGroups §7a.3), and it is stable under right multiplication by `U`, since `ℒ(gu) = u⁻¹ℒ(g)F(u)`; `Y_U` is its image in `G/U`,
the quotient by this free action, and its dimension is the length of `w` by the Bruhat cell of `(B, F(B))`. The
`T^F`-torsor: `F(B) = ṅBṅ⁻¹` with `ṅ ∈ N_G(T)`, and the torus coordinate `τ(x)`, the `a ∈ T` of an expression
`x = uav ∈ B·F(B)` with `u ∈ U`, `v ∈ F(U)`, is a well-defined morphism `B·F(B) → T` (the cell coordinates of ReductiveGroups Layer 7C,
transported to `(T, B)`); `φ(gU) = τ(g⁻¹F(g))` is a morphism from the preimage of `X_B` in `G/U` to `T`, with
`Y_U = φ⁻¹(1)` and `φ(gtU) = φ(gU)·t⁻¹F(t)` for `t ∈ T`. Over an open subset of `X_B` on which `G/U → G/B` has a section,
`Y_U` is therefore the pullback of the Lang torsor of `T` (ReductiveGroups §7a.3 for `T`), and being a torsor is local on the base.
For `Ỹ = {g ∈ G : g⁻¹F(g) ∈ F(U)}`, the map `Ỹ → Y_U`, `g ↦ gU`, used in §§1.4, 1.5 and 1.8, is a torsor under
`U ∩ F(U)`, an affine space, and is Zariski-locally trivial because `G → G/U` is.
(Deligne–Lusztig 1976, §1†; Dudas–Michel 2015, Definition 14.2 and the models after it, p. 61.)
*Needs:* ReductiveGroups §7a.3 for `G` and for `T` (with ReductiveGroups Layer 9E for Steinberg endomorphisms); ReductiveGroups Layer 7's Bruhat decomposition; ReductiveGroups Layer
7C's cell coordinates; SchemeAndStackFoundations §§1.1 and 1.15.

### 1.2 Deligne–Lusztig characters and Green functions

For a character `θ` of `T^F`, the class function

    R_T^G(θ)(g) = |T^F|⁻¹ Σ_{t∈T^F} θ(t)⁻¹ Lef((g, t), Y_U),

where `(g, t)` acts by `y ↦ g·y·t`, is the alternating sum of the `θ`-isotypic parts, under `T^F`, of the
`G^F`-modules `H^i_c(Y_U)`; it is a virtual character of `G^F` and does not depend on `ℓ` or on `ι`. The **Green
function** `Q_T^G(u) = R_T^G(1)(u)`, for unipotent `u ∈ G^F`, is integer valued, and `R_T^G(θ)(u) = Q_T^G(u)` for every
`θ`.

*Route.* Integrality and independence of `ℓ` and `ι` from those of Lefschetz numbers; virtuality from the decomposition
of the `H^i_c(Y_U)` under `G^F × T^F`. At unipotent `u`, `(u, t)` has semisimple part `(1, t)`; `T^F` acts freely on
`Y_U` and its elements have order prime to `p`, so the Jordan decomposition formula for Lefschetz numbers and their
vanishing for free actions give `Lef((u, t), Y_U) = 0` for `t ≠ 1`. (Deligne–Lusztig 1976, §§1† and 4†; Carter;
Dudas–Michel 2015, Definition 14.2 (i), p. 61, Definition 14.7 and Proposition 14.8, p. 63, and Corollary 13.2, p. 58.)
*Needs:* §1.1; EtaleDualityAndPerverseSheaves §7.6 (*lefschetzIntegrality*, the vanishing for free actions in
*lefschetzDevissage* (d) and its value on a finite scheme in (a), *lefschetzJordanFormula*); Tau Ceti's virtual
characters.

### 1.3 The character formula

For `g = su ∈ G^F`,

    R_T^G(θ)(su) = |C°(s)^F|⁻¹ Σ_{x∈G^F, x⁻¹sx∈T} θ(x⁻¹sx)·Q^{C°(s)}_{xTx⁻¹}(u).

In particular, for regular semisimple `s` with `T′ = C°(s)`,
`R_T^G(θ)(s) = Σ_{x ∈ T′^F\{x∈G^F : x⁻¹T′x = T}} θ(x⁻¹sx)`, which vanishes unless `T` and `T′` are `G^F`-conjugate.

*Route.* By the Jordan decomposition formula, `Lef((su, t), Y_U) = Lef((u, 1), Y_U^{(s,t)})`. A point `gU` is fixed by
`(s, t)` exactly when `g⁻¹sg ∈ t⁻¹U`, so the fixed-point set is empty unless `t⁻¹` is conjugate to `s`, and it is a
disjoint union, indexed by the `x ∈ G^F` with `x⁻¹sx = t⁻¹` taken modulo `C°(s)^F`, of translates of the
Deligne–Lusztig varieties of `C°(s)` for the tori `xTx⁻¹` (which lie in `C°(s)`, ReductiveGroups §7.1 (b)); summing over `t` with the
weight `θ(t)⁻¹ = θ(x⁻¹sx)` gives the formula. For regular `s`, `C°(s) = T′` and `Q^{T′}_{T′}(1) = 1`.
(Deligne–Lusztig 1976, Theorem 4.2†; Carter, Theorem 7.2.8†; Dudas–Michel 2015, Proposition 14.9 (i), p. 63;
Digne–Michel 2020†.)
*Needs:* §1.2; ReductiveGroups §7.1; EtaleDualityAndPerverseSheaves §7.6 (*lefschetzJordanFormula*; *lefschetzDevissage* (a), the value
on a finite scheme).

### 1.4 The inner product formula

Put `N_{G^F}(T, T′) = {n ∈ G^F : nTn⁻¹ = T′}` and
`W_{G^F}(T, θ) = {n ∈ N_{G^F}(T) : θ(n⁻¹tn) = θ(t) for all t ∈ T^F}/T^F`. Then

    ⟨R_T^G(θ), R_{T′}^G(θ′)⟩ = |{n ∈ N_{G^F}(T, T′)/T^F : θ′(ntn⁻¹) = θ(t) for all t ∈ T^F}|

for any choice of Borel subgroups `B ⊃ T`, `B′ ⊃ T′` defining the two sides. Hence `R_T^G(θ)` does not depend on `B`;
`R_T^G(θ)` and `R_{T′}^G(θ′)` are orthogonal unless `(T, θ)` and `(T′, θ′)` are `G^F`-conjugate; and
`⟨R_T^G(θ), R_T^G(θ)⟩ = |W_{G^F}(T, θ)|`. `θ` is in **general position** when `W_{G^F}(T, θ) = 1`.

*Route.* By `Lef(h, X) = Lef(h⁻¹, X)` and the Künneth and quotient formulas, the pairing is
`|T^F|⁻¹|T′^F|⁻¹ Σ_{t,t′} θ(t)⁻¹θ′(t′)·Lef((t, t′), G^F\(Y_U × Y_{U′}))`. With `Ỹ = {g ∈ G : g⁻¹F(g) ∈ F(U)}` and `Ỹ′`
likewise, `Ỹ × Ỹ′ → Y_U × Y_{U′}` is an equivariant fibration in affine spaces (§1.1), and ReductiveGroups §7a.3 identifies
`G^F\(Ỹ × Ỹ′)` with `Z = {(x, x′, y) ∈ F(U) × F(U′) × G : xF(y) = yx′}`, on which `(t, t′)` acts by
`(x, x′, y) ↦ (t⁻¹xt, t′⁻¹x′t′, t⁻¹yt′)`. Let `N_G(T′, T) = {n ∈ G : nT′n⁻¹ = T}`. The Bruhat decomposition
`G = ⊔ BnB′`, `n ∈ N_G(T′, T)/T′`, gives a filtered stratification of `Z` (a decomposition into finitely many locally
closed pieces, each stable under the automorphisms considered, numbered so that the union of the first `j` pieces is
closed for every `j`), with pieces `Z_n` on which the closed subgroup
`H_n = {(s, s′) ∈ T × T′ : F(s′)s′⁻¹ = F(n)⁻¹·F(s)s⁻¹·F(n)}` acts, extending the action of `T^F × T′^F`; the torus
fixed-point formula reduces `Lef((t, t′), Z_n)` to the fixed points of `H_n°`, the finite set `G^F ∩ nT′`, and summing
gives `Lef((t, t′), Z) = #{m ∈ N_{G^F}(T′, T) : m⁻¹tm = t′}`. Only the fixed points of `H_n°` enter: the pieces
themselves are not fibred in affine spaces over tori. Independence of `B`: for two choices `B, B₁ ⊃ T` the three
pairings of the two characters are all `|W_{G^F}(T, θ)|`, so their difference has norm zero.
(Deligne–Lusztig 1976, Theorem 6.8† and its proof; Carter, Theorem 7.3.4†; Dudas–Michel 2015, Corollary 14.6, p. 63;
Digne–Michel 2020†.)
*Needs:* §§1.1, 1.2; ReductiveGroups §7a.3; ReductiveGroups Layer 7's Bruhat decomposition; EtaleDualityAndPerverseSheaves §7.6 (*lefschetzIntegrality*;
*lefschetzDevissage*: additivity over filtered stratifications, the value on a finite scheme, the Künneth and quotient
formulas; *lefschetzGroupActions*: the torus fixed-point formula and fibrations in affine spaces);
EtaleCohomologyFoundations §§F.2.5, F.2.5a and F.2.7.

### 1.5 Harish-Chandra compatibility

(a) If `T ⊂ L` with `L` a rational Levi subgroup, then `R_L^G ∘ R_T^L = R_T^G`; in particular `R_T^G(θ) = Ind_{B^F}^{G^F} θ`
(inflated through `B^F → T^F`) when `T` lies in a rational Borel subgroup `B`.
(b) (Mackey formula.) For a rational Levi subgroup `L` and a rational maximal torus `T`,
`*R_L^G(R_T^G(θ)) = Σ_x R^L_{xTx⁻¹}(ad(x)θ)`, the sum over `x ∈ L^F\{x ∈ G^F : xTx⁻¹ ⊂ L}/T^F`, with
`(ad(x)θ)(t′) = θ(x⁻¹t′x)` on `(xTx⁻¹)^F`.
(c) `⟨R_T^G(θ), 1_{G^F}⟩` is `1` if `θ = 1` and `0` otherwise.
(d) If `f` is a class function on `G^F` with `f(su) = f(s)` for every Jordan decomposition `g = su`, then
`⟨f, R_T^G(θ)⟩ = |T^F|⁻¹ Σ_{t∈T^F} f(t)·conj(θ(t))` for every rational maximal torus `T` and every `θ`.

*Route.* (a) By §1.4 choose `B = B_L U_P` with `B_L ⊃ T` a Borel subgroup of `L`, `P = L ⋉ U_P`. For `gU ∈ Y_U`,
`g⁻¹F(g) ∈ P`, so `gU ↦ gP` maps `Y_U` `G^F`-equivariantly onto `(G/P)^F = G^F/P^F` (Lang's theorem for `P`); its fibre
over `P` is the variety `Y_{U_L}` of `L`, on which `U_P^F` acts trivially. Hence `Y_U ≅ G^F/U_P^F ×_{L^F} Y_{U_L}`. That
`H^*_c(Y_U)` is then `ℚ̄_ℓ[G^F/U_P^F] ⊗_{L^F} H^*_c(Y_{U_L})`, the functor `R^G_{L⊂P}`, is a statement on modules;
(a) is cited (Dudas–Michel 2015, Proposition 14.3, p. 62). (b) By the definition of `*R_L^G` on class functions,
`*R_L^G(R_T^G(θ))(l) = |U_P^F|⁻¹ Σ_{u∈U_P^F} R_T^G(θ)(lu)`, a combination of the numbers `Lef((lu, t), Y_U)`; stratify
`Y_U` by the relative position of `gB` to `P`, the preimage of the finitely many `P`-orbits on `G/B`, a filtered
stratification (§1.4) whose pieces are stable under every `(lu, t)`, and compute these Lefschetz numbers piece by
piece on `Y_U` itself; the published proof is cited (Deligne and Lusztig 1983† and Digne–Michel 1991, 11.13†, to which
Dudas–Michel 2015, Conjecture-Theorem 14.4, p. 62, attributes this case). (c) The map `g ↦ gU` from
`Ỹ = {g ∈ G : g⁻¹F(g) ∈ F(U)}` onto `Y_U` is an equivariant fibration in affine spaces (§1.1), and the Lang map
identifies `G^F\Ỹ` with the affine space `F(U)`, on which `t ∈ T^F` acts by conjugation; conjugation by the connected
`T`, which normalizes `F(U)`, extends this action, so `T^F` acts trivially on `H^*_c(F(U))`, and `⟨R_T^G(θ), 1⟩` is the
alternating dimension of its `θ`-isotypic part. (d) For every rational maximal
torus `T′` of a connected reductive `C`, `Σ_u Q_{T′}^C(u) = |C^F|/|T′^F|` over the unipotent `u ∈ C^F` (by (c), §1.2 and
§1.3); summing §1.3 over the unipotent `u ∈ C°(s)^F` gives `Σ_u R_T^G(θ)(su) = |T^F|⁻¹ Σ_{x : x⁻¹sx ∈ T} θ(x⁻¹sx)`, and
the pairs `(s, x)` correspond to the pairs `(t, x) ∈ T^F × G^F` through `s = xtx⁻¹`. (Dudas–Michel 2015, Proposition
14.3, p. 62, for (a); Conjecture-Theorem 14.4, p. 62, for (b), in the case where one Levi subgroup is a maximal torus,
attributed there to Deligne and Lusztig 1983 and to Digne–Michel 1991, 11.13†; Proposition 14.13 (iii), p. 65, for (c)
and (d). Deligne–Lusztig 1976, §8†, for the induction from a rational parabolic subgroup. Digne–Michel 2020†.)
*Needs:* §§1.1–1.4; ReductiveGroups §7c.1; ReductiveGroups Layers 7a, 7b, 7c and 7e; EtaleDualityAndPerverseSheaves §7.6 (*lefschetzGroupActions*:
connected groups act trivially on `H^*_c`, fibrations in affine spaces; *lefschetzDevissage*: additivity over filtered
stratifications); EtaleCohomologyFoundations §§F.2.5 and F.2.5a (the cohomology of a quotient by a finite group as a
module, for (c)); RepresentationTheory/InductionRestriction Layer 2 (induced characters).

### 1.6 The Steinberg character and the two averages

Let `St_G = Σ_J (−1)^{|J/F|} R_{L_J}^G(1)`, the sum over the `F`-stable subsets `J ⊂ S`. Then:
(a) `St_G` is an irreducible character;
(b) `St_G(1) = |G^F|_p`, `St_G(s) = ε_G ε_{C°(s)} |C°(s)^F|_p` for semisimple `s`, and `St_G(g) = 0` when `g` is not
semisimple;
(c) `⟨R_T^G(1), St_G⟩ = ε_G ε_T` for every rational maximal torus `T`;
(d) `1_{G^F} = |W|⁻¹ Σ_{w∈W} R_{T_w}^G(1)` and `St_G = |W|⁻¹ Σ_{w∈W} ε_G ε_{T_w} R_{T_w}^G(1)`.

*Route*, in the order (a), (c), (d), (b). (a) By the Mackey theorem for Harish-Chandra functors (ReductiveGroups Layer 7d) and the
rational Bruhat decomposition (ReductiveGroups §7a.1), `⟨St_G, St_G⟩ = Σ_{J,K}(−1)^{|J/F|+|K/F|}·#(W_J\W/W_K)^F`, the double cosets
counted being the `F`-fixed ones, and Solomon's identity in its twisted form gives `1`; and `St_G(1) = |G^F|_p > 0` by
the first step of (b), which uses only ReductiveGroups §7a.1. (c) When `F` acts trivially on `W`: by §1.5 (b), (c) and ReductiveGroups §7a.2,
`⟨R_{T_w}^G(1), R_{L_J}^G(1)⟩` is the number `N_J(w)` of cosets `vW_J` with `v⁻¹wv ∈ W_J`, and Solomon's alternating sum
over the parabolic subgroups of the Coxeter group `W` gives `Σ_J (−1)^{|J|} N_J(w) = (−1)^{ℓ(w)}`, which is
`ε_Gε_{T_w}` (Dudas–Michel 2015, Remark 15.7, p. 69). For a non-trivial action of `F` on `W`, (c) is cited: the
published proof goes through the duality functor `Σ_J (−1)^{|J/F|} R_{L_J}^G ∘ *R_{L_J}^G`, which gives (c)
(Dudas–Michel 2015, Theorem 14.5, p. 63, Proposition 14.13 (iii), p. 65, and Definition 15.1, p. 67, for a Frobenius
endomorphism; Digne–Michel 2020† for Frobenius roots). (d) The two averages have norm one by §1.4 (the twisted
classes of `W` and their centralizers, ReductiveGroups §7a.2), and
pair to `1` with `1_{G^F}` (§1.5 (c)) and with `St_G` (by (c)). (b) `St_G` restricts to the regular character of the
Sylow `p`-subgroup `U₀^F` (the Mackey decomposition over `U₀^F\G^F/P_J^F`, in which the coefficient of every `w ≠ w₀`
is a product of factors `1 − 1`), which gives `St_G(1)` and the vanishing at unipotent `u ≠ 1`; at `su`, (d), §1.3
and the rewriting of a Weyl average as a sum over all rational maximal tori give
`St_G(su) = ε_Gε_{C°(s)}St_{C°(s)}(u)`. (Curtis 1966 for (a), from the Tits system `(B₀^F, N_{G^F}(T₀))` with Weyl
group `W^F`, and for the restriction to `U₀^F`; Solomon 1966 for `F` trivial on `W`; Deligne–Lusztig 1976, §7†;
Dudas–Michel 2015, Lemma 15.2 and Corollary 15.3, pp. 67–68, and Proposition 15.10, p. 70, for a Frobenius
endomorphism; Digne–Michel 2020†.)
*Needs:* §§1.3–1.5; ReductiveGroups §§7a.1, 7a.2, 7.1, 7c.1; ReductiveGroups Layers 7b–7d; RepresentationTheory/InductionRestriction Layer 3 (the
Mackey decomposition).

### 1.7 Degree, sign and irreducibility

(a) `R_T^G(θ)(1) = ε_G ε_T |G^F|_{p′}/|T^F|`.
(b) For `θ` in general position, `ε_G ε_T R_T^G(θ)` is an irreducible character.

*Route.* (a) Induction on `dim G`, a torus giving `R_T^T(θ) = θ`. Pair `R_T^G(1)` with `St_G`, using §1.6 (b), which
vanishes off the semisimple elements, and §1.3 at semisimple `s`: for non-central `s`, `C°(s)` is a proper connected
reductive group and the induction hypothesis gives `Q^{C°(s)}_{xTx⁻¹}(1)`, while the central `s` contribute
`|Z^F|·|G^F|_p·R_T^G(1)(1)`; §1.6 (c) then forces the value, and §1.2 removes `θ`. (b) Norm one (§1.4) and positive
degree after the sign (a). (Deligne–Lusztig 1976, Theorem 7.1† and its corollaries; Carter, 7.5.1† and 7.5.2†;
Dudas–Michel 2015, Proposition 15.6, p. 68, and Remark 15.7, p. 69, for a Frobenius endomorphism; Digne–Michel 2020†.)
*Needs:* §§1.2–1.6; ReductiveGroups §§7a.2, 7.1.

### 1.8 Geometric conjugacy, Lusztig series and exhaustion

Pairs `(T, θ)` and `(T′, θ′)` of rational maximal tori and characters of their rational points are **geometrically
conjugate** if some `g ∈ G` with `gTg⁻¹ = T′` satisfies `θ′∘N_{F^m/F}∘ad(g) = θ∘N_{F^m/F}` on `T^{F^m}` for some `m`
with `g ∈ G^{F^m}`, where `N_{F^m/F}(t) = t·F(t)⋯F^{m−1}(t)`. If `R_T^G(θ)` and `R_{T′}^G(θ′)` have a common
constituent, the pairs are geometrically conjugate; every irreducible character of `G^F` is a constituent of some
`R_T^G(θ)`; and

    reg_{G^F} = |G^F|_{p′} |W|⁻¹ Σ_{w∈W} ε_G ε_{T_w} |T_w^F|⁻¹ Σ_θ R_{T_w}^G(θ).

The **Lusztig series** `E(G^F, κ)`, the constituents of the `R_T^G(θ)` with `(T, θ)` in the geometric conjugacy class
`κ`, therefore partition the irreducible characters of `G^F`.

*Route.* Disjointness: a common constituent `χ` occurs in some `H^i_c(Y_U)_θ`, and `conj(χ)` in some
`H^j_c(Y_{U′})_{θ′⁻¹}` (as `Lef(h, X) = Lef(h⁻¹, X)`); so, by the Künneth formula and the cohomology of a quotient by a
finite group as modules (EtaleCohomologyFoundations §§F.2.7 and F.2.5a), the `θ ⊠ θ′⁻¹`-part of
`H^*_c(G^F\(Y_U × Y_{U′}))` is nonzero. That it is then nonzero on some piece `Z_n` of the filtered stratification of
§1.4, through the fibration in affine spaces of §1.4, is a statement on isotypic parts, and this step is the
published proof's, cited (Deligne–Lusztig 1976, proof of Theorem 6.2†). On `Z_n` the action of `T^F × T′^F` extends to
that of `H_n`, whose identity component acts trivially on cohomology. For `m` with `F^m(ṅ) = ṅ`, the homomorphism
`x ↦ (N_{F^m/F}(x), N_{F^m/F}(F(ṅ)⁻¹xF(ṅ)))` maps the connected `T` into `H_n°`, and triviality on its rational values
is geometric conjugacy by `g = ṅ⁻¹` (Deligne–Lusztig 1976, proof of Theorem 6.2†). The regular character:
`Σ_θ R_T^G(θ)` vanishes off the unipotent elements and is `|T^F|·Q_T^G` on them (§1.3), so the right side is supported
on the unipotent elements, where it is `|G^F|_{p′}·St_G` (§1.6 (d)), which is `|G^F|` at `1` and `0` at the other
unipotent elements (§1.6 (b)). Exhaustion: `χ(1) = ⟨χ, reg_{G^F}⟩ ≠ 0`. (Deligne–Lusztig 1976, Theorem 6.2†, 7.5† for
the regular character, Corollary 7.7† for exhaustion and §10† for geometric conjugacy; Carter, §12.1†; Digne–Michel
1991, 12.14†, for the regular character; Dudas–Michel 2015, Corollary 15.11, p. 70, for a Frobenius endomorphism;
Digne–Michel 2020†.)
*Needs:* §§1.2–1.7; EtaleCohomologyFoundations §§F.2.5, F.2.5a (cohomology of a quotient by a finite group) and F.2.7
(Künneth, compatibly with automorphisms); EtaleDualityAndPerverseSheaves §7.6 (*lefschetzIntegrality*;
*lefschetzGroupActions* (a), (c): the action of connected groups, fibrations in affine spaces).

### 1.9 Cuspidality

If `T` lies in no proper rational Levi subgroup, then `*R_L^G(R_T^G(θ)) = 0` for every proper rational Levi subgroup `L`;
hence for `θ` in general position `ε_G ε_T R_T^G(θ)` is an irreducible cuspidal character (ReductiveGroups §7h.1).

*Route.* The Mackey formula §1.5 (b), whose index set is empty, and §1.7 (b). (Deligne–Lusztig 1976, Theorem 8.3†;
Carter; Digne–Michel 2020†.)
*Needs:* §§1.5, 1.7; ReductiveGroups §7h.1.

### 1.10 Green functions at regular unipotent elements

Let `F` be the `q`-Frobenius of an `F_q`-structure. For every rational maximal torus `T` and every regular unipotent
`u ∈ G^F` (ReductiveGroups 7C.6), `Q_T^G(u) = 1`.

*Route.* By the quotient formula for Lefschetz numbers, `Q_T^G(u) = |T^F|⁻¹ Σ_t Lef((u, t), Y_U) = Lef(u, X_B)` with
`X_B = Y_U/T^F` (§1.1), and Deligne and Lusztig compute this Lefschetz number at a regular unipotent element to be `1`.
(Deligne–Lusztig 1976, Theorem 9.16†.)
*Needs:* ReductiveGroups 7C.6; §§1.1, 1.2; EtaleDualityAndPerverseSheaves §7.6 (the quotient formula of *lefschetzDevissage*).

### 1.11 Gelfand–Graev characters and Lusztig series

Let `F` be the `q`-Frobenius of an `F_q`-structure, assume that `Z(G)` is connected, and let `Γ_ψ` be a Gelfand–Graev
representation of `G^F` (ReductiveGroups Layer 7i; by ReductiveGroups §7i.2 it does not depend on the regular character `ψ`). For every rational
maximal torus `T` and every `θ`, `⟨Γ_ψ, R_T^G(θ)⟩ = ε_G ε_T`; and every Lusztig series contains exactly one constituent
of `Γ_ψ`, which occurs in `Γ_ψ` once.

*Route.* Induction on the semisimple rank. With the degenerate Gelfand–Graev representations
`Γ_{ψ,J} ≅ R_{L_J}^G(Γ^{L_J})` of ReductiveGroups §7i.3 (`J` an `F`-stable set of simple roots, identified with a subset of `S`), the
class function `D = Σ_J (−1)^{|J/F|} Γ_{ψ,J}` is supported on the regular unipotent elements, since
`Σ_J (−1)^{|J/F|} ψ_J = ∏_O (1 − ψ_O)` vanishes on the elements of `U₀^F` with a trivial component in some `U_O^F`
(ReductiveGroups §7i.1); there `R_T^G(θ) = 1` (§1.10), so `⟨D, R_T^G(θ)⟩ = ⟨D, 1⟩ = 1`. For `J ≠ S`, adjunction, the Mackey formula
§1.5 (b), the induction hypothesis for `L_J`, whose centre is connected (ReductiveGroups §7i.3), and `ε_{L_J} = ε_G` give
`⟨Γ_{ψ,J}, R_T^G(θ)⟩ = ε_Gε_T·⟨R_T^G(1), R_{L_J}^G(1)⟩`, and §1.6 (c) leaves `⟨Γ_ψ, R_T^G(θ)⟩ = ε_Gε_T`. The second
statement combines the first with ReductiveGroups §7i.2 and §§1.4 and 1.8: the projection of `Γ_ψ` to the span of the `R_T^G(θ)` with
`(T, θ)` in one geometric class has norm `Σ 1/|W_{G^F}(T, θ)|` over the rational classes in it, which is `1` when
`Z(G)` is connected, so every series contains a constituent of `Γ_ψ`; and `⟨Γ_ψ, Γ_ψ⟩`, the number of double cosets
supporting `End(Γ_ψ)` (ReductiveGroups §7i.2), is the number of geometric conjugacy classes of pairs, so that no series contains two.
(Deligne–Lusztig 1976, §10†, Theorem 10.7†, under a connected centre; Carter, §§8.1† and 8.4†; Digne–Michel 2020†.)
*Needs:* ReductiveGroups §§7i.1–7i.3, 7C.6; §§1.4–1.10.

### Examples

**Checks.**
- (1.1, 1.2) If `B` is rational, `w = 1`, `Y_U = G^F/U^F` is finite and `R_T^G(θ) = Ind_{B^F}^{G^F} θ`, inflated
  through `B^F → T^F`: `Lef((g, t), Y_U)` counts the `xU^F` with `x⁻¹gx ∈ t⁻¹U^F`. With `θ(t)` in place of `θ(t)⁻¹` the
  formula would give `Ind θ⁻¹`; this pins the convention. For `G = T`, `Y_U = T^F` and `R_T^T(θ) = θ`.
- (1.4) `SL₂` over `F₂` and `T = T′` the non-split torus (`T^F ≅ μ₃`): the formula gives
  `⟨R_T(θ), R_T(θ′)⟩ = [θ′ = θ] + [θ′ = θ⁻¹]`, which is `2` for `θ = 1`.
- (1.5) (a) for `G = L = T = 𝔾_m` over `F_3` (`P = G`, `U = U_P = 1`): `Y_U = T^F` has two points, the base `G^F/P^F`
  one and the fibre `T^F` two; a fibration over `G^F/U_P^F = T^F` with fibre `Y_{U_L}` would have four points.
- (1.5) (b) for `GL₂` and `L = T₁` the diagonal torus: the index set is `T₁^F\N_{G^F}(T₁)/T₁^F = W`, of order two, and
  `(Ind_{B^F} 1)^{U^F}` is two copies of the trivial character of `T₁^F`.
- (1.5) (d) needs its hypothesis: for `f = St_G` on `GL₂` (`St(1) = q`, `St(u) = 0` at unipotent `u ≠ 1`) and
  `T = T₁`, `⟨St, R_{T₁}(1)⟩ = 1` by §1.6 (c), while `|T₁^F|⁻¹ Σ_t St(t) = (q − 1)^{−2}((q − 1)q + (q − 1)(q − 2)) = 2`.
- (1.6) `GL₂`: `St = Ind_{B^F} 1 − 1`, of degree `q`; `½(R_{T₁}(1) + R_{T_s}(1)) = 1` and `½(R_{T₁}(1) − R_{T_s}(1)) = St`.
- (1.6) `U₃(F_q)`: the two simple roots form one `F`-orbit, the `F`-stable `J` are `∅` and `S`, and
  `St = Ind_{B^F} 1 − 1`, of degree `q³ = |G^F|_p`. The sign `(−1)^{|J|}` would give `Ind_{B^F} 1 + 1`, of degree
  `q³ + 2`, which is not irreducible. In (a) the `F`-fixed double cosets give `⟨St, St⟩ = 2 − 1 − 1 + 1 = 1`, while all
  of `W_J\W/W_K` would give `6 − 1 − 1 + 1 = 5`.
- (1.6) (b) for `GL₃` at `s = diag(a, a, b)`, `a ≠ b`: `C°(s) = GL₂ × GL₁`, `ε_Gε_{C°(s)} = 1` and `St(s) = q`;
  directly, `s` fixes `3(q + 1)` complete flags, `q + 2` planes and `q + 2` lines, and `3(q + 1) − 2(q + 2) + 1 = q`.
- (1.7) `GL₂`: `R_{T₁}^G(1) = 1 + St` and `R_{T_s}^G(1) = 1 − St`, of degree `−(q − 1) = ε_Gε_{T_s}(q² − 1)(q − 1)/(q² − 1)`.
  For `T` in a rational Borel subgroup, `ε_Gε_T = 1` and `|G^F|_{p′}/|T^F| = [G^F : B^F]`, the degree of
  `Ind_{B^F}^{G^F} θ`.
- (1.10) `GL₂`: `Q_{T₁}(u) = (Ind_B 1)(u) = 1` (one fixed point on `ℙ¹(F_q)`) and `Q_{T_s}(u) = (1 − St)(u) = 1`.
- (1.11) `GL₂`: `⟨Γ_ψ, Ind_{B^F}(α ⊗ β)⟩ = 1` for all characters `α, β` of `F_q^×` (the irreducible principal series,
  or the twisted Steinberg constituent when `α = β`), and `⟨Γ_ψ, R_{T_s}(θ)⟩ = −1` for every `θ`.

### Dependencies

ReductiveGroups Layers 4, 7, 7C, 7a–7e, 7h, 7i and 9E, with §§7.1, 7a.1–7a.3, 7c.1 and 7C.6; SchemeAndStackFoundations §§1.1 and 1.15;
EtaleCohomologyFoundations §§F.2.5, F.2.5a, F.2.7, F.3 and F.4.5; EtaleDualityAndPerverseSheaves §7.6 (Lefschetz
numbers of finite-order automorphisms); Tau Ceti's class functions, character pairing and virtual characters (supplier
contracts); RepresentationTheory/InductionRestriction Layers 2–3.

## Layer 2: the characters of `GL_n(𝔽_q)`

RepresentationTheory/CharacterTheory Layer 9 treats `GL₂(𝔽_q)` through the pinned library; the Checks of this layer compare its classes, degrees and
counts with RepresentationTheory/CharacterTheory Layer 9. Let `F` be a finite field with `q` elements and characteristic `p`, and
`G = GL_n(𝔽_q) = GL (Fin n) F`. This layer states Green's classification of the irreducible complex characters of
`G` and the theory around it: the conjugacy classes, the mirabolic subgroup and derivatives, the cuspidal
characters, the Hecke algebras of Harish-Chandra induced cuspidal representations, the characteristic maps, the
parametrisation and degree formula, uniformity and the matching of Green's virtual characters with
Deligne–Lusztig characters, generic and semisimple characters, the counts, the Gauss sums of cuspidal characters
and Shintani descent. Harish-Chandra functors, Harish-Chandra series, Gelfand–Graev representations and
Deligne–Lusztig characters of a finite reductive group are ReductiveGroups' (Layers 7c–7e, 7h and 7i) and Layer 1's, applied
to `GL_n` over an algebraic closure `F̄` of `F` with the standard Frobenius `Fr` (raising every entry to the `q`-th
power), the `q`-Frobenius of the `𝔽_q`-structure `GL_n`, whose group of fixed points is `G` (ReductiveGroups
Layer 7a); the theorems of this layer are proved from them.

Notation for this layer.

- **Fields.** `𝔽_{q^m} ⊂ F̄` is the subfield with `q^m` elements (`𝔽_q = F`); `N` and `Tr` are the norm and the
  trace between such subfields.
- **Subgroups and functors.** `B`, `T`, `U` are the upper triangular, diagonal and upper unitriangular subgroups,
  `U_m` that of `GL_m(F)`; `P_n ⊂ G` is the mirabolic subgroup of matrices with last row `(0, …, 0, 1)`. A standard
  Levi subgroup is a block diagonal `GL_{n₁} × ⋯ × GL_{n_r}`, its standard parabolic subgroup the block upper
  triangular one. `R_L^G` and `*R_L^G` are the Harish-Chandra induction and restriction of ReductiveGroups Layer 7c
  (for a standard parabolic `P = L ⋉ U_P`, `R_L^G = Ind_P^G ∘ Inf_L^P` and `*R_L^G` takes `U_P`-invariants),
  independent of `P` by its Layer 7e. For representations or class functions `π₁` of `GL_a(F)` and `π₂` of `GL_b(F)`,
  `π₁ × π₂ = R_{GL_a × GL_b}^{GL_{a+b}}(π₁ ⊠ π₂)`, with `⊠` the external tensor product of RepresentationTheory/CharacterTheory §3.6. An irreducible
  representation is **cuspidal** if `*R_L^G` kills it for every proper standard Levi subgroup `L` (ReductiveGroups
  §7h.1).
- **Gelfand–Graev.** `ψ₀` is a fixed nontrivial character of `(F, +)` and `ψ(u) = ψ₀(u_{12} + u_{23} + ⋯ + u_{n−1,n})`
  the standard regular character of `U`; `Γ_n = Ind_U^G ψ` is the Gelfand–Graev representation. An irreducible `π` is
  **generic** if `Hom_U(π, ψ) ≠ 0`.
- **Combinatorics.** Partitions are Mathlib's `Nat.Partition`; `ℓ(μ)` is the number of parts, `n(μ) = Σ_i (i−1)μ_i`,
  `H̃_μ(t) = ∏_{boxes} (t^{h(box)} − 1)` with `h` the hook length, `f^μ` the number of standard tableaux, and `z_μ` the
  order of the centraliser in `S_{|μ|}` of a permutation of cycle type `μ`. Put `ϖ_m(t) = ∏_{i=1}^m (t^i − 1)`,
  `ϖ₀ = 1`. The unipotent class of Jordan type `μ` is `u_μ`; `u_{(n)}` is regular unipotent and `u_{(1^n)} = 1`.
  `Λ_ℂ` is the ring of symmetric functions with complex coefficients of RepresentationTheory/SchurWeyl §7.5, with its Hall inner product,
  power sums `p_μ`, complete and elementary functions `h_m`, `e_m` and Schur functions `s_μ`; `χ^μ` is the irreducible
  character of `S_{|μ|}` of RepresentationTheory/SchurWeyl Layer 4, `χ^{(m)}` the trivial one.
- **Characters of finite fields.** `Ξ_m = Hom(𝔽_{q^m}^×, ℂ^×)`. For `d ∣ m`, `Ξ_d ↪ Ξ_m` by composition with the norm
  `𝔽_{q^m}^× → 𝔽_{q^d}^×`, and `Ξ = colim_m Ξ_m`. Frobenius acts by `θ ↦ θ^q`; the **degree** of `θ ∈ Ξ` is the size of
  its orbit, and `θ ∈ Ξ_m` is **regular** when its degree is `m`, that is when `θ, θ^q, …, θ^{q^{m−1}}` are distinct.
  For a Frobenius orbit `O`, `|O|` is its size and `q_O = q^{|O|}`. A Frobenius-equivariant group isomorphism
  `F̄^× ≅ Ξ` (one exists; it is a choice) turns orbits into monic irreducible polynomials `f_O` over `F` other than `X`,
  and finitely supported functions from orbits to `ℕ` into monic polynomials with nonzero constant term (the
  **labelled form**). `N*_q(m)` is the number of Frobenius orbits of degree `m`, that is the number of monic
  irreducible polynomials of degree `m` over `F` other than `X`.
- **Tori.** For `τ ⊢ n`, `T_τ` is a rational maximal torus of `GL_n` whose type (ReductiveGroups §7a.2, rational
  maximal tori and the twisted classes of the Weyl group, here `S_n` with trivial Frobenius action) has cycle type
  `τ`; `T_τ^{Fr} ≅ ∏_i 𝔽_{q^{τ_i}}^×`, and `ε_Gε_{T_τ} = (−1)^{n−ℓ(τ)}` (the `𝔽_q`-ranks of `GL_n` and of `T_τ` are `n`
  and `ℓ(τ)`; Layer 1, signs). The **Coxeter torus** `T_{(n)}` has `T_{(n)}^{Fr} ≅ 𝔽_{q^n}^×`, realised by the
  multiplication operators of `𝔽_{q^n}` in an `F`-basis.
- **Labels and Green data.** A **label** of degree `n` is a finitely supported function `κ` from Frobenius orbits to
  `ℕ` with `Σ_O |O|·κ(O) = n`; a **Green datum** is a finitely supported function `λ` from orbits to partitions, of
  weight `‖λ‖ = Σ_O |O|·|λ(O)|`, with label `|λ| : O ↦ |λ(O)|`. The **label of a pair** `(T_τ, θ)`, `θ = ⊠_i θ_i` with
  `θ_i ∈ Ξ_{τ_i}` (whose orbit has size dividing `τ_i`), is `κ(O) = Σ_{i : θ_i ∈ O} τ_i/|O|`. For a label `κ`, a choice
  of `θ_O ∈ O` for each orbit and a tuple `ν = (ν_O)` of partitions `ν_O ⊢ κ(O)`, `T_{κ,ν}` is the rational maximal
  torus with `T_{κ,ν}^{Fr} ≅ ∏_O ∏_i 𝔽_{q^{|O|ν_{O,i}}}^×` and `θ_{κ,ν} = ⊠_O ⊠_i θ_O ∘ N_{𝔽_{q^{|O|ν_{O,i}}}/𝔽_{q^{|O|}}}`, a
  pair of label `κ`; `L_κ = ∏_O GL_{|O|}^{κ(O)}` (block diagonal).
- Class functions, the pairing and virtual characters are those of RepresentationTheory/CharacterTheory Layers 0 and 3; "constituent" means an
  irreducible character with nonzero pairing; `conj(z)` is complex conjugation.

### 2.1 Conjugacy classes of `GL_n(𝔽_q)`

The conjugacy classes of `G` correspond to the functions `μ` from the monic irreducible polynomials `f ≠ X` over `F`
to partitions with `Σ_f deg(f)·|μ(f)| = n`: the semisimple part of an element of the class has characteristic
polynomial `∏_f f^{|μ(f)|}`, and its unipotent part, in the centraliser `∏_f GL_{|μ(f)|}(𝔽_{q^{deg f}})` of the
semisimple part, has Jordan type `μ(f)` in each factor. The unipotent classes correspond to the partitions of `n`. The
number `c_n(q)` of classes satisfies

`Σ_{n≥0} c_n(q) t^n = ∏_{i≥1} (1 − t^i)/(1 − q t^i)`,

and the number of semisimple classes is `q^n − q^{n−1}` for `n ≥ 1`. The number of `G`-classes of pairs `(T, θ)` of a
rational maximal torus `T` of `GL_n` and a character `θ` of `T^{Fr}` is also `c_n(q)`; for a standard Levi subgroup
`L = ∏_i GL_{n_i}` the number of `L(F)`-classes of such pairs with `T ⊂ L` is the number `∏_i c_{n_i}(q)` of conjugacy
classes of `L(F)`.

Route: a semisimple `s` makes `F^n` a module over `F[X]/(charpoly)`, which splits by the Chinese remainder
theorem, and its centraliser is the unit group of the endomorphism ring of that module,
`∏_f GL_{m_f}(𝔽_{q^{deg f}})` for characteristic polynomial `∏_f f^{m_f}`. Similarity of matrices is classified by
invariant factors (ClassicalArithmeticCompletion §3.59); regrouping the invariant factors into elementary divisors,
with the Jordan decomposition of an element into commuting semisimple and unipotent parts, gives the
parametrisation, and the semisimple classes are the characteristic polynomials, the monic polynomials of degree
`n` with nonzero constant term. Generating function: the monic polynomials with nonzero constant term have
generating function `(1 − t)/(1 − qt) = ∏_d (1 − t^d)^{−N*_q(d)}` (unique factorisation); the class count is
`∏_d (Σ_μ t^{d|μ|})^{N*_q(d)} = ∏_d ∏_{i≥1} (1 − t^{di})^{−N*_q(d)}`, and substituting `t ↦ t^i` in the first identity
gives the product. Pairs: by the twisted classes of the Weyl group (ReductiveGroups §7a.2), a pair is up to
conjugacy a cycle type `τ ⊢ n` with a character `θ = ⊠_i θ_i` of `∏_i 𝔽_{q^{τ_i}}^×` up to the normaliser
`∏_k (ℤ/k ≀ S_{a_k})` (`a_k` the number of parts equal to `k`, `ℤ/k` acting by Frobenius). A character of `𝔽_{q^r}^×`
whose Frobenius orbit has size `d ∣ r` factors through the norm to `𝔽_{q^d}^×` (by Hilbert 90 the kernel of the norm
is `{x^{q^d−1}}`), so the classes of pairs correspond to a label `κ` of degree `n` with a partition `ν_O ⊢ κ(O)` for
each orbit, the parts of `ν_O` being the `τ_i/|O|` with `θ_i` over `O`: every pair is conjugate to one
`(T_{κ,ν}, θ_{κ,ν})`, with `κ` and `ν` unique. The orbits of size `d` number `N*_q(d)`, so the count is
`∏_O Σ_k p(k) t^{|O|k} = ∏_d ∏_{i≥1} (1 − t^{di})^{−N*_q(d)}`, the product above. For `L = ∏_i GL_{n_i}` both counts are
products over the factors.

*Needs:* ClassicalArithmeticCompletion §3.59; ReductiveGroups §7a.2 (rational maximal tori and the twisted classes
of the Weyl group); Mathlib `Matrix.charpoly`, `Polynomial.Monic`, `Irreducible`, `Nat.Partition`, `PowerSeries`.

(Green, *The characters of the finite general linear groups*, 1955, for the classes; Macdonald, *Symmetric functions
and Hall polynomials*, second edition, Ch. IV. The generating function is Feit–Fine 1960 and Macdonald 1981, and
the number `q^n − q^{n−1}` of semisimple classes is recorded with it in Fulman–Guralnick, §3.2. The count of classes
of pairs is equivalent, by the inner product formula (§1.4), to the uniformity of all class
functions of `G` (§2.8 (a)), which follows from Lusztig–Srinivasan 1977 (Geck 2017, Example 2.13); it is proved
directly in the route.)

**Checks.**
- `c₁ = q − 1`, `c₂ = q² − 1`, `c₃ = q³ − q`, read off the product to order `t³`.
- `GL₂(𝔽_q)`: `q − 1` central, `½(q−1)(q−2)` split semisimple, `q − 1` non-semisimple and `½q(q−1)` elliptic
  classes, the four families of RepresentationTheory/CharacterTheory §9.1.
- Pairs for `n = 2`: `T_{(1,1)}` with the `½(q−1)q` unordered pairs `{α, β}` of characters of `𝔽_q^×` (`α = β`
  allowed), and `T_{(2)}` with the `½(q² − 1 − (q − 1)) + (q − 1) = ½(q² + q − 2)` Frobenius orbits of characters of
  `𝔽_{q²}^×`: in all `q² − 1 = c₂(q)`.

### 2.2 The mirabolic subgroup and derivatives

Write `P_n = GL_{n−1} ⋉ V_n` with `V_n` the unipotent radical of matrices `[[1_{n−1}, v], [0, 1]]`, and define the exact
functors `Ψ⁻(τ) = τ^{V_n}` to representations of `GL_{n−1}(F)` and its left adjoint `Ψ⁺` (inflation). For `n ≥ 2` the
stabiliser in `GL_{n−1}` of the character `v ↦ ψ₀(v_{n−1})` of `V_n` is the mirabolic subgroup `P_{n−1}`; define
`Φ⁻(τ)`, the `(V_n, ψ₀(v_{n−1}))`-isotypic part, a representation of `P_{n−1}(F)`, and
`Φ⁺(ρ) = Ind_{P_{n−1}V_n}^{P_n}(ρ ⊗ ψ₀(v_{n−1}))`. For `n = 1`, `P_1 = GL_0 = 1` and `V_1 = 1`, so `Ψ^±` are the identity,
and `V_1` has no nontrivial character: `Φ^±` occur only on `P_m` with `m ≥ 2`.

(a) For `n ≥ 2`, `Ψ⁻Ψ⁺ ≅ 1`, `Φ⁻Φ⁺ ≅ 1`, `Φ⁻Ψ⁺ = 0`, `Ψ⁻Φ⁺ = 0`. For `n ≥ 1` every representation `τ` of `P_n(F)`
satisfies `τ ≅ ⊕_{i=1}^n (Φ⁺)^{i−1}Ψ⁺(τ^{(i)})` with the **derivatives** `τ^{(i)} = Ψ⁻(Φ⁻)^{i−1}τ`, representations of
`GL_{n−i}(F)` (for `n = 1` the single term `τ = Ψ⁺Ψ⁻τ`); `dim (Φ⁺)^{i−1}Ψ⁺(ρ) = dim ρ·∏_{j=n−i+1}^{n−1}(q^j − 1)`. The
representations `(Φ⁺)^{i−1}Ψ⁺(ρ)`, for `1 ≤ i ≤ n` and `ρ` irreducible of `GL_{n−i}(F)`, are irreducible and pairwise
non-isomorphic, and exhaust the irreducible representations of `P_n(F)`.

(b) For a representation `π` of `G` put `π^{(i)} = (π|_{P_n})^{(i)}`. Then `π^{(i)}` is the space of
`(U_i, ψ)`-coinvariants, on the second factor, of `*R_{GL_{n−i}×GL_i}^{GL_n}(π)`, as a representation of
`GL_{n−i}(F)`. For irreducible `π`: `π` is generic iff `π^{(n)} ≠ 0`, and then `π^{(n)}` is one-dimensional; `π` is
cuspidal iff `π|_{P_n} ≅ (Φ⁺)^{n−1}Ψ⁺(1) = Ind_U^{P_n(F)} ψ`. In particular every cuspidal representation is generic
and has degree `ϖ_{n−1}(q) = ∏_{i=1}^{n−1}(q^i − 1)`.

(c) Every unipotent element of `G` is conjugate into `P_n(F)`, and for a cuspidal `π` and `u` unipotent of Jordan type
`μ`, `π(u) = (−1)^{n−ℓ(μ)} ∏_{i=1}^{ℓ(μ)−1}(q^i − 1)`.

(d) For an irreducible cuspidal `σ` of `GL_d(F)`, `σ × σ` has two constituents, each of multiplicity one: a generic one
of degree `q^d·ϖ_{2d−1}(q)/(q^d − 1)` and a non-generic one of degree `ϖ_{2d−1}(q)/(q^d − 1)`, whose restriction to
`P_{2d}` is `(Φ⁺)^{d−1}Ψ⁺(σ)`.

Route: (a) the finite-field form of the theory of derivatives (Gelfand–Kazhdan; Bernstein–Zelevinsky; Zelevinsky,
Ch. III): the exact sequence `0 → Φ⁺Φ⁻ → 1 → Ψ⁺Ψ⁻ → 0` on representations of `P_n`, split because the groups are
finite, comes from the decomposition of `τ|_{V_n}` into the `V_n`-invariants and the orbit of nontrivial characters of
`V_n`, which `GL_{n−1}(F)` permutes transitively with stabiliser `P_{n−1}(F)` of index `q^{n−1} − 1` (so the stabiliser
in `P_n(F)` is `P_{n−1}V_n`), for `n ≥ 2`; iterate down to `P_1 = 1`, where `τ = Ψ⁺Ψ⁻τ`. (b) Unwinding `(Φ⁻)^{i−1}` and
`Ψ⁻`, `π^{(i)}` is the space of coinvariants of the unipotent radical of the parabolic subgroup of type `(n−i, i)`
(trivial character) times `U_i` (character `ψ`), the stated Whittaker coinvariant of the Harish-Chandra restriction;
genericity is `i = n` with Frobenius reciprocity and multiplicity one (ReductiveGroups §7i.2); cuspidality is the
vanishing of every `*R` with `i < n`. For the criterion by the mirabolic restriction, by (a) it says that `π^{(i)} = 0`
for `i < n` and that `π^{(n)}` is a line. If `π` is not cuspidal, let `(∏_{i≤r} GL_{n_i}, ⊠_i σ_i)`,
`r ≥ 2`, be its cuspidal support (ReductiveGroups §7h.2): by adjunction and transitivity (ReductiveGroups §7c.1),
`*R_{GL_{n−n_r}×GL_{n_r}}^{GL_n}(π)` has a constituent `τ ⊠ σ_r`, and `σ_r`, cuspidal of smaller rank, is generic by
induction on `n`, so `π^{(n_r)} ≠ 0` with `n_r < n`. The degree: `|P_n(F)|/|U| = ϖ_{n−1}(q)`. (c) A unipotent element
fixes a nonzero linear form, hence is conjugate into `P_n`, and by (b) `π|_{P_n} = ρ_n` with `ρ_k = (Φ⁺)^{k−1}Ψ⁺(1)` on
`P_k`. By induction on `k`, the value of `ρ_k` at a unipotent `u ∈ P_k` with `ℓ` Jordan blocks (in `GL_k`) is
`(−1)^{k−ℓ}∏_{i=1}^{ℓ−1}(q^i − 1)`: write `u = (a, v) ∈ GL_{k−1} ⋉ V_k`; the induced-character formula gives
`ρ_k(u) = Σ_w ψ₀(w(v))·ρ_{k−1}(a_w)` over the nonzero linear forms `w` on `F^{k−1}` with `w∘a = w`, `a_w` being `a`
read in the stabiliser of `w`; the forms fixed by `a` make up a space of dimension `ℓ(a)` whose annihilator is
`Im(a − 1)`, so the sum is `q^{ℓ(a)} − 1` if `v ∈ Im(a − 1)` (and then `u` has `ℓ(a) + 1` blocks) and `−1` otherwise (and
then `u` has `ℓ(a)` blocks). (d) The Harish-Chandra restriction of `σ × σ` to `GL_d × GL_d` is `2(σ ⊠ σ)` (Mackey formula,
ReductiveGroups Layer 7d); the normaliser of `GL_d × GL_d` exchanges the two blocks, so the stabiliser of `σ ⊠ σ` in
it has order two modulo `GL_d × GL_d`, and the endomorphism algebra of `σ × σ` is two-dimensional and commutative
(ReductiveGroups §7h.3): two constituents, each of multiplicity one. The other Harish-Chandra restrictions of `σ × σ`
to `GL_{2d−i} × GL_i`, `0 < i < 2d`, `i ≠ d`, vanish by the Mackey formula and cuspidality, so by (b) the derivatives of
each constituent vanish except in degrees `d` (equal to `σ`) and `2d`. Put
`D = ϖ_{2d−1}(q)/(q^d − 1)`. Then `dim(σ × σ) = ϖ_{2d}(q)/(q^d − 1)² = (q^d + 1)D`; the two derivatives in degree `d`
contribute `2D` by (a); the remainder `(q^d − 1)D = ϖ_{2d−1}(q)` shows that `(σ × σ)^{(2d)}` is a line. As derivatives are
additive, exactly one constituent is generic, and the degrees are `D + ϖ_{2d−1}(q) = q^dD` and `D`.

*Needs:* ReductiveGroups Layers 7c, 7d, 7e, §7c.1, §§7h.1–7h.3 (cuspidality, cuspidal support, endomorphism
algebras) and §7i.2 (multiplicity one, generic representations); RepresentationTheory/InductionRestriction Layers 0, 2–5; RepresentationTheory/CharacterTheory §3.6.

(S. I. Gelfand, *Representations of the full linear group over a finite field*, 1970, Proposition 1.3, Theorem 2.3
with its Corollary 1 and Theorem 3.3, pp. 20–23 of the original: the criterion of (b) for cuspidality by the
restriction to `P_n`, and the degree. The functors, the derivatives, the classification in (a) and the description
of `π^{(i)}` in (b): Zelevinsky, LNM 869, Ch. III, in the formalism of Gelfand–Kazhdan 1975 and Bernstein–Zelevinsky
1976. (c): the values are Green's, Green 1955, §5, Example (ii) (with Definition 4.1), quoted as (6.1) in S. I.
Gelfand 1970, whose Theorem 2.3 gives the common restriction to `P_n` of all cuspidal representations. (d): the two
constituents and their degrees: Howlett–Lehrer 1980, Theorem 3.18 (i) with Example 4.15 (ii);
Brundan–Dipper–Kleshchev, (2.4a), (2.5.2), (2.5.3) and Theorem 2.5d (v) for the generic one; the restriction to
`P_{2d}` follows from (a) and (b).)

**Checks.**
- `n = 2`: `P₂ ≅ F ⋊ F^×`; its irreducible representations are the `q − 1` characters (`i = 1`, `Ψ⁺` of the characters
  of `GL₁`) and the one of degree `q − 1` (`i = 2`, `Φ⁺Ψ⁺(1)`), matching `(q−1)·1² + (q−1)² = q(q−1) = |P₂(F)|`.
- A one-dimensional representation `α∘det` of `G`, `n ≥ 2`, has `π^{(1)} = α∘det` on `GL_{n−1}` and all higher
  derivatives zero; it is neither generic nor cuspidal.
- (c) for `GL₂`: a cuspidal character is `q − 1` at `1` and `Σ_{a≠0}ψ₀(a) = −1` at a regular unipotent element; for
  `GL₃`: `(q−1)(q²−1)` at `1`, `−(q−1)` on the class `(2,1)` and `1` at a regular unipotent element.
- (d) for `d = 1`, `σ = 1`: the two constituents of `Ind_B 1` of `GL₂` have degrees `1` and `q`.
- (d) agrees with the degree formula of §2.7 for the label `2·O`, `|O| = d`: the column `(1,1)` gives
  `q^d ϖ_{2d}(q)/ϖ₂(q^d) = q^dD` and the row `(2)` gives `ϖ_{2d}(q)/ϖ₂(q^d) = D`.

### 2.4 Green's cuspidal characters

For a regular `θ ∈ Ξ_n`, `σ_θ = (−1)^{n−1} R_{T_{(n)}}^G(θ)` is an irreducible cuspidal character of `G` of degree
`ϖ_{n−1}(q)`; `σ_θ = σ_{θ′}` iff `θ′ = θ^{q^j}` for some `j`. Further: `σ_θ` has central character `θ|_{F^×}`;
`σ_θ ⊗ (α∘det) = σ_{θ·(α∘N)}` for `α ∈ Ξ_1`; `σ_θ^∨ = σ_{θ⁻¹}`; at a regular elliptic element (characteristic polynomial
irreducible) with eigenvalue `z ∈ 𝔽_{q^n}`, `σ_θ = (−1)^{n−1} Σ_{j=0}^{n−1} θ(z^{q^j})`; at a regular semisimple element that
is not elliptic, `σ_θ = 0`; at `su` with `s` semisimple and `u` unipotent commuting with `s`, `σ_θ(su) = 0` unless the
characteristic polynomial of `s` is `f^{n/d}` with `f` irreducible of degree `d ∣ n`, in which case, with `z` a root of `f`
and `ℓ_d(u)` the number of Jordan blocks of `u` in `C_G(s) ≅ GL_{n/d}(𝔽_{q^d})`,

`σ_θ(su) = (−1)^{n−1} (Σ_{j=0}^{d−1} θ(z^{q^j}))·∏_{i=1}^{ℓ_d(u)−1}(1 − q^{di})`.

Route: `θ` regular is in general position for `T_{(n)}`, whose Weyl group `N_G(T_{(n)})/T_{(n)}^{Fr} ≅ ℤ/n` acts by
Frobenius (ReductiveGroups §7a.2); so irreducibility up to the sign `ε_Gε_{T_{(n)}} = (−1)^{n−1}` and the degree are the
degree and irreducibility theorems (§1.7), the orbit criterion is the inner product formula
(§1.4), and cuspidality is the cuspidality theorem (§1.9), `T_{(n)}` lying in no proper rational Levi subgroup
(`𝔽_{q^n}^×` acts irreducibly on `F^n`). Central character and dual from the definition of `R_T^G(θ)` (§1.2); twist
from the character formula (§1.3), as in the route of §2.7. Values: the character formula (§1.3), where for `s` with characteristic polynomial `f^{n/d}` the torus `T_{(n)}` lies in
`C(s) ≅ Res_{𝔽_{q^d}/F} GL_{n/d}`, and for other `s` no conjugate of `s` lies in `T_{(n)}`. It remains to show that the
Green function `Q^{C(s)}_{T_{(n)}}` at a unipotent element with `ℓ_d(u)` blocks is `∏_{i=1}^{ℓ_d(u)−1}(1 − q^{di})`. Over
`F̄`, `C(s)` is a product of `d` copies of `GL_{n/d}` permuted cyclically by `Fr`, and projection to the first factor
identifies `C(s)^{Fr}` with `GL_{n/d}(𝔽_{q^d})` and the rational parabolic and Levi subgroups of `C(s)`, with their rational
points and unipotent radicals, with those of `GL_{n/d}` over `𝔽_{q^d}`; so it identifies the Harish-Chandra functors and
cuspidality on both sides (it does not identify Deligne–Lusztig varieties, and none is needed). `T_{(n)}` lies in no
proper rational Levi subgroup of `C(s)`, `N_{C(s)^{Fr}}(T_{(n)})/T_{(n)}^{Fr} ≅ ℤ/(n/d)` acts by `x ↦ x^{q^d}`, and for a
character `θ′` of `𝔽_{q^n}^×` with `n/d` distinct `q^d`-conjugates (one exists) the cuspidality and irreducibility
theorems in `C(s)` make `(−1)^{n/d−1}R^{C(s)}_{T_{(n)}}(θ′)` an irreducible cuspidal character of `GL_{n/d}(𝔽_{q^d})`. Its
values at unipotent elements are §2.2(c) over `𝔽_{q^d}`, and on unipotent elements it is `(−1)^{n/d−1}Q^{C(s)}_{T_{(n)}}`,
which gives the product.

*Needs:* §2.2(c); §§1.2, 1.3, 1.4, 1.7, 1.9 (Deligne–Lusztig characters and Green functions,
the character formula, the inner product formula, degree, sign and irreducibility, cuspidality) and ReductiveGroups §7a.2 (rational
maximal tori); Mathlib `GaloisField`.

(Green 1955, the characters, their degree and their values; his Lemma 6.3 for the orbit criterion. Deligne–Lusztig
1976 for the form through `R_T^G(θ)`. Cuspidality: S. I. Gelfand 1970, Theorem 6.1.)

**Checks.**
- `n = 1`: `σ_θ = θ`.
- `n = 2`: the degree `q − 1` and the `½q(q−1)` Frobenius orbits of regular characters of `𝔽_{q²}^×` are those of the
  cuspidal family of RepresentationTheory/CharacterTheory §9.1.
- A non-regular `θ = α∘N_{𝔽_{q²}/𝔽_q}` on `𝔽_{q²}^×` gives `−R_{T_{(2)}}^G(θ) = α·St − α∘det`, not a character: the
  regularity hypothesis is needed for irreducibility.
- At a regular unipotent element `σ_θ = (−1)^{n−1}`; at `1` the formula gives `(−1)^{n−1}∏_{i=1}^{n−1}(1 − q^i) = ϖ_{n−1}(q)`,
  the degree.

### 2.5 Hecke algebras of Harish-Chandra induced cuspidal representations

Let `L = ∏_i GL_{d_i}^{m_i}` (block diagonal, the blocks of each `i` consecutive), with standard parabolic subgroup `P`,
and `σ = ⊠_i σ_i^{⊠ m_i}` with `σ_i` pairwise non-isomorphic irreducible cuspidal representations of `GL_{d_i}(F)`. Then
`W_G(L, σ) = {x ∈ N_G(L) : ˣσ ≅ σ}/L(F) ≅ ∏_i S_{m_i}`, realised by the block permutation matrices. For each `i`,
`σ_i × σ_i` has exactly two constituents, each of multiplicity one (§2.2(d)); let `a_i ≥ 1` be the ratio of their
degrees, so that `a_i = q^{d_i}`. `End_G(R_L^G σ)` has a basis `T_w`, `w ∈ ∏_i S_{m_i}`, with `T_w` supported on the double
coset `P ẇ P`, `T_w T_{w′} = T_{ww′}` when lengths add, and `(T_s − a_i)(T_s + 1) = 0` for each simple reflection `s` of the
factor `S_{m_i}`. Thus `End_G(R_L^G σ) ≅ ⊗_i H_{m_i}(a_i)`, where `H_m(a)` is the Iwahori–Hecke algebra of `S_m` with
these relations, the algebra of TypeAHeckeAlgebras §1.1 at the parameter `√a` after the substitution `T_s ↦ √a·T_s`;
it is split semisimple, and the constituents of `R_L^G σ` correspond to its simple modules, with multiplicity the
dimension. For `L = T` and `σ = 1` this is Iwahori's theorem `End_G(Ind_B^G 1) ≅ H_n(q)`.

Route: `W_G(L, σ)`: the normaliser of `L` permutes the blocks, and a permutation preserves `σ` iff it preserves each
family of `σ_i`-blocks, the `σ_i` being pairwise non-isomorphic. The block permutation matrices permute the tensor
factors of `σ`, which extends `σ` to `L(F) ⋊ ∏_i S_{m_i}` and gives operators `B_w` supported on the double cosets
`P ẇ P`; the dimension of `End_G(R_L^G σ)` is `|W_G(L, σ)|` and its simple modules correspond to the constituents
(ReductiveGroups §7h.3), so the `B_w` form a basis, and when lengths add `P ẇ P ẇ′ P = P ẇẇ′ P`, which gives
`B_wB_{w′} = B_{ww′}`. The `T_w` of the statement are `∏_i c_i^{ℓ_i(w)}·B_w`, with one nonzero constant `c_i` for each
factor `S_{m_i}` (`ℓ_i` the length of the component in that factor), fixed by the quadratic relation; `c_i` is not 1 in
general (Brundan–Dipper–Kleshchev, (2.5b)). The quadratic relation is computed in the Levi subgroup `M ⊃ L` in
which the two `σ_i`-blocks exchanged by `s` form one block `GL_{2d_i}`, where `R_L^M σ` is `σ_i × σ_i` tensor the other
blocks: there the endomorphism algebra is two-dimensional, the two roots of the relation are fixed by the degrees of
the two constituents, and `R_M^G` (transitivity, ReductiveGroups §7c.1) carries it to `End_G(R_L^G σ)`; the ratio
`a_i = q^{d_i}` is §2.2(d). Split semisimplicity: the criterion of TypeAHeckeAlgebras §1.2, `∏_r (1 + a + ⋯ + a^{r−1}) ≠ 0`,
holds for `a > 0`.

*Needs:* §2.2(d); ReductiveGroups Layers 7b–7e, §7c.1 and §7h.3 (endomorphism algebras of Harish-Chandra induced
cuspidal representations); TypeAHeckeAlgebras §§1.1, 1.2.

(Howlett–Lehrer 1980: the two constituents and the presentation by the `T_w` are Theorems 3.18 (i) and 4.14
(pp. 48, 56–57), and `L = GL_d^m` is their Example 4.15 (pp. 57–58). Iwahori 1964 for `L = T`, `σ = 1`. Dudas–Michel 2015,
§11.1, Lemmas 11.8–11.10 and Theorem 11.11: the products when lengths add, the quadratic relation from a Levi
subgroup of relative rank one, explicit in the dimensions of the two summands.)

**Checks.**
- `GL₂`, `σ = 1`: `Ind_B^G 1 = 1 + St`, of degrees `1` and `q`, so `a = q`; `T_s` acts by `q` on the `B`-fixed line of the
  trivial constituent (the index `[BsB : B] = q`) and by `−1` on the Steinberg constituent, so `(T_s − q)(T_s + 1) = 0` and
  not `(T_s − 1)(T_s + 1) = 0`.
- `GL₃`, `σ = 1`: three constituents, with multiplicities `1, 2, 1` (the dimensions of the simple modules of `H₃(q)`) and
  degrees `1, q(q+1), q³`; `1 + 2q(q+1) + q³ = (q²+q+1)(q+1)`, the number of complete flags in `F³`.

### 2.6 The characteristic map of a label

Fix a label `κ` of degree `n`, the cuspidal characters `σ_O = σ_{θ_O}` of `GL_{|O|}(F)` (§2.4), the Levi subgroup
`L_κ = ∏_O GL_{|O|}^{κ(O)}` and `σ_κ = ⊠_O σ_O^{⊠κ(O)}`. Let `Λ_κ = ⊗_O Λ_ℂ^{κ(O)}` (the parts of degree `κ(O)`), with the
tensor product of the Hall inner products, and define the linear map `ch_κ : Λ_κ → (class functions on G)` by

`ch_κ(⊗_O p_{ν_O}) = (−1)^{n + Σ_O κ(O)} R_{T_{κ,ν}}^G(θ_{κ,ν})`.

Then:
(a) `ch_κ` is an isometry onto the span `V_κ` of the `R_T^G(θ)` with `(T, θ)` of label `κ`, and `V_κ` is the span of the set
`E_κ` of irreducible constituents of these `R_T^G(θ)`; the `V_κ` are pairwise orthogonal and span all class functions;
(b) `ch_{κ′+κ″}(f′·f″) = ch_{κ′}(f′) × ch_{κ″}(f″)` (Harish-Chandra product from `GL_{n′} × GL_{n″}`); in particular
`ch_κ(⊗_O p_1^{κ(O)}) = R_{L_κ}^G(σ_κ)`;
(c) `χ_{gen(κ)} = ch_κ(⊗_O e_{κ(O)})` is an irreducible character, the unique constituent of `Γ_n` in `E_κ`;
(d) for every Green datum `λ` with label `κ`, `χ_λ = ch_κ(⊗_O s_{λ(O)})` is an irreducible character; the `χ_λ` are
pairwise distinct, `E_κ = {χ_λ : |λ| = κ}`, and `E_κ` is the Harish-Chandra series of `(L_κ, σ_κ)`, with
`⟨χ_λ, R_{L_κ}^G σ_κ⟩ = ∏_O f^{λ(O)}`.

Route: (a) the inner product formula (§1.4) with the pairs of §2.1: pairs of
label `κ` with different `ν` are not conjugate, and `⟨R_{T_{κ,ν}}^G(θ_{κ,ν}), R_{T_{κ,ν}}^G(θ_{κ,ν})⟩` is the order of the
stabiliser of `θ_{κ,ν}` in `N_G(T_{κ,ν})/T_{κ,ν}^{Fr}`, the product over the sizes `s` of the groups `ℤ/s ≀ S_{A_s}`, `A_s`
the number of factors of size `s`. An element fixing `θ_{κ,ν}` cannot move a factor attached to `O` to one attached to
`O′ ≠ O` (the two characters are not Frobenius conjugate), and a rotation by `j` fixes `θ_O∘N` iff `|O| ∣ j`, `θ_O` being
regular of degree `|O|`; so the stabiliser is `∏_O ∏_k (ℤ/k ≀ S_{a_k})`, `a_k` the number of parts of `ν_O` equal to `k`,
of order `∏_O z_{ν_O} = ⟨⊗p_{ν_O}, ⊗p_{ν_O}⟩`. Pairs of different labels are not geometrically conjugate: over `𝔽_{q^k}`,
`k` divisible by every degree of a factor of either torus, both tori split and `θ∘N` becomes `n` characters of
`𝔽_{q^k}^×`, each orbit `O` contributing its `|O|` conjugates with multiplicity `κ(O)`; so the `V_κ` are orthogonal.
`dim V_κ = dim Λ_κ = ∏_O p(κ(O))`, and `Σ_κ ∏_O p(κ(O)) = c_n(q)`, the number of classes of pairs (§2.1), which is
the dimension of the space of class functions; so `⊕_κ V_κ` is everything. Each `V_κ` lies in the span of `E_κ`, and the
spans of the `E_κ` are orthogonal by the disjointness of Lusztig series (§1.8); hence
`V_κ = span E_κ`. (b) Harish-Chandra compatibility of Deligne–Lusztig characters (§1.5 (a)) with
the product formula `R^{G′×G″}_{T′×T″}(θ′ ⊠ θ″) = R^{G′}_{T′}(θ′) ⊠ R^{G″}_{T″}(θ″)` for a product of general linear groups,
which is proved as part of this target: the Deligne–Lusztig variety of `T′ × T″ ⊂ B′ × B″` is the product of those of
`T′ ⊂ B′` and `T″ ⊂ B″`, and the Künneth formula factors the Lefschetz numbers that define `R_T^G(θ)` (§1.2).
`T_{κ′,ν′} × T_{κ″,ν″}` inside `GL_{n′} × GL_{n″}` is `T_{κ′+κ″, ν′∪ν″}`, and the signs multiply. (c) By the pairing of
Gelfand–Graev characters with Deligne–Lusztig characters (§1.11; the centre of `GL_n` is connected),
`⟨Γ_n, R_T^G(θ)⟩ = ε_Gε_T`, with `ε_Gε_{T_τ} = (−1)^{n−ℓ(τ)}`, the projection of `Γ_n` to `span E_κ = V_κ` pairs with
`ch_κ(⊗p_{ν_O})` to `(−1)^{Σ_O(κ(O) − ℓ(ν_O))} = ⟨⊗p_{ν_O}, ⊗e_{κ(O)}⟩`; so the projection is
`ch_κ(⊗e_{κ(O)})`, of norm one, and since `Γ_n` is an actual character the projection is a single irreducible
character. (d) Products of the characters of (c) for smaller labels are characters (b), so `ch_κ` maps
`⊗_O Λ_ℤ^{κ(O)}`, spanned over `ℤ` by products of the `e_k`, into virtual characters; the `ch_κ(⊗s_{λ(O)})` are virtual
characters forming an orthonormal basis of `span E_κ`, hence `±` the elements of `E_κ`, and
`⟨ch_κ(⊗s_{λ(O)}), R_{L_κ}^G σ_κ⟩ = ⟨⊗s_{λ(O)}, ⊗p_1^{κ(O)}⟩ = ∏_O f^{λ(O)} > 0` fixes the sign and shows that every element
of `E_κ` is a constituent of `R_{L_κ}^G σ_κ`, whose constituents lie in `E_κ`.

*Needs:* §2.1, §2.4; §§1.2, 1.4, 1.5 (a), 1.8, 1.11 (the definition of `R_T^G(θ)` by Lefschetz
numbers, the inner product formula, Harish-Chandra compatibility, geometric conjugacy and the disjointness of Lusztig
series, the pairing with Gelfand–Graev characters) and ReductiveGroups §7i.2 (multiplicity one); RepresentationTheory/SchurWeyl §§7.5–7.7 (`Λ`, the Hall
form, power sums, Schur functions, Jacobi–Trudi, the Frobenius characteristic); the product formula for
Deligne–Lusztig characters of a product of general linear groups, proved as part of this target (route of (b)).

(Green 1955; Macdonald, *Symmetric functions and Hall polynomials*, second edition, Ch. IV; in the language of
Deligne–Lusztig characters: Fong–Srinivasan 1982, §1, (1.13)–(1.18), (1B), (1C), and Brundan–Dipper–Kleshchev,
§§2.3–2.5; the uniformity in (a) follows from Lusztig–Srinivasan 1977 (Geck 2017, Example 2.13); Zelevinsky,
LNM 869.)

**Checks.**
- `n = 2`, `κ = 2·{1}` (the orbit of the trivial character): `ch(h₂) = ½(R_{T_{(1,1)}}(1) + R_{T_{(2)}}(1)) = 1` and
  `ch(e₂) = ½(R_{T_{(1,1)}}(1) − R_{T_{(2)}}(1)) = St`, the constituent of `Γ₂` in the unipotent series.
- `n = 2`, `κ = {O}` with `|O| = 2`, `θ ∈ O`: `ch_κ(p₁) = (−1)^{2+1}R_{T_{(2)}}(θ) = σ_θ`. Without the sign
  `(−1)^{n+Σκ(O)}` it would be `−σ_θ`.

### 2.7 Green's parametrisation and degree formula

The irreducible characters of `G` are the `χ_λ` of §2.6, `λ` running over the Green data of weight `n`, without
repetition. The degree of `χ_λ` is

`χ_λ(1) = ϖ_n(q) ∏_O q_O^{n(λ(O))} / H̃_{λ(O)}(q_O)`.

Twisting and duality: `χ_λ ⊗ (α∘det) = χ_{α·λ}` and `χ_λ^∨ = χ_{λ∘inv}`, where `α·λ` and `λ∘inv` transport `λ` along the
maps of orbits `O ↦ α·O` (the orbit of `θ_O·(α∘N)`, `α ∈ Ξ_1`) and `O ↦ O⁻¹`. Every irreducible cuspidal character is some
`σ_θ` (§2.4), so the cuspidal characters are in bijection with the Frobenius orbits of degree `n`. The degree formula
rests on the `q`-hook formula in `Λ_ℂ`: the principal specialisation
`s_μ(1, t, t², …) = t^{n(μ)} ∏_{boxes} (1 − t^{h(box)})^{−1}`, an identity of power series in `t` whose two sides are
expansions of rational functions; the degree formula uses the rational functions at `t = q_O`.

Route: §2.6(a), (d): the `E_κ` partition the irreducible characters and `E_κ = {χ_λ : |λ| = κ}` without repetition. The
degree: `ch_κ(⊗p_{ν_O})(1) = (−1)^{Σ_O(κ(O) − ℓ(ν_O))} ϖ_n(q)/∏_{O,i}(q_O^{ν_{O,i}} − 1)` by the degree formula for
Deligne–Lusztig characters (§1.7 (a)), which is `ϖ_n(q)` times the value at `⊗p_{ν_O}` of the
specialisation `⊗_O g_O ↦ ∏_O (−1)^{deg g_O} g_O(1, t, t², …)|_{t=q_O}` (`p_k(1, t, …) = (1 − t^k)⁻¹`); expand
`s_μ = Σ_ν χ^μ(ν)p_ν/z_ν` (RepresentationTheory/SchurWeyl §7.6) and apply the `q`-hook formula. The `q`-hook formula: the bialternant formula
at `x_i = t^{i−1}`, `i ≤ N`, is a ratio of Vandermonde determinants in powers of `t`, giving
`s_μ(1, …, t^{N−1}) = t^{n(μ)} ∏_{boxes}(1 − t^{N+c(box)})/(1 − t^{h(box)})`, `c` the content; let `N → ∞` in `ℤ[[t]]`.
Twisting and duality: for every pair `(T, θ)`, `R_T^G(θ) ⊗ (α∘det) = R_T^G(θ·(α∘det)|_{T^{Fr}})` and
`R_T^G(θ)^∨ = R_T^G(θ⁻¹)` (the character formula, §1.3: `det(su) = det s`, and the Green functions are
rational integers, §1.2, with `Q(u⁻¹) = Q(u)`). For the pairs `(T_{κ,ν}, θ_{κ,ν})`, `α∘det` restricted to
`T_{κ,ν}^{Fr}` is `⊠_{O,i} α∘N`, so `θ_{κ,ν}·(α∘det) = θ_{α·κ,ν}` with the representatives `θ_O·(α∘N)` of the orbits `α·O`,
and `θ_{κ,ν}⁻¹ = θ_{κ∘inv,ν}`; the orbit sizes and the signs of §2.6 are unchanged. Hence `ch_κ(f) ⊗ (α∘det) = ch_{α·κ}(f)`
and `ch_κ(f)^∨ = ch_{κ∘inv}(f)` for every `f ∈ Λ_κ`, first for `f = ⊗_O p_{ν_O}` and then by linearity; at
`f = ⊗_O s_{λ(O)}` this is the formula. Cuspidal characters: `χ_λ` lies in the Harish-Chandra series of `(L_κ, σ_κ)`
(§2.6(d)), so it is cuspidal iff `L_κ = G`, iff `κ` is a single orbit of size `n` with `κ(O) = 1`, iff `χ_λ = σ_θ`.

*Needs:* §2.4, §2.6; §§1.2, 1.3, 1.7 (a) (Green functions, the character formula, the degree
formula); RepresentationTheory/SchurWeyl Layer 4 and Layer 7 (Schur functions, the Frobenius characteristic, the Hall form).

(Green 1955; the exhaustion of the cuspidal characters is his Lemma 7.7 and Theorem 13, by comparison with the number
of classes. Macdonald, *Symmetric functions and Hall polynomials*, second edition, Ch. I §3, Examples 1–2 (the
`q`-hook formula), and Ch. IV. Restated in Brundan–Dipper–Kleshchev, (2.3.5)–(2.3.7) and the opening of §2.4 (cuspidal
characters).)

**Checks.**
- `λ = (n)` at the orbit of `1` gives degree `1` (the trivial character); `λ = (1^n)` there gives `q^{n(n−1)/2}`, the
  Steinberg character; `λ = (1)` at an orbit of size `n` gives `ϖ_{n−1}(q)`, `σ_θ`. Exchanging `λ(O)` with its conjugate
  partition throughout would swap the first two: this Check pins the convention.
- `GL₂`: `(2)` at `{α}`: degree `1`; `(1,1)` at `{α}`: `q`; `(1)` at `{α}` and `(1)` at `{β}`, `α ≠ β`: `q + 1`; `(1)` at an
  orbit of size `2`: `q − 1`; with counts `q − 1, q − 1, ½(q−1)(q−2), ½q(q−1)` and `Σ deg² = |GL₂(𝔽_q)|`, as in RepresentationTheory/CharacterTheory §9.2.
- `GL₃`, `λ = (2,1)` at `{1}`: `n((2,1)) = 1`, hooks `3, 1, 1`, degree `q(q+1)`, as in the Check of §2.5.

### 2.8 Uniformity, Green functions and Green's virtual characters

(a) Every class function on `G` is a linear combination of the `R_T^G(θ)`. Explicitly, for a Green datum `λ` of label `κ`,

`χ_λ = (−1)^{n + Σ_O κ(O)} Σ_ν (∏_O χ^{λ(O)}(ν_O)/z_{ν_O}) R_{T_{κ,ν}}^G(θ_{κ,ν})`,

the sum over the tuples `ν = (ν_O)`, `ν_O ⊢ κ(O)`. For a unipotent character (`λ` supported on the orbit of `1`, with value
`μ` there) this is `χ_μ = (n!)⁻¹ Σ_{w∈S_n} χ^μ(w) R_{T_{τ(w)}}^G(1)`, `τ(w)` the cycle type of `w`. Special values of the Green
functions `Q_T^G`: `Q_{T_τ}^G(u_{(n)}) = 1`; `Q_{T_τ}^G(1) = (−1)^{n−ℓ(τ)} ϖ_n(q)/∏_i (q^{τ_i} − 1)`;
`Q_{T_{(n)}}^G(u_μ) = ∏_{i=1}^{ℓ(μ)−1}(1 − q^i)`.

(b) (Green's virtual characters.) For a homomorphism `θ̃ : F̄^× → ℂ^×` let `b_{θ̃}^{(n)}(x) = Σ_α θ̃(α)`, the sum over the
eigenvalues `α ∈ F̄^×` of `x ∈ GL_n(F)` counted with multiplicity. Green's class functions `J_a(θ̃)` on `GL_a(F)`,
`a ≥ 1`, satisfy, and are determined by, the recursion

`b_{θ̃}^{(n)} = Σ_{a=1}^{n} J_a(θ̃) × 1_{GL_{n−a}(F)}`   for every `n ≥ 1`,

the term `a = n` being `J_n(θ̃)` itself (**Green's virtual characters**). Then `J_n(θ̃)` is the Deligne–Lusztig character of
the Coxeter torus (deduced in the route below from Layer 1):

`J_n(θ̃) = R_{T_{(n)}}^G(θ̃|_{𝔽_{q^n}^×})`.

In particular `b_{θ̃}^{(n)}` is a virtual character, `J_n(θ̃) = (−1)^{n−1}σ_θ` when `θ = θ̃|_{𝔽_{q^n}^×}` is regular (§2.4), and
`*R_L^G J_n(θ̃) = 0` for every proper standard Levi subgroup `L`.

Route: (a) §2.6(a) for uniformity; the formula is the definition of `ch_κ` applied to
`⊗_O s_{λ(O)} = ⊗_O Σ_{ν_O} χ^{λ(O)}(ν_O)p_{ν_O}/z_{ν_O}` (RepresentationTheory/SchurWeyl §7.6). Special values: Green functions at regular unipotent
elements (§1.10, stated for the `q`-Frobenius of an `𝔽_q`-structure, which `Fr` is) and the degree
formula (§1.7 (a)), with `ε_Gε_{T_τ} = (−1)^{n−ℓ(τ)}`; and §2.2(c) with §2.4, `Q_{T_{(n)}}^G` being `(−1)^{n−1}σ_θ` on
unipotent elements (§1.2).
(b) By induction on `n`. The vanishing of the Harish-Chandra restrictions of `R_{T_{(n)}}^G(θ̃|)` is
§1.9 (through the Mackey formula §1.5 (b)): `T_{(n)}` lies in no proper rational Levi subgroup (§2.4). Write
`β_a = R_{T_{(a)}}^{GL_a}(θ̃|_{𝔽_{q^a}^×})` and `ξ_n = b^{(n)} − Σ_{a<n} β_a × 1`. For `0 < c < n`, the Harish-Chandra restriction to
`GL_c × GL_{n−c}` of `b^{(n)}` is `b^{(c)} ⊠ 1 + 1 ⊠ b^{(n−c)}` (an average over the unipotent radical, ReductiveGroups
Layer 7c, of a function of the eigenvalues, which are those of the two diagonal blocks). By the Mackey formula
(ReductiveGroups Layer 7d) the restriction of `β_a × 1_{GL_{n−a}}` to `GL_c × GL_{n−c}` is a sum over the splittings
`a = a₁ + a₂` with `a₁ ≤ c`, `a₂ ≤ n − c`, in which `β_a` enters through its restriction to `GL_{a₁} × GL_{a₂}`. For `a < n`
only `a₁ = 0` and `a₂ = 0` survive (§1.9 in `GL_a`), and as `*R(1) = 1 ⊠ 1` these terms are `(β_a × 1_{GL_{c−a}}) ⊠ 1` (if
`a ≤ c`) and `1 ⊠ (β_a × 1_{GL_{n−c−a}})` (if `a ≤ n − c`). Summing over `a < n` gives `b^{(c)} ⊠ 1 + 1 ⊠ b^{(n−c)}` by the
formula in the ranks `c, n − c < n`, so `ξ_n` is killed by the Harish-Chandra restrictions to the `GL_c × GL_{n−c}`, hence
by every proper Harish-Chandra restriction (transitivity, ReductiveGroups §7c.1). Such a class function is orthogonal to
every Harish-Chandra induced class function (adjunction, ReductiveGroups Layer 7c), in particular to
`R_{T_τ}^G(θ′) = R_L^G(R_{T_τ}^L(θ′))` for `τ ≠ (n)` (§1.5 (a); `T_τ` lies in a proper rational Levi subgroup `L`); by (a)
and the orthogonality of §1.4 it lies in the span of the `R_{T_{(n)}}^G(θ′)`. By adjunction and §1.9 the terms
`β_a × 1`, `a < n`, are orthogonal to `R_{T_{(n)}}^G(θ′)`, and by the pairing of a function of the semisimple part with a
Deligne–Lusztig character (§1.5 (d)),
`⟨ξ_n, R_{T_{(n)}}^G(θ′)⟩ = ⟨b^{(n)}, R_{T_{(n)}}^G(θ′)⟩ = (q^n − 1)⁻¹ Σ_{z∈𝔽_{q^n}^×} Σ_{j<n} θ̃(z^{q^j})·conj(θ′(z))`
(the eigenvalues of `z ∈ T_{(n)}^{Fr} ≅ 𝔽_{q^n}^×` are its conjugates),
which is the number of `j < n` with `θ^{q^j} = θ′`, `θ = θ̃|_{𝔽_{q^n}^×}`, and equals `⟨R_{T_{(n)}}^G(θ), R_{T_{(n)}}^G(θ′)⟩` (the
inner product formula, §1.4, with the Weyl group `ℤ/n` of `T_{(n)}` acting by Frobenius, §2.4). So `ξ_n − β_n` lies in
that span and is orthogonal to it: `ξ_n = β_n`, that is `J_n(θ̃) = β_n`. Virtuality: `R_T^G(θ)` is a virtual character
(§1.2) and Harish-Chandra induction preserves virtual characters (ReductiveGroups Layer 7c).
Green's own route: he obtains the recursion (Lemma 3.2, Theorem 5; Theorem 2 evaluates a Harish-Chandra product as a
sum over invariant subspaces) and proves directly that `J_n(θ̃)` is a virtual character (Theorems 1 and 5), its degree
(Lemma 5.3), its values at primary elements (§5, Example (ii)), its pairings (Lemma 6.3; Theorems 8, 9, 11) and the
irreducibility of `(−1)^{n−1}J_n(θ̃)` for regular `θ` (Lemmas 7.5, 7.6, Theorem 12). Through (b) these are the degree,
values, orbit criterion and irreducibility of §2.4.

*Needs:* §2.2(c), §2.4, §2.6; ReductiveGroups Layers 7c, 7d, §7c.1; §§1.2, 1.4, 1.5 (a), (b), (d), 1.7 (a),
1.9, 1.10 (Deligne–Lusztig characters and Green functions, the inner product formula, Harish-Chandra compatibility,
the Mackey formula and the pairing of a function of the semisimple part with a Deligne–Lusztig character, the degree
formula, cuspidality, Green functions at regular unipotent elements); RepresentationTheory/SchurWeyl Layer 4 and §7.6.

((a): uniformity follows from Lusztig–Srinivasan 1977 (Geck 2017, Example 2.13); in the language of Deligne–Lusztig
characters, Fong–Srinivasan 1982, (1.13), (1.18); the expansion is Green's characteristic map (Green 1955; Macdonald,
Ch. IV), the values of Green functions Deligne–Lusztig 1976. (b): Green 1955, Lemma 3.2 (with `r = 1`) and Theorem 5
(with `v = 1`), with Theorem 2, for the recursion and his functions; the identity
`J_n(θ̃) = R_{T_{(n)}}^G(θ̃|_{𝔽_{q^n}^×})`, for every `θ̃`, is deduced in the route above from Layer 1.)

**Checks.**
- `n = 2`: `χ_{(2)} = ½(R_{T_{(1,1)}}(1) + R_{T_{(2)}}(1)) = 1` and `χ_{(1,1)} = ½(R_{T_{(1,1)}}(1) − R_{T_{(2)}}(1)) = St`.
- `Q_{T_{(n)}}^G(1) = ∏_{i=1}^{n−1}(1 − q^i)`, from the third special value at `μ = (1^n)`, agrees with the second at `τ = (n)`.
- (b) for `n = 1`: `b = θ̃|_{F^×} = J_1(θ̃)`. For `n = 2` at a central element `a`:
  `Ind_B^G(θ̃|_{F^×} ⊠ 1)(a) + R_{T_{(2)}}^G(θ̃|_{𝔽_{q²}^×})(a) = (q + 1)θ̃(a) + (1 − q)θ̃(a) = 2θ̃(a) = b(a)`; with `σ_θ` in place of
  `J_2(θ̃)` the value would be `2qθ̃(a)`: the sign matters, and the formula holds also for non-regular `θ̃|_{𝔽_{q²}^×}`, for which
  `σ_θ` is not defined.

### 2.9 Generic and semisimple characters

The **semisimple label** of `χ_λ` is `|λ| : O ↦ |λ(O)|`; in the labelled form it is the monic polynomial `∏_O f_O^{κ(O)}` of
degree `n` with nonzero constant term. By §2.6(d) the irreducible characters of label `κ` form one Harish-Chandra
series, that of `(L_κ, σ_κ)`. `χ_λ` is generic iff every `λ(O)` is a column `(1^{κ(O)})`; it is called **semisimple** iff every
`λ(O)` is a row `(κ(O))`. Each label carries exactly one generic and one semisimple character; there are `q^n − q^{n−1}`
of each, with degrees

`q^{η(κ)} ϖ_n(q)/∏_O ϖ_{κ(O)}(q_O)` (generic), `η(κ) = Σ_O |O|·κ(O)(κ(O)−1)/2`, and `ϖ_n(q)/∏_O ϖ_{κ(O)}(q_O)` (semisimple).

The Gelfand–Graev representation is the sum of the generic characters, one for each label: `Γ_n = Σ_κ χ_{gen(κ)}`.
In particular `⟨Γ_n, Γ_n⟩ = q^n − q^{n−1}`, the number of generic irreducible representations of `G` and of its
semisimple classes.

Route: the series from §2.6(a), (d). Genericity: by §2.6(c), `χ_{gen(κ)} = χ_λ` for the columns (`e_m = s_{(1^m)}`), and
it is the only constituent of `Γ_n` of label `κ`; `Γ_n` is multiplicity free (ReductiveGroups §7i.2), so
`Γ_n = Σ_κ χ_{gen(κ)}`. Degrees from §2.7: a column of length `k` has `n((1^k)) = k(k−1)/2` and `H̃_{(1^k)}(t) = ϖ_k(t)`; a
row has `n = 0` and the same hook product. The count: the labels of degree `n` are, in the labelled form, the monic
polynomials of degree `n` with nonzero constant term, `q^n − q^{n−1}` of them (§2.1). `⟨Γ_n, Γ_n⟩`: multiplicity one
(ReductiveGroups §7i.2) and one generic character for each label.

*Needs:* §2.1, §2.6, §2.7; ReductiveGroups §7i.2 (multiplicity one).

(Deligne–Lusztig 1976, §10 (10.7, 10.8: regular and semisimple characters); Carter, *Finite groups of Lie type*, §8.4;
Zelevinsky, LNM 869; S. I. Gelfand 1970; Brundan–Dipper–Kleshchev, Theorem 2.5d and (2.5.2), (2.5.3); the degrees are
the case of Green's formula (Green 1955) for a column and a row. `⟨Γ_n, Γ_n⟩ = q^n − q^{n−1}`: Brundan–Dipper–Kleshchev,
Theorem 2.5d (ii), (iii), after I. M. Gelfand–Graev and S. I. Gelfand; Zelevinsky, LNM 869, Proposition 9.4.)

**Checks.**
- The unipotent label `(X − 1)^n` has generic character `St` (degree `q^{n(n−1)/2}`) and semisimple character `1`.
- `GL₂`: the generic characters are the twisted Steinberg characters, the irreducible principal series and the
  cuspidal characters, `(q−1) + ½(q−1)(q−2) + ½q(q−1) = q² − q`.
- `n = 1`: `Γ₁` is the regular representation of `F^×`, of norm `q − 1`.

### 2.10 Counting

For `n ≥ 1`: the number of irreducible characters of `G` is `c_n(q)`, with generating function
`Σ_n c_n(q)t^n = ∏_{i≥1}(1 − t^i)/(1 − qt^i)` (§2.1); the number of cuspidal irreducible characters is `N*_q(n)`; the number of
generic, and of semisimple, irreducible characters is `q^n − q^{n−1}` (§2.9); and

`q^n − q^{n−1} ≤ c_n(q) ≤ q^n`.

Route: the number of irreducible characters is the number of conjugacy classes (RepresentationTheory/CharacterTheory Layer 2), and also the number of Green
data of weight `n` (§2.7). The cuspidal characters are in bijection with the Frobenius orbits of degree `n` (§2.7). The
lower bound counts the semisimple classes (§2.1); the upper bound is Maslen–Rockmore's.

*Needs:* §2.1, §2.7, §2.9; RepresentationTheory/CharacterTheory Layer 2 (the count).

(Green 1955, Lemma 7.7 and Theorem 13, for the cuspidal count. The generating function: Feit–Fine 1960 and
Macdonald 1981. The two-sided bound: Fulman–Guralnick, Proposition 3.5 (2), the lower bound by counting semisimple
classes, the upper bound after Maslen–Rockmore 1997; stated there for prime powers `q`.)

**Checks.**
- `c₃(q) = q³ − q` and `q³ − q² ≤ q³ − q ≤ q³`; `N*_q(3) = (q³ − q)/3`.
- `q^n − c_n(q)` for `n = 1, …, 6` is `1, 1, q, q, q² + q − 1, q²`, positive and of lower order than `q^n`.
- `c₅(q) = q⁵ − q² − q + 1` while `q·c₄(q) = q⁵ − q²`: `c_n(q) − q c_{n−1}(q)` changes sign, so the bound cannot be read off
  coefficientwise from `Σ q^n t^n = (1 − qt)⁻¹`.

### 2.11 Gauss sums of cuspidal characters

For an irreducible representation `σ` of `G` the operator `Σ_{x∈G} ψ₀(tr x)σ(x)` commutes with `σ` and is therefore a scalar
`w(σ)`, the **Gauss sum** of `σ`. For `θ ∈ Ξ_n` put `g_n(θ) = Σ_{z∈𝔽_{q^n}^×} θ(z)ψ₀(Tr_{𝔽_{q^n}/F} z)` (Mathlib's `gaussSum`
for `θ` and `ψ₀ ∘ Tr`). For regular `θ ∈ Ξ_n`,

`w(σ_θ) = (−1)^{n−1} q^{n(n−1)/2} g_n(θ)`.

Route: `x ↦ ψ₀(tr x)` is a class function, so the operator commutes with `σ(G)` and Schur's lemma applies. Taking
traces, `w(σ_θ)·ϖ_{n−1}(q) = Σ_x σ_θ(x)ψ₀(tr x)`. By §2.4, `σ_θ(su) = 0` unless the characteristic polynomial of `s` is `f^m` with
`f` irreducible of degree `d`, `dm = n`, and then `σ_θ(su) = (−1)^{n−1}(Σ_{j<d}θ(z^{q^j}))·Q(u)` with `z` a root of `f` and `Q` the
Green function of the Coxeter torus `T_c` of `C(s) ≅ GL_m(𝔽_{q^d})` (§2.8(a)), while `tr(su) = m·Tr_{𝔽_{q^d}/F}(z) = Tr_{𝔽_{q^n}/F}(z)`.
For every rational maximal torus `T`, `Σ_{u unipotent} Q_T(u) = |G|/|T^{Fr}|`: `Σ_θ R_T^G(θ)` vanishes off the unipotent
elements and equals `|T^{Fr}|·Q_T` on them (the character formula, §1.3, with §1.2), and
`Σ_θ ⟨R_T^G(θ), 1⟩ = 1` (§1.5 (c)). Applied to `C(s)` and `T_c` (`|T_c^{Fr}| = q^n − 1`), the
elements with semisimple part conjugate to `s` contribute
`(|G|/|C(s)(F)|)·(−1)^{n−1}(Σ_{j<d}θ(z^{q^j}))ψ₀(Tr z)·|C(s)(F)|/(q^n − 1)`; summing over the classes, each polynomial `f` carrying
its `d` roots, gives `(−1)^{n−1}|G|·g_n(θ)/(q^n − 1)`, and `|G| = q^{n(n−1)/2}ϖ_n(q)`.

*Needs:* §2.4, §2.8(a); §§1.2, 1.3, 1.5 (c) (Green functions, the character formula,
`⟨R_T^G(θ), 1⟩`); RepresentationTheory/SemisimpleAlgebras Layer 1 (Schur's lemma); Mathlib `gaussSum`, `AddChar`, `MulChar`.

(Kondo, *On Gaussian sums attached to the general linear groups over finite fields*, 1963, the Theorem of the
Introduction, p. 245, proved in §2.2, in the case of a cuspidal character.)

**Checks.**
- `n = 1`: `σ_θ = θ` and `w(θ) = g_1(θ)`.
- `n = 2`, over the four class families of RepresentationTheory/CharacterTheory §9.1: the central elements contribute `(q−1)Σ_a θ(a)ψ₀(2a)`, the non-semisimple
  ones `−(q²−1)Σ_a θ(a)ψ₀(2a)`, the elliptic ones `−q(q−1)Σ_{z∉F}θ(z)ψ₀(Tr z)`, the split ones `0`; the total is
  `−q(q−1)g_2(θ)`, and `w(σ_θ) = −qg_2(θ)`.

### 2.12 Shintani descent for `GL_n`

Let `F ⊂ F′ = 𝔽_{q^d}` (`d ≥ 1`), `G = GL_n(F)`, `G′ = GL_n(F′)`, `Fr` the automorphism of `G′` raising every entry to the `q`-th
power (of order `d`), and `Nm(δ) = δ·Fr(δ)⋯Fr^{d−1}(δ)` for `δ ∈ G′`. Elements `δ, δ′` of `G′` are **`Fr`-conjugate** if
`δ′ = y⁻¹δFr(y)` for some `y ∈ G′`; an **`Fr`-class function** is constant on `Fr`-conjugacy classes.

(a) *Norm classes.* For `δ ∈ G′`, `Nm(δ)` is conjugate in `G′` to an element `γ ∈ G`, unique up to conjugacy in `G` (the **norm
class** of `δ`); `δ ↦` (norm class) is a bijection from the `Fr`-conjugacy classes of `G′` onto the conjugacy classes of `G`;
and `{y ∈ G′ : y⁻¹δFr(y) = δ}` is isomorphic to the centraliser of `γ` in `G`. Hence
`#{δ ∈ G′ : Nm(δ) ∼ γ}·|G| = #(class of γ)·|G′|`.

(b) *The Shintani lift.* For a class function `f` on `G`, `Sh_d(f)(δ) = f(γ)` (`γ` in the norm class of `δ`) is an `Fr`-class
function on `G′`; `|G′|⁻¹ Σ_δ Sh_d f(δ)·conj(Sh_d f′(δ)) = |G|⁻¹ Σ_γ f(γ)·conj(f′(γ))`; and
`Sh_d(ω∘det) = (ω∘N_{F′/F})∘det` for every character `ω` of `F^×`.

(c) *Harish-Chandra induction.* Let `M = ∏_i GL_{n_i}` be a standard Levi subgroup with standard parabolic subgroup
`P = MU`, and `Sh_d^M = ⊠_i Sh_d` the lift for `M`. For an `Fr`-class function `φ` on `M(F′)` put
`R_M^{Fr}(φ)(δ) = |P(F′)|⁻¹ Σ_{y ∈ G′, y⁻¹δFr(y) ∈ P(F′)} φ(pr_M(y⁻¹δFr(y)))`, with `pr_M : P(F′) → M(F′)` the projection along
`U(F′)`. Then `Sh_d(R_M^G f) = R_M^{Fr}(Sh_d^M f)` for every class function `f` on `M(F)`.

(d) *Shintani's lifting theorem.* For every irreducible character `χ` of `G` there are an irreducible representation `ρ` of
`G′` with `ρ∘Fr ≅ ρ`, an extension `ρ̃` of `ρ` to `G′ ⋊ ⟨Fr⟩` and a sign `ε ∈ {±1}` with `Sh_d(χ)(δ) = ε·χ_{ρ̃}(δ·Fr)` for
every `δ ∈ G′`; and `χ ↦ ρ` is a bijection from the irreducible characters of `G` onto the isomorphism classes of
`Fr`-stable irreducible representations of `G′`.

Route: (a) Lang's theorem for `GL_n` over `F̄` (ReductiveGroups Layer 7a), with `Fr` extended to the `q`-Frobenius of
`GL_n(F̄)`, gives `x` with `δ = x⁻¹Fr(x)`; then `Nm(δ) = x⁻¹Fr^d(x)`, and `γ = Fr^d(x)x⁻¹` is `Fr`-fixed (from `Fr(x) = xδ` and
`Fr^d(δ) = δ`), so `γ ∈ G` and `Nm(δ) = x⁻¹γx`. Matrices over `F′` conjugate over `F̄` are conjugate over `F′`, and elements of
`G` conjugate in `G′` are conjugate in `G` (rational canonical form, ClassicalArithmeticCompletion §3.56). `x` is determined
by `δ` up to `x ↦ gx` with `g ∈ G`, which conjugates `γ` in `G`; replacing
`δ` by `y⁻¹δFr(y)` replaces `x` by `xy` and keeps `γ`. If `x` and `x′` give the same `γ`, then `y = x⁻¹x′` satisfies
`Fr^d(y) = y`, so `y ∈ G′` and `x′⁻¹Fr(x′) = y⁻¹δFr(y)`: injectivity. Surjectivity: for `γ ∈ G` choose `x` with `Fr^d(x)x⁻¹ = γ`
(Lang for `Fr^d`) and put `δ = x⁻¹Fr(x)`. Finally `y ↦ xyx⁻¹` maps `{y ∈ G′ : y⁻¹δFr(y) = δ}` onto the centraliser of `γ` in
`G`, so the `Fr`-class of `δ` has `|G′|/|C_G(γ)|` elements, which is the count. (b) The sum over `G′` groups by norm classes
with the fibres of (a); `det Nm(δ) = N_{F′/F}(det δ)`. (c) Let `δ = x⁻¹Fr(x)` and `γ = Fr^d(x)x⁻¹` as in (a). For `y ∈ G′`,
`δFr(y)P = yP` says that the coset `xyP ∈ G(F̄)/P(F̄)` is `Fr`-fixed, hence lies in `(G/P)(F)` (Lang for the connected `P`),
and `γ·xyP = xyP`; conversely, for a coset `c ∈ (G/P)(F)` fixed by `γ`, `x⁻¹c` is fixed by `Fr^d`, hence of the form `yP` with
`y ∈ G′`, and `δFr(yP) = yP`. So `yP(F′) ↦ xyP` is a bijection from the cosets with `y⁻¹δFr(y) ∈ P(F′)` onto the points of
`(G/P)(F)` fixed by `γ`. If `xy = zp⁻¹` with `z ∈ G` and `p ∈ P(F̄)`, then `y⁻¹δFr(y) = pFr(p)⁻¹` and `z⁻¹γz = Fr^d(p)⁻¹p`, so by
the construction of (a) in `P` and in `M` the image of `z⁻¹γz` in `M(F)` lies in the norm class of the image of `y⁻¹δFr(y)` in
`M(F′)`. Comparing with `R_M^G(f)(γ) = Σ_{zP ∈ (G/P)(F), γzP = zP} f(pr_M(z⁻¹γz))` (ReductiveGroups Layer 7c, the adapter
`R = Ind ∘ Inf`) term by term gives the identity. (d) The proof is Shintani's, and is cited; in outline: for
`1 ≤ r ≤ n` let `Σ_r(θ̃)` be the class function whose value at `x` is the `r`-th elementary symmetric function of the
`θ̃(α)`, `α` the eigenvalues of `x` (`Σ_1 = b_{θ̃}^{(n)}` of §2.8 (b)); it is a virtual character (Green 1955, Theorem 1).
The tensor-power construction of Shintani's Lemma 1-4 attaches to a virtual character `X` of `G′` a virtual character of
`G′ ⋊ ⟨Fr⟩` whose value at `δ·Fr` is `X(Nm(δ))`; applied to the `Σ_r(θ̃)` over `F′` it lifts the `Σ_r(θ̃)` of `G`. Every
irreducible character of `G` is an integral combination of the `Σ_r(θ̃)` and of Harish-Chandra products from proper
standard Levi subgroups (Green's theorem, in the form of Shintani's Lemma 2-10); eigenvalue sums alone give rational
combinations only. With (c) and induction on `n`, the lift of an irreducible character is the restriction to the coset
of a virtual character of `G′ ⋊ ⟨Fr⟩` (his Lemma 2-11), of norm one there by (b), hence a root of unity times the
restriction of one irreducible extension (his Lemmas 1-1 to 1-3), and for a suitable extension a sign (his Lemma 2-11
and Theorem 1). By (a) and (b) the lift is an isometry from the class functions on `G` onto the `Fr`-class functions on
`G′` (the two spaces have the same dimension), so the lifts of the irreducible characters form an orthonormal basis of
the latter; the restrictions to the coset of the extensions of non-isomorphic `Fr`-stable irreducible representations
are orthogonal and nonzero; so `χ ↦ ρ` is a bijection (his Theorem 1, with the count of the `Fr`-stable irreducible
representations in his Lemma 2-7).

*Needs:* §2.1, §2.8(b); ReductiveGroups Layers 7a, 7b, 7c; RepresentationTheory/InductionRestriction Layer 2 (induced characters);
ClassicalArithmeticCompletion §3.56 (the rational canonical form).

(Shintani, *Two remarks on irreducible characters of finite general linear groups*, 1976: (a) Lemma 2-6; (b) its
Corollary; (c) Lemmas 2-8 and 2-9; (d) Lemmas 1-1 to 1-4, Definition 2-5 and Lemma 2-10 (Green's theorem), Lemma 2-11,
Lemma 2-7, Theorem 1.)

**Checks.**
- `n = 1`: `Sh_d(ω) = ω∘N_{F′/F}`, and every element of `F^×` is a norm from `F′^×`.
- (a) for `GL₂(𝔽₂) ⊂ GL₂(𝔽₄)`: the classes of sizes `1, 3, 2` have fibres `30, 90, 60` in `G′` (`|G′| = 180`).
- (c) for `GL₂` and `M = T`: at `δ` whose norm class is elliptic both sides vanish, since an elliptic `γ` fixes no point of
  `ℙ¹(F)` and `δ∘Fr` fixes no line over `F′`.

### Examples

`GL₂(𝔽_q)` against RepresentationTheory/CharacterTheory Layer 9: the four class families and the degrees `1`, `q`, `q + 1`, `q − 1` in the numbers `q − 1`,
`q − 1`, `½(q−1)(q−2)`, `½q(q−1)` (§§2.1, 2.7); `ch(h₂) = 1`, `ch(e₂) = St` and `ch_κ(p₁) = σ_θ` for an orbit of size `2`
(§2.6). `GL₃(𝔽_q)`: `c₃(q) = q³ − q`, and the constituents of `Ind_B^G 1` have degrees `1, q(q+1), q³` and multiplicities
`1, 2, 1` (§§2.1, 2.5). For `n = 2`, `w(σ_θ) = −qg_2(θ)` (§2.11). For `GL₂(𝔽₂) ⊂ GL₂(𝔽₄)` the classes of sizes `1, 3, 2`
have norm fibres of sizes `30, 90, 60` (§2.12).

### Dependencies

RepresentationTheory/CharacterTheory Layers 0–3 and 9, §3.6; RepresentationTheory/SemisimpleAlgebras Layer 1; RepresentationTheory/InductionRestriction Layers 0, 2–5; ReductiveGroups Layers 7a–7e
(with §§7a.2, 7c.1), 7h and 7i; Layer 1; RepresentationTheory/SchurWeyl Layer 4 and Layer 7 (§§7.5–7.7); TypeAHeckeAlgebras §§1.1, 1.2;
ClassicalArithmeticCompletion §§3.56, 3.59; Mathlib `GaloisField`, `Matrix.charpoly`, `Polynomial.Monic`, `Irreducible`,
`Nat.Partition`, `PowerSeries`, `gaussSum`, `AddChar`, `MulChar`.

## Worked examples

- **`GL_n(𝔽_q)` (Layer 2).** `GL₂(𝔽_q)` against RepresentationTheory/CharacterTheory Layer 9
  (classes, degrees and counts); `GL₃(𝔽_q)` (`c₃(q) = q³ − q`, the constituents of `Ind_B 1`); the
  Gauss sum `w(σ_θ) = −qg_2(θ)`; the norm fibres of `GL₂(𝔽₂) ⊂ GL₂(𝔽₄)`.

## Downstream consumers

- **SmoothRepresentationsOfLocalGroupsPartII** SRU.4.1 *finite-steinberg*: the irreducibility and
  the degree of the Steinberg character for split `G` and the `q`-Frobenius, the split case of
  §1.6 (a), (b).

## Scope and ownership

This roadmap owns:

- Deligne–Lusztig induction for a connected reductive group over an algebraic closure of a finite
  field with the `q`-Frobenius of an `𝔽_q`-structure or a Steinberg endomorphism: the varieties,
  characters and Green functions, the character and inner product formulas, the compatibility
  with Harish-Chandra functors, the Steinberg character, degrees, geometric conjugacy and Lusztig
  series, cuspidality, the Green functions at regular unipotent elements and the pairing with
  Gelfand–Graev characters (Layer 1);
- for `GL_n(𝔽_q)`: the parametrisation and count of its conjugacy classes and of the classes of
  pairs of a rational maximal torus and a character, the theory of derivatives and the mirabolic
  subgroup, Green's cuspidal characters and their values, the type-A Hecke algebras of
  Harish-Chandra induced cuspidal representations, the characteristic maps of labels, Green's
  parametrisation and degree formula with the `q`-hook formula, uniformity, special values of
  Green functions and the identification of Green's virtual characters with Deligne–Lusztig
  characters, generic and semisimple characters, the counts, the Gauss sums of cuspidal
  characters, and Shintani descent (Layer 2).

SmoothRepresentationsOfLocalGroupsPartII SRU.4.1 *finite-steinberg* states the irreducibility and
the degree of the Steinberg character for split `G` and the `q`-Frobenius, the split case of
§1.6 (a), (b), and is a consumer of §1.6, not a second supplier.

It does not own, and consumes by name:

- the finite reductive groups `G^F`, Lang's theorem and the Lang torsor, rational Borel pairs and
  rational maximal tori, parabolic and Levi subgroups, the Harish-Chandra functors with their
  Mackey formula, Harish-Chandra series and Gelfand–Graev representations, for the `q`-Frobenius
  and for Steinberg endomorphisms: **ReductiveGroups** Layers 4, 7, 7C, 7a–7e, 7h, 7i and 9E;
- compactly supported `ℓ`-adic cohomology: **EtaleCohomologyFoundations** §§F.2.5, F.2.5a, F.2.7,
  F.3 and F.4.5; the Lefschetz numbers of finite-order automorphisms: **EtaleDualityAndPerverseSheaves**
  §7.6; fpqc descent and torsors under a flat group scheme: **SchemeAndStackFoundations** §§1.1
  and 1.15;
- class functions, the pairing, virtual characters and the count of irreducible characters, and
  the `GL₂(𝔽_q)` theory that Layer 2 extends: **RepresentationTheory/CharacterTheory** Layers 0–3
  and 9;
- induced characters, Frobenius reciprocity, the Mackey decomposition and Clifford theory:
  **RepresentationTheory/InductionRestriction** Layers 0 and 2–5; Schur's lemma:
  **RepresentationTheory/SemisimpleAlgebras** Layer 1;
- symmetric functions, the Hall form, the Frobenius characteristic and the characters of
  symmetric groups: **RepresentationTheory/SchurWeyl** Layers 4 and 7; Iwahori–Hecke algebras of
  type A and their split semisimplicity: **TypeAHeckeAlgebras** §§1.1, 1.2; the classification of
  matrices up to similarity by invariant factors and the rational canonical form:
  **ClassicalArithmeticCompletion** §§3.56, 3.59.

## Exact supplier contracts

### From Mathlib

| Use here | Exact declarations |
|---|---|
| finite fields, polynomials, partitions, power series and Gauss sums (Layer 2) | `GaloisField`, `Matrix.GeneralLinearGroup`, `Matrix.charpoly`, `Polynomial.Monic`, `Irreducible`, `Nat.Partition`, `PowerSeries`, `AddChar`, `MulChar`, `gaussSum` |

### From Tau Ceti

| Use here | Exact declarations |
|---|---|
| class functions, the pairing and virtual characters (Layers 1 and 2), recorded in RepresentationTheory/CharacterTheory Layers 0 and 3 | `TauCeti.ClassFunction`, `TauCeti.ClassFunction.equivConjClasses`, `TauCeti.ClassFunction.characterPairing`, `TauCeti.virtualCharacters` |

### From `TauCetiRoadmap.ReductiveGroups`

| Use here | Section |
|---|---|
| the Jordan decomposition of the elements of `G^F` | Layer 4 |
| Borel subgroups, conjugacy of maximal tori, the Weyl group and the Bruhat decomposition | Layer 7 |
| centralizers of semisimple elements | §7.1 |
| products of root subgroups and the cell coordinates; regular unipotent elements | Layer 7C (7C.6) |
| `G^F` for the `q`-Frobenius and for `GL_n` with the standard Frobenius, Lang's theorem, rational Borel pairs and the rational Bruhat decomposition, rational maximal tori and the twisted classes of the Weyl group, the Lang map as a finite étale torsor | Layer 7a (§§7a.1–7a.3) |
| rational parabolic and Levi subgroups | Layer 7b |
| Harish-Chandra induction and restriction over `ℂ`, the adapter `R = Ind ∘ Inf`, adjunction, transitivity | Layer 7c (§7c.1) |
| the Mackey formula for Harish-Chandra functors | Layer 7d |
| independence of the parabolic | Layer 7e |
| cuspidality, cuspidal support, Harish-Chandra series, endomorphism algebras of Harish-Chandra induced cuspidal representations | Layer 7h (§§7h.1–7h.3) |
| Gelfand–Graev representations, the simple-root quotient and rational regular unipotent elements, multiplicity one, generic representations, degenerate Gelfand–Graev representations and their Harish-Chandra restriction | Layer 7i (§§7i.1–7i.3) |
| Steinberg endomorphisms and the extension of Layers 7a–7f, 7h and 7i to them | Layer 9E |

### From `TauCetiRoadmap.SchemeAndStackFoundations`

| Use here | Section |
|---|---|
| fpqc descent and torsors under a flat group scheme, for the Lang torsor and Deligne–Lusztig varieties (§1.1) | §§1.1, 1.15 |

### From `TauCetiRoadmap.EtaleCohomologyFoundations`

Sections F.2.5 (compactly supported cohomology and its localization sequence), F.2.5a (the
compactly supported cohomology of a quotient by a finite group, compatibly with commuting
automorphisms), F.2.7 (Künneth with compact supports), F.3 (finiteness and cohomological
dimension) and F.4.5 (rational realization and `ℚ̄_ℓ` coefficients) supply the ℓ-adic
cohomology of Layer 1.

### From `TauCetiRoadmap.EtaleDualityAndPerverseSheaves`

§7.6, *Lefschetz numbers of finite-order automorphisms*, supplies to Layer 1: lefschetzIntegrality
(`Lef(γ, X)` is a rational integer independent of `ℓ`, and `Lef(γ, X) = Lef(γ⁻¹, X)`);
lefschetzDevissage (additivity over a decomposition into finitely many stable locally closed pieces
whose initial unions are closed, the value `|X(k)^γ|` on a finite scheme, the Künneth formula, the
quotient formula for an automorphism commuting with the finite group, and the vanishing of
`Lef(γ, X)` for a free action and `γ` of order not a power of `p`); lefschetzJordanFormula
(`Lef(g, X) = Lef(g_p, X^{g_{p′}})`); and lefschetzGroupActions (the trivial action of a connected
linear algebraic group on compactly supported cohomology, the torus fixed-point formula and the
cohomology of Zariski-locally trivial fibrations in affine spaces). It states Lefschetz numbers and
these actions; the module statements of Layer 1 come from EtaleCohomologyFoundations §§F.2.5,
F.2.5a and F.2.7 or are cited with the published proofs.

### From `TauCetiRoadmap.RepresentationTheory.CharacterTheory`

| Use here | Section |
|---|---|
| class functions, the pairing and virtual characters | Layers 0 and 3 |
| the number of irreducible characters is the number of conjugacy classes | Layer 2 |
| the external tensor product | §3.6 |
| `GL₂(𝔽_q)`, its class families and degrees, against which the Checks of Layer 2 are made | Layer 9 (§§9.1, 9.2) |

### From `TauCetiRoadmap.RepresentationTheory.InductionRestriction`

| Use here | Section |
|---|---|
| induction in stages (Layer 2) | Layer 0 |
| induced representations and characters, Frobenius reciprocity (Layers 1 and 2) | Layer 2 |
| the Mackey decomposition (§1.6) | Layer 3 |
| Mackey and Clifford theory for the mirabolic subgroup (§2.2) | Layers 3–5 |

### From `TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras`

| Use here | Section |
|---|---|
| Schur's lemma (§2.11) | Layer 1 |

### From `TauCetiRoadmap.RepresentationTheory.SchurWeyl`

| Use here | Section |
|---|---|
| the characters `χ^μ` of `S_n` | Layer 4 |
| `Λ`, the Hall inner product, power sums, Schur functions, Jacobi–Trudi, the Frobenius characteristic `s_μ = Σ_ν χ^μ(ν)p_ν/z_ν` | Layer 7 (§§7.5–7.7) |

### From `TauCetiRoadmap.TypeAHeckeAlgebras`

| Use here | Section |
|---|---|
| `H_m(q)` and its basis `T_w` | §1.1 |
| split semisimplicity | §1.2 |

### From `TauCetiRoadmap.ClassicalArithmeticCompletion`

| Use here | Section |
|---|---|
| similarity of matrices is classified by invariant factors | §3.59 |
| the rational canonical form (§2.12) | §3.56 |

## References

- P. Deligne and G. Lusztig, “Representations of reductive groups over finite fields,” *Ann.
  of Math.* 103 (1976), 103–161: §1† (rational maximal tori; Deligne–Lusztig varieties),
  Theorem 4.2†, Theorems 6.2† and 6.8†, §7† (Theorem 7.1†, 7.5†, Corollary 7.7†), §8†
  (Theorem 8.3†), Theorem 9.16†, §10† (Theorem 10.7†); the general theory that Layer 2
  specializes to `GL_n` (the cuspidal characters through `R_T(θ)`, §2.4; the values of Green
  functions, §2.8; regular and semisimple characters, §10, 10.7–10.8, §2.9).
- P. Deligne and G. Lusztig, “Duality for representations of a reductive group over a finite
  field. II,” *J. Algebra* 81 (1983), 540–545†.
- F. Digne and J. Michel, *Representations of Finite Groups of Lie Type*, London Mathematical
  Society Student Texts 21 (1991), 11.13† and 12.14†; second edition, London Mathematical
  Society Student Texts 95, Cambridge University Press (2020)†, the exposition being made for
  Frobenius roots.
- O. Dudas, J. Michel, *Lectures on finite reductive groups and their representations*, lecture
  notes, BICMR, 23 April – 3 June 2015,
  [webusers.imj-prg.fr/~jean.michel/papiers/lectures_beijing_2015.pdf](https://webusers.imj-prg.fr/~jean.michel/papiers/lectures_beijing_2015.pdf):
  Corollary 13.2, Definition 14.2, Propositions 14.3, 14.8, 14.9 and 14.13, Conjecture-Theorem
  14.4, Theorem 14.5, Corollary 14.6, Definition 14.7, Definition 15.1, Lemma 15.2, Corollary
  15.3, Proposition 15.6, Remark 15.7, Proposition 15.10 and Corollary 15.11 (Layer 1); §11.1,
  Lemmas 11.8–11.10, Theorem 11.11 (§2.5).
- R. W. Carter, *Finite Groups of Lie Type: Conjugacy Classes and Complex Characters*, John
  Wiley and Sons (1985): Theorem 7.2.8† (the character formula), Theorem 7.3.4† (the inner
  product formula), 7.5.1† and 7.5.2† (the degree), §§8.1† and 8.4† (the Gelfand–Graev
  character; regular and semisimple characters) and §12.1† (geometric conjugacy); §8.4, regular
  and semisimple characters (§2.9).
- C. W. Curtis, “The Steinberg character of a finite group with a (B,N)-pair,” *J. Algebra* 4
  (1966), 433–441.
- L. Solomon, “The orders of the finite Chevalley groups,” *J. Algebra* 3 (1966), 376–393.
- J. A. Green, *The characters of the finite general linear groups*, Trans. Amer. Math. Soc. 80 (1955) 402–447: Layer 2:
  the conjugacy classes, the pairing of his class functions (Lemma 6.3), the characteristic map, the parametrisation and
  degree formula, the exhaustion of the cuspidal characters (Lemma 7.7, Theorem 13), the values at primary elements (§5,
  Example (ii)), and the virtual characters `J_n` with the expansion of eigenvalue sums (Lemma 3.2, Theorems 1, 2, 5).
- S. I. Gelfand, *Representations of the full linear group over a finite field*, Mat. Sb. 83(125) (1970) 15–41; Math.
  USSR Sb. 12 (1970) 13–39: the criterion for cuspidality by the restriction to the mirabolic subgroup, and the degree
  (Proposition 1.3, Theorem 2.3 with Corollary 1, Theorem 3.3, §2.2), Green's values quoted as (6.1) (§2.2),
  cuspidality of Green's characters (Theorem 6.1, §2.4).
- A. V. Zelevinsky, *Representations of finite classical groups: a Hopf algebra approach*, Lecture Notes in Math. 869
  (1981): Ch. III, derivatives over a finite field (§2.2); §2.6; Proposition 9.4 and the generic characters (§2.9).
- I. M. Gelfand, D. Kazhdan, *Representations of the group GL(n, K) where K is a local field*, in *Lie groups and their
  representations* (Proc. Summer School Bolyai János Math. Soc., Budapest 1971), 1975, 95–118: the derivative formalism
  (§2.2).
- I. N. Bernstein, A. V. Zelevinsky, *Representations of the group GL(n, F) where F is a nonarchimedean local field*,
  Russian Math. Surveys 31:3 (1976) 1–68: the derivative formalism (§2.2).
- J. Brundan, R. Dipper, A. Kleshchev, *Quantum linear groups and representations of `GL_n(𝔽_q)`*, Mem. Amer. Math. Soc.
  149 (2001), no. 706: §2.3, (2.3.1)–(2.3.7) (Green's parametrisation, sign and degree formula restated, §§2.6, 2.7), the
  opening of §2.4 (cuspidal characters, §2.7), (2.4a), (2.5b), (2.5.2), (2.5.3) and Theorem 2.5d (the two constituents
  of `σ × σ`, §2.2; the normalisation of the operators, §2.5; generic characters and `⟨Γ_n, Γ_n⟩`, §2.9).
- I. M. Gelfand, M. I. Graev, *The construction of irreducible representations of simple algebraic groups over a finite
  field*, Dokl. Akad. Nauk USSR 147 (1962) 529–532: named by Brundan–Dipper–Kleshchev at Theorem 2.5d for the
  Gelfand–Graev representation (§2.9).
- R. B. Howlett, G. I. Lehrer, *Induced cuspidal representations and generalised Hecke rings*, Invent. Math. 58 (1980)
  37–64: Theorems 3.18 (i) and 4.14, Example 4.15 (§§2.2, 2.5).
- N. Iwahori, *On the structure of a Hecke ring of a Chevalley group over a finite field*, J. Fac. Sci. Univ. Tokyo,
  Sect. I, 10 (1964) 215–236: `End(Ind_B^G 1) ≅ H_n(q)` (§2.5).
- I. G. Macdonald, *Symmetric functions and Hall polynomials*, second edition, Clarendon Press, Oxford (1995): Ch. I §3,
  Examples 1–2 (the `q`-hook formula), Ch. IV (§§2.1, 2.6–2.8).
- G. Lusztig, B. Srinivasan, *The characters of the finite unitary groups*, J. Algebra 49 (1977) 167–171: uniformity for
  the unitary groups, from which that of `GL_n(𝔽_q)` follows (§§2.1, 2.6, 2.8).
- M. Geck, *A first guide to the character theory of finite groups of Lie type*,
  [arXiv:1705.05083](https://arxiv.org/abs/1705.05083) (2017): Example 2.13 (§§2.1, 2.6, 2.8).
- P. Fong, B. Srinivasan, *The blocks of finite general linear and unitary groups*, Invent. Math. 69 (1982) 109–153: §1,
  (1.13)–(1.18), (1B), (1C), the irreducible characters of `GL_n(𝔽_q)` in the language of Deligne–Lusztig characters
  (§2.6, §2.8 (a)).
- W. Feit, N. J. Fine, *Pairs of commuting matrices over a finite field*, Duke Math. J. 27 (1960) 91–94: the generating
  function of `c_n(q)` (§§2.1, 2.10).
- I. G. Macdonald, *Numbers of conjugacy classes in some finite classical groups*, Bull. Austral. Math. Soc. 23 (1981)
  23–48: the generating function of `c_n(q)` (§§2.1, 2.10).
- J. Fulman, R. Guralnick, *Bounds on the number and sizes of conjugacy classes in finite Chevalley groups with
  applications to derangements*, Trans. Amer. Math. Soc. 364 (2012) 3023–3070,
  [arXiv:0902.2238](https://arxiv.org/abs/0902.2238): §3.2 (the generating function and the semisimple classes, §2.1),
  Proposition 3.5 (2) (the bound `q^n − q^{n−1} ≤ c_n(q) ≤ q^n`, §2.10).
- D. Maslen, D. Rockmore, *Separation of variables and the computation of Fourier transforms on finite groups, I*,
  J. Amer. Math. Soc. 10 (1997) 169–214: the upper bound `c_n(q) ≤ q^n` (§2.10).
- T. Kondo, *On Gaussian sums attached to the general linear groups over finite fields*, J. Math. Soc. Japan 15 (1963)
  244–255: the Theorem of the Introduction, p. 245, proved in §2.2 (§2.11).
- T. Shintani, *Two remarks on irreducible characters of finite general linear groups*, J. Math. Soc. Japan 28 (1976)
  396–414: Lemmas 1-1 to 1-4, Definition 2-5, Lemma 2-6 with its Corollary, Lemmas 2-7 to 2-11, Theorem 1 (§2.12).

Locators marked † have not been checked against the source.
