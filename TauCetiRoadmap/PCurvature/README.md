# Roadmap: p-curvature, Cartier descent and rank-one algebraic solutions

**Summary.** Build the theory of connections in characteristic `p` that the arithmetic of linear
differential equations rests on. Layer 0 makes the `p`-th power of a derivation a derivation and
gives Jacobson's theory of restricted Lie algebras, with Jacobson's formula for `(a + b)^p` in an
associative algebra of characteristic `p`. Layer 1 defines the `p`-curvature
`ψ(D) = (∇_D)^p − ∇_{D^p}` of a connection and proves Katz's structure theorems: `ψ(D)` is
linear, `ψ` is `p`-linear in `D`, for flat connections the values commute and are horizontal,
`ψ` is compatible with
horizontal maps, tensor products, duals and base change, and has the closed rank-one formula
`ψ = a^p + D^{p−1}(a)`; it also defines nilpotence of the `p`-curvature. Layer 2 proves Cartier's
descent theorem (Katz 1970, Theorem 5.1): over a smooth algebra in characteristic `p`, flat
connections with zero `p`-curvature are the modules over the Frobenius twist. Layer 3 proves the
easy direction of the arithmetic principle: a connection over a finitely generated `ℤ`-algebra
that becomes trivial on a finite étale cover of its generic fibre has zero `p`-curvature at all
closed points of a dense open of the base. Layer 4 proves the converse in rank one over open
subsets of the affine line over a number field `K` (Honda's theorem): `d + a dx`, `a ∈ K(x)`, has
zero `p`-curvature at almost every prime of `K` if and only if `n·a` is a logarithmic derivative
`f′/f` for some `n ≥ 1`, if and only if the connection is trivialised by a Kummer cover.

Research context, not a target: the Grothendieck–Katz conjecture predicts the converse of
Layer 3 in every rank. It is stated in Katz 1972 and reformulated by Katz 1982; Katz 1972 proves
it for Gauss–Manin connections, and the case of solvable monodromy is due to D. and G. Chudnovsky
for curves, J.-B. Bost (2001) and Y. André (2004). Grothendieck raised the question in his notes
(Montpellier fonds, folder 93, pp. 193–197: « la réciproque est-elle vraie ? »), and split the
rank-one case into a torsion question in the Picard group and a question on closed forms whose
reductions are logarithmic. Nothing in this roadmap assumes or formalises the conjecture.

Suggested home: `TauCeti/Algebra/Lie/Restricted/` for Layer 0,
`TauCeti/RingTheory/Derivation/PCurvature/` for Layers 1–3, and
`TauCeti/NumberTheory/DifferentialEquations/RankOne/` for Layer 4.

## Layers

| Layer | Title | Content |
| --- | --- | --- |
| [0](#layer-0-restricted-lie-algebras-and-the-p-th-power-of-a-derivation) | Restricted Lie algebras | `D^p` is a derivation, Jacobson's Lie polynomial and formula, restricted Lie algebras and their morphisms, `Der_R(A)`, `End_R(M)` and associative algebras as examples, Deligne's identity for `(aD)^p` |
| [1](#layer-1-the-p-curvature) | The `p`-curvature | definition, linearity, `p`-linearity, commutation and horizontality, functoriality, matrix and rank-one formulas, nilpotence |
| [2](#layer-2-cartier-descent) | Cartier descent | the Frobenius image, horizontal sections, Katz's projector and Taylor formula, the descent equivalence, rank one in one variable, rank one over `κ(x)` |
| [3](#layer-3-trivial-on-a-finite-étale-cover-implies-zero-p-curvature) | The easy direction | étale pull-back, spreading out the trivialisation, zero `p`-curvature on a dense open |
| [4](#layer-4-rank-one-over-open-subsets-of-the-affine-line) | Rank one over `𝔸¹` | Kronecker's theorem from Chebotarev, partial fractions and reduction, Honda's theorem over a number field, the Kummer trivialisation |

## Scope and ownership

**Owned here.** Jacobson's Lie polynomial and Jacobson's formula in associative algebras of
characteristic `p`; restricted Lie algebras, their morphisms and the standard examples; the
restricted structure `D ↦ D^p` on `Der_R(A)`; the `p`-curvature of a connection and all of
Layer 1; nilpotence of the `p`-curvature and its comparison with the quasi-nilpotence of
CrystallineCohomology CR.1.3; Cartier descent in the affine form of Layer 2; the statements of
Layers 3 and 4.

**Consumed, with the owner of each shared notion.**

| Material | Owner and exact declaration | Use here |
| --- | --- | --- |
| Ordinary algebraic connections `M → M ⊗_A Ω`, curvature, horizontal maps, tensor, `Hom`/dual, base change | CrystallineCohomology (#857), CR.1.3, `Crystalline.Connection` with `.extend`, `.curvature`, `.tensor`, `.hom` | every connection of this roadmap is a `Crystalline.Connection` for `Ω = Ω¹_{A/R}`; no second carrier is introduced |
| Evaluation on derivations `Der_R(A) →ₗ[A] End_R(M)`, the bracket form of flatness and its comparison with zero curvature when `Ω¹_{A/R}` is finite projective; differential operators and principal parts | FormalConnectionsOpers (#1056), F2.1–F2.3 | `ψ` is defined on F2.1's evaluation; "flat" means F2.3's bracket identity `∇_{[D,E]} = [∇_D, ∇_E]` |
| Topologically quasi-nilpotent connections over PD envelopes, crystals | CrystallineCohomology (#857), CR.1.3, *Integrable topologically quasi-nilpotent connections* | Layer 1.5 proves the comparison with nilpotent `p`-curvature over an `𝔽_p`-algebra with the zero PD ideal |
| Smooth Cartier isomorphism `H^i(Ω•_{B/A}) ≅ ∧^i Ω¹_{B^{(1)}/A}` | DerivedDeRhamCohomology (#868), §3.6, `DerivedDeRham.smoothCartier` | Layer 2.0 uses degree `0`: `ker d` is the Frobenius twist |
| Absolute and relative scheme Frobenius, the twist `X^{(p/S)}` and its affine algebra `B ⊗_{A, F_A} A` | SchemeAndStackFoundations §0.29, `SchemeFrobenius.schemeFrobeniusTwist`, `SchemeFrobenius.relativeFrobenius`, with `relativeFrobenius_smooth_rank` | Layer 2.0 identifies the affine twist with `frobeniusImage R A p` |
| Spreading out over a dense open: descent of finitely presented algebras, morphisms and the properties étale and finite | SchemeAndStackFoundations §0.9, `finite_presentation_limits`, `spreading_out_models` | Layer 3.2 |
| Commutator of a derivation with multiplication; conjugation by a unit | GrothendieckNotesLemmas (#1431), §3.2, `Derivation.lie_mulLeft`, `Derivation.mulLeft_mul_mul_mulLeft_inv` | Layers 1.1 and 1.4 |
| Frobenius commutator identity `ad(a^{p^n}) = (ad a)^{p^n}` in an associative algebra | Tau Ceti `TauCeti.LieAlgebra.ad_pow_expChar_pow` | the restricted structure on an associative algebra (0.2) |
| Extension of a derivation to a localization | Tau Ceti `Derivation.extendOfIsLocalization`, `Derivation.extendOfIsLocalization_algebraMap` | `d/dx` on `K(x)` (Layer 4) and localization of connections (1.3) |
| Kähler differentials along a formally étale map; bases of `Ω¹` from étale coordinates | Mathlib `KaehlerDifferential.tensorKaehlerEquivOfFormallyEtale`; Tau Ceti `TauCeti.kaehlerBasisOfFormallyEtale` | extension of derivations along étale maps (1.3), coordinates in Layers 1.2 and 2.1 |
| Chebotarev density, Frobenius classes of primes | Tau Ceti `NumberField.Chebotarev.infinite_frobeniusPrimeSet`, `NumberField.Chebotarev.frobeniusPrimeSet` | Layer 4.1 |

**Not used, with the boundary.** PadicDifferentialEquationsAndRigidCohomology (#1002),
RD.1.1–RD.1.6, owns differential modules `DifferentialModule` over differential rings of
characteristic `0` and cyclic vectors; this roadmap is in characteristic `p` and does not use
them. DiophantineApproximationAndTranscendence §§5.1–5.3 owns D-finite series, G-functions and
the Galochkin condition; the
relation between the Galochkin condition and nilpotent `p`-curvature (Chudnovsky, André, Katz) is
outside this roadmap. Smooth connections and monodromy belong to SmoothBundlesConnections (#887),
and the complex Riemann–Hilbert comparison to ComplexComparisonPartII (#848); Grothendieck's
complex formulation (finite monodromy) is therefore stated in this roadmap only through finite
étale covers.

**Out of scope.** Restricted enveloping algebras and their Poincaré–Birkhoff–Witt bases; the
centre of the ring of differential operators in characteristic `p`; the nilpotence of the
`p`-curvature of Gauss–Manin connections (Katz 1970, Theorem 5.10) and Katz's proof of the
conjecture for Picard–Fuchs equations (Katz 1972), which need algebraic Gauss–Manin connections in
characteristic `p`; the Cartier transform of Ogus–Vologodsky. These are research consumers of this
roadmap, listed under *Research context*.

## What Mathlib and Tau Ceti already have

- **Derivations.** `Derivation R A M`, `Derivation.mk'`, `Derivation.leibniz_pow`, the Lie ring
  and Lie algebra of `Derivation R A A` (`Mathlib/RingTheory/Derivation/Lie.lean`),
  `LinearMap.compDer`, `Polynomial.derivative'`, `KaehlerDifferential` with
  `KaehlerDifferential.D` and `KaehlerDifferential.linearMapEquivDerivation`,
  `Algebra.Smooth`, `Algebra.Etale`.
- **Lie algebras.** `FreeLieAlgebra R X` with `FreeLieAlgebra.of` and `FreeLieAlgebra.lift`,
  `LieAlgebra.ad`, `LieRing.ofAssociativeRing` (a local instance, as in Tau Ceti) and
  `LieAlgebra.ofAssociativeAlgebra`.
- **Fields and number fields.** `RatFunc`, `IsFractionRing`, `Ideal.ResidueField`,
  `NumberField.RingOfIntegers`, `IsDedekindDomain.HeightOneSpectrum`, `ringChar`, `CharP`.
- **Tau Ceti.** The declarations of the ownership table, all present at Tau Ceti `358314d4`.

Checked at this repository's pins (Mathlib `f6090c70`, Tau Ceti `358314d4`): neither has
restricted Lie algebras, Jacobson's formula, the `p`-th power of a derivation as a derivation,
algebraic connections, or the `p`-curvature.

## Conventions

1. `p` is a prime (`[Fact p.Prime]`). `R` is a commutative ring and `A` a commutative `R`-algebra
   with `[CharP A p]`; in Layer 2 also `[CharP R p]`. Derivations are `R`-linear, so they kill
   the image of `R`.
2. `D^p` denotes the `p`-th iterate of a derivation `D`, packaged as a derivation (`pPow p D`);
   it is not the `p`-th power of `D` in `Der_R(A)`, which has no product.
3. A connection on an `A`-module `M` is a `Crystalline.Connection` (CR.1.3) for
   `Ω = Ω¹_{A/R}`; `∇_D : M → M` is its evaluation on `D` (F2.1), with
   `∇_D(a m) = a ∇_D m + D(a) m`. It is *flat* when `∇_{[D,E]} = [∇_D, ∇_E]` for all `D, E`
   (F2.3); when `Ω¹_{A/R}` is finite projective this is zero curvature (F2.3).
4. The `p`-curvature is `ψ(D) = (∇_D)^p − ∇_{D^p} ∈ End_R(M)` (Katz 1970, (5.0.4)). It is defined
   for every connection; additivity in `D` needs flatness, linearity in `M` and `p`-linearity in
   `D` do not.
5. On `A = κ(x)` or `κ[x]` with `D = d/dx`, `D^p = 0`, so for `∇ = d/dx + a` the `p`-curvature is
   multiplication by `a^p + D^{p−1}(a)`. In Layer 4 the connection is `d + a dx`, its horizontal
   sections solve `y′ + a y = 0`, and "`n·a` is a logarithmic derivative" means
   `n·a = f′/f` with `f ∈ K(x)^×`.
6. "Almost every prime of `K`" means all but finitely many `v : HeightOneSpectrum (𝓞 K)`
   (`Filter.cofinite`). The reduction of `a = P/Q`, `P, Q ∈ 𝓞_K[x]`, at `v` is
   `P̄/Q̄ ∈ κ(v)(x)` with `κ(v) = Ideal.ResidueField v.asIdeal`; it is junk (`0`) at the finitely
   many `v` where `Q̄ = 0`.

## Layer 0: restricted Lie algebras and the p-th power of a derivation

### 0.1 Jacobson's formula

Define `jacobsonLie R p : FreeLieAlgebra R (Fin 2)`, the Lie polynomial
`Λ_p(x, y) = Σ_{0<i<p} s_i(x, y)` with `i·s_i(x, y)` the coefficient of `t^{i−1}` in
`ad(tx + y)^{p−1}(x)` (Katz 1970, (5.2.5)); `Suggested.lean` writes it as a sum over words of
length `p − 1`, the coefficient `1/i` being the natural-number representative of `i^{−1}` modulo
`p`, so that `jacobsonLie R p` is defined over every ring `R`. Prove `add_pow_eq_jacobson`: in
an associative `R`-algebra `A` with `[CharP A p]`, `(a + b)^p = a^p + b^p + Λ_p(a, b)`,
where `Λ_p(a, b)` is the image of `jacobsonLie R p` under `FreeLieAlgebra.lift R ![a, b]`
for the commutator Lie structure (Jacobson 1937; Katz 1970, (5.2.4)). Prove that `Λ_p` is natural for Lie algebra morphisms (it
is the value of a Lie polynomial), that `Λ_p(a, b) = 0` when `a` and `b` commute, and that in a
Lie algebra in which `p = 0` the value `Λ_p(a, b)` does not depend on the representatives.

**Checks.** `p = 2`: `Λ_2(x, y) = [y, x]` and `(a + b)^2 = a^2 + b^2 + ab + ba`. `p = 3`:
`Λ_3(x, y) = [y,[y,x]] + ½·([x,[y,x]] + [y,[x,x]]) = [y,[y,x]] + 2·[x,[y,x]]` in characteristic
`3`. For `2 × 2` matrices over `𝔽_p` with `a = E₁₂`, `b = E₂₁`, `(a + b)^p = a + b` for odd `p`
while `a^p = b^p = 0`, so `Λ_p(a, b) = a + b ≠ 0`.

### 0.2 Restricted Lie algebras

Define the class `RestrictedLieAlgebra R L p` (Jacobson 1941): a Lie algebra `L` over `R` with a
map `pMap : L → L` such that `pMap (c • x) = c^p • pMap x`, `ad (pMap x) = (ad x)^p` and
`pMap (x + y) = pMap x + pMap y + Λ_p(x, y)`. Define `RestrictedLieHom` (Lie algebra morphisms
commuting with `pMap`), composition and identity, restricted Lie subalgebras (Lie subalgebras
closed under `pMap`) with the induced structure, and the kernel of a restricted morphism as a
restricted ideal. Examples, all proved: an associative `R`-algebra `A` of characteristic `p`
with `pMap a = a^p` (`ad(a^p) = (ad a)^p` is `TauCeti.LieAlgebra.ad_pow_expChar_pow` with
`n = 1`, additivity is 0.1), as a definition `RestrictedLieAlgebra.ofAssociative` because the
commutator Lie ring is a local instance; `Module.End R M` as a special case; a Lie subalgebra of
a restricted Lie algebra closed under `pMap`.

**Checks.** For `A` commutative with the zero bracket, `pMap a = a^p` is additive, as Jacobson's
formula requires (`Λ_p = 0`). For `R` of characteristic `p`, the abelian Lie algebra `R`
with `pMap = 0` and with `pMap c = c^p` are two different restricted structures on one Lie
algebra.

### 0.3 The p-th power of a derivation

Prove `iterate_leibniz`: in characteristic `p`, `D^[p](ab) = a D^[p](b) + b D^[p](a)` (Katz 1970,
(5.0)), from the Leibniz rule `D^n(ab) = Σ binom(n, k) D^k(a) D^{n−k}(b)` and
`binom(p, k) ≡ 0` for `0 < k < p`. Define `pPow p D : Derivation R A A` with
`pPow_apply : pPow p D a = D^[p] a`. Prove:

- `pPow_smul_const`: `pPow p (c • D) = c^p • pPow p D` for `c ∈ R`;
- `pPow_smul` (Hochschild's formula; Katz 1970, Proposition 5.3, due to Deligne, applied in
  (5.4.0)): for `a ∈ A`, `pPow p (a • D) = a^p • pPow p D + ((aD)^{p−1}(a)) • D`;
- `ad_pPow`: `[pPow p D, E] = (ad D)^p (E)`;
- `pPow_add`: `pPow p (D + E) = pPow p D + pPow p E + Λ_p(D, E)`, from 0.1 in `End_R(A)`;
- the instance `RestrictedLieAlgebra R (Derivation R A A) p`, and the inclusion
  `Der_R(A) → End_R(A)` as a restricted morphism into `RestrictedLieAlgebra.ofAssociative`;
- compatibility with base change: for `R → R′` with `A′ = R′ ⊗_R A`, the base change of
  `pPow p D` is `pPow p` of the base change; and with localization: the extension of
  `pPow p D` to a localization (`Derivation.extendOfIsLocalization`) is `pPow p` of the extension;
- coordinates: if `Ω¹_{A/R}` is free on `ds_1, …, ds_r`, the dual derivations `∂_i` commute and
  `pPow p ∂_i = 0` (a derivation is determined by its values on the `s_j`).

**Checks.** On `𝔽_p[x]`, `pPow p (d/dx) = 0` but `pPow p (x d/dx) = x d/dx`, since
`(x d/dx)(x^n) = n x^n` and `n^p ≡ n`. This fixes the sign in `pPow_smul`: with `a = x` and
`D = d/dx`, the correction term is `(xD)^{p−1}(x) · D = x D`, as it must be. Katz's display
(5.3.0) writes the correction term as `a · D^{p−1}(a^{p−1}) · D`, which for `a = x` is
`(p − 1)!·x D = −x D` (Wilson); the identity holds with `−a · D^{p−1}(a^{p−1})`, which equals
`(aD)^{p−1}(a)`, and the `p`-linearity of Layer 1.2 is unaffected. For `p = 2` the two forms agree.

## Layer 1: the p-curvature

### 1.1 Definition and linearity

For a connection `∇` on `M` define `pCurvature p ∇ D = (∇_D)^p − ∇_{pPow p D}`. Prove
`pCurvature_smul_apply`: `ψ(D)(a m) = a ψ(D)(m)` (Katz 1970, (5.0.6)–(5.0.9)), from
`[∇_D, a] = D(a)` (the module analogue of `Derivation.lie_mulLeft`) and the commutator expansion
of `(∇_D)^p a` in characteristic `p`. Hence `ψ(D) ∈ End_A(M)`, and `ψ(D)` kills the horizontal
sections.

### 1.2 Katz's structure theorem

Prove (Katz 1970, Proposition 5.2):

- `pCurvature_smul`: `ψ(a D) = a^p ψ(D)` for every connection (5.2.0; proof (5.4), from
  `pPow_smul` and Deligne's identity in `End_R(M)`);
- `pCurvature_add`: for a flat connection, `ψ(D + E) = ψ(D) + ψ(E)` (5.2.0; proof (5.2.6)–(5.2.8):
  Jacobson's formula in `Der_R(A)` and in `End_R(M)`, and flatness, which makes `∇` a Lie
  morphism so that `∇(Λ_p(D, E)) = Λ_p(∇_D, ∇_E)`);
- `commute_pCurvature`: for a flat connection, `∇_D`, `∇_{D^p}` and `ψ(D)` commute (5.2.1);
- `commute_pCurvature_of_basis`: if `Ω¹_{A/R}` is free on `ds_1, …, ds_r` and `∇` is flat, the
  `ψ(D)` commute with each other and are horizontal, `[∇_E, ψ(D)] = 0` (5.2.2)–(5.2.3), by
  reducing with `p`-linearity to `ψ(∂_i) = (∇_{∂_i})^p` (since `pPow p ∂_i = 0`).

Consequently, when `Ω¹_{A/R}` is free on `ds_1, …, ds_r`, `ψ` is determined by the commuting
`A`-linear endomorphisms `ψ(∂_i)`, and defines the `p`-curvature tensor
`M → M ⊗_A F^*Ω¹_{A^{(p)}/R}` (Katz 1970, §5; the twist is that of Layer 2.0).

**Checks.** Additivity needs flatness: on `A = 𝔽_2[x, y]`, `∇ = d + x dy` is not flat
(`[∇_{∂_x}, ∇_{∂_y}] = 1` while `[∂_x, ∂_y] = 0`), and `ψ(∂_x) = 0`, `ψ(∂_y) = x^2`, but
`ψ(∂_x + ∂_y) = x^2 + 1` (Jacobson's formula in rank one with `E = ∂_x + ∂_y`, `E(x) = 1`). For
odd `p` the same connection has `ψ(∂_x + ∂_y) = x^p = ψ(∂_x) + ψ(∂_y)`.

### 1.3 Functoriality

Prove, with CR.1.3's operations: `pCurvature_comp_of_horizontal` (a horizontal `A`-linear map
intertwines `ψ`); direct sums (`ψ` is diagonal); tensor products,
`ψ_{M⊗N}(D) = ψ_M(D) ⊗ 1 + 1 ⊗ ψ_N(D)`; duals and `Hom` (for `M` finite projective),
`ψ_{Hom(M,N)}(D)(φ) = ψ_N(D) ∘ φ − φ ∘ ψ_M(D)`; base change along `R → R′` with `R′` of
characteristic `p`, `ψ_{R′⊗M}(1 ⊗ D) = 1 ⊗ ψ_M(D)`; pull-back along an étale `A → B`, where
every `D ∈ Der_R(A)` extends uniquely to `D_B ∈ Der_R(B)`
(`KaehlerDifferential.tensorKaehlerEquivOfFormallyEtale`) and `ψ_{B⊗M}(D_B) = 1 ⊗ ψ_M(D)`;
localization, via `Derivation.extendOfIsLocalization`.
Prove `pCurvature_eq_zero_of_basis`: a basis of horizontal
sections forces `ψ = 0` (`ψ(D)` is `A`-linear and kills horizontal sections). For `B` faithfully
flat over `A` (in particular a finite étale cover with `Spec B → Spec A` surjective), `ψ_M = 0`
if and only if `ψ_{B⊗M} = 0`.

### 1.4 Matrices and rank one

For `M = A^n` with `∇_D = D + Γ(D)`, prove `ψ(D) = Γ_p(D) − Γ(D^p)` with `Γ_0 = 1`,
`Γ_{k+1} = D(Γ_k) + Γ(D) Γ_k` (entrywise `D`). Define `ofForm ω`, the connection `D + ω(D)` on
`A` attached to `ω : Der_R(A) →ₗ[A] A`, and prove `pCurvature_ofForm`:
`ψ(D) = ω(D)^p + D^{p−1}(ω(D)) − ω(D^p)` (Jacobson's formula in rank one, from 0.1 or directly).
If `u ∈ A^×` and `ω(D) = −D(u)/u` for all `D` (the connection `d − du/u`, with horizontal section
`u`), then `ψ = 0`.

**Checks.** On `𝔽_p[x, x^{−1}]`, `D = d/dx`, `a = c/x` (`c ∈ 𝔽_p̄`):
`ψ = (c^p − c)/x^p`, zero exactly for `c ∈ 𝔽_p` (`D^{p−1}(x^{−1}) = (p−1)!·x^{−p} = −x^{−p}`
by Wilson). On `𝔽_p[x]` with `a = 1`: `ψ = 1`. Rank two, unipotent: `Γ = [[0, x^{p−1}], [0, 0]]`
on `𝔽_p[x]` gives `ψ = [[0, −1], [0, 0]] ≠ 0`, although the sub-object and the quotient have
`ψ = 0`. The Airy connection `Γ = [[0, 1], [x, 0]]` has `ψ = [[−1, x], [x^2, 1]]` for `p = 3`
and `ψ = [[x, x^2], [x^3 − 1, −x]]` for `p = 5`.

### 1.5 Nilpotence

Define `IsNilpotentPCurvature p ∇ n`: every product of `n` values of `ψ` vanishes (Katz 1970,
(5.5.1), (5.6)). Prove, for `Ω¹_{A/R}` free on `ds_1, …, ds_r` and `∇` flat, the equivalence of
(5.5.0) (a horizontal filtration of length `≤ n` whose graded pieces have `ψ = 0`), (5.5.1) and
(5.5.2) (vanishing of the products of the `(∇_{∂_i})^{p w_i}` with `Σ w_i = n`) (Katz 1970,
Corollary 5.5); stability under subobjects and quotients, and exponent `≤ n + m − 1` for tensor
products and `Hom` (Proposition 5.7); stability under pull-back along the squares of
Theorem 5.9; and the criterion of Proposition 5.8. Prove the comparison with CR.1.3: for an
`𝔽_p`-algebra `R` with the zero PD ideal, `P = R[x_1, …, x_r]` and `M` a finitely generated
`P`-module with flat connection, CR.1.3's topological quasi-nilpotence holds if and only if `ψ`
is nilpotent.

**Checks.** The unipotent example of 1.4 has `ψ ≠ 0` and `ψ^2 = 0`: nilpotent of exponent `2`,
not `1`. `∇e = e dx` on `𝔽_p[x]` has `ψ = 1`, not nilpotent, matching CR.1.3's check that it is
not quasi-nilpotent.

## Layer 2: Cartier descent

### 2.0 The Frobenius image and the twist

Define `frobeniusImage R A p`, the `R`-subalgebra of `A` generated by the `p`-th powers: the
image of the relative Frobenius `A ⊗_{R, F_R} R → A`, `a ⊗ r ↦ r a^p`, of
SchemeAndStackFoundations §0.29 on `Spec A`. Prove `apply_eq_zero_of_mem_frobeniusImage` (every
derivation vanishes on it). For `A` smooth over `R` of characteristic `p`, prove that the relative
Frobenius is injective with image `frobeniusImage R A p` (it is finite locally free of positive
rank, `relativeFrobenius_smooth_rank`), and `kaehlerD_eq_zero_iff`: `d a = 0` if and only if
`a ∈ frobeniusImage R A p` (degree `0` of `DerivedDeRham.smoothCartier`). Horizontal sections
`horizontalFrob p ∇` form a `frobeniusImage R A p`-submodule of `M`.

### 2.1 The descent theorem

Prove `cartier_descent` (Katz 1970, Theorem 5.1, affine form): for `A` smooth over `R` of
characteristic `p` and `∇` flat with `ψ = 0`, the map `A ⊗_{A′} M^∇ → M`,
`A′ = frobeniusImage R A p`, is bijective. Conversely, for every `A′`-module `N`, the canonical
connection `∇_D(a ⊗ n) = D(a) ⊗ n` on `A ⊗_{A′} N` is flat with `ψ = 0`, and
`N → (A ⊗_{A′} N)^∇` is bijective. Together, with morphisms the horizontal maps, these give the
equivalence between `A′`-modules and flat connections on `A`-modules with `ψ = 0`, compatible with
tensor products, finite projectivity in both directions, and base change along `R → R′`. Proof
(Katz 1970, (5.1.2)–(5.1.6)): the statement is Zariski-local on `Spec A`, since inverting
`f ∈ A` is inverting `f^p ∈ A′` and horizontal sections commute with it; so reduce to `A` étale
over `R[s_1, …, s_r]` (the étale coordinates of SchemeAndStackFoundations §0.8,
`etale_coordinates`), where `Ω¹_{A/R}` is free on the `ds_i`
(`TauCeti.kaehlerBasisOfFormallyEtale`); with `∂_i` the dual derivations, the projector
`P = Σ_w Π_i (−s_i)^{w_i}/w_i! · Π_i (∇_{∂_i})^{w_i}`, `0 ≤ w_i ≤ p − 1`, maps `M` onto `M^∇` and
`Σ_w Π s_i^{w_i}/w_i! · P ∘ Π (∇_{∂_i})^{w_i} = id` (Taylor's formula), from
`ψ(∂_i) = (∇_{∂_i})^p = 0`.

### 2.2 Consequences

`ψ = 0` if and only if `M` is spanned by horizontal sections; for `M` finite projective of rank
`n` over a local `A`, if and only if `M` has a basis of `n` horizontal sections. Rank one: flat
connections on invertible `A`-modules with `ψ = 0` correspond to invertible `A′`-modules, and on
the trivial module `A` the connections `d + ω` with `ψ = 0` and a horizontal unit are exactly
`d − du/u`, `u ∈ A^×`.

### 2.3 Rank one in one variable

Prove `exists_unit_horizontal_iff`: over a local ring `A` of characteristic `p` with a
derivation `D` such that `D^[p] = 0` and `x` with `D x = 1`, `D + a` has a horizontal unit if
and only if `a^p + D^{p−1}(a) = 0`. This needs no smoothness: Katz's projector in one variable,
`P = Σ_{k<p} (−x)^k/k! (D + a)^k`, has horizontal values and `Σ_{j<p} x^j/j! P (D + a)^j = 1`.
It applies to `κ(x)`, `κ[[x]]` and the local rings of `κ[x]`.

### 2.4 Rank one over κ(x)

For a field `κ` of characteristic `p` and `a ∈ κ(x)`, prove the equivalence of: `ψ(d/dx + a) = 0`;
`a = −y′/y` for some `y ∈ κ(x)^×` (2.3); over an algebraic closure `κ̄`, `a` has only simple
poles, vanishes at `∞`, and all its residues lie in `𝔽_p` (Bostan–Caruso–Roques 2024,
Proposition 3.3 and Remark 3.13, for `κ = 𝔽_p`). The passage from `κ̄(x)` to `κ(x)` is 2.3
applied over `κ(x)`, since `ψ` commutes with the base change `κ(x) → κ̄(x)` (1.3).

**Checks.** `a = 1/x + 1/(x − 1)`: residues `1`, `ψ = 0`, `y = 1/(x(x − 1))`. `a = 1/(2x)` for
`p` odd: residue `1/2 ∈ 𝔽_p`, `ψ = 0`, `y = x^{(p−1)/2}`, a polynomial, though over `ℚ` the
solution `x^{−1/2}` is not rational. `a = 1/x^2`: double pole, `ψ ≠ 0`.

## Layer 3: trivial on a finite étale cover implies zero p-curvature

### 3.1 Pull-back

From 1.3: for a finite étale `A → B` with `Spec B → Spec A` surjective, `ψ_M = 0` if and only if
`ψ_{B⊗M} = 0`; and the trivial connection `(B^n, d)` has `ψ = 0`.

### 3.2 The easy direction

Let `S` be a domain finitely generated over `ℤ` with fraction field `F` of characteristic `0`,
`A` a smooth `S`-algebra, and `M` a finite projective `A`-module with a flat connection relative
to `S`. Suppose there is a finite étale `F ⊗_S A`-algebra `B_F`, faithfully flat, such that
`B_F ⊗ M` is isomorphic, with its connection, to `(B_F^n, d)`. Prove that there is `0 ≠ f ∈ S`
such that for every maximal ideal `m` of `S_f` (whose residue field is finite of characteristic
`p_m`), the reduction of `(A, M, ∇)` modulo `m` has zero `p_m`-curvature. Proof: spread out
`B_F` and the isomorphism over some `S_f` (SchemeAndStackFoundations §0.9,
`spreading_out_models` and `finite_presentation_limits`, with the properties finite, étale and
surjective), reduce modulo `m`, and apply 3.1. This is Grothendieck's observation in folder 93,
pp. 193–197, and Bostan–Caruso–Roques 2024, Theorem 3.5, in rank one over `ℚ(x)`.

**Checks.** `S = ℤ`, `A = ℤ[x, x^{−1}]`, `∇ = d + (1/2) dx/x` after inverting `2`: trivialised on
`B = A[t]/(t^2 − x)`; for `p` odd, `ψ = 0` by 1.4 with `c = 1/2 ∈ 𝔽_p`. `∇ = d + dx` on
`ℤ[x]`: `ψ = 1` modulo every `p`, so no finite étale cover trivialises it (the solution `e^{−x}`
is transcendental).

## Layer 4: rank one over open subsets of the affine line

### 4.1 Kronecker's theorem

Prove `exists_intCast_eq_of_forall_pow_sub_mem`: for a number field `L` and `c ∈ 𝓞_L`, if
`c^{p} − c ∈ 𝔓` for almost every prime `𝔓` of `𝓞_L`, `p = char κ(𝔓)`, then `c ∈ ℤ`. Proof: if
`c ∉ ℚ`, choose `σ` in the Galois group of a Galois closure `M/ℚ` with `σ(c) ≠ c`; by
`NumberField.Chebotarev.infinite_frobeniusPrimeSet` infinitely many primes of `ℤ` have Frobenius
class that of `σ`; at a prime `𝔔` of `M` above such a prime with Frobenius `σ` and not dividing
`σ(c) − c`, `c^p ≡ σ(c) ≢ c`, and `𝔓 = 𝔔 ∩ 𝓞_L` contradicts the hypothesis. This is the form of
Kronecker's theorem (Kronecker 1880; Bostan–Caruso–Roques 2024, Theorem 3.7; Fürnsinn–Pannier,
Theorem 1.1) used below.

**Checks.** `c = i` in `ℚ(i)`: at primes above `p ≡ 3 (mod 4)`, `i^p = −i ≢ i`. `c = 3`: Fermat.

### 4.2 Partial fractions and reduction

For `K` a number field and `a = P/Q`, `P, Q ∈ 𝓞_K[x]`, `Q ≠ 0`, let `L` be a splitting field of
`Q` over `K` and write `a = R(x) + Σ_{α, j} c_{α, j}/(x − α)^j` over `L`. Prove that for almost
every prime `𝔓` of `L`, the `α` and `c_{α, j}` are `𝔓`-integral, the `α` stay distinct modulo
`𝔓`, and the reduction of this decomposition is the partial-fraction decomposition of the
reduction of `a` (Bostan–Caruso–Roques 2024, proof of Theorem 3.6).

### 4.3 Honda's theorem

Prove `honda`: for `K` a number field and `a = P/Q ∈ K(x)`, the reductions of `d/dx + a` have
zero `p`-curvature (`ratFuncPCurvature`) at almost every prime of `K` if and only if
`n·a = f′/f` for some `n ≥ 1` and `f ∈ K(x)^×`. Proof of `⇒` (Honda 1981, §1, for `K = ℚ`;
Bostan–Caruso–Roques 2024, Theorem 3.6): the primes of `L` above almost every prime of `K`
are almost every prime of `L`, and `ψ` commutes with the extension `κ(v) → κ(𝔓)` (1.3); so by
2.4 and 4.2, for almost every `𝔓`, `R ≡ 0`,
`c_{α, j} ≡ 0` for `j ≥ 2`, and `c_{α, 1}` reduces into `𝔽_p`; hence `R = 0`, `c_{α, j} = 0` for
`j ≥ 2`, and `c_{α, 1} ∈ ℚ` by 4.1 (applied to an integer multiple); with `n` a common
denominator, `f = Π (x − α)^{n c_{α, 1}}` is fixed by `Gal(L/K)` (which permutes the `α` and
fixes the rational residues), so `f ∈ K(x)`, and `n·a = f′/f`. Proof of `⇐`: for almost every
prime, `n` is invertible and the reductions of `f`, `f′` are defined, and `a ≡ (1/n)·f′/f` with
`1/n ∈ 𝔽_p` is a logarithmic derivative, so `ψ = 0` by 1.4.

### 4.4 The Kummer trivialisation

For `a` as in 4.3 with `n·a = f′/f`, let `U = Spec K[x]_{Qfg}` (`f = F/G`) and
`B = O(U)[t]/(t^n − f)`: `B` is finite étale and faithfully flat over `O(U)`, and `t^{−1}` is a
horizontal unit of `d + a dx` on `B` (`t′ = (f′/(n f)) t = a t`). So the four conditions are
equivalent: zero `p`-curvature at almost every prime; `n·a` logarithmic; `d + a dx` trivialised
by a finite étale cover of a dense open of `𝔸¹_K`; `d + a dx` trivialised by a Kummer cover.
This is the Grothendieck–Katz principle in rank one over open subsets of `𝔸¹_K`, a theorem.

**Checks.** `a = 1/(2x)` over `ℚ`: `n = 2`, `f = x`, `y = x^{−1/2}`. `a = i/(x^2 + 1)` over
`ℚ(i)`: residues `±1/2`, `n = 2`, `f = (x − i)/(x + i)`. `a = 1/(x^2 + 1)` over `ℚ`: residues
`∓i/2 ∉ ℚ`, `ψ ≠ 0` at the primes `p ≡ 3 (mod 4)` (Bostan–Caruso–Roques 2024, Example 3.4).
`a = 1`: `ψ = 1` everywhere.

## Ordering

Layer 0 → Layer 1 (1.1 → 1.2 → 1.3 → 1.4 → 1.5) → Layer 2 (2.0 → 2.1 → 2.2; 2.3 needs only
Layers 0–1 and precedes 2.4) → Layer 3 → Layer 4 (4.1 and 4.2 are independent of Layers 0–3;
4.3 needs 2.4; 4.4 needs 4.3 and 1.3). CR.1.3 (#857) and F2.1–F2.3 (#1056) precede Layer 1;
DerivedDeRhamCohomology §3.6 (#868) and SchemeAndStackFoundations §0.29 precede Layer 2.

## Research context

Not targets. The Grothendieck–Katz conjecture: for `S` finitely generated over `ℤ` and
dominant, `X → S` smooth and `(M, ∇)` a vector bundle with flat connection on `X/S`, if the
reductions have zero `p`-curvature at all closed points of a dense open of `S`, then `(M, ∇)`
becomes trivial on a finite étale cover of the generic fibre (Katz 1972; Katz 1982, which
reformulates it through the Lie algebra of the differential Galois group). Known cases: Gauss–
Manin connections (Katz 1972), rank one over curves (Chudnovsky 1985, Theorem 8.1, as cited by
Bostan–Caruso–Roques 2024, §3.3.2), solvable differential Galois group (Bost 2001; André 2004).
In rank one, Grothendieck's notes (folder 93, pp. 193–197) separate a torsion question for the
class of `M` in the Picard group from the question whether a closed `1`-form whose reductions are
logarithmic has an integral multiple that is logarithmic; Layer 4 answers the second over open
subsets of `𝔸¹_K`. Research that uses the material of Layers 0–2: Katz's nilpotence of
Gauss–Manin `p`-curvature and the monodromy theorem (Katz 1970, Theorem 5.10 and §§6–7);
the Cartier transform and nonabelian Hodge theory in characteristic `p` (Ogus–Vologodsky 2007),
listed by CrystallineCohomology (#857) as the subject of a later crystalline roadmap; the
Frobenius-descent connection used by DerivedDeRhamCohomology (#868), §3.6.1; the restricted Lie
algebra of an algebraic group used by ReductiveGroups Layer 9B; algorithms deciding algebraicity
by `p`-curvatures (Bostan–Caruso–Roques 2024; Fürnsinn–Pannier).

## References

- N. M. Katz, « Nilpotent connections and the monodromy theorem: applications of a result of
  Turrittin », *Publ. Math. IHÉS* 39 (1970), 175–232, §5: (5.0) (`D^p`, the `p`-curvature,
  (5.0.4), (5.0.9)), Theorem 5.1 (Cartier), Proposition 5.2 with (5.2.4)–(5.2.8), Proposition 5.3
  (Deligne), Corollary 5.5, Definition 5.6, Propositions 5.7–5.8, Theorems 5.9–5.10.
  (zbMATH 0221.14007; Numdam PMIHES_1970__39__175_0.)
- N. M. Katz, « Algebraic solutions of differential equations (p-curvature and the Hodge
  filtration) », *Invent. Math.* 18 (1972), 1–118. (zbMATH 0278.14004.)
- N. M. Katz, « A conjecture in the arithmetic theory of differential equations », *Bull. Soc.
  Math. France* 110 (1982), 203–239. (Numdam BSMF_1982__110__203_0.)
- N. Jacobson, « Abstract derivation and Lie algebras », *Trans. Amer. Math. Soc.* 42 (1937),
  206–224.
- N. Jacobson, « Restricted Lie algebras of characteristic p », *Trans. Amer. Math. Soc.* 50
  (1941), 15–25.
- T. Honda, « Algebraic differential equations », *Symposia Mathematica* XXIV (INDAM, Rome,
  1979), Academic Press (1981), 169–204, §1.
- D. V. Chudnovsky, G. V. Chudnovsky, « Applications of Padé approximations to the Grothendieck
  conjecture on linear differential equations », *Number theory (New York, 1983–84)*, Lecture
  Notes in Math. 1135, Springer (1985), 52–100.
- J.-B. Bost, « Algebraic leaves of algebraic foliations over number fields », *Publ. Math.
  IHÉS* 93 (2001), 161–221.
- Y. André, « Sur la conjecture des p-courbures de Grothendieck–Katz et un problème de Dwork »,
  in *Geometric aspects of Dwork theory*, de Gruyter (2004), 55–112.
- A. Ogus, V. Vologodsky, « Nonabelian Hodge theory in characteristic p », *Publ. Math. IHÉS*
  106 (2007), 1–138.
- A. Bostan, X. Caruso, J. Roques, « Algebraic solutions of linear differential equations: an
  arithmetic approach », *Bull. Amer. Math. Soc.* 61 (2024), 609–658; arXiv:2304.05061:
  Propositions 1.8, 3.1, 3.3, Example 3.4, Theorems 3.5–3.7, Theorem 3.12, Remark 3.13,
  Theorem 3.16, Theorem 3.19 (Cartier's lemma), §3.3.2.
- F. Fürnsinn, L. Pannier, « An effective version of the p-curvature conjecture for order one
  differential equations », arXiv:2510.00892, Theorem 1.1, Propositions 2.2–2.4.
- L. Kronecker, « Über die Irreducibilität von Gleichungen », *Monatsber. Königl. Preuss. Akad.
  Wiss. Berlin* (1880), 155–163.

## Provenance

The question that motivates Layers 3 and 4 is Grothendieck's, in the Montpellier fonds, folder
93 (catalogue dates [1972]–1981), pp. 193–197, with the rank-one splitting; pp. 204–212 write
the `p`-curvature of `d + ω` through the Cartier operator and ask, p. 208, for a `p`-curvature
tensor in every rank, which Katz 1970, §5, constructs. An existing formalisation of rank-one
and matrix cases, over `Derivation ℤ A A` and on `A^n`, is
[`lean/Grothendieck/Folder93.lean`](https://github.com/Commutator-IO/grothendieck-project/blob/a7b61770f7cef8a446760b0870bd0ee9d280a923/lean/Grothendieck/Folder93.lean)
at commit `a7b61770`: `iterate_leibniz` and `pDerivation` (0.3), `jacobson` (Jacobson's formula
in rank one, 1.4), `pCurvature_eq_zero` and `jacobson_logDeriv` (1.4), `curvMat`,
`pCurvature_smul`, `pCurvature_apply` and `curvMat_eq_zero_of_horizontal` (1.1, 1.3, 1.4), the
examples `curvMat_unipotent_X_pow`, `curvMat_airy_three`, `curvMat_airy_five` (1.4), and Katz's
projector `proj`, `mul_proj`, `taylor`, `horizontal_unit_iff`, `horizontal_span` (2.3). It is a
cited source, not the specification: this roadmap works over an arbitrary base `R` and on the
connection carrier of CR.1.3.
