# Roadmap: p-curvature, Cartier descent and rank-one algebraic solutions

**Summary.** Build the theory of connections in characteristic `p` that the arithmetic of linear
differential equations rests on. Layer 0 makes the `p`-th power of a derivation a derivation and
gives Jacobson's theory of restricted Lie algebras, with Jacobson's formula for `(a + b)^p` in an
associative algebra of characteristic `p`. Layer 1 defines the `p`-curvature
`ψ(D) = (∇_D)^p − ∇_{D^p}` of a connection and proves Katz's structure theorems: `ψ(D)` is
linear, `ψ` is `p`-linear in `D`, for flat connections the values commute and are horizontal,
`ψ` is compatible with horizontal maps, tensor products, duals, base change and étale pull-back,
and has the closed rank-one formula `ψ = a^p + D^{p−1}(a)`; it also defines nilpotence of the
`p`-curvature. Layer 2 proves Cartier's descent theorem (Katz 1970, Theorem 5.1): over a smooth
algebra in characteristic `p`, flat connections with zero `p`-curvature are the modules over the
Frobenius twist. Layer 3 proves the easy direction of the arithmetic principle: a flat connection
over a finitely generated `ℤ`-algebra that becomes trivial on a finite étale cover of its generic
fibre has zero `p`-curvature at all closed points of a dense open of the base. Layer 4 proves the
converse in rank one over open subsets of the affine line over a number field `K` (Honda's
theorem): `d + a dx`, `a ∈ K(x)`, has zero `p`-curvature at almost every prime of `K` if and only
if `n·a` is a logarithmic derivative `f′/f` for some `n ≥ 1`, if and only if the connection is
trivialised by a Kummer cover.

Suggested home: `TauCeti/Algebra/Lie/Restricted/` for Layer 0,
`TauCeti/RingTheory/Derivation/PCurvature/` for Layers 1–3, and
`TauCeti/NumberTheory/DifferentialEquations/RankOne/` for Layer 4.

## Scope and ownership

**Owned here.** Jacobson's Lie polynomial and Jacobson's formula in associative algebras of
characteristic `p`; restricted Lie algebras, their morphisms and the standard examples; the
restricted structure `D ↦ D^p` on `Der_R(A)`; the `p`-curvature of a connection and all of
Layer 1; nilpotence of the `p`-curvature and its comparison with the quasi-nilpotence of
CrystallineCohomology CR.1.3; Cartier descent in the affine form of Layer 2; the statements of
Layers 3 and 4. A search of the roadmaps for p-curvature, restricted Lie algebras, Jacobson's
formula, Cartier descent and Honda's theorem finds no other owner.

**Left to other roadmaps.** The ordinary algebraic connection `M → M ⊗_A Ω`, with its curvature,
horizontal maps, tensor product, `Hom`/dual and base change, is CrystallineCohomology CR.1.3's,
and its evaluation on derivations, `Der_R(A) →ₗ[A] End_R(M)`, with flatness in the bracket form,
is FormalConnectionsOpers §§2.1–2.3's; this roadmap introduces no second connection carrier.
PadicDifferentialEquationsAndRigidCohomology RD.1.1–RD.1.6 owns differential modules over
differential rings of characteristic `0` and cyclic vectors; this roadmap is in characteristic
`p` and does not use them. DiophantineApproximationAndTranscendence §§5.1–5.3 owns D-finite
series, G-functions and the Galochkin condition; the relation between the Galochkin condition and
nilpotent `p`-curvature (Chudnovsky 1985; André 1989; Katz 1970) is outside this roadmap. Smooth
connections and monodromy belong to SmoothBundlesConnections, and the complex Riemann–Hilbert
comparison to ComplexComparisonPartII; the complex formulation by finite monodromy is therefore
stated here only through finite étale covers.

**Out of scope.** Restricted enveloping algebras and their Poincaré–Birkhoff–Witt bases; the
centre of the ring of differential operators in characteristic `p`; the nilpotence of the
`p`-curvature of Gauss–Manin connections (Katz 1970, Theorem 5.10) and Katz's proof of the
conjecture for Picard–Fuchs equations (Katz 1972), which need algebraic Gauss–Manin connections
in characteristic `p`; the Cartier transform of Ogus–Vologodsky. These are research consumers of
this roadmap, listed under *Research context*.

## Conventions

1. `p` is a prime (`[Fact p.Prime]`). `R` is a commutative ring and `A` a commutative
   `R`-algebra with `[CharP A p]`; in Layer 2 also `[CharP R p]`. Derivations are `R`-linear, so
   they kill the image of `R`. Witness: on `𝔽_p[x]` over `R = 𝔽_p[x^p]`, `d/dx` is
   `R`-linear because `d(x^p)/dx = p x^{p−1} = 0`.
2. `D^p` denotes the `p`-th iterate of a derivation `D`, packaged as a derivation (`pPow p D`);
   it is not a power in `Der_R(A)`, which has no product. Witness: on `𝔽_p[x]`,
   `pPow p (d/dx) = 0` and `pPow p (x d/dx) = x d/dx` (Check 0.3).
3. A connection on an `A`-module `M` is CrystallineCohomology CR.1.3's ordinary connection for
   `Ω = Ω¹_{A/R}`; `∇_D : M → M` is its evaluation on `D` (FormalConnectionsOpers §2.1), with
   `∇_D(a m) = a ∇_D m + D(a) m`. It is *flat* when `∇_{[D,E]} = [∇_D, ∇_E]` for all `D, E`
   (§2.3); when `Ω¹_{A/R}` is finite projective this is zero curvature (§2.3). Witness: on
   `𝔽_2[x, y]`, `d + x dy` is not flat, `[∇_{∂_x}, ∇_{∂_y}] = 1` while `[∂_x, ∂_y] = 0`.
4. The `p`-curvature is `ψ(D) = (∇_D)^p − ∇_{D^p} ∈ End_R(M)` (Katz 1970, (5.0.4)). It is
   defined for every connection; additivity in `D` needs flatness, linearity in `M` and
   `p`-linearity in `D` do not. Sign witness: `d + dx` on `𝔽_p[x]` has `ψ(d/dx) = +1`.
5. On `A = κ(x)` or `κ[x]` with `D = d/dx`, `D^p = 0`, so for `∇ = d/dx + a` the `p`-curvature
   is multiplication by `a^p + D^{p−1}(a)`. In Layer 4 the connection is `d + a dx`, its
   horizontal sections solve `y′ + a y = 0`, and "`n·a` is a logarithmic derivative" means
   `n·a = f′/f` with `f ∈ K(x)^×`. Witness: `a = 1/x` on `𝔽_p(x)` gives
   `ψ = x^{−p} + (p−1)!·x^{−p} = 0`, with horizontal section `1/x`.
6. "Almost every prime of `K`" means all but finitely many `v : HeightOneSpectrum (𝓞 K)`
   (`Filter.cofinite`). The reduction of `a = P/Q`, `P, Q ∈ 𝓞_K[x]`, at `v` is
   `P̄/Q̄ ∈ κ(v)(x)` with `κ(v) = Ideal.ResidueField v.asIdeal`; it is junk (`0`) at the finitely
   many `v` where `Q̄ = 0`. Witness: `a = 1/(2x)` over `ℚ` reduces to `0` at `v = 2`.

## Exact supplier contracts

**From Mathlib** (at the pinned revision `f6090c70`).

- Derivations: `Derivation`, `Derivation.mk'`, `Derivation.leibniz_pow`, the Lie ring and Lie
  algebra of `Derivation R A A`, `LinearMap.compDer`, `Polynomial.derivative'`,
  `LinearMap.mulLeft`, `Module.End`.
- Differentials: `KaehlerDifferential`, `KaehlerDifferential.D`,
  `KaehlerDifferential.linearMapEquivDerivation`,
  `KaehlerDifferential.tensorKaehlerEquivOfFormallyEtale`, `Algebra.Smooth`, `Algebra.Etale`.
- Lie algebras: `FreeLieAlgebra`, `FreeLieAlgebra.of`, `FreeLieAlgebra.lift`, `LieAlgebra.ad`,
  `LieRing.ofAssociativeRing` (a local instance) and `LieAlgebra.ofAssociativeAlgebra`.
- Fields and number fields: `RatFunc`, `IsFractionRing`, `Ideal.ResidueField`,
  `NumberField.RingOfIntegers`, `IsDedekindDomain.HeightOneSpectrum`, `ringChar`, `CharP`,
  `IsLocalRing`, `Algebra.adjoin`.

**From Tau Ceti** (at the pinned revision `358314d4`).

- `TauCeti.LieAlgebra.ad_pow_expChar_pow` (`TauCeti/Algebra/Lie/AdjointAction/Frobenius.lean`):
  `ad(a^{p^n}) = (ad a)^{p^n}` in an associative algebra; the restricted structure of 0.2.
- `Derivation.extendOfIsLocalization`, `Derivation.extendOfIsLocalization_algebraMap`
  (`TauCeti/RingTheory/Derivation/Localization.lean`): `d/dx` on `K(x)` (Layer 4) and the
  localization of connections (1.3).
- `TauCeti.kaehlerBasisOfFormallyEtale` (`TauCeti/RingTheory/Kaehler/FormallyEtale.lean`): bases
  of `Ω¹` from étale coordinates (1.2, 2.1).
- `NumberField.Chebotarev.infinite_frobeniusPrimeSet`, `NumberField.Chebotarev.frobeniusPrimeSet`
  (`TauCeti/NumberTheory/Chebotarev/`): Layer 4.1.

**From CrystallineCohomology.** CR.1.3, *Ordinary algebraic connections*: the connection
carrier, its extension, curvature, horizontal maps, tensor, `Hom`/dual and base change; and its
definition of integrable topologically quasi-nilpotent connections over PD envelopes (1.5).

**From FormalConnectionsOpers.** §2.1, the evaluation of a connection on vector fields,
`Der_R(A) →ₗ[A] End_R(M)` with `∇_D(a m) = a ∇_D m + D(a) m`; §2.3, flatness in the bracket form
and its comparison with zero curvature when `Ω¹_{A/R}` is finite projective.

**From DerivedDeRhamCohomology.** §3.6, the smooth Cartier isomorphism
`DerivedDeRham.smoothCartier`, `H^i(Ω•_{B/A}) ≅ ∧^i Ω¹_{B^{(1)}/A}`; Layer 2.0 uses degree `0`.

**From SchemeAndStackFoundations.** §0.29, `SchemeFrobenius.schemeFrobeniusTwist`,
`SchemeFrobenius.relativeFrobenius` and `relativeFrobenius_smooth_rank` (2.0); §0.8,
`etale_coordinates` (2.1); §0.9, `finite_presentation_limits` and `spreading_out_models` (3.2).

**From GrothendieckNotesLemmas.** §3.2, `Derivation.lie_mulLeft` and
`Derivation.mulLeft_mul_mul_mulLeft_inv`: the commutator of a derivation with a multiplication
and conjugation by a unit (1.1, 1.4).

Neither pin has restricted Lie algebras, Jacobson's formula, the `p`-th power of a derivation as
a derivation, algebraic connections, or the `p`-curvature.

## How to read the build

Layer 0 is algebra on derivations and associative algebras and needs nothing but Mathlib and Tau
Ceti. Layer 1 needs the connection carrier of CrystallineCohomology CR.1.3 with the evaluation of
FormalConnectionsOpers §2.1, and delivers the `p`-curvature with its structure theorems. Layer 2
adds the Frobenius twist (SchemeAndStackFoundations §0.29) and the degree-`0` Cartier
isomorphism (DerivedDeRhamCohomology §3.6), and delivers Cartier descent; its targets 2.3 and
2.4 in one variable need only Layers 0–1. Layer 3 spreads a trivialisation out over a dense open
(SchemeAndStackFoundations §0.9) and reduces it with Layer 1.3. Layer 4 is independent of
Layers 2–3 except through 2.4: Kronecker's theorem from Chebotarev, partial fractions, Honda's
theorem and the Kummer trivialisation.

## Layer 0: restricted Lie algebras and the p-th power of a derivation

### 0.1 Jacobson's formula

Define `jacobsonLie R p : FreeLieAlgebra R (Fin 2)`, the Lie polynomial
`Λ_p(x, y) = Σ_{0<i<p} s_i(x, y)` with `i·s_i(x, y)` the coefficient of `t^{i−1}` in
`ad(tx + y)^{p−1}(x)` (Katz 1970, (5.2.5)). Concretely, `Λ_p` is the sum, over the words
`z_1 ⋯ z_{p−1}` in the letters `x, y`, of the bracket `[z_1, [z_2, … [z_{p−1}, x] …]]` (innermost
letter `x`) times the natural-number representative of `i^{−1}` modulo `p`, where `i − 1` is the
number of letters `x` in the word; the word with `p − 1` letters `x` gets `0`, and its bracket
vanishes anyway. So `jacobsonLie R p` is defined over every ring `R`. Prove
`add_pow_eq_jacobson`: in an associative `R`-algebra `A` with `[CharP A p]`,
`(a + b)^p = a^p + b^p + Λ_p(a, b)`, where `Λ_p(a, b)` is the image of `jacobsonLie R p` under
`FreeLieAlgebra.lift R ![a, b]` for the commutator Lie structure (Jacobson 1937; Katz 1970,
(5.2.4)). Prove that `Λ_p` is natural for Lie algebra morphisms (it is the value of a Lie
polynomial), that `Λ_p(a, b) = 0` when `a` and `b` commute, and that in a Lie algebra in which
`p = 0` the value `Λ_p(a, b)` does not depend on the representatives.
*Needs:* Mathlib `FreeLieAlgebra`, `FreeLieAlgebra.lift`, `LieRing.ofAssociativeRing`.

**Checks.**

- `p = 2`: `Λ_2(x, y) = [y, x]` and `(a + b)^2 = a^2 + b^2 + ab + ba`, with `ba − ab = ab + ba`
  in characteristic `2`; a definition with the innermost letter `y` would give `[x, y]`, wrong
  only by a sign that characteristic `2` hides, so the next Check fixes it.
- `p = 3`: `Λ_3(x, y) = [y,[y,x]] + 2·[x,[y,x]]` in characteristic `3`, and
  `(a+b)^3 − a^3 − b^3 = a²b + aba + ba² + ab² + bab + b²a` equals its value; the coefficient
  `1` on every word would give `[y,[y,x]] + [x,[y,x]]`, wrong by `[x,[y,x]]`, which is `2E₁₂ ≠ 0`
  at `x = E₁₂`, `y = E₂₁` over `𝔽_3`.
- For `2 × 2` matrices over `𝔽_p`, `p` odd, `a = E₁₂`, `b = E₂₁`: `(a + b)^p = a + b` while
  `a^p = b^p = 0`, so `Λ_p(a, b) = a + b ≠ 0`; the formula without the Lie term is false.

### 0.2 Restricted Lie algebras

Define the class `RestrictedLieAlgebra R L p` (Jacobson 1941): a Lie algebra `L` over `R` with a
map `pMap : L → L` such that `pMap (c • x) = c^p • pMap x`, `ad (pMap x) = (ad x)^p` and
`pMap (x + y) = pMap x + pMap y + Λ_p(x, y)`. Define morphisms of restricted Lie algebras (Lie
algebra morphisms commuting with `pMap`), composition and identity, restricted Lie subalgebras
(Lie subalgebras closed under `pMap`) with the induced structure, and the kernel of a restricted
morphism as a restricted ideal. Examples, all proved: an associative `R`-algebra `A` of
characteristic `p` with `pMap a = a^p` (`ad(a^p) = (ad a)^p` is
`TauCeti.LieAlgebra.ad_pow_expChar_pow` with `n = 1`, additivity is 0.1), as a definition rather
than an instance because the commutator Lie ring is a local instance; `Module.End R M` as a
special case; a Lie subalgebra of a restricted Lie algebra closed under `pMap`.
*Needs:* 0.1; Tau Ceti `TauCeti.LieAlgebra.ad_pow_expChar_pow`; Mathlib `LieAlgebra.ad`.

**Checks.**

- For `A` commutative with the zero bracket, `pMap a = a^p` is additive, as Jacobson's formula
  requires (`Λ_p = 0`); a `p`-map without the Lie term would be refused by no example here, so
  the next Check is the discriminating one.
- On `M_2(𝔽_p)`, `p` odd, `pMap a = a^p` is not additive (Check 0.1): the axiom with `Λ_p` is
  the right one, the bare additivity axiom is false.
- For `R` of characteristic `p`, the abelian Lie algebra `R` with `pMap = 0` and with
  `pMap c = c^p` are two different restricted structures on one Lie algebra (they differ at `1`):
  the `p`-map is data, not a property.

### 0.3 The p-th power of a derivation

Prove `iterate_leibniz`: in characteristic `p`, `D^[p](ab) = a D^[p](b) + b D^[p](a)` (Katz 1970,
(5.0)), from the Leibniz rule `D^n(ab) = Σ binom(n, k) D^k(a) D^{n−k}(b)` and
`binom(p, k) ≡ 0` for `0 < k < p`. Define `pPow p D : Derivation R A A`, whose value at `a` is
`D^[p] a`. Prove:

- `(c • D)^p = c^p • D^p` for `c ∈ R` (the scalars of `R` are central);
- `pPow_smul` (Hochschild's formula; Katz 1970, Proposition 5.3, due to Deligne, applied in
  (5.4.0)): for `a ∈ A`, `pPow p (a • D) = a^p • pPow p D + ((aD)^{p−1}(a)) • D`;
- `ad_pPow`: `[pPow p D, E] = (ad D)^p (E)`;
- `pPow_add`: `pPow p (D + E) = pPow p D + pPow p E + Λ_p(D, E)`, from 0.1 in `End_R(A)`;
- the instance `RestrictedLieAlgebra R (Derivation R A A) p`, and the inclusion
  `Der_R(A) → End_R(A)` as a restricted morphism into the associative structure of 0.2;
- compatibility with base change: for `R → R′` with `A′ = R′ ⊗_R A`, the base change of
  `pPow p D` is `pPow p` of the base change; and with localization: the extension of `pPow p D`
  to a localization (`Derivation.extendOfIsLocalization`) is `pPow p` of the extension;
- coordinates: if `Ω¹_{A/R}` is free on `ds_1, …, ds_r`, the dual derivations `∂_i` commute and
  `pPow p ∂_i = 0` (a derivation is determined by its values on the `s_j`).

*Needs:* 0.1, 0.2; Mathlib `Derivation.mk'`, `Derivation.leibniz_pow`,
`KaehlerDifferential.linearMapEquivDerivation`; Tau Ceti `Derivation.extendOfIsLocalization`.

**Checks.**

- On `𝔽_p[x]`, `pPow p (d/dx) = 0` but `pPow p (x d/dx) = x d/dx`, since
  `(x d/dx)(x^n) = n x^n` and `n^p ≡ n`: `pPow` is not `A`-linear in `D`.
- The sign in `pPow_smul`: with `a = x` and `D = d/dx`, the correction term is
  `(xD)^{p−1}(x) · D = x D`, as it must be. Katz's display (5.3.0) writes the correction term as
  `a · D^{p−1}(a^{p−1}) · D`, which for `a = x` is `(p − 1)!·x D = −x D` (Wilson); the identity
  holds with `−a · D^{p−1}(a^{p−1})`, which equals `(aD)^{p−1}(a)`, and the `p`-linearity of
  Layer 1.2 is unaffected. For `p = 2` the two forms agree.
- Characteristic `0` is excluded: on `ℚ[x]`, `(d/dx)^2 (x · x) = 2 ≠ x·0 + x·0`, so the
  iterate of a derivation is not a derivation without `[CharP A p]`.

### Examples

- On `𝔽_p[x_1, …, x_r]`, `pPow p ∂_i = 0` and `pPow p (x_i ∂_i) = x_i ∂_i`: the restricted
  structure of `Der(𝔽_p[x])` contains the toral element `x ∂_x`.
- On `M_n(𝔽_p)`, the restricted structure of 0.2 is `a ↦ a^p`, and the inclusion of the
  derivations `[a, −]` is a restricted morphism.

### Dependencies

Mathlib and Tau Ceti only. Within the layer, 0.2 uses 0.1, and 0.3 uses 0.1 and 0.2.

## Layer 1: the p-curvature

### 1.1 Definition and linearity

For a connection `∇` on `M` define the `p`-curvature `ψ(D) = (∇_D)^p − ∇_{pPow p D}`. Prove
`ψ(D)(a m) = a ψ(D)(m)` (Katz 1970, (5.0.6)–(5.0.9)), from `[∇_D, a] = D(a)` (the module
analogue of `Derivation.lie_mulLeft`) and the commutator expansion of `(∇_D)^p a` in
characteristic `p`. Hence `ψ(D) ∈ End_A(M)`, and `ψ(D)` kills the horizontal sections.
*Needs:* CrystallineCohomology CR.1.3; FormalConnectionsOpers §2.1; GrothendieckNotesLemmas §3.2;
0.3 `pPow`.

**Checks.**

- `d + dx` on `𝔽_p[x]`: `ψ(d/dx) = 1` (rank-one formula of 1.4 with `a = 1`); a definition
  without the term `∇_{D^p}` agrees here, since `pPow p (d/dx) = 0`, so the next Check matters.
- The trivial connection `d` on `𝔽_p[x]` with `D = x d/dx`: `(x d/dx)^p − pPow p (x d/dx) = 0`;
  the definition `ψ(D) = (∇_D)^p` alone would give `x d/dx ≠ 0`, and would not be `A`-linear.
- The non-flat connection `d + x dy` on `𝔽_2[x, y]`: `ψ(∂_x) = 0`, `ψ(∂_y) = x^2`,
  `ψ(∂_x + ∂_y) = x^2 + 1`; `ψ` is defined for every connection, but not additive without
  flatness (1.2).

### 1.2 Katz's structure theorem

Prove (Katz 1970, Proposition 5.2):

- `ψ(a D) = a^p ψ(D)` for every connection (5.2.0; proof (5.4), from `pPow_smul` and Deligne's
  identity in `End_R(M)`);
- for a flat connection, `ψ(D + E) = ψ(D) + ψ(E)` (5.2.0; proof (5.2.6)–(5.2.8): Jacobson's
  formula in `Der_R(A)` and in `End_R(M)`, and flatness, which makes `∇` a Lie morphism so that
  `∇(Λ_p(D, E)) = Λ_p(∇_D, ∇_E)`);
- for a flat connection, `∇_D`, `∇_{D^p}` and `ψ(D)` commute (5.2.1);
- if `Ω¹_{A/R}` is free on finitely many `ds_1, …, ds_r` and `∇` is flat, the `ψ(D)` commute
  with each other and are horizontal, `[∇_E, ψ(D)] = 0` (5.2.2)–(5.2.3), by reducing with
  additivity and `p`-linearity to `ψ(∂_i) = (∇_{∂_i})^p` (since `pPow p ∂_i = 0`); the reduction
  writes `D = Σ_i D(s_i) ∂_i`, a finite sum (Katz 1970, (5.4.3)–(5.4.4)).

Consequently, when `Ω¹_{A/R}` is free on `ds_1, …, ds_r`, `ψ` is determined by the commuting
`A`-linear endomorphisms `ψ(∂_i)`, and defines the `p`-curvature tensor
`M → M ⊗_A F^*Ω¹_{A^{(p)}/R}` (Katz 1970, §5; the twist is that of Layer 2.0).
*Needs:* 1.1; 0.1, 0.3; FormalConnectionsOpers §2.3; Tau Ceti
`TauCeti.kaehlerBasisOfFormallyEtale`.

**Checks.**

- Additivity needs flatness: on `A = 𝔽_2[x, y]`, `∇ = d + x dy` is not flat, and
  `ψ(∂_x + ∂_y) = x^2 + 1 ≠ x^2 = ψ(∂_x) + ψ(∂_y)` (Jacobson's formula in rank one with
  `E = ∂_x + ∂_y`, `E(x) = 1`). For odd `p` the same connection has
  `ψ(∂_x + ∂_y) = x^p = ψ(∂_x) + ψ(∂_y)`.
- `p`-linearity needs no flatness: for the same connection and `a ∈ A`,
  `ψ(a ∂_y) = (a ∂_y + a x)^2 = a^2 x^2 = a^2 ψ(∂_y)` in characteristic `2`; linearity in `D`
  (`ψ(a D) = a ψ(D)`) would give `a x^2`, false for `a = x`.
- The finiteness of the coordinates is used: over `κ = 𝔽_p(x_0, x_1, …)`, `Der_{𝔽_p}(κ) ≅ κ^ℕ`
  is a product, a derivation is not a finite combination of the `∂_i`, and the reduction to the
  `ψ(∂_i)` does not apply.

### 1.3 Functoriality

Prove, with CR.1.3's operations: a horizontal `A`-linear map intertwines `ψ`; direct sums (`ψ` is
diagonal); tensor products, `ψ_{M⊗N}(D) = ψ_M(D) ⊗ 1 + 1 ⊗ ψ_N(D)`; duals and `Hom` (for `M`
finite projective), `ψ_{Hom(M,N)}(D)(φ) = ψ_N(D) ∘ φ − φ ∘ ψ_M(D)`; base change along `R → R′`
with `R′` of characteristic `p`, `ψ_{R′⊗M}(1 ⊗ D) = 1 ⊗ ψ_M(D)`; localization, via
`Derivation.extendOfIsLocalization`. Pull-back along an étale `A → B`: every `D ∈ Der_R(A)`
extends uniquely to `D_B ∈ Der_R(B)` (`KaehlerDifferential.tensorKaehlerEquivOfFormallyEtale`)
and `ψ_{B⊗M}(D_B) = 1 ⊗ ψ_M(D)`, so `ψ_M = 0` implies `ψ_{B⊗M}(D_B) = 0` on extended
derivations for every connection. Prove that a basis of horizontal sections forces `ψ = 0`
(`ψ(D)` is `A`-linear and kills horizontal sections). For `A → B` étale and faithfully flat and
`∇` flat, `ψ_M = 0` if and only if `ψ_{B⊗M} = 0`: the direction `⇒` on all of `Der_R(B)` uses
additivity (1.2) and `Der_R(B) = B ⊗_A Der_R(A)` (`Ω¹_{A/R}` finitely presented, as for `A`
smooth); the direction `⇐` uses faithful flatness.
*Needs:* 1.1, 1.2; CrystallineCohomology CR.1.3; Mathlib
`KaehlerDifferential.tensorKaehlerEquivOfFormallyEtale`; Tau Ceti
`Derivation.extendOfIsLocalization`.

**Checks.**

- Étaleness is needed: `R = 𝔽_p`, `A = 𝔽_p[x] ⊂ B = 𝔽_p[s]` with `s^p = x` (`B` is free over
  `A` on `1, s, …, s^{p−1}`, so faithfully flat), `M = A`, `∇ = d + dx`. Then `ψ_M(d/dx) = 1`,
  but `dx = d(s^p) = 0` in `Ω¹_{B/𝔽_p}`, so the base-changed connection on `B` is `d`, with
  `ψ = 0`: the equivalence fails for a merely faithfully flat `B`.
- Tensor products: `(A, d + dx) ⊗ (A, d − dx)` on `𝔽_p[x]` is `(A, d)`, and
  `ψ = 1 ⊗ 1 + 1 ⊗ (−1) = 0`, as the formula with `+` requires.
- Duals: the dual of `d + dx` is `d − dx`, with `ψ = −1`; the formula `ψ_N ∘ φ − φ ∘ ψ_M` with
  `N = A` trivial gives `−1`, the opposite sign would give `+1`.

### 1.4 Matrices and rank one

For `M = A^n` with `∇_D = D + Γ(D)`, prove `ψ(D) = Γ_p(D) − Γ(D^p)` with `Γ_0 = 1`,
`Γ_{k+1} = D(Γ_k) + Γ(D) Γ_k` (entrywise `D`). For a form `ω : Der_R(A) →ₗ[A] A`, the
connection `D + ω(D)` on `A` has `ψ(D) = ω(D)^p + D^{p−1}(ω(D)) − ω(D^p)` (Jacobson's formula in
rank one, from 0.1 or directly); as an identity in `Module.End R A` this needs no connection
carrier and is `rankOne_pCurvature_eq`. If `u ∈ A^×` and `ω(D) = −D(u)/u` for all `D` (the
connection `d − du/u`, with horizontal section `u`), then `ψ = 0`.
*Needs:* 1.1; 0.1, 0.3; GrothendieckNotesLemmas §3.2; Mathlib `LinearMap.mulLeft`.

**Checks.**

- On `𝔽_p[x, x^{−1}]`, `D = d/dx`, `a = c/x` (`c ∈ 𝔽̄_p`): `ψ = (c^p − c)/x^p`, zero exactly
  for `c ∈ 𝔽_p` (`D^{p−1}(x^{−1}) = (p−1)!·x^{−p} = −x^{−p}` by Wilson); a formula without the
  term `D^{p−1}(a)` would give `c^p/x^p`, never zero for `c ≠ 0`.
- Rank two, unipotent: `Γ = [[0, x^{p−1}], [0, 0]]` on `𝔽_p[x]` gives `ψ = [[0, −1], [0, 0]] ≠ 0`,
  although the sub-object and the quotient have `ψ = 0`: `ψ` is not determined by the graded
  pieces.
- The Airy connection `Γ = [[0, 1], [x, 0]]` has `ψ = [[−1, x], [x^2, 1]]` for `p = 3` and
  `ψ = [[x, x^2], [x^3 − 1, −x]]` for `p = 5`; the recursion with `Γ(D)` on the right,
  `Γ_{k+1} = D(Γ_k) + Γ_k Γ(D)`, gives `[[1, x], [x^2, −1]]` for `p = 3`, the diagonal exchanged.

### 1.5 Nilpotence

Define nilpotence of exponent `≤ n` of the `p`-curvature: every product of `n` values of `ψ`
vanishes (Katz 1970, (5.5.1), Definition 5.6). Prove, for `Ω¹_{A/R}` free on `ds_1, …, ds_r` and
`∇` flat, the equivalence of (5.5.0) (a horizontal filtration of length `≤ n` whose graded pieces
have `ψ = 0`), (5.5.1) and (5.5.2) (vanishing of the products of the `(∇_{∂_i})^{p w_i}` with
`Σ w_i = n`) (Katz 1970, Corollary 5.5); stability under subobjects and quotients, and exponent
`≤ n + m − 1` for tensor products and `Hom` (Proposition 5.7); stability under pull-back along the
squares of Theorem 5.9; and the criterion of Proposition 5.8. Prove the comparison with CR.1.3:
for an `𝔽_p`-algebra `R` with the zero PD ideal, `P = R[x_1, …, x_r]` and `M` a finitely
generated `P`-module with flat connection, CR.1.3's topological quasi-nilpotence holds if and only
if `ψ` is nilpotent.
*Needs:* 1.2, 1.3; CrystallineCohomology CR.1.3.

**Checks.**

- The unipotent example of 1.4 has `ψ ≠ 0` and `ψ^2 = 0`: nilpotent of exponent `2`, not `1`.
- `∇e = e dx` on `𝔽_p[x]` has `ψ = 1`, not nilpotent, matching CR.1.3's Check that it is not
  quasi-nilpotent.
- Exponent of a tensor product, `p` odd: the unipotent example tensored with itself has
  `ψ = N ⊗ 1 + 1 ⊗ N` with `ψ^2 = 2 N ⊗ N ≠ 0` and `ψ^3 = 0`: exponent `3 = 2 + 2 − 1`, not `2`.

### Examples

- The unipotent and Airy connections of 1.4, with their `p`-curvatures for `p = 3, 5`.
- Rank one on `𝔽_p[x, x^{−1}]`: `d + c dx/x` has `ψ = 0` exactly for `c ∈ 𝔽_p`.

### Dependencies

Layer 0; CrystallineCohomology CR.1.3; FormalConnectionsOpers §§2.1–2.3; GrothendieckNotesLemmas
§3.2; Mathlib `KaehlerDifferential.tensorKaehlerEquivOfFormallyEtale`; Tau Ceti
`Derivation.extendOfIsLocalization` and `TauCeti.kaehlerBasisOfFormallyEtale`. Within the layer,
1.1 → 1.2 → 1.3 → 1.4 → 1.5.

## Layer 2: Cartier descent

### 2.0 The Frobenius image and the twist

Define `frobeniusImage R A p`, the `R`-subalgebra of `A` generated by the `p`-th powers: the
image of the relative Frobenius `A ⊗_{R, F_R} R → A`, `a ⊗ r ↦ r a^p`, of
SchemeAndStackFoundations §0.29 on `Spec A`. Prove `apply_eq_zero_of_mem_frobeniusImage` (every
derivation vanishes on it). For `A` smooth over `R` of characteristic `p`, prove that the
relative Frobenius is injective with image `frobeniusImage R A p` (it is finite locally free of
positive rank, `relativeFrobenius_smooth_rank`), and `kaehlerD_eq_zero_iff`: `d a = 0` if and only
if `a ∈ frobeniusImage R A p` (degree `0` of `DerivedDeRham.smoothCartier`). The horizontal
sections of a connection form a `frobeniusImage R A p`-submodule of `M`, not an `A`-submodule.
*Needs:* SchemeAndStackFoundations §0.29; DerivedDeRhamCohomology §3.6; 1.1; Mathlib
`Algebra.adjoin`, `KaehlerDifferential.D`, `Algebra.Smooth`.

**Checks.**

- `R = 𝔽_p`, `A = 𝔽_p[x]`: `frobeniusImage = 𝔽_p[x^p]` and `ker d = 𝔽_p[x^p]`; the subring of
  `p`-th powers alone, without `R`, would be the same here, so the next Check discriminates.
- `R = 𝔽_p[ε]/ε²`, `A = R[t]`: `frobeniusImage = R[t^p]` (it contains `ε`, which is not a
  `p`-th power), and `ker d = R[t^p]` too, as 2.0 claims for smooth `A`.
- A perfect field `κ` over `R = 𝔽_p`: `frobeniusImage = κ`, and every derivation of `κ` is `0`.
- On `𝔽_p[x]` with `d`, the horizontal sections are `𝔽_p[x^p]`: closed under multiplication by
  `x^p`, not by `x`, so they are a `frobeniusImage`-module and not an `A`-submodule.

### 2.1 The descent theorem

Prove Cartier descent (Katz 1970, Theorem 5.1, affine form): for `A` smooth over `R` of
characteristic `p` and `∇` flat with `ψ = 0`, the map `A ⊗_{A′} M^∇ → M`,
`A′ = frobeniusImage R A p`, is bijective. Conversely, for every `A′`-module `N`, the canonical
connection `∇_D(a ⊗ n) = D(a) ⊗ n` on `A ⊗_{A′} N` is flat with `ψ = 0`, and
`N → (A ⊗_{A′} N)^∇` is bijective. Together, with morphisms the horizontal maps, these give the
equivalence between `A′`-modules and flat connections on `A`-modules with `ψ = 0`, compatible
with tensor products, finite projectivity in both directions, and base change along `R → R′`.
Proof (Katz 1970, (5.1.2)–(5.1.6)): the statement is Zariski-local on `Spec A`, since inverting
`f ∈ A` is inverting `f^p ∈ A′` and horizontal sections commute with it; so reduce to `A` étale
over `R[s_1, …, s_r]` (the étale coordinates of SchemeAndStackFoundations §0.8), where
`Ω¹_{A/R}` is free on the `ds_i` (`TauCeti.kaehlerBasisOfFormallyEtale`); with `∂_i` the dual
derivations, the projector `P = Σ_w Π_i (−s_i)^{w_i}/w_i! · Π_i (∇_{∂_i})^{w_i}`,
`0 ≤ w_i ≤ p − 1`, maps `M` onto `M^∇` and
`Σ_w Π s_i^{w_i}/w_i! · P ∘ Π (∇_{∂_i})^{w_i} = id` (Taylor's formula), from
`ψ(∂_i) = (∇_{∂_i})^p = 0`. A conceptual proof, through the Azumaya property of the ring of
crystalline differential operators over its centre and Morita theory, is Groechenig 2016,
Theorem 3.11 (arXiv numbering); this roadmap follows Katz's elementary route.
*Needs:* 2.0; 1.2, 1.3; SchemeAndStackFoundations §0.8; Tau Ceti
`TauCeti.kaehlerBasisOfFormallyEtale`.

**Checks.**

- `A = R` (relative dimension `0`): `Der_R(A) = 0`, `M^∇ = M`, `A′ = R`, and the map is
  `R ⊗_R M → M`, bijective.
- `A = 𝔽_p[x]`, `M = A` with `d`: `M^∇ = 𝔽_p[x^p] = A′` and `A ⊗_{A′} A′ → A` is the identity.
- `ψ = 0` is needed: `d + dx` on `𝔽_p[x]` has `M^∇ = 0` (Check 2.2), and `A ⊗_{A′} 0 → A` is
  not surjective.

### 2.2 Consequences

Under the hypotheses of 2.1 (`A` smooth over `R` of characteristic `p`, `∇` flat): `ψ = 0` if and
only if `M` is spanned by horizontal sections; for `M` finite projective of rank `n` over a local
`A`, if and only if `M` has a basis of `n` horizontal sections. The direction `⇐` of both holds
for every connection, by 1.3. Rank one: flat connections on invertible `A`-modules with `ψ = 0`
correspond to invertible `A′`-modules, and on the trivial module `A` the connections `d + ω` with
`ψ = 0` and a horizontal unit are exactly `d − du/u`, `u ∈ A^×`.
*Needs:* 2.1; 1.3, 1.4.

**Checks.**

- `d + dx` on `𝔽_p[x]`: `ψ = 1 ≠ 0`, and the horizontal sections are `0` (a solution of
  `y′ = −y` in `𝔽_p[x]` vanishes), so `M` is not spanned by them.
- `d − dx/x` on `𝔽_p[x, x^{−1}]`: `u = x` is a horizontal unit and `ψ = 0`.
- `d − du/u` with `u = 1 + x` on the local ring `𝔽_p[x]_{(x)}`: `u` is a horizontal unit and
  `ψ = 0` by 1.4; with `u = x` the form `−dx/x` is not defined on that ring.

### 2.3 Rank one in one variable

Prove `exists_unit_horizontal_iff`: over a local ring `A` of characteristic `p` with a
derivation `D` such that `D^[p] = 0` and `x` with `D x = 1`, `D + a` has a horizontal unit if
and only if `a^p + D^{p−1}(a) = 0`. This needs no smoothness: Katz's projector in one variable,
`P = Σ_{k<p} (−x)^k/k! (D + a)^k`, has horizontal values and `Σ_{j<p} x^j/j! P (D + a)^j = 1`.
It applies to `κ(x)`, `κ[[x]]` and the local rings of `κ[x]`.
*Needs:* 1.4; 0.3; Mathlib `IsLocalRing`.

**Checks.**

- `a = 0`: `y = 1` is a horizontal unit and `0^p + D^{p−1}(0) = 0`.
- `A = 𝔽_p[x]_{(x)}`, `D = d/dx`, `a = 1`: `1^p + 0 = 1 ≠ 0`, so `d/dx + 1` has no horizontal
  unit; the criterion without the term `D^{p−1}(a)` would agree here, so the next Check matters.
- `A = 𝔽_p[x]_{(x)}`, `p` odd, `a = −1/(1 + x)`: `y = 1 + x` is a horizontal unit
  (`y′ + a y = 1 − 1 = 0`), and `a^p + D^{p−1}(a) = −(1 + x)^{−p} + (1 + x)^{−p} = 0`; without the
  term `D^{p−1}(a)` the criterion would give `−(1 + x)^{−p} ≠ 0`.

### 2.4 Rank one over κ(x)

For a field `κ` of characteristic `p` and `a ∈ κ(x)`, prove the equivalence of:
`ψ(d/dx + a) = 0`; `a = −y′/y` for some `y ∈ κ(x)^×` (2.3); over an algebraic closure `κ̄`, `a`
has only simple poles, vanishes at `∞`, and all its residues lie in `𝔽_p` (Bostan–Caruso–Roques
2024, Proposition 3.3 and Remark 3.13, for `κ = 𝔽_p`). The passage from `κ̄(x)` to `κ(x)` is
2.3 applied over `κ(x)`, since `ψ` commutes with the base change `κ(x) → κ̄(x)` (1.3).
*Needs:* 2.3; 1.3, 1.4.

**Checks.**

- `a = 1/x + 1/(x − 1)`: residues `1`, `ψ = 0`, `y = 1/(x(x − 1))`.
- `a = 1/(2x)` for `p` odd: residue `1/2 ∈ 𝔽_p`, `ψ = 0`, `y = x^{(p−1)/2}`, a polynomial,
  though over `ℚ` the solution `x^{−1/2}` is not rational.
- `a = 1/x^2`: double pole, `ψ = x^{−2p} ≠ 0`; the criterion without "simple poles" would accept
  it (its residue is `0 ∈ 𝔽_p`).

### Examples

- `d + c dx/x` on `𝔽_p(x)`: `ψ = 0` exactly for `c ∈ 𝔽_p`, with horizontal section `x^{−c}`
  for the representative `0 ≤ c < p`.
- Cartier descent for `(A, d)` returns `A′`, and for `(A^n, d)` returns `A′^n`.

### Dependencies

Layers 0–1; SchemeAndStackFoundations §§0.8, 0.29; DerivedDeRhamCohomology §3.6; Tau Ceti
`TauCeti.kaehlerBasisOfFormallyEtale`. Within the layer, 2.0 → 2.1 → 2.2; 2.3 needs only
Layers 0–1 and precedes 2.4.

## Layer 3: trivial on a finite étale cover implies zero p-curvature

### 3.1 Pull-back

From 1.3: for a finite étale `A → B` with `Spec B → Spec A` surjective (so faithfully flat) and
`∇` flat, `ψ_M = 0` if and only if `ψ_{B⊗M} = 0`; and the trivial connection `(B^n, d)` has
`ψ = 0`.
*Needs:* 1.3 (the étale and faithfully flat case, for a flat connection).

**Checks.**

- `(B^n, d)`: `ψ = 0` for every `D`.
- `A = 𝔽_p[x, x^{−1}]`, `B = A[t]/(t^2 − x)`, `p` odd, `∇ = d + (1/2) dx/x`: `ψ = 0` on `A` by
  1.4 with `c = 1/2 ∈ 𝔽_p`, and on `B` the unit `t^{−1}` is horizontal.
- The finite étale hypothesis is used: the purely inseparable `A = 𝔽_p[x] ⊂ 𝔽_p[s]`, `s^p = x`,
  kills `d + dx` (Check 1.3), although `ψ_M = 1`.

### 3.2 The easy direction

Let `S` be a domain finitely generated over `ℤ` with fraction field `F` of characteristic `0`,
`A` a smooth `S`-algebra, and `M` a finite projective `A`-module with a flat connection relative
to `S`. Suppose there is a finite étale `F ⊗_S A`-algebra `B_F`, faithfully flat, such that
`B_F ⊗ M` is isomorphic, with its connection, to `(B_F^n, d)`. Prove that there is `0 ≠ f ∈ S`
such that for every maximal ideal `m` of `S_f` (whose residue field is finite of characteristic
`p_m`), the reduction of `(A, M, ∇)` modulo `m` has zero `p_m`-curvature. Proof: spread out
`B_F` and the isomorphism over some `S_f` (SchemeAndStackFoundations §0.9, `spreading_out_models`
and `finite_presentation_limits`, with the properties finite, étale and surjective), reduce
modulo `m`, and apply 3.1. In rank one over `ℚ(x)` this is Bostan–Caruso–Roques 2024,
Theorem 3.5.
*Needs:* 3.1; SchemeAndStackFoundations §0.9; CrystallineCohomology CR.1.3 (base change).

**Checks.**

- `S = ℤ[1/2]`, `A = S[x, x^{−1}]`, `∇ = d + (1/2) dx/x`: trivialised on `B = A[t]/(t^2 − x)`;
  for `p` odd, `ψ = 0` by 1.4 with `c = 1/2 ∈ 𝔽_p`.
- `∇ = d + dx` on `ℤ[x]`: `ψ = 1` modulo every `p`, so no finite étale cover trivialises it (the
  solution `e^{−x}` is transcendental).
- The dense open is needed: `∇ = d + (1/2) dx/x` over `S = ℤ` is not defined modulo `2`; the
  conclusion "at all closed points of `Spec S`" would be false or meaningless there.

### Examples

- Kummer connections `d + (1/n) df/f` on `S[x]_f`, trivialised by `t^n = f`, have zero
  `p`-curvature at every `p ∤ n`.

### Dependencies

Layer 1 (1.3); SchemeAndStackFoundations §0.9; CrystallineCohomology CR.1.3. Within the layer,
3.1 → 3.2.

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
*Needs:* Tau Ceti `NumberField.Chebotarev.infinite_frobeniusPrimeSet`,
`NumberField.Chebotarev.frobeniusPrimeSet`; Mathlib `IsDedekindDomain.HeightOneSpectrum`.

**Checks.**

- `c = i` in `ℚ(i)`: at primes above `p ≡ 3 (mod 4)`, `i^p = −i ≢ i`, and `i ∉ ℤ`.
- `c = 3`: Fermat, `3^p ≡ 3`, and `3 ∈ ℤ`.
- `c = 1/2` is excluded by `c ∈ 𝓞_L`: `(1/2)^p ≡ 1/2` at every odd `p`, so the statement for
  elements of `L` would conclude `1/2 ∈ ℤ`; the right conclusion there is `c ∈ ℚ`, used in 4.3.

### 4.2 Partial fractions and reduction

For `K` a number field and `a = P/Q`, `P, Q ∈ 𝓞_K[x]`, `Q ≠ 0`, let `L` be a splitting field of
`Q` over `K` and write `a = R(x) + Σ_{α, j} c_{α, j}/(x − α)^j` over `L`. Prove that for almost
every prime `𝔓` of `L`, the `α` and `c_{α, j}` are `𝔓`-integral, the `α` stay distinct modulo
`𝔓`, and the reduction of this decomposition is the partial-fraction decomposition of the
reduction of `a` (Bostan–Caruso–Roques 2024, proof of Theorem 3.6).
*Needs:* Mathlib `RatFunc`, `Ideal.ResidueField`, `NumberField.RingOfIntegers`.

**Checks.**

- `a = 1/(x^2 − 1) = (1/2)/(x − 1) − (1/2)/(x + 1)` over `ℚ`: modulo `2` the poles `±1` merge,
  so `2` is one of the excluded primes.
- `a = 1/(x^2 + 1)` over `L = ℚ(i)`: residues `∓i/2`, integral away from `2`, and the poles `±i`
  stay distinct modulo every prime not above `2`.
- `a = x + 1/x`: the polynomial part `R = x` reduces to `x` at every prime, and is not absorbed
  into the poles.

### 4.3 Honda's theorem

Define `ratFuncD K`, the derivation `d/dx` of `K(x)` extended from `K[x]` by
`Derivation.extendOfIsLocalization`; `ratFuncPCurvature a = a^p + (d/dx)^{p−1}(a)` on `κ(x)`,
`p = char κ`; `ratFuncOfInt K P Q`, the rational function `P/Q` over `K`; and `ratFuncMod K P Q v`,
its reduction at `v` (Convention 6). Prove `honda`: for `K` a number field and `a = P/Q ∈ K(x)`,
the reductions of `d/dx + a` have zero `p`-curvature at almost every prime of `K` if and only if
`n·a = f′/f` for some `n ≥ 1` and `f ∈ K(x)^×`. Proof of `⇒` (Honda 1981, §1, for `K = ℚ`;
Bostan–Caruso–Roques 2024, Theorem 3.6): the primes of `L` above almost every prime of `K` are
almost every prime of `L`, and `ψ` commutes with the extension `κ(v) → κ(𝔓)` (1.3); so by 2.4
and 4.2, for almost every `𝔓`, `R ≡ 0`, `c_{α, j} ≡ 0` for `j ≥ 2`, and `c_{α, 1}` reduces into
`𝔽_p`; hence `R = 0`, `c_{α, j} = 0` for `j ≥ 2`, and `c_{α, 1} ∈ ℚ` by 4.1 (applied to an
integer multiple); with `n` a common denominator, `f = Π (x − α)^{n c_{α, 1}}` is fixed by
`Gal(L/K)` (which permutes the `α` and fixes the rational residues), so `f ∈ K(x)`, and
`n·a = f′/f`. Proof of `⇐`: for almost every prime, `n` is invertible and the reductions of `f`,
`f′` are defined, and `a ≡ (1/n)·f′/f` with `1/n ∈ 𝔽_p` is a logarithmic derivative, so `ψ = 0`
by 1.4.
*Needs:* 4.1, 4.2; 2.4; 1.3, 1.4; Tau Ceti `Derivation.extendOfIsLocalization`.

**Checks.**

- `a = 0`: `ψ = 0` everywhere, `n = 1`, `f = 1`.
- `a = 1/(2x)` over `ℚ`: `ψ = 0` at every odd `p` (Check 2.4), `n = 2`, `f = x`; with `n = 1`
  required, the theorem would be false.
- `a = 1/(x^2 + 1)` over `ℚ`: residues `∓i/2 ∉ ℚ`, `ψ ≠ 0` at the primes `p ≡ 3 (mod 4)`
  (Bostan–Caruso–Roques 2024, Example 3.4); the condition "at infinitely many primes" in place of
  "almost every" would accept it, since `ψ = 0` at `p ≡ 1 (mod 4)`.

### 4.4 The Kummer trivialisation

For `a` as in 4.3 with `n·a = f′/f`, let `U = Spec K[x]_{Qfg}` (`f = F/G`) and
`B = O(U)[t]/(t^n − f)`: `B` is finite étale and faithfully flat over `O(U)`, and `t^{−1}` is a
horizontal unit of `d + a dx` on `B` (`t′ = (f′/(n f)) t = a t`). So the four conditions are
equivalent: zero `p`-curvature at almost every prime; `n·a` logarithmic; `d + a dx` trivialised
by a finite étale cover of a dense open of `𝔸¹_K`; `d + a dx` trivialised by a Kummer cover.
This is the Grothendieck–Katz principle in rank one over open subsets of `𝔸¹_K`, a theorem
(Bostan–Caruso–Roques 2024, Theorem 3.16, over `ℚ`).
*Needs:* 4.3; 3.2; CrystallineCohomology CR.1.3.

**Checks.**

- `a = 1/(2x)` over `ℚ`: `n = 2`, `f = x`, `y = x^{−1/2}`, `B = O(U)[t]/(t^2 − x)`.
- `a = i/(x^2 + 1)` over `ℚ(i)`: residues `±1/2`, `n = 2`, `f = (x − i)/(x + i)`.
- `a = 1`: `ψ = 1` everywhere, and no Kummer cover trivialises `d + dx` (the solution `e^{−x}`).

### Examples

- `d + (1/n) dx/x` over any number field: zero `p`-curvature at every `p ∤ n`, trivialised by
  `t^n = x`.
- `d + dx/(x^2 + 1)` over `ℚ`: not algebraic; `ψ ≠ 0` at every `p ≡ 3 (mod 4)`.

### Dependencies

Layer 2 (2.4); Layer 1 (1.3, 1.4); Layer 3 (3.2) for 4.4; Tau Ceti
`NumberField.Chebotarev.infinite_frobeniusPrimeSet` and `Derivation.extendOfIsLocalization`.
Within the layer, 4.1 and 4.2 are independent of Layers 0–3; 4.3 needs 4.1, 4.2 and 2.4; 4.4
needs 4.3.

## Downstream consumers

No roadmap on main cites this one. The research that uses Layers 0–2 is listed under *Research
context*.

## Research context

Not targets. The Grothendieck–Katz conjecture: for `S` finitely generated over `ℤ` and
dominant, `X → S` smooth and `(M, ∇)` a vector bundle with flat connection on `X/S`, if the
reductions have zero `p`-curvature at all closed points of a dense open of `S`, then `(M, ∇)`
becomes trivial on a finite étale cover of the generic fibre (Katz 1972; Katz 1982, which
reformulates it through the Lie algebra of the differential Galois group). Nothing in this
roadmap assumes or formalises the conjecture. Known cases: Gauss–Manin connections (Katz 1972),
rank one over curves (Chudnovsky 1985, Theorem 8.1, as cited by Bostan–Caruso–Roques 2024,
§3.3.2), solvable differential Galois group (Bost 2001; André 2004); Chambert-Loir 2002 surveys
these three methods. Global boundedness does not force finite local monodromy: the Apéry series
for `ζ(3)` is a globally bounded solution of the Picard–Fuchs equation of a family of K3 surfaces
whose local monodromy at `0` is unipotent of infinite order (Beukers–Peters 1984); Christol
1986–87 studies the globally bounded hypergeometric series. Bost's algebraicity criterion asks
the leaves to satisfy a Liouville property, which fails for most leaves of a generic foliation of
`ℙ²` (Brunella 1994).

Grothendieck raised the question of the converse in his notes, and split the rank-one case into
a torsion question for the class of `M` in the Picard group and the question whether a closed
`1`-form whose reductions are logarithmic has an integral multiple that is logarithmic; Layer 4
answers the second over open subsets of `𝔸¹_K` (Montpellier fonds, folder 93, pp. 193–197,
https://grothendieck.umontpellier.fr/93.pdf).

Research that uses the material of Layers 0–2: Katz's nilpotence of Gauss–Manin `p`-curvature and
the monodromy theorem (Katz 1970, Theorem 5.10 and §§6–7); the Cartier transform and nonabelian
Hodge theory in characteristic `p` (Ogus–Vologodsky 2007), listed by CrystallineCohomology as the
subject of a later crystalline roadmap; the Frobenius-descent connection used by
DerivedDeRhamCohomology §3.6.1; algorithms deciding algebraicity by `p`-curvatures
(Bostan–Caruso–Roques 2024; Fürnsinn–Pannier); Frobenius descent for arithmetic `𝒟`-modules
(Berthelot 2000).

## References

- N. M. Katz, « Nilpotent connections and the monodromy theorem: applications of a result of
  Turrittin », *Publ. Math. IHÉS* 39 (1970), 175–232, §5: (5.0) (`D^p`, the `p`-curvature,
  (5.0.4), (5.0.9)), Theorem 5.1 (Cartier), Proposition 5.2 with (5.2.4)–(5.2.8), Proposition 5.3
  (Deligne), Corollary 5.5, Definition 5.6, Propositions 5.7–5.8, Theorems 5.9–5.10.
  (Numdam PMIHES_1970__39__175_0.)
- N. M. Katz, « Algebraic solutions of differential equations (p-curvature and the Hodge
  filtration) », *Invent. Math.* 18 (1972), 1–118.
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
- Y. André, *G-functions and Geometry*, Vieweg, Braunschweig (1989).
- J.-B. Bost, « Algebraic leaves of algebraic foliations over number fields », *Publ. Math.
  IHÉS* 93 (2001), 161–221.
- Y. André, « Sur la conjecture des p-courbures de Grothendieck–Katz et un problème de Dwork »,
  in *Geometric aspects of Dwork theory*, de Gruyter (2004), 55–112.
- A. Chambert-Loir, « Théorèmes d'algébricité en géométrie diophantienne (d'après J.-B. Bost,
  Y. André, D. & G. Chudnovsky) », Séminaire Bourbaki, exposé 886, *Astérisque* 282 (2002).
  (Numdam SB_2000-2001__43__175_0.)
- F. Beukers, C. A. M. Peters, « A family of K3 surfaces and ζ(3) », *J. reine angew. Math.* 351
  (1984), 42–54, doi:10.1515/crll.1984.351.42.
- G. Christol, « Fonctions hypergéométriques bornées », *Groupe de travail d'analyse
  ultramétrique* 14 (1986–1987), exposé 8, 1–16. (Numdam GAU_1986-1987__14__A4_0.)
- M. Brunella, « Foliations on the complex projective plane with many parabolic leaves », *Ann.
  Inst. Fourier* 44 (1994), no. 4, 1237–1242, doi:10.5802/aif.1432.
- P. Berthelot, « 𝒟-modules arithmétiques II. Descente par Frobenius », *Mém. Soc. Math. France*
  81 (2000).
- M. Groechenig, « Moduli of flat connections in positive characteristic », *Math. Res. Lett.* 23
  (2016), no. 4, 989–1047, doi:10.4310/MRL.2016.v23.n4.a3; arXiv:1201.0741, Theorem 3.11.
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
