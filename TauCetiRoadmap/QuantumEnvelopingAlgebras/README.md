# Roadmap: quantum enveloping algebras of full root data, integral forms and quantum Frobenius

**Summary.** This roadmap builds the Drinfeld–Jimbo quantized enveloping algebra `U_v(A, X, Y)`
of a finite-rank symmetrizable Cartan datum carried by a full root datum `(X, Y)`, central and
isogeny directions included, with its Hopf structure, triangular decomposition, braided halves,
skew pairings and Drinfeld double; Lusztig's braid automorphisms and their braid relations; in
finite type the root vectors, the integral PBW basis of the divided-power form `U_A` over
`A = ℤ[v, v⁻¹]` with its full-`Y` toral part, and the comparison of `U_A` at `v = 1` with the
full-`Y` Kostant form; the integral highest-weight lattices and their specialization at `v = 1`;
quantum Frobenius at every root of unity (the unital map at odd orders coprime to the symmetrizer,
the modified-algebra map with its modified root datum, and the half-algebra Frobenius sequences
at the small orders where the modified root datum changes type); the quantum Lucas theorem for
signed arguments; root-of-unity Weyl modules, simple heads, Frobenius pullbacks and the Steinberg
tensor-product theorem; Frobenius contraction; and the quantum plane as a worked integral model.
The end theorems are the Hopf structure on the full-`Y` presentation, the braid relations, the
integral PBW theorem, the integral `v = 1` comparisons, the Frobenius maps for all orders and the
contraction comparisons. It is built from KacMoody Layer 0, RootSystems, LieHighestWeight,
ReductiveGroups Layer 9 §9A and QuantumGroups Q8.

## Scope and ownership

This roadmap owns:

- the generic algebra `U_v(A, X, Y)` for every finite-rank symmetrizable datum on a full lattice
  pair, its Hopf structure, triangular decomposition, braided halves, nilpotent and Borel pairings,
  the torus-amalgamated double, and the rank-one comparison with QuantumGroups Q8 (Layer 1);
- the braid automorphisms `Tᵢ` and the braid relations for every symmetrizable datum, and in
  finite type the root vectors attached to reduced expressions of the longest element (Layer 2);
- the full-`Y` integral form `U_A`, its toral basis, the finite-type integral PBW basis, base
  change, and the comparison of `U_A` at `v = 1` with the full-`Y` Kostant form (Layer 3);
- the finite-type integral highest-weight lattices `V_A(λ)` and their integral specialization at
  `v = 1` (Layer 4);
- quantum Frobenius at every root of unity in finite type: order data and the modified root
  datum, the odd-order unital map, the modified-algebra map, and the half-algebra Frobenius
  sequences (Layer 5);
- the symmetric Gaussian binomials over `ℤ[v, v⁻¹]` with signed upper argument and the quantum
  Lucas theorem at every root of unity (Layer 0), and the root-of-unity module theory consuming
  them (Layer 6);
- Frobenius contraction and its comparisons with Frobenius pullbacks (Layer 7);
- the quantum plane, its integral monomial lattices and the first root-of-unity extensions
  (Layer 8).

It leaves to named roadmaps:

- the symmetrizable realization, its lattices and root-annihilating directions: KacMoody Layer 0
  (§§0.1–0.3); the Weyl group of the realization as a Coxeter group: KacMoody Layer 2 §2.1;
- abstract Coxeter combinatorics (strong exchange, Matsumoto's theorem): RootSystems Layer 3; the
  finite longest element: RootSystems Layer 4;
- classical highest-weight modules and finite-dimensional classification: LieHighestWeight Layers
  3–4; complete reducibility and characters: LieHighestWeight Layers 5–6;
- the rational pinned reductive Lie algebra of a root datum, its full-`Y` Kostant form, the
  highest-generated classical lattices: ReductiveGroups Layer 9 §9A (items 1–5); integral Weyl
  modules and their simple heads: ReductiveGroups Layer 10 §10B;
- the complex rank-one algebra `U_q(sl₂)` with its PBW basis and Hopf structure: QuantumGroups Q8
  item 1;
- type-1 integrable modules of the generic algebra, the quantum Casimir, Kashiwara operators,
  crystal bases and the path-crystal comparison: KacMoody, Part II, which consumes Layers 1–4;
- finite LS chains, section indices and the Chevalley divisor formula: SchubertGeometry S4 and S7.

Already in the libraries, consumed and not restated: Mathlib's `FreeAlgebra`, `RingQuot`,
`Bialgebra.ofAlgHom`, `LaurentPolynomial.eval₂`, `Ring.choose`, `IsPrimitiveRoot` and
`CoxeterSystem`; Tau Ceti's Kostant form `TauCeti.UniversalEnvelopingAlgebra.kostantForm` and its
Hopf structure (listed in the supplier contracts).

## Conventions

- `I` is a finite index type, `A = (aᵢⱼ)` a symmetrizable generalized Cartan matrix with the row
  convention `aᵢⱼ = ⟨αⱼ, hᵢ⟩`, and `dᵢ` positive integers with `dᵢ aᵢⱼ = dⱼ aⱼᵢ`. `X` and `Y` are
  free of finite rank with a perfect pairing `⟨−, −⟩ : X × Y → ℤ`, simple roots `αᵢ ∈ X` and simple
  coroots `hᵢ ∈ Y`, each family linearly independent. `Y` is never replaced by the coroot lattice
  nor `X` by the root lattice, and no splitting of a central sublattice is assumed.
- `vᵢ = v^dᵢ`, `Kᵢ = K_(dᵢhᵢ)`. Symmetric quantum integers `[m]ᵢ = (vᵢ^m − vᵢ^(−m))/(vᵢ − vᵢ⁻¹)`;
  divided powers `Eᵢ^(n) = Eᵢⁿ/[n]ᵢ!` use `vᵢ`, never `v`. `aᵢⱼ` and `aⱼᵢ` are never
  interchanged.
- The generic theorems of Layers 1–2 are stated over an arbitrary field `k` with `q ∈ k`, `q ≠ 0`,
  and `[n]_(qᵢ)! ≠ 0` for all `i`, `n` (equivalently, no `qᵢ` is a root of unity). `U_v(A, X, Y)` is
  the case `k = ℚ(v)`, `q = v`. Evaluation `v ↦ q` is a ring map `ℚ(v) → k` only for `q`
  transcendental over the prime field, so these theorems are proved over `(k, q)` directly or over
  `A` and base changed, never transported from `ℚ(v)` by scalar extension.
- One Hopf structure, that of QuantumGroups Q8: `Δ(K_y) = K_y ⊗ K_y`, `Δ(Eᵢ) = Eᵢ ⊗ 1 + Kᵢ ⊗ Eᵢ`,
  `Δ(Fᵢ) = Fᵢ ⊗ Kᵢ⁻¹ + 1 ⊗ Fᵢ`, `ε(K_y) = 1`, `ε(Eᵢ) = ε(Fᵢ) = 0`, `S(K_y) = K_(−y)`,
  `S(Eᵢ) = −Kᵢ⁻¹Eᵢ`, `S(Fᵢ) = −FᵢKᵢ`. Lentner2014 (line 427) uses the opposite tensor-factor order
  `Δ(Eᵢ) = Eᵢ ⊗ Kᵢ + 1 ⊗ Eᵢ`; statements imported from it are transported by the flip.
- Roots of unity: for `ζ` with `ζ²` of finite order `L`, put `ℓᵢ = ord(ζ^(2dᵢ)) = L/gcd(L, dᵢ)`.
  `A_ℓ = A/(Φ_(2ℓ)(v))` is McGerty's ring, with `v` of order `2ℓ` (McGerty2006 Definition 2.4,
  line 176). Lentner2014 writes `𝓁 = ord(q)`; its `𝓁ᵢ = 𝓁/gcd(𝓁, 2dᵢ)` (line 194) is our `ℓᵢ`.
- Weight modules carry an internal direct-sum decomposition indexed by `X`; a weight is never
  read off from a root-of-unity eigenvalue of `K_y`.

## Exact supplier contracts

### From Mathlib

- `FreeAlgebra`, `FreeAlgebra.ι`, `FreeAlgebra.lift` (`Mathlib/Algebra/FreeAlgebra.lean`): the
  free algebra on the generators and its universal property; no relations.
- `RingQuot`, `RingQuot.mkAlgHom`, `RingQuot.liftAlgHom` (`Mathlib/Algebra/RingQuot.lean`): the
  quotient by the relation and factorization of relation-respecting algebra maps.
- `Bialgebra.ofAlgHom` (`Mathlib/RingTheory/Bialgebra/Basic.lean`): a bialgebra from coproduct and
  counit algebra maps and the three coalgebra laws, stated with
  `Algebra.TensorProduct.assoc`, `lid`, `rid`.
- `LaurentPolynomial`, `LaurentPolynomial.T`, `LaurentPolynomial.eval₂`
  (`Mathlib/Algebra/Polynomial/Laurent.lean`): `eval₂ f x` evaluates at a unit `x`, sending
  `T n` to `x ^ n` for `n ∈ ℤ`.
- `Ring.choose`, `Ring.choose_neg` (`Mathlib/RingTheory/Binomial.lean`): integer-valued binomial
  coefficients with arbitrary integer upper argument.
- `IsPrimitiveRoot` (`Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean`).
- `CoxeterSystem` (`Mathlib/GroupTheory/Coxeter/Basic.lean`), consumed through KacMoody Layer 2
  §2.1 for the Weyl group of the datum.
- `AlgEquiv`, `LinearIndependent`, `Algebra.adjoin`, `TensorProduct.map`, `LinearMap.mul'`.

No q-binomial, quantum integer, Drinfeld–Jimbo algebra, Nichols algebra or Yetter–Drinfeld
category exists at the pinned Mathlib or Tau Ceti.

### From Tau Ceti

- `TauCeti.UniversalEnvelopingAlgebra.kostantForm`
  (`TauCeti/Algebra/Lie/UniversalEnveloping/Kostant/Form.lean`): for families `e : ι → L` and
  `h : κ → L` in a rational Lie algebra `L`, the subring of `UniversalEnvelopingAlgebra ℚ L`
  generated by the divided powers of the `e` and the binomials `Ring.choose (h j) n`. The
  definition asserts nothing about the families: that they are the Chevalley root vectors and a
  basis of the integral Cartan lattice is supplied by ReductiveGroups Layer 9 §9A.1, where the
  Cartan family is `y ↦ H_y` on a ℤ-basis of `Y`, so that the empty-root torus is covered.
- `instBialgebraKostantForm`, `instHopfAlgebraKostantForm` (`Kostant/HopfAlgebra.lean`): its
  integral Hopf structure.
- `kostantFormComul_dividedPower`, `kostantFormComul_ringChoose` (`Kostant/Comultiplication.lean`):
  the classical coproducts `Δ(X^(m)) = Σ_(a+b=m) X^(a) ⊗ X^(b)` and the Vandermonde coproduct of
  the binomials, consumed in Layer 7.
- `kostantFormBaseChange` (`Kostant/BaseChange.lean`): rationalization of the Kostant form, under
  the hypothesis that the families generate `L` as a rational Lie algebra.
- `jointWeightSpace`, `weightSublattice`, `isInternal_weightSublattice`, `kostantWeightBasis`
  (`Kostant/Weight/Basis.lean`): classical weight lattices of a Kostant-stable lattice, consumed in
  Layer 4.

### From TauCetiRoadmap.KacMoody

- Layer 0 (§§0.1–0.3): generalized Cartan matrices with the row convention `aᵢⱼ = αⱼ(hᵢ)`,
  symmetrizers, rational realizations with independent roots and coroots, the full weight and
  coweight lattices and the root-annihilating directions.
- Layer 2 §2.1: the simple reflections and the Weyl group as a Coxeter group, with the lengths
  `mᵢⱼ = 2, 3, 4, 6` for `aᵢⱼ aⱼᵢ = 0, 1, 2, 3`.

### From TauCetiRoadmap.RootSystems

- Layer 3: strong exchange and Matsumoto's theorem for Coxeter groups (used for independence of
  the reduced word in Layer 2).
- Layer 4: chambers and the longest element `w₀` of a finite Weyl group, its reduced expressions
  and the enumeration of positive roots `β_k = s_(i₁) ⋯ s_(i_(k−1))(α_(i_k))`.

### From TauCetiRoadmap.LieHighestWeight

- Layers 3–4: classical Verma modules, simple highest-weight modules `L(λ)` and the
  classification of finite-dimensional simple modules over a split semisimple Lie algebra in
  characteristic zero.
- Layers 5–6: complete reducibility and the Weyl character formula (used for ranks in Layer 4).

### From TauCetiRoadmap.ReductiveGroups

- Layer 9 §9A, items 1–5: the rational pinned reductive Lie algebra of a reduced root datum
  `(X, Y)`, its integral Chevalley lattice, the full-`Y` Kostant form `U_ℤ` with all
  `binom(H_y, m)`, its basis, base change and Hopf structure, and the highest-generated lattices
  `V_ℤ(λ) = U_ℤ · v_λ` for dominant `λ ∈ X` ([ReductiveGroups, Layer 9
  §9A](../ReductiveGroups/README.md#9a-the-full-reductive-integral-enveloping-form)).
- Layer 10 §10B: the integral Weyl modules of the split reductive group and their simple heads
  over fields.

### From TauCetiRoadmap.QuantumGroups

- Q8 item 1: the complex algebra `U_q(sl₂)` for `q` not a root of unity, presented as a `RingQuot`
  on `E, F, K, K⁻¹`, its PBW basis and its native Hopf structure with
  `ΔE = E ⊗ 1 + K ⊗ E`, `ΔF = F ⊗ K⁻¹ + 1 ⊗ F`, `S(E) = −K⁻¹E`, `S(F) = −FK`.

### From TauCetiRoadmap.SchubertGeometry

- S4 and S7: finite-type LS chains, normalized extremal sections and the Chevalley divisor
  coefficient `⟨λ, β∨⟩` for a codimension-one predecessor; Layer 8 names this boundary and
  consumes nothing further.

## How to read the build

Layer 0 fixes the datum and the quantum integers, and proves the quantum Lucas theorem on the
Laurent Gaussians. Layer 1 builds the generic algebra on the full lattice and all its Hopf,
triangular and pairing structure over an arbitrary field with generic parameter. Layer 2 adds the
braid automorphisms in every symmetrizable type and, in finite type, root vectors. Layer 3 builds
the integral form `U_A`, its toral basis and PBW basis, and compares it at `v = 1` with the
Kostant form. Layer 4 builds integral highest-weight lattices and specializes them at `v = 1`.
Layer 5 constructs quantum Frobenius at every root of unity. Layer 6 develops root-of-unity
modules and the Steinberg theorem, Layer 7 Frobenius contraction, and Layer 8 the quantum plane
as the worked integral model of Layers 3–7.

## Layer 0: the datum, quantum integers and Gaussian binomials (QEA0)

### 0.1 The Cartan datum

Define `CartanDatum ι X Y` as a structure on free finite ℤ-modules `X`, `Y` bundling the perfect
pairing `X ≃ₗ[ℤ] (Y →ₗ[ℤ] ℤ)`, simple roots and coroots (each linearly independent), the matrix
`cartan i j = ⟨αⱼ, hᵢ⟩` with diagonal `2`, nonpositive off-diagonal entries and
`aᵢⱼ = 0 ↔ aⱼᵢ = 0`, and a positive symmetrizer `dᵢ aᵢⱼ = dⱼ aⱼᵢ` (KacMoody §0.1–0.2 for the
realization). Define the pairing value `CartanDatum.pairingValue` (`⟨αᵢ, y⟩`), the toral direction
`CartanDatum.simpleTorus` (`dᵢhᵢ`) and the reflection `CartanDatum.reflect` (`y ↦ y − ⟨αᵢ, y⟩hᵢ`). Define `CartanDatum.braidLength i j`
as `2, 3, 4, 6` according as `aᵢⱼaⱼᵢ = 0, 1, 2, 3`.
*Needs:* Mathlib `Module.Free`, `Module.Finite`, `LinearIndependent`; KacMoody Layer 0.

- The realization and full lattices of KacMoody Layer 0 (§§0.2–0.3) give a `CartanDatum` with the
  same Cartan matrix, roots, coroots and pairing.
- `reflect i` is a ℤ-linear involution of `Y`, it sends `hᵢ` to `−hᵢ`, fixes every `y` with
  `⟨αᵢ, y⟩ = 0`, and satisfies `⟨sᵢλ, sᵢy⟩ = ⟨λ, y⟩` for the dual reflection
  `sᵢλ = λ − ⟨λ, hᵢ⟩αᵢ` on `X`.
- `sᵢ(dⱼhⱼ) = dⱼhⱼ − dᵢaᵢⱼhᵢ` for every `i, j`, by symmetrizability.
- The reflections generate a Coxeter group with `mᵢⱼ = braidLength i j` whenever
  `aᵢⱼaⱼᵢ ≤ 3` (KacMoody Layer 2 §2.1).
- A central isogeny of root data (maps `X' → X`, `Y → Y'` respecting roots, coroots and pairing)
  induces a map of data, functorially.

**Checks.**

- Empty `ι` with `X = Y = ℤ` and the identity pairing is a datum; it has a nonzero central
  direction, which a definition replacing `Y` by the coroot lattice would delete.
- Type `A₁`, simply connected (`X = ℤω`, `Y = ℤh`, `α = 2ω`) and adjoint (`X = ℤα`, `Y = ℤϖ`,
  `⟨α, ϖ⟩ = 1`, `h = 2ϖ`) are both data with `a₁₁ = 2`; `reflect` sends `ϖ` to `−ϖ`, while the
  wrong model `y + ⟨α, y⟩h` sends `h` to `3h` and is not an involution.
- For `GL₂` (`X = Y = ℤ²`, `α = e₁ − e₂`, `h = e₁* − e₂*`), `reflect` swaps `e₁*` and `e₂*` and fixes
  the central `e₁* + e₂*`.
- For `B₂` with `a₁₂ = −2`, `a₂₁ = −1`, the symmetrizer `d = (1, 2)` gives `d₁a₁₂ = −2 = d₂a₂₁`,
  while `d = (1, 1)` gives `−2 ≠ −1` and is rejected; `simpleTorus 2 = 2h₂`.
- `braidLength` is `2, 3, 4, 6` for `A₁ × A₁`, `A₂`, `B₂`, `G₂`; for affine `A₁^(1)`
  (`a₁₂a₂₁ = 4`) no braid relation is imposed, and the value `6` is never used there.

### 0.2 Quantum integers in a field

Define `qInt q r = (q^r − q^(−r))/(q − q⁻¹)` and `qFactorial q r = [1]_q ⋯ [r]_q` in a field `K`.
At `q = ±1` the denominator vanishes and `qInt` is `0` by the field convention; every theorem using
them assumes `qFactorial (q ^ dᵢ) n ≠ 0` for all `i` and `n`.
*Needs:* Mathlib `Field`, `Finset.prod`.

- For `q² ≠ 1`, `qInt q r = q^(r−1) + q^(r−3) + ⋯ + q^(1−r)`, it is invariant under `q ↦ q⁻¹`, and
  `qInt q (r + 1) = q · qInt q r + q^(−r)`.
- `qFactorial q n ≠ 0` for all `n` if and only if `q` is not a root of unity.
- For `q` not a root of unity, `qInt q r` is the specialization at `q` of the Laurent Gaussian
  `[r choose 1]_v` of 0.3, and `qFactorial q n` that of `∏_(j ≤ n) [j choose 1]_v`.

**Checks.**

- Over `ℚ` with `q = 2`: `qInt 2 3 = (8 − 1/8)/(2 − 1/2) = 21/4` and `qFactorial 2 3 = 1 · 5/2 · 21/4
  = 105/8 ≠ 0`.
- `qInt 1 1 = 0/0 = 0` by the field convention, whereas the Laurent Gaussian `[1 choose 1]_v`
  specializes to `1` at `v = 1`: the field-valued `qInt` is used only under the genericity
  hypothesis, and the root-of-unity theory uses the Laurent Gaussians.
- At `q = i` in `ℂ`, `qInt i 2 = i + i⁻¹ = 0`, so `qFactorial i 2 = 0` and the genericity hypothesis
  excludes `q = i`; the non-symmetric integer `1 + q²` would give `0` as well but differs from
  `qInt` at `q = 2` (`5` against `5/2`).

### 0.3 Laurent Gaussian binomials and the quantum Lucas theorem

Define `gaussian n r ∈ ℤ[v, v⁻¹]` by the Pascal recurrence
`[n+1 choose r+1] = v^(−(r+1)) [n choose r+1] + v^(n−r) [n choose r]`, `[n choose 0] = 1`,
`[0 choose r+1] = 0`, and `signedGaussian m r` for `m ∈ ℤ` by `gaussian m r` for `m ≥ 0` and
`(−1)^r [a+r−1 choose r]` for `m = −a < 0`; this is the Laurent polynomial extending
`∏_(j=1)^r [m−j+1]_v/[j]_v`. Define `specialize ζ : ℤ[v, v⁻¹] → K`, `v ↦ ζ`, at a unit `ζ` as
`LaurentPolynomial.eval₂`. Prove `quantumLucas`: if `ζ²` is a primitive `l`-th root of unity
(`l ≥ 1`), `m = m₁l + m₀` and `r = r₁l + r₀` with `0 ≤ m₀, r₀ < l`, `m₁ ∈ ℤ`, `r₁ ∈ ℕ`, then

    [m choose r]_ζ = ζ^(l(r₁m₀ − m₁r₀) + (m₁+1)r₁l²) · [m₀ choose r₀]_ζ · binom(m₁, r₁)

with `binom` the integer-valued `Ring.choose` (McGerty2006 Lemma 2.7, line 215, for `m ≥ 0`,
after Lusztig1993 Chapter 34; the negative case follows from it and the reflection identity
`[−a choose r] = (−1)^r [a+r−1 choose r]` together with `Ring.choose_neg`). When `ζ` has odd
order the power of `ζ` is `1`. This signed formula is the one used for toral eigenvalues on all
integral weights in Layers 5–8.
*Needs:* Mathlib `LaurentPolynomial.eval₂`, `Ring.choose`, `Ring.choose_neg`, `IsPrimitiveRoot`.

- `gaussian n r = 0` for `r > n`, `gaussian n n = 1`, symmetry `[n choose r] = [n choose n−r]` for
  `r ≤ n`, invariance under `v ↦ v⁻¹`, and the second Pascal recurrence with the exponents
  interchanged.
- `gaussian n r · ∏_(j ≤ r)[j]_v · ∏_(j ≤ n−r)[j]_v = ∏_(j ≤ n)[j]_v` in `ℤ[v, v⁻¹]`, with
  `[j]_v = gaussian j 1`; hence over `ℚ(v)` it is the quotient of quantum factorials.
- `specialize 1 (gaussian n r) = binom(n, r)` and `specialize 1 (signedGaussian m r) =
  Ring.choose m r`.
- `[m choose r]` satisfies the Vandermonde identity
  `[m+m′ choose r] = Σ_(a+b=r) v^(m′a − mb) [m choose a][m′ choose b]` for all `m, m′ ∈ ℤ`.
- At a root of unity with `ζ²` of order `l`, `[m choose r]_ζ = 0` when `l ∣ m` and `l ∤ r`, for every
  `m ∈ ℤ` (McGerty2006 Lemma 2.7(1), line 217, for `m ≥ 0`; the general case from `quantumLucas`).

**Checks.**

- `gaussian 2 1 = v + v⁻¹` and `gaussian 4 2 = v⁴ + v² + 2 + v⁻² + v⁻⁴`; the non-symmetric
  normalization would give `1 + v²` for `[2 choose 1]`.
- `signedGaussian (−1) r = (−1)^r` and `signedGaussian (−2) 1 = −(v + v⁻¹) = [−2]_v`, agreeing with
  the product formula; a definition by `0` for negative `m` would give `0`.
- At a primitive cube root `ζ` (`l = 3`): `[−3 choose 3]_ζ = −[5 choose 3]_ζ = −1`, and the Lucas
  side is `ζ⁰ · [0 choose 0] · binom(−1, 1) = −1`, not `0`.
- At `ζ = i` (`ζ² = −1`, `l = 2`): `[3 choose 2]_i = [3]_i = −1`, and the Lucas side is
  `i^(2(1−0) + 2·1·4) · [1 choose 0] · binom(1, 1) = i^10 = −1`; the sign-free formula would give
  `+1`.
- At `ζ = −1` (`l = 1`): `[2 choose 1]_(−1) = −2 = (−1)^3 · binom(2, 1)`.
- At a primitive fifth root, `[5 choose 1]_ζ = [5]_ζ = 0 = [0 choose 1]_ζ · binom(1, 0)`.

### Examples

- For `A₂` with `d = (1, 1)` the datum is symmetric; for `G₂` with `a₁₂ = −3`, `a₂₁ = −1`,
  `d = (1, 3)`.
- The values of `[n choose r]_ζ` for `n ≤ 2l` at a primitive `2l`-th root of unity (`l = 2, 3`)
  tabulated from the recurrence agree with `quantumLucas`.

### Dependencies

KacMoody Layer 0 and Layer 2 §2.1; Mathlib.

## Layer 1: the generic Drinfeld–Jimbo algebra and its Hopf structure (QEA1)

### 1.1 The presentation

Define `Generator ι Y` with constructors `E i`, `F i`, `K y` for every `y ∈ Y`; on the free algebra
define `genE`, `genF`, `genK`, `simpleK i = K_(dᵢhᵢ)`, `dividedPower q x r = x^r/[r]_q!`,
`serreLength i j = 1 − aᵢⱼ`, and the Serre elements `serreE`, `serreF` with `qᵢ`-divided powers.
Define `Relation` as the relation with `K_0 = 1`, `K_yK_z = K_(y+z)`,
`K_yEᵢK_(−y) = q^⟨αᵢ,y⟩Eᵢ`, `K_yFᵢK_(−y) = q^(−⟨αᵢ,y⟩)Fᵢ`,
`EᵢFⱼ − FⱼEᵢ = δᵢⱼ(Kᵢ − Kᵢ⁻¹)/(qᵢ − qᵢ⁻¹)` and, for `i ≠ j`,
`Σ_(r+s=1−aᵢⱼ)(−1)^rEᵢ^(r)EⱼEᵢ^(s) = 0` and its `F` analogue. Define `U` as `RingQuot Relation`
over `K`, with `generator`, `E`, `F`, `Ktorus`, `Ki`, `KiInv`, and its universal property `lift`
(Lentner2014 Definition 3.2, line 387, for intermediate lattices in finite type; the
divided-power Serre form is equivalent to Lusztig's definition by McGerty2006 line 106).
*Needs:* Mathlib `FreeAlgebra`, `RingQuot`; 0.1, 0.2.

- `lift f h` is the unique algebra map with `lift f h (generator g) = f g`; two algebra maps out of
  `U` agreeing on generators are equal.
- `Ktorus 0 = 1`, `Ktorus (y + z) = Ktorus y * Ktorus z`, hence every `K_y` is a unit with inverse
  `K_(−y)`; `Ki i * KiInv i = 1`.
- `U` is graded by the root lattice `Q_A = ⊕ℤαᵢ ⊆ X`, with `Eᵢ` of degree `αᵢ`, `Fᵢ` of degree `−αᵢ`,
  `K_y` of degree `0`, and `K_y` acts on the degree-`β` piece by conjugation with `q^⟨β,y⟩`.
- For `i ≠ j` with `aᵢⱼ = 0`, `EᵢEⱼ = EⱼEᵢ` and `FᵢFⱼ = FⱼFᵢ`.
- For a root-annihilating `c ∈ Y` (`⟨αᵢ, c⟩ = 0` for all `i`), `K_c` is central.
- Over `(ℂ, q)` with `q` not a root of unity, for each `i` the assignment `E ↦ Eᵢ`, `F ↦ Fᵢ`,
  `K^(±1) ↦ K_(±dᵢhᵢ)` is an injective Hopf algebra map from QuantumGroups Q8's algebra with
  parameter `qᵢ`, with image the subalgebra generated by `Eᵢ, Fᵢ, K_(±dᵢhᵢ)`; the relations hold
  because `⟨αᵢ, dᵢhᵢ⟩ = 2dᵢ`. Every `K_y` with `y ∉ ℤdᵢhᵢ` lies outside the image, and no splitting
  of `Y` along `ℤhᵢ` is assumed. The comparison is made over `(ℂ, q)`, not by extending scalars
  from `ℚ(v)`.

**Checks.**

- Empty `ι`, `Y = ℤ`: `U` is the Laurent polynomial algebra `K[K_1, K_1⁻¹]`, with basis `K_n`,
  `n ∈ ℤ`; a presentation with only the simple toral symbols would give `K`.
- Adjoint `A₁` at `q = 2`: `K_ϖ E K_(−ϖ) = 2E`, while `K₁ = K_h` gives `K₁EK₁⁻¹ = 4E`; the simply
  connected datum has no element acting by `2`.
- `serreLength i j = 1` when `aᵢⱼ = 0`, and the Serre element is `EⱼEᵢ − EᵢEⱼ`. For `B₂` with
  `a₁₂ = −2`, `serreLength 1 2 = 3` and multiplying the Serre element by `[3]₁!` gives
  coefficients `1, −[3], [3], −1`, which specialize at `v = 1` to the classical `1, −3, 3, −1`; the
  undivided sum `Σ(−1)^rEᵢ^rEⱼEᵢ^s` has coefficients `1, −1, 1, −1` and fails at `v = 1`.
- In `B₂` the commutator `[E₂, F₂]` is `(K₂ − K₂⁻¹)/(q² − q⁻²)` with `K₂ = K_(2h₂)`, not
  `(K_(h₂) − K_(−h₂))/(q − q⁻¹)`.

### 1.2 Coproduct, counit and antipode

Define `comulGenerator` and `counitGenerator` with the Q8 values of the Conventions, prove
`comul_relations` and `counit_relations` (the generator values respect `Relation`, the former
under `q ≠ 0` and genericity), and define `comulAlgHom` and `counitAlgHom` by `lift`. Prove
`comul_coassoc`, `counit_comul_left` and `counit_comul_right`, giving the Mathlib bialgebra
`bialgebra` through `Bialgebra.ofAlgHom`, and `exists_antipode`: a two-sided convolution inverse
`S` of the identity, bijective, with `S(Eᵢ) = −Kᵢ⁻¹Eᵢ`, `S(Fᵢ) = −FᵢKᵢ`, `S(K_y) = K_(−y)`
(Lentner2014 Theorem 3.3, line 430, in finite type with the flipped convention). Derive for
`n ≥ 0`

    Δ(Eᵢ^(n)) = Σ_(a+b=n) qᵢ^(ab) Eᵢ^(a)Kᵢ^b ⊗ Eᵢ^(b)
    Δ(Fᵢ^(n)) = Σ_(a+b=n) qᵢ^(ab) Fᵢ^(a) ⊗ Fᵢ^(b)Kᵢ^(−a)
    S(Eᵢ^(n)) = (−1)^n qᵢ^(n(n−1)) Kᵢ^(−n)Eᵢ^(n)
    S(Fᵢ^(n)) = (−1)^n qᵢ^(−n(n−1)) Fᵢ^(n)Kᵢ^n

from `(Kᵢ ⊗ Eᵢ)(Eᵢ ⊗ 1) = qᵢ²(Eᵢ ⊗ 1)(Kᵢ ⊗ Eᵢ)`, `(Fᵢ ⊗ Kᵢ⁻¹)(1 ⊗ Fᵢ) = qᵢ²(1 ⊗ Fᵢ)(Fᵢ ⊗ Kᵢ⁻¹)` and
`EᵢKᵢ⁻¹ = qᵢ²Kᵢ⁻¹Eᵢ`, and the coproducts of the toral binomials of Layer 3. Expose the normalized
operators `eᵢ = Kᵢ⁻¹Eᵢ`, `fᵢ = FᵢKᵢ` with `Δ(eᵢ) = eᵢ ⊗ Kᵢ⁻¹ + 1 ⊗ eᵢ` and
`Δ(fᵢ) = fᵢ ⊗ 1 + Kᵢ ⊗ fᵢ` for KacMoody, Part II, which proves the Kashiwara-lattice transport for
this coproduct (or an explicit rescaling or tensor-factor reversal) and does not infer it from
another convention.
*Needs:* 1.1; Mathlib `Bialgebra.ofAlgHom`, `Algebra.TensorProduct`.

- `Δ` and `ε` are algebra maps with the generator values above; `Δ(K_y)` is group-like.
- `S` is an algebra anti-automorphism and a coalgebra anti-automorphism, with inverse
  `S⁻¹(Eᵢ) = −EᵢKᵢ⁻¹`, `S⁻¹(Fᵢ) = −KᵢFᵢ`, `S⁻¹(K_y) = K_(−y)`, and `S²(Eᵢ) = qᵢ⁻²Eᵢ`,
  `S²(Fᵢ) = qᵢ²Fᵢ`, `S²(K_y) = K_y`.
- The divided-power coproduct and antipode formulas above, for every `n ≥ 0`.
- Generic modules, tensor products (with `(M ⊗ N)_λ = ⊕_(μ+μ′=λ) M_μ ⊗ N_(μ′)`) and contragredient
  duals consume this single Hopf structure.

**Checks.**

- `n = 2`: expanding `(Eᵢ ⊗ 1 + Kᵢ ⊗ Eᵢ)²` gives the middle term `(1 + qᵢ²)EᵢKᵢ ⊗ Eᵢ =
  qᵢ[2]ᵢEᵢKᵢ ⊗ Eᵢ`, so the `a = b = 1` coefficient of `Δ(Eᵢ^(2))` is `qᵢ`, not `1` and not `qᵢ⁻¹`.
- `m(S ⊗ id)Δ(Eᵢ) = S(Eᵢ) + S(Kᵢ)Eᵢ = −Kᵢ⁻¹Eᵢ + Kᵢ⁻¹Eᵢ = 0 = ε(Eᵢ)`; the wrong value
  `S(Eᵢ) = −EᵢKᵢ⁻¹` gives `(1 − qᵢ²)Kᵢ⁻¹Eᵢ ≠ 0`.
- `S²(Eᵢ) = Kᵢ⁻¹EᵢKᵢ = qᵢ⁻²Eᵢ ≠ Eᵢ`: `S` is not an involution, so an inverse built as `S` itself is
  wrong.
- `ε` respects the commutator relation: `ε(EᵢFᵢ − FᵢEᵢ) = 0 = (1 − 1)/(qᵢ − qᵢ⁻¹)`.

### 1.3 Triangular decomposition and the full torus

Prove `triangular_bijective`: multiplication `U⁻ ⊗ U⁰ ⊗ U⁺ → U` is bijective, with `U⁻`, `U⁰`,
`U⁺` the subalgebras generated by the `Fᵢ`, the `K_y` and the `Eᵢ`; and `Ktorus_linearIndependent`:
the `K_y`, `y ∈ Y`, are linearly independent, so `U⁰` is the group algebra `K[Y]` (Lentner2014
Theorem 3.3, line 433, for intermediate lattices). Define `U_v^±` as the q-Serre quotients of the
free algebras on the `Eᵢ`, respectively `Fᵢ`, and prove that they map isomorphically onto `U^±`.
*Needs:* 1.1, 1.2.

- The `Q_A`-grading restricts to `U^±`, each graded piece finite-dimensional, `U^+_0 = K`.
- `U^0 ≅ K[Y]` as Hopf algebras.
- `U⁺ ⊗ U⁰ ⊗ U⁻ → U` is also bijective.

**Checks.**

- Rank one: `EF = FE + (K − K⁻¹)/(q − q⁻¹)` expresses `EF` in the triangular basis; in the free
  algebra `EF` is not in the image of the triangular map.
- The degree-zero part of `U` for `A₁` contains `FE` and `K_y` for all `y ∈ Y`, and no relation
  identifies `K_ϖ` with a polynomial in `K₁` in the adjoint datum.
- For the empty-root datum with `Y = ℤ`, `U⁻ = U⁺ = K` and the triangular map is the identity of
  `K[Y]`.

### 1.4 Braided halves and the nilpotent pairing

Let `Q_A = ⊕ℤαᵢ`, `χ(αᵢ, αⱼ) = v^(dᵢaᵢⱼ)` extended bilinearly. Give `U_v^+ ⊗ U_v^+` the braided
multiplication `(a ⊗ b)(c ⊗ d) = χ(|b|, |c|) ac ⊗ bd` and `r₊ : U_v^+ → U_v^+ ⊗_χ U_v^+`,
`r₊(Eᵢ) = Eᵢ ⊗ 1 + 1 ⊗ Eᵢ` (McGerty2006 line 85); give `U_v^-` the multiplication with `χ⁻¹` and
`r₋(Fᵢ) = Fᵢ ⊗ 1 + 1 ⊗ Fᵢ`. Prove that each map descends through its q-Serre ideal and is
braided coassociative and counital; construct the braided antipodes, with `S₋(1) = 1`,
`S₋(Fᵢ) = −Fᵢ`, `S₋(ab) = χ(|a|, |b|)⁻¹S₋(b)S₋(a)`, `m(S₋ ⊗ id)r₋ = ηε = m(id ⊗ S₋)r₋`, and the
χ-braided positive identities. Reconstruct the Borel coproducts by
`Δ_(B₊)(x) = Σ x₁K_(κ(|x₂|)) ⊗ x₂` and `Δ_(B₋)(y) = Σ y₁ ⊗ K_(κ(|y₁|))y₂`, `κ(αᵢ) = dᵢhᵢ`. Define the
pairing `p` on `U_v^+ × U_v^-` with `p(Eᵢ, Fⱼ) = δᵢⱼcᵢ`, `cᵢ = (vᵢ − vᵢ⁻¹)⁻¹`,
`p(xx′, y) = Σ p(x, y₁)p(x′, y₂)`, `p(x, yy′) = χ(|y|, |y′|)⁻¹ Σ p(x₁, y′)p(x₂, y)`, zero unless the
degrees are opposite; prove it descends through both Serre ideals and is nondegenerate in each
degree (McGerty2006 lines 88–95 for the form on `f` whose radical is the Serre ideal).
*Needs:* 1.3.

- `r₊` is an algebra map for the braided multiplication and is coassociative.
- `p` is nondegenerate on `U^+_β × U^-_(−β)` for every `β ∈ Q_A^+`.
- The Borel coproducts reconstructed from `r₊`, `r₋` are the restrictions of 1.2's `Δ`.

**Checks.**

- Rank one: `p(Eᵢ², Fᵢ²) = (1 + vᵢ⁻²)cᵢ²`, which fixes the negative `χ⁻¹` convention.
- From `r₋(Fᵢ) = Fᵢ ⊗ 1 + 1 ⊗ Fᵢ` and `κ(−αᵢ) = −dᵢhᵢ`, `Δ_(B₋)(Fᵢ) = Fᵢ ⊗ Kᵢ⁻¹ + 1 ⊗ Fᵢ`, the
  coproduct of 1.2; putting the torus factor on the first tensor factor, `Σ y₁K_(κ(|y₂|)) ⊗ y₂`,
  would give `Fᵢ ⊗ 1 + Kᵢ⁻¹ ⊗ Fᵢ`. Likewise `Δ_(B₊)(Eᵢ) = Eᵢ ⊗ 1 + Kᵢ ⊗ Eᵢ`.
- For `i ≠ j` with `aᵢⱼ = 0`, `p(EᵢEⱼ − EⱼEᵢ, y) = 0` for every `y`, as Serre-compatibility requires.

### 1.5 The Borel pairing and the torus-amalgamated double

Put `H_ℚ = span_ℚ{hᵢ} ⊂ Y ⊗ ℚ` and define the symmetric rational form `b` on `H_ℚ × (Y ⊗ ℚ)` by
`b(dᵢhᵢ, y) = ⟨αᵢ, y⟩`; it is consistent on `H_ℚ × H_ℚ` since
`⟨αᵢ, dⱼhⱼ⟩ = dⱼaⱼᵢ = dᵢaᵢⱼ = ⟨αⱼ, dᵢhᵢ⟩`. Extend it symmetrically to `Y ⊗ ℚ` (the extension is part
of the construction and may be degenerate), choose `N > 0` clearing denominators, adjoin `t` with
`tᴺ = v`, and over `K′ = ℚ(t)` set `β_t(y, z) = t^(N b(y, z))`, a bicharacter on `Y` with
`β_t(dᵢhᵢ, y) = v^⟨αᵢ,y⟩` in both orders. On `B₊ = U_v^+ ⋊ K[Y]`, `B₋ = U_v^- ⋊ K[Y]` define
`⟨−, −⟩ : B₊ × B₋ → K′` by `⟨aa′, b⟩ = Σ⟨a, b₁⟩⟨a′, b₂⟩`, `⟨a, bb′⟩ = Σ⟨a₁, b′⟩⟨a₂, b⟩`,
`⟨1, b⟩ = ε(b)`, `⟨a, 1⟩ = ε(a)`, `⟨Eᵢ, Fⱼ⟩ = δᵢⱼcᵢ`, `⟨Eᵢ, K_y⟩ = ⟨K_y, Fᵢ⟩ = 0`,
`⟨K_y^+, K_z^-⟩ = β_t(y, z)`. Form the double with the cross rule
`Σ⟨a₁, b₁⟩a₂b₂ = Σ⟨a₂, b₂⟩b₁a₁`, identify the two copies of `K_y` for every `y ∈ Y`, and prove that the
generator map to `U_v(A, X, Y) ⊗_K K′` is an isomorphism by checking the defining relations in both
directions and the triangular factorization; prove the cross relations descend to `K = ℚ(v)`.
Compute the radical `R_b = {y ∈ Y : b(y, z) = 0 ∀ z}`; the `K_r`, `r ∈ R_b`, and every
root-annihilating `K_c` are central and are retained.
*Needs:* 1.4; KacMoody Layer 0 (independent coroots).

- The pairing is well defined, respects both Serre ideals, and its restriction to the nilpotent
  halves is `p`.
- The double is isomorphic to `U_v(A, X, Y) ⊗ K′` by the explicit generator map.
- The toral part of the pairing has radical `R_b` exactly.

**Checks.**

- The cross rule gives exactly `EᵢFⱼ − FⱼEᵢ = δᵢⱼ(Kᵢ − Kᵢ⁻¹)/(vᵢ − vᵢ⁻¹)` and the toral
  conjugations `K_yEᵢK_(−y) = v^⟨αᵢ,y⟩Eᵢ`; `⟨K_(dᵢhᵢ)^+, K_y^-⟩ = ⟨K_y^+, K_(dᵢhᵢ)^-⟩ = v^⟨αᵢ,y⟩`.
- For `GL₂`, the central `c = e₁* + e₂*` has `⟨α, c⟩ = 0`; with the extension `b(c, c) = 0` it lies
  in `R_b`, and `K_c` survives in the double as a central generator.
- For the empty-root datum `H_ℚ = 0`, the extension of `b` is the chosen form on `Y ⊗ ℚ`, and the
  double is `K′[Y]`; nondegeneracy of the toral pairing is not asserted.

### Examples

- The rank-one comparison with Q8 for `B₂`'s long root uses parameter `q²`.
- The quantum plane of Layer 8 is a module algebra for the rank-one algebra exactly for 1.2's
  factor order.

### Dependencies

Layer 0; QuantumGroups Q8 item 1; KacMoody Layer 0; Mathlib.

## Layer 2: braid operators and root vectors (QEA2)

### 2.1 The braid automorphisms

Define `braidImageFree i` and `braidImage i` on generators by `Tᵢ(Eᵢ) = −FᵢKᵢ`,
`Tᵢ(Fᵢ) = −Kᵢ⁻¹Eᵢ`, `Tᵢ(K_y) = K_(sᵢ y)` and, for `j ≠ i`, with `n = −aᵢⱼ`,

    Tᵢ(Eⱼ) = Σ_(r=0)^n (−1)^(r+n) qᵢ^(−r) Eᵢ^(n−r) Eⱼ Eᵢ^(r)
    Tᵢ(Fⱼ) = Σ_(r=0)^n (−1)^(r+n) qᵢ^r Fᵢ^(r) Fⱼ Fᵢ^(n−r)

(divided powers in `qᵢ`). Prove `exists_braidOperator`: for every symmetrizable datum, `q ≠ 0` and
`q` generic, there is an algebra automorphism `Tᵢ` of `U` with these generator values (Lusztig1993
Chapter 37; in finite type Lentner2014 Definition 3.4, line 462). Give the inverse-generator
formulas and prove both composites are identities. Define `braidWord T i j n = Tᵢ ∘ Tⱼ ∘ Tᵢ ∘ ⋯`
(`n` factors) and prove `braid_relation`: for `i ≠ j` with `aᵢⱼaⱼᵢ ≤ 3`,
`braidWord T i j mᵢⱼ = braidWord T j i mᵢⱼ` with `mᵢⱼ = braidLength i j`, with no isolated-entry
shortcut (Lusztig1993 Chapter 39). The proof route is Lusztig's: verify the relations on
generators by identities in `U_A` among divided powers with coefficients in `A`, which hold over
`(k, q)` because the divided powers exist there.
*Needs:* 1.1–1.3; 0.1 (`CartanDatum.reflect`, `CartanDatum.braidLength`); KacMoody Layer 2 §2.1.

- `Tᵢ(K_μ) = K_(sᵢμ)` on all of `Y`, hence `Tᵢ(Kⱼ) = KⱼKᵢ^(−aᵢⱼ)` in every symmetrizable type.
- `Tᵢ` maps `U_β` to `U_(sᵢβ)` for the `Q_A`-grading, where `sᵢβ = β − ⟨β, hᵢ⟩αᵢ`.
- `Tᵢ` preserves the integral form `U_A` of Layer 3 and commutes with base change.
- `Tᵢ` intertwines the actions on integrable modules with the Weyl group action on weights
  (consumed by KacMoody, Part II).

**Checks.**

- Rank one: `[Tᵢ(E), Tᵢ(F)] = FE − K⁻¹EFK = FE − EF = Tᵢ((K − K⁻¹)/(q − q⁻¹))`, and
  `Tᵢ(K)Tᵢ(E)Tᵢ(K)⁻¹ = −K⁻¹FK · K = q²Tᵢ(E)` as required.
- `A₂` at `q = 1.37`: on `V ⊗ V` for the standard three-dimensional `V`, the images of all
  generators under `T₁` and `T₂` satisfy every defining relation, and `T₁T₂T₁` and `T₂T₁T₂` give
  the same matrices for all six generators (to `10⁻¹⁴`). Replacing `qᵢ^(−r)` by `qᵢ^r` in
  `Tᵢ(Eⱼ)` breaks the commutator relations (error `4.2`).
- `B₂` (`d = (1, 2)`, `a₁₂ = −2`, `a₂₁ = −1`): `T₁(K₂) = K₂K₁²`, `T₂(K₁) = K₁K₂`, and interchanging
  `aᵢⱼ` with `aⱼᵢ` would give `T₁(K₂) = K₂K₁`; on the five-dimensional representation the
  length-four relation `T₁T₂T₁T₂ = T₂T₁T₂T₁` holds on all generators.
- For `aᵢⱼ = 0` the sum has the single term `Eⱼ`, so `Tᵢ(Eⱼ) = Eⱼ` and `TᵢTⱼ = TⱼTᵢ`.

### 2.2 Root vectors in finite type

Assume finite type, with finite Weyl group `W` and longest element `w₀` (RootSystems Layer 4).
For a reduced expression `w₀ = s_(i₁) ⋯ s_(i_N)` put `β_k = s_(i₁) ⋯ s_(i_(k−1))(α_(i_k))` and
`E_(β_k) = T_(i₁) ⋯ T_(i_(k−1))(E_(i_k))`, `F_(β_k)` analogously, with divided powers in
`v_(β_k) = v^(d_(β_k))` (Lentner2014 Definition 3.4, line 466). Prove that `E_β ∈ U^+_β`, that
`E_β = E_i` when `β = αᵢ`, the straightening relations between root vectors, and that the ordered
bases for different reduced words are related by integral transition matrices (via Matsumoto's
theorem, RootSystems Layer 3), not by equality of ordered monomials.
*Needs:* 2.1; RootSystems Layers 3–4.

- Every positive root occurs exactly once among the `β_k`.
- `E_(β_k)` is homogeneous of degree `β_k`, and for `k < l` the commutator `E_(β_l)E_(β_k) −
  v^(−(β_k,β_l))E_(β_k)E_(β_l)` lies in the span of ordered monomials in `E_(β_m)`, `k < m < l`.
- The generic PBW basis: ordered monomials `F_(β₁)^(a₁) ⋯ F_(β_N)^(a_N) K_y E_(β₁)^(b₁) ⋯ E_(β_N)^(b_N)`
  form a `K`-basis of `U` (Lentner2014 Theorem 3.5, line 474).

**Checks.**

- `A₂` with `121`: `β = α₁, α₁ + α₂, α₂` and `E_(α₁+α₂) = T₁(E₂) = q⁻¹E₂E₁ − E₁E₂`; with `212`:
  `β = α₂, α₁ + α₂, α₁` and `E_(α₁+α₂) = T₂(E₁) = q⁻¹E₁E₂ − E₂E₁`, a different vector of the same
  degree. For `121`, `E₂E₁ − qE₁E₂ = q E_(α₁+α₂)` (the straightening relation with
  `−(α₁, α₂) = 1`), and `E_(α₁+α₂)E₁ − q⁻¹E₁E_(α₁+α₂)` is `q⁻¹` times the Serre element, hence `0`.
- `B₂` (`d = (1, 2)`) with `1212` gives `α₁, 2α₁ + α₂, α₁ + α₂, α₂`, each positive root once.
- In finite type the number of PBW monomials of degree `β` equals the Kostant partition function
  of `β`; a list omitting `E_(α₁+α₂)` in `A₂` gives one monomial in degree `α₁ + α₂` instead of two.

### Examples

- `G₂` braid relation of length six on generators, recomputed from 2.1's formulas.
- The root vector `E_(α₁+α₂) = q⁻¹E₂E₁ − E₁E₂` of `A₂` acts on the standard representation
  (`E₁ = e₁₂`, `E₂ = e₂₃`) as `−e₁₃`.

### Dependencies

Layers 0–1; KacMoody Layer 2 §2.1; RootSystems Layers 3–4.

## Layer 3: the full-`Y` integral form and the finite-type PBW basis (QEA3)

### 3.1 The integral form and its torus

Let `A = ℤ[v, v⁻¹]`. Define `U_A` as the `A`-subalgebra of `U_v(A, X, Y)` generated by all
`Eᵢ^(m)`, `Fᵢ^(m)`, `K_μ` (`μ ∈ Y`), the simple-coroot binomials

    [Kᵢ; 0 choose m] = Π_(s=1)^m (Kᵢvᵢ^(−s+1) − Kᵢ⁻¹vᵢ^(s−1))/(vᵢ^s − vᵢ^(−s))

and the full-lattice binomials
`[K_y; c choose m]_v = Π_(s=1)^m (K_yv^(c−s+1) − K_y⁻¹v^(−c+s−1))/(v^s − v^(−s))` (`y ∈ Y`, `c ∈ ℤ`) (Lentner2014 Definition 3.6, line 515, for the simple-coroot
part). For a ℤ-basis `y₁, …, y_r` of `Y` prove that the elements
`K_(Σ_j ε_j y_j) · ∏_j [K_(y_j); 0 choose n_j]` with `ε_j ∈ {0, 1}`, `n_j ∈ ℕ` form an `A`-basis of
the toral part `U_A^0` (Lentner2014 Theorem 3.8, line 549, for the simple-coroot directions of an
intermediate lattice), that every simple-coroot and full-`Y` binomial lies in this span, and the
integral change-of-basis formulas for every other basis of `Y`.
*Needs:* Layer 1; 0.3.

- `U_A` is stable under `Δ`, `ε`, `S`, and under every `Tᵢ`.
- `K ⊗_A U_A → U_v` is an isomorphism.
- The toral binomials satisfy integral straightening: `[K_y; c choose m]` times `[K_y; c′ choose m′]`
  is an `A`-combination of `K_y^(ε)[K_y; c″ choose n]`.

**Checks.**

- A family with `ε = ±1` in place of `ε ∈ {0, 1}` does not span over the one-dimensional torus:
  with `C_n(K) = [K; 0 choose n]`, `C_n(1) = C_n(−1) = 0` for `n > 0`, `K(±1) = K⁻¹(±1) = ±1`, so every
  combination of `KC_n` and `K⁻¹C_n` satisfies `f(−1) = −f(1)`, which the constant `1` does not.
- `[K; 0 choose 1] = (K − K⁻¹)/(v − v⁻¹)` acts on weight `n` by `[n]_v`; at `v = 1` this is
  `binom(n, 1) = n`.
- For `GL₂` the central `[K_c; 0 choose m]` acts on weight `λ` by `[⟨λ, c⟩ choose m]_v`; a toral form
  generated by the simple-coroot binomials alone misses it.

### 3.2 The integral PBW basis and base change

In finite type, with a proved toral basis `B_Y`, prove that the products
`F_(β₁)^(a₁) ⋯ F_(β_N)^(a_N) · t · E_(β₁)^(b₁) ⋯ E_(β_N)^(b_N)` (`a_k, b_k ∈ ℕ`, `t ∈ B_Y`) form an
`A`-basis of `U_A` (Lentner2014 Theorem 3.8, line 549; Lusztig1993 Chapter 41), with integral
straightening `E_α^(a)E_α^(b) = [a+b choose a]_(v_α) E_α^(a+b)` and the opposite-root and
different-root commutation formulas, every coefficient kept in `A` (primes in nonsimply-laced
coefficients are retained, not inverted). Base change the basis and the Hopf maps to every
commutative `A`-algebra `R`, writing `U_R = R ⊗_A U_A`; specialized divided powers are the
base-changed elements, never quotients by a vanishing factorial.
*Needs:* 2.2, 3.1.

- `U_A^± = U_A ∩ U^±` is free with the ordered root-vector monomials as basis.
- `U_R` is a Hopf algebra over `R` for every `R`, functorially in `R`.
- Transition matrices between reduced words are unitriangular over `A` for a suitable order.

**Checks.**

- `E^(1)E^(1) = [2]_v E^(2)`, which at `v = i` is `0`: in `U_ℂ` at `v = i`, `E² = 0` while `E^(2) ≠ 0`.
- At `v = 1` the image of `E^(2)` is `X²/2`; after base change to `𝔽₂` the basis element `E^(2)`
  survives while `E² = [2]E^(2) = 2E^(2) = 0`, so defining the specialized divided power as
  `E²/[2]!` is impossible there.
- The rank of `U_A^+` in degree `β` equals the Kostant partition function of `β` (`2` for
  `α₁ + α₂` in `A₂`).

### 3.3 The comparison at `v = 1`

At `v = 1` prove that `U_1 = ℤ ⊗_A U_A` modulo `(K_μ − 1 : μ ∈ Y)` is isomorphic to the full-`Y`
Kostant form `U_ℤ` of ReductiveGroups Layer 9 §9A (items 1–4), by `Eᵢ^(m) ↦ Xᵢ^(m)`,
`Fᵢ^(m) ↦ Yᵢ^(m)`, `[K_y; 0 choose m] ↦ binom(H_y, m)`, and compatibly with the Hopf structures
(Tau Ceti `instHopfAlgebraKostantForm`); compare the full root datum maps under central
isogenies (McGerty2006 lines 278–281 for the comparison of the original Frobenius target with
the specialization at `v = 1`). A rational Lie-algebra isomorphism alone does not identify
integral forms.
*Needs:* 3.1, 3.2; ReductiveGroups Layer 9 §9A; Tau Ceti `kostantForm`.

- The isomorphism carries the PBW basis of 3.2 at `v = 1` to Kostant's basis.
- It intertwines `Δ`, `ε`, `S` with the Kostant Hopf structure.
- It is compatible with base change to every commutative ring.

**Checks.**

- `[K_y; 0 choose m]` at `v = 1` acts on weight `ν` by `binom(⟨ν, y⟩, m)`; for `m = 2`, `⟨ν, y⟩ = −1`
  this is `1`, matching `Ring.choose (−1) 2 = 1`.
- For the one-dimensional torus with no roots the comparison is `ℤ[binom(H, n)]`, the ring of
  integer-valued polynomials, not `ℤ[H]`.
- The image of `E^(2)` is `X²/2`, which is in `U_ℤ` but not in `ℤ[X]`.

### Examples

- `A₁` simply connected: `U_A^0` has basis `K^ε[K; 0 choose n]`, `ε ∈ {0, 1}`.
- `SL₂` versus `PGL₂`: the comparison maps for the isogeny on the `K_y`.

### Dependencies

Layers 0–2; ReductiveGroups Layer 9 §9A; Tau Ceti Kostant form; Lentner2014 §3.2.

## Layer 4: integral highest-weight lattices and the specialization at `v = 1` (QEA4)

### 4.1 The lattices `V_A(λ)`

For finite type and dominant `λ ∈ X`, construct the generic finite-dimensional type-1
highest-weight module `V(λ)` over `ℚ(v)` with highest vector `v_λ` and weights in `X`, define
`V_A(λ) = U_A · v_λ`, and prove that it is a free `A`-lattice of rank `dim V(λ)`, stable under every
divided power and toral binomial, with an `X`-graded basis; base change gives a `U_R`-module for
every commutative `A`-algebra `R`.
*Needs:* Layer 3; LieHighestWeight Layers 3–6 (for the rank via characters).

- `V_A(λ)_μ = V_A(λ) ∩ V(λ)_μ` and `V_A(λ) = ⊕_μ V_A(λ)_μ`.
- `V_A(λ) = U_A^- · v_λ`.
- `[K_y; c choose m]` acts on `V_A(λ)_μ` by `[⟨μ, y⟩ + c choose m]_v`.

**Checks.**

- `λ = 0`: `V_A(0) = A` with trivial action; the counit module.
- `A₁`, `λ = ω`: basis `v_ω, Fv_ω` with `E Fv_ω = v_ω`.
- `A₁`, `λ = 2ω`: basis `b₀, b₁ = F b₀, b₂ = F^(2) b₀`, with `E b₁ = [2]_v b₀`.

### 4.2 Integral specialization at `v = 1`

Put `ε₁ : A → ℤ`, `v ↦ 1`, `U₁ = ℤ ⊗_A U_A`, `V₁(λ) = ℤ ⊗_A V_A(λ)`. Prove that every `K_μ` acts as
`1` on `V₁(λ)`, so the action factors through 3.3's `U₁/(K_μ − 1) ≅ U_ℤ`, while the `X`-labelled
weight decomposition is kept. Let `V_ℤ(λ) = U_ℤ · v_λ^cl` be the highest-generated lattice of
ReductiveGroups Layer 9 §9A item 5 in the rational classical module of highest weight `λ`
(LieHighestWeight Layers 3–4). Construct the `U_ℤ`-isomorphism `Φ_λ : V₁(λ) ≅ V_ℤ(λ)` with
`Φ_λ(1 ⊗ v_λ) = v_λ^cl`, sending a negative divided-power word on the highest vector to the same
word in the classical divided powers; prove uniqueness, the inverse, that `[K_y; 0 choose m]` acts
on the weight-`ν` piece by `binom(⟨ν, y⟩, m)`, and that the weight-piece restrictions are integral
isomorphisms. Route: `V₁(λ)` is free of rank `dim V(λ)` (4.1), so it embeds in `ℚ ⊗ V₁(λ)`, a finite-dimensional
module over the rational Lie algebra generated by a highest-weight vector of weight `λ`, hence
isomorphic to the classical simple module `L(λ)` (complete reducibility, LieHighestWeight Layer
5, and classification, Layers 3–4); under this isomorphism `V₁(λ) = U₁^- · (1 ⊗ v_λ)` maps onto
`U_ℤ^- · v_λ^cl = V_ℤ(λ)` by 3.3, and injectivity is inherited from the rational isomorphism.
Character equality alone is not used and would not suffice. For every commutative ring `B` base change `Φ_λ` to
`B ⊗_(A,ε₁) V_A(λ) ≅ B ⊗_ℤ V_ℤ(λ)`, compatibly with ring maps and the specialized divided powers;
the comparison over `ℂ` is this map tensored with `ℂ`. After ReductiveGroups §10B, compare the
classical side with the integral Weyl module and its field specializations; their simple heads
remain separate objects.
*Needs:* 4.1, 3.3; ReductiveGroups Layer 9 §9A item 5 and Layer 10 §10B; LieHighestWeight Layers 3–6.

- `Φ_λ` intertwines every simple `E`/`F` divided power and every full-`Y` toral binomial.
- `Φ_λ` restricts to isomorphisms of the weight pieces.
- `Φ_λ` is natural in `B` and compatible with the central-isogeny maps of 3.3.

**Checks.**

- `A₁`, `λ = 2ω`: the classical highest-generated lattice in binary quadratic forms has basis
  `x², F x² = 2xy, F^(2) x² = y²`, while the monomial lattice has basis `x², xy, y²` and index `2`
  over it; `Φ` carries `b_j` to `F^(j)x²`, with determinant `1` in the divided-power bases, so a
  comparison with monomials (determinant `2`) or character equality alone cannot replace the
  integral argument.
- The weight-zero piece of `V₁(2ω)` is `ℤ b₁`, on which `[K; 0 choose 1]` acts by `0` and `E` acts
  into `ℤ b₀` by `[2]₁ = 2`, matching `X(2xy) = 2x²`.
- For the empty-root datum and `λ ∈ X` a character, `V_A(λ) = A` and `Φ_λ` is the identity; the
  central characters are retained.

### Examples

- `A₂`, `λ = ω₁ + ω₂`: the eight-dimensional lattice and its weight-zero piece of rank two.

### Dependencies

Layer 3; LieHighestWeight Layers 3–6; ReductiveGroups Layer 9 §9A, Layer 10 §10B. The generic
classification of type-1 modules, character equality and the crystal comparison belong to
KacMoody, Part II; the `v = 1` comparison does not imply simplicity after an arbitrary
specialization.

## Layer 5: quantum Frobenius at every root of unity (QEA5)

### 5.1 Order data and the modified root datum

Fix a finite-type datum and a root of unity `ζ` in a commutative `A`-algebra, with `ζ²` of order
`L ≥ 1`. Put `ℓᵢ = L/gcd(L, dᵢ)`, the least `m > 0` with `ζ^(2mdᵢ) = 1` (McGerty2006 line 335;
Lentner2014 Definition 2.3, line 192), `X* = {λ ∈ X : ⟨λ, hᵢ⟩ ∈ ℓᵢℤ ∀ i}`, `Y* = Hom(X*, ℤ)`,
`αᵢ* = ℓᵢαᵢ`, `hᵢ*(λ) = ⟨λ, hᵢ⟩/ℓᵢ`, `aᵢⱼ* = ℓⱼaᵢⱼ/ℓᵢ` and `dᵢ* = ℓᵢ²dᵢ` (Lusztig's modified datum
`i ∘ j = ℓᵢℓⱼ(i · j)`, McGerty2006 line 336). Prove that `(X*, Y*)` with these roots and coroots is a
root datum, that `aᵢⱼ*` is integral and symmetrized by `d*`, and that the target parameters
`ζᵢ* = ζ^(dᵢℓᵢ²)` lie in `{1, −1}`. Say `L` is *nondivisible* if it is coprime to every `dᵢ`
(then `ℓᵢ = L` for all `i`), and that the datum satisfies *Lusztig's conditions* at `L` if it has no
odd cycle and `ℓᵢ ≥ 1 − aᵢⱼ` whenever `i ≠ j` and `ℓⱼ ≥ 2` (McGerty2006 lines 337–339).
*Needs:* 0.1; Mathlib `IsPrimitiveRoot`.

- `X*` is the kernel of `X → ⊕ᵢ ℤ/ℓᵢ`, `λ ↦ (⟨λ, hᵢ⟩ mod ℓᵢ)ᵢ`, so it has finite index and contains
  every `ℓᵢαᵢ`; restriction `Y → Y*` sends `hᵢ` to `ℓᵢhᵢ*`.
- In finite type `A*` is of finite type: of the type of `A` when all `ℓᵢ` are equal, and of the dual
  type otherwise (the ratio of the `ℓᵢ` is `gcd(L, d_long)`, either `1` or `d_long/d_short`).
- For simply-laced normalized data (`dᵢ = 1`) and every `L`, `ℓᵢ = L` and `A* = A`.

**Checks.**

- `G₂` (`a₁₂ = −3`, `a₂₁ = −1`, `d = (1, 3)`) at `L = 3` (`ζ` of order `3` or `6`): `ℓ = (3, 1)`,
  `A* = [[2, −1], [−3, 2]]`, `d* = (9, 3)`, and `d₁*a₁₂* = −9 = d₂*a₂₁*`; the uniform exponent `3`
  would give `α₂* = 3α₂` and the wrong lattice. `L = 3` is not nondivisible (`gcd(3, 3) = 3`) and
  Lusztig's conditions fail at `(i, j) = (2, 1)`: `ℓ₂ = 1 < 2 = 1 − a₂₁`.
- `B₂` (`d = (1, 2)`) at `L = 2` (`ζ = ±i`): `ℓ = (2, 1)`, `A* = [[2, −1], [−2, 2]]`, the dual type;
  Lusztig's conditions fail at `(2, 1)` (`1 < 2`), and `L` is not nondivisible.
- `G₂` at `L = 2`: `ℓ = (2, 2)`, nondivisible; Lusztig's second condition fails (`2 < 4`)
  (McGerty2006 line 343).
- `A₁` with `d₁ = 2` at `L = 2`: `ℓ₁ = 1`, `ζ₁* = ζ² = −1`, so the target is not the ordinary
  classical algebra.

### 5.2 The odd-order unital Frobenius map

Assume `L` odd and nondivisible and `ζ` of order `L`, `R = ℤ[ζ]`, `U_ζ = R ⊗_A U_A`. Construct the
Hopf algebra homomorphism `Fr : U_ζ → U_ℤ ⊗ R` to the full-`Y` Kostant form of 3.3 with
`Fr(Eᵢ^(m)) = Xᵢ^(m/L)`, `Fr(Fᵢ^(m)) = Yᵢ^(m/L)` when `L ∣ m` and `0` otherwise, `Fr(K_μ) = 1`,
`Fr([Kᵢ; 0 choose m]) = binom(H_(hᵢ), m/L)` when `L ∣ m` and `0` otherwise, and the matching formula
in every full-`Y` direction derived from the toral basis of 3.1 (GrosKaneda2013 §1.3, lines 57–82,
after Lusztig's Theorem 8.10 of *Quantum groups at roots of 1*; Lentner2014 line 1102). Prove
well-definedness on every defining relation, Hopf compatibility and compatibility with central
isogenies. Construct the positive and negative divided-power splittings `Fr′^± : U_ℤ^± ⊗ R → U_ζ^±`,
`Xᵢ^(n) ↦ Eᵢ^(nL)`, on their nilpotent domains only (GrosKaneda2013 line 84).
*Needs:* 5.1, 3.3, 0.3 (`quantumLucas`).

- `Fr` is surjective, determined by its generator values, and `Fr ∘ Fr′^± = id` on `U_ℤ^± ⊗ R`.
- `Fr` vanishes on `Eᵢ`, `Fᵢ` and `K_μ − 1`, hence on the augmentation ideal of the subalgebra they
  generate.
- `Fr′^±` are algebra maps; neither is a unital section of all of `U_ℤ ⊗ R`.

**Checks.**

- `Fr(Eᵢ^(L)) = Xᵢ`, `Fr(Eᵢ) = 0`, and the relation `Eᵢ^L = [L]ᵢ! Eᵢ^(L) = 0` in `U_ζ` is consistent.
- `Fr([Kᵢ; 0 choose L]) = Hᵢ`: on a weight `Lν` the source acts by `[L⟨ν, hᵢ⟩ choose L]_(ζᵢ)`, which
  `quantumLucas` (with `l = L`, `m₀ = r₀ = 0`, `r₁ = 1`, power `ζᵢ^((⟨ν,hᵢ⟩+1)L²) = 1`) evaluates to
  `binom(⟨ν, hᵢ⟩, 1)`.
- The rule `Fr(Kᵢ) = 1` cannot be kept at even order in `A₂`: with `ζ^L = −1` and `aᵢⱼ = −1`,
  `KᵢEⱼ^(L)Kᵢ⁻¹ = −Eⱼ^(L)` while `Fr(Kᵢ) = 1` fixes the image; this is why 5.3 uses weight
  idempotents.

### 5.3 The modified algebra and its Frobenius map

Over `ℚ(v)` let `1_λ` (`λ ∈ X`) be the projection to the `λ`-weight space on the category of
`X`-weight modules (`K_y` acting on weight `λ` by `v^⟨λ,y⟩`), `dot U = ⊕_λ U 1_λ`, locally unital with
orthogonal idempotents, and `dot U_A` its `A`-subalgebra generated by the `Eᵢ^(n)1_λ`, `Fᵢ^(n)1_λ`
(McGerty2006 lines 109–157, after Lusztig1993 §23.2); prove `dot U_A = ⊕_λ U_A1_λ`, that it is free,
that `ℚ(v) ⊗_A dot U_A ≅ dot U`, and put `R dot U = R ⊗_A dot U_A`. Prove the presentation of
McGerty2006 Lemma 2.2 (line 161, after Lusztig1993 §31.1.3) for every `A`-algebra `R`: generators
`u⁺1_λu⁻`, `u⁻1_λu⁺` with `u^± ∈ R U^± = R ⊗_A U_A^±`, relations
`(u1_λ)(1_μu′) = δ_(λ,μ)u1_λu′`, `Eᵢ^(n)1_λ = 1_(λ+nαᵢ)Eᵢ^(n)1_λ`, `Fᵢ^(n)1_λ = 1_(λ−nαᵢ)Fᵢ^(n)1_λ`,
`Eᵢ^(a)1_λFⱼ^(b) = Fⱼ^(b)1_(λ+aαᵢ+bαⱼ)Eᵢ^(a)` for `i ≠ j`,

    Eᵢ^(a)1_λFᵢ^(b) = Σ_(t=0)^min(a,b) [⟨λ,hᵢ⟩+a+b choose t]ᵢ Fᵢ^(b−t)1_(λ+(a+b−t)αᵢ)Eᵢ^(a−t)

and its `F`/`E` analogue, and `R dot U` is a left module for `R U^+` and `R U^-`, so that every
relation of the integral halves holds. Construct the same for the modified datum `(X*, Y*)` of 5.1.
Then, for every `L` that is nondivisible (McGerty2006 Theorem 2.6, line 208, any parity) or at
which the datum satisfies Lusztig's conditions (Lusztig1993 Chapter 35, McGerty2006 lines 332–339),
and every `R` over `A_ℓ`, construct the surjective homomorphism

    Fr : R dot U(X, Y) → R dot U*(X*, Y*)

with `Fr(Eᵢ^(n)1_λ) = eᵢ^(n/ℓᵢ)1_λ`, `Fr(Fᵢ^(n)1_λ) = fᵢ^(n/ℓᵢ)1_λ` when `λ ∈ X*` and `ℓᵢ ∣ n`, and `0`
otherwise; at `n = 0` it sends `1_λ` to `1_λ` for `λ ∈ X*` and to `0` otherwise. Prove the
full-`Y` multiplier laws: `K_y` acts on `1_λ` by `ζ^⟨λ,y⟩`, its toral binomial `C_y(c, n)` by
`[⟨λ, y⟩ + c choose n]_ζ`, and for `λ ∈ X*` the target laws `K*_(y*)1_λ = ζ^⟨λ,y*⟩1_λ`,
`C*_(y*)(c, n)1_λ = [⟨λ, y*⟩ + c choose n]_ζ1_λ` with `y* = y|_(X*)`, using `quantumLucas`. Under no
odd cycles (automatic in finite type, McGerty2006 Remark 2.10, line 292) identify McGerty's
nondivisible target `dot U♯` with Lusztig's `dot U*` (McGerty2006 Lemma 2.11, line 307) and the
quasiclassical specialization with the one at `v = 1` (Theorem 2.9, line 288).
*Needs:* 5.1, 3.2, 0.3; McGerty2006 §2.

- `Fr` is well defined on the presentation, respects the finite-support local units, is
  surjective, and pulls every `X*`-weight module back to an `X`-weight module supported on `X*`.
- Uniqueness: `Fr` is determined by its values on the generators.
- No unital Hopf map is inferred from this modified-algebra homomorphism.

**Checks.**

- The presentation needs the integral halves: in `A₁ × A₁` at `L = 2`, `ζ = i`,
  `F₁^(2)F₂^(2) = F₂^(2)F₁^(2)` holds in `U_A^-`, but follows from `F₁F₂ = F₂F₁` only after dividing
  by `[2]₁![2]₂! = (v + v⁻¹)²`, whose image `(i + i⁻¹)²` is `0`; a presentation with only the
  generic Serre families has a module over `ℂ⟨x, y⟩` (odd divided powers by `0`, second divided
  powers by `x`, `y`) on which `F₁^(2)F₂^(2) − F₂^(2)F₁^(2)` sends `1` to `xy − yx ≠ 0`.
- Simply-laced normalized data at every even `L`: `ℓᵢ = L`, `ζᵢ* = ζ^(L²) = 1`, and the target is the
  classical modified algebra for `(X*, Y*)`, not for an independently chosen simply connected
  lattice.
- `G₂` at `L = 2` is covered by the nondivisible branch although Lusztig's second condition fails.

### 5.4 Half-algebra Frobenius sequences at every order

For finite-type semisimple data with toral lattice `Λ` between the root and weight lattices, and
every `ζ` of order `𝓁 = ord(ζ)`, construct the exact sequence of Hopf algebras in `Λ`-Yetter–Drinfeld
modules

    u_ζ(g(0), Λ)⁺ ⊂ U_ζ^L(g, Λ)⁺ → U(g(𝓁))⁺

of Lentner2014 Theorem 6.1 (line 1116), with the kernel `u_ζ(g(0))⁺` of Lentner2014 Theorem 5.4
(line 106) and the Lie algebra `g(𝓁)` of its table, braided exactly in the listed cases, and the
quotient generated by the primitive images of `E_(αᵢ)^(𝓁ᵢ)`. Transport it to the coproduct of 1.2 by
the flip. Where 5.3 applies, identify the sequence with the restriction of 5.3's map to the
positive half. For the normalized symmetrizer (`dᵢ = 1` on short roots) the orders not covered by
5.3 are exactly `B_n`, `C_n`, `F₄` at `𝓁 = 4` (`L = 2`) and `G₂` at `𝓁 = 3, 6` (`L = 3`): for
`d ∈ {1, 2}` the order is nondivisible unless `L` is even, and Lusztig's conditions then reduce to
`L/2 ≥ 2`; for `G₂` the order is nondivisible unless `3 ∣ L`, and the conditions then reduce to
`L/3 ≥ 2`. At these orders the sequence has kernel of type `A₁^(×n)`, `D_n`, `D₄`, `A₂` and quotient
of type `C_n`, `B_n`, `F₄` (braided), `G₂` (braided at `𝓁 = 6`) respectively, and the roadmap's
Frobenius theorem there is this half-algebra sequence and its negative analogue; no
modified-algebra map is asserted at these orders. `G₂` at `𝓁 = 4` is covered by 5.3 (nondivisible)
and also here, with the exceptional kernel of type `A₃`. For a non-normalized symmetrizer the
roadmap's Frobenius theorems are those of 5.2–5.3.
*Needs:* 5.1, 3.2; Lentner2014 §§5–6.

- The quotient `U_ζ^L(g, Λ)⁺ // u_ζ⁺` is generated by primitive elements and has the (braided)
  commutator relations of `U(g(𝓁))⁺`.
- `u_ζ⁺` is a normal Hopf subalgebra in Yetter–Drinfeld modules.
- For `ord(ζ²) > d_α` for every root `α`, the sequence is Lusztig's (Lentner2014 line 1162).

**Checks.**

- `G₂` at `𝓁 = 3`: the quotient root system has simple roots `3α₁, α₂`, matching 5.1's `A*`
  with long and short roots exchanged.
- `B₂` at `𝓁 = 4`: kernel of dimension `2²` (`A₁ × A₁` on the short roots), quotient of type `C₂`,
  matching 5.1's `A* = [[2, −1], [−2, 2]]`.
- `𝓁 = 1, 2` (`ζ = ±1`): the kernel is trivial and the quotient is of the type of `g`.

### Examples

- `A₁` at `L = 3`: `Fr(E^(3)) = X`, `Fr(E^(4)) = 0`, and `Fr(E^(6)) = X^(2) = X²/2`.
- `A₂` at `L = 2` through 5.3 with target the classical modified algebra of `(X*, Y*)`.

### Dependencies

Layers 0–3; McGerty2006 §2; Lentner2014 §§3–6; GrosKaneda2013 §1.

## Layer 6: root-of-unity modules, heads and Frobenius pullback (QEA6)

### 6.1 Weyl modules, simple heads and pullbacks

Separate four objects: the integral Weyl lattice `V_A(λ)`, its specialization `Δ_ζ(λ) = R ⊗ V_A(λ)`,
its simple head `L_ζ(λ)`, and the Frobenius pullback `Fr^*V` of a classical module. After an
embedding `R → ℂ` construct the finite-dimensional type-1 modules, the surjection
`Δ_ζ(λ) → L_ζ(λ)`, and prove `Fr^*L(λ) ≅ L_ζ(Lλ)` in the odd nondivisible case of 5.2: ordinary
`Eᵢ, Fᵢ` act by `0`, `Eᵢ^(L), Fᵢ^(L)` as `Xᵢ, Yᵢ`, and the highest weight is `Lλ`. Derive toral
eigenvalues on highest-weight vectors from `quantumLucas`; never conclude from a nonzero
`⟨λ, hᵢ⟩` that `Fᵢv_λ` is not a highest vector without testing every positive divided power.
Dualize with the antipode of 1.2.
*Needs:* Layers 4–5; 0.3.

- `Δ_ζ(λ)` has the character of `V(λ)` and `L_ζ(λ)` is its unique simple quotient.
- `Fr^*` is exact and monoidal on classical modules.
- `L_ζ(λ)* ≅ L_ζ(−w₀λ)`.

**Checks.**

- `A₁`, `L = 3`, `λ = 3ω`: `Δ_ζ(3ω)` is four-dimensional and not simple; its head is
  `Fr^*L(ω)` of dimension `2` (Layer 8, 8.2).
- `A₁`, `λ = ω` with `0 < ⟨λ, h⟩ < L`: `Δ_ζ(ω) = L_ζ(ω)`.
- `[K; 0 choose L]` on the highest vector of `Fr^*L(ω)` acts by `binom(1, 1) = 1`, while `K` acts by
  `ζ^L = 1`: the weight `Lω` is read from the binomials, not from `K`.

### 6.2 The Steinberg tensor-product theorem

For the simply connected semisimple root datum, where every dominant weight is `λ₀ + Lλ₁` with
`0 ≤ ⟨λ₀, hᵢ⟩ < L`, prove `L_ζ(λ₀ + Lλ₁) ≅ L_ζ(λ₀) ⊗ Fr^*L(λ₁)`; for other root data state the
extension only with its lattice hypotheses. This is independent of the construction of `Fr`.
*Needs:* 6.1.

- The decomposition `λ = λ₀ + Lλ₁` is unique.
- `dim L_ζ(λ) = dim L_ζ(λ₀) · dim L(λ₁)`.
- The isomorphism is natural in `λ₁`.

**Checks.**

- `A₁`, `L = 3`, `λ = 4ω = ω + 3ω`: `dim L_ζ(4ω) = 2 · 2 = 4`, while `dim Δ_ζ(4ω) = 5`.
- `λ₁ = 0`: the theorem reduces to `L_ζ(λ₀) ≅ L_ζ(λ₀)`.
- `λ₀ = 0`: `L_ζ(Lλ₁) ≅ Fr^*L(λ₁)`, agreeing with 6.1.

### Examples

- `A₁` at `L = 5`: the restricted simples `L_ζ(kω)`, `0 ≤ k ≤ 4`, all equal to their Weyl modules.

### Dependencies

Layers 0, 4, 5; LieHighestWeight Layers 3–6.

## Layer 7: Frobenius contraction and nilpotent restrictions (QEA7)

### 7.1 Contraction

For a type-1 `U_ζ`-module `M` (odd nondivisible `L`) require an internal direct sum
`M = ⊕_(μ∈X) M_μ` with `K_y m = ζ^⟨μ,y⟩m`, `[K_y; 0 choose n]m = [⟨μ, y⟩ choose n]_ζ m`,
`[Kᵢ; 0 choose n]m = [⟨μ, hᵢ⟩ choose n]_(ζᵢ)m`, `Eᵢ^(r)M_μ ⊆ M_(μ+rαᵢ)`, `Fᵢ^(r)M_μ ⊆ M_(μ−rαᵢ)`.
Define `M^(L) = ⊕_(ν∈X) M_(Lν)`, with new weight `ν`, and the classical divided operators
`Xᵢ^(m)`, `Yᵢ^(m)` as the restrictions of `Eᵢ^(Lm)`, `Fᵢ^(Lm)`; prove that the full-`Y` divided
Cartan operators act on `M_(Lν)` by `binom(⟨ν, y⟩, m)` (from `quantumLucas`), that all Kostant
relations hold, and functoriality. Keep the positive and negative unprojected restrictions as
separate `U(n^±)`-actions.
*Needs:* Layer 5 (5.2), 0.3.

- `M^(L)` is a `U_ℤ ⊗ R`-module with weights `ν`, functorial in `M`.
- Contraction is exact.
- The unprojected restrictions are actions of the nilpotent halves only.

**Checks.**

- On the counit module `K_y = 1` and the positive toral binomials vanish, so it is not relabelled
  as a nonzero weight `Lν`; its contraction is the trivial module of weight `0`.
- Contraction is not monoidal: in simply connected `A₁` with `L = 3`, `M = N = L_ζ(ω)` has weights
  `±ω ∉ 3X`, so `M^(3) = N^(3) = 0`, while `(M ⊗ N)_0` is two-dimensional and `(M ⊗ N)^(3) ≠ 0`.
- `(Fr^*V)^(L) = V` on weight spaces, with `[Lκ choose n]_ζ = binom(κ, n/L)` for `L ∣ n` and `0`
  otherwise.

### 7.2 Comparisons with pullbacks and duals

For classical `U_ℤ ⊗ R`-modules `V = ⊕_ν V_ν` with the Kostant weight laws, give `Fr^*V` the
weights `(Fr^*V)_(Lν) = V_ν`. With tensor products from 1.2's coproduct specialized at `ζ` and the
classical coproduct (Tau Ceti `kostantFormComul_dividedPower`, `kostantFormComul_ringChoose`),
prove the natural isomorphisms, each the identity on weight spaces (GrosKaneda2013 Lemma 6.8,
line 1845, whose weight-space computation does not use its finite-generation hypothesis):
`(Fr^*V)^(L) = V`, `(M ⊗ Fr^*V)^(L) ≅ M^(L) ⊗ V` and `(Fr^*V ⊗ M)^(L) ≅ V ⊗ M^(L)`. For finite-dimensional
`M` prove `(M*)^(L) ≅ (M^(L))*` with the contragredient duals of 1.2's antipode and the classical
antipode `S(Xᵢ^(m)) = (−1)^mXᵢ^(m)`, `S(binom(H_y, m)) = binom(−H_y, m)`.
*Needs:* 7.1; Tau Ceti Kostant coproducts.

- In the second isomorphism `Eᵢ^(Lm)` acts on `M_(Lκ′) ⊗ V_ν` through the terms with `L ∣ b`, hence
  `L ∣ a`, where `ζᵢ^(ab) = 1` and `Kᵢ^b` acts on `M_(Lκ′)` by `1`; the third uses `Fr(Kᵢ^b) = 1`.
- The toral binomials agree by Vandermonde's identity
  `binom(⟨κ, y⟩, m) = Σ_(a+b=m) binom(⟨κ−ν, y⟩, a) binom(⟨ν, y⟩, b)`.
- No dual comparison is stated for infinite-dimensional `M`.

**Checks.**

- On selected weights `S(Eᵢ^(Lm)) = (−1)^(Lm)ζᵢ^(Lm(Lm−1))Kᵢ^(−Lm)Eᵢ^(Lm)` acts as `(−1)^mEᵢ^(Lm)`,
  because `L` is odd and `ζ^L = 1`; at even order the sign would differ.
- `V` the trivial module: `(M ⊗ Fr^*V)^(L) = M^(L)`.
- `M = L_ζ(ω)`, `V = L(ω)` in `A₁`, `L = 3`: `(M ⊗ Fr^*V)^(3) = 0 = M^(3) ⊗ V`.

### Examples

- `A₁`, `L = 3`: the contraction of the quantum plane's degree-`3` part (Layer 8).

### Dependencies

Layers 0, 1, 5, 6; Tau Ceti Kostant coproducts; GrosKaneda2013 §6.

## Layer 8: the quantum plane and the geometry boundary (QEA8)

### 8.1 The quantum plane as a module algebra

Construct `K⟨x, y⟩/(xy − v yx)` with basis `y^j x^k` and the total-degree grading as a module algebra
over rank-one `U_v(sl₂)` (`d₁ = 1`, `x` of weight `ω`, `y` of weight `−ω`) by `K(y^jx^k) = v^(k−j)y^jx^k`,
`E(y^jx^k) = [j]_v y^(j−1)x^(k+1)`, `F(y^jx^k) = [k]_v y^(j+1)x^(k−1)` (zero when `j = 0`, resp.
`k = 0`), with the module-algebra laws of 1.2: `K(ab) = K(a)K(b)`, `E(ab) = E(a)b + K(a)E(b)`,
`F(ab) = F(a)K⁻¹(b) + aF(b)`. Prove that the degree-`n` part is the simple module of highest
weight `nω` with highest vector `xⁿ`, and that at `v = 1` the action is `E = x∂_y`, `F = y∂_x` on
binary forms.
*Needs:* Layer 1.

- The formulas define a `U_v`-action compatible with multiplication.
- The degree-`n` part is simple of dimension `n + 1`.
- The action commutes with the grading.

**Checks.**

- `E(y) = x`, `F(x) = y`, `E(x) = F(y) = 0`, `K(x) = vx`, `K(y) = v⁻¹y`; on degree one
  `(EF − FE)x = x = ((K − K⁻¹)/(v − v⁻¹))x` and `(EF − FE)y = −y`.
- `E(xy) = K(x)E(y) = vx²` and `E(yx) = E(y)x = x²`, so `E(xy − vyx) = 0`; `F(xy − vyx) = vy² − vy² = 0`.
  With the opposite rule `E(ab) = E(a)K(b) + aE(b)`, `E(xy − vyx) = x² − v²x² ≠ 0`.
- `E(y²) = xy + v⁻¹yx = (v + v⁻¹)yx`, pinning the symmetric quantum integer rather than `1 + v²`.

### 8.2 Integral monomials, the Weyl-to-dual comparison and the first root-of-unity extensions

For the simply connected rank-one datum construct `P_A = A⟨x, y⟩/(xy − vyx)` with basis `y^jx^k`
and product `(y^jx^k)(y^ax^b) = v^(ka)y^(j+a)x^(k+b)`, its degree-`n` monomial lattice `M_A(n)` with
basis `w_j = y^jx^(n−j)`, and prove `E^(r)w_j = [j choose r]_v w_(j−r)`,
`F^(r)w_j = [n−j choose r]_v w_(j+r)`, `Kw_j = v^(n−2j)w_j`, and that `[K_(th); c choose r]` acts on
`w_j` by `[t(n−2j) + c choose r]_v` (signed Gaussians of 0.3). For `Δ_A(n) = V_A(nω)` with
`b_j = F^(j)b₀`, prove `E^(r)b_j = [n−j+r choose r]_v b_(j−r)`, `F^(r)b_j = [j+r choose r]_v b_(j+r)`,
construct `C_n : Δ_A(n) → M_A(n)`, `C_n(b_j) = [n choose j]_v w_j`, prove equivariance,
injectivity, the generic isomorphism, cokernel `⊕_j A/([n choose j]_v)`, and the integral dual
isomorphism `T_n : M_A(n) ≅ Δ_A(n)^∨`, `T_n(w_j) = (−1)^j v^(j(j+1−n)) φ_(n−j)`, for the dual with
`(u·φ)(z) = φ(S(u)z)`. At a primitive odd `L`-th root `ζ` in `ℂ`, `L ≥ 3`, and `n = L`: the diagonal of
`C_L` is `1, 0, …, 0, 1` by `quantumLucas`, `ker C_L = span(b₁, …, b_(L−1))`, the image is
`W = span(w₀, w_L) ≅ Fr^*L(ω) = L_ζ(Lω)`; `Δ_ζ((L−2)ω)` is simple, `a_k ↦ [k+1]_ζ b_(k+1)` identifies
it with `ker C_L`, `a_k ↦ (−1)^k(w_(k+1) + W)` with `M_ζ(L)/W`, and the nonsplit exact sequences

    0 → L_ζ((L−2)ω) → Δ_ζ(Lω) → Fr^*L(ω) → 0
    0 → Fr^*L(ω) → M_ζ(L) → L_ζ((L−2)ω) → 0

are compared by `T_L`. The Chevalley divisor formula is SchubertGeometry S7's; this layer provides
no quantum flag variety, quantum cohomology ring or quantum Schubert product.
*Needs:* 8.1, Layers 3–7, 0.3.

- `C_n` is an integral isomorphism exactly for `n = 0, 1`.
- `T_n` is an isomorphism over `A`, with inverse and base-change compatibility.
- After a field specialization the kernel and image of `C_n` are spanned by the basis vectors with
  vanishing, resp. nonvanishing, diagonal coefficient.

**Checks.**

- `n = 2`: `C_2 = diag(1, v + v⁻¹, 1)`, cokernel `A/(v + v⁻¹)`, and at `v = 1` the diagonal `1, 2, 1`
  matches 4.2's index-`2` lattice.
- `L = 3`: `[3]_v = v² + 1 + v⁻²` vanishes at `ζ`, the diagonal of `C_3` is `1, 0, 0, 1`, both
  four-dimensional modules have two-dimensional simple factors, and `[K; 0 choose 3]` has
  eigenvalues `1, −1` on `w₀, w₃` although `K = 1` on both.
- First sequence nonsplit: a section sends the highest vector to `b₀`, but `F b₀ = b₁ ≠ 0` while `F`
  kills `Fr^*L(ω)`; second: a section must send the highest vector of the quotient to `w₁`, but
  `E w₁ = w₀ ≠ 0`.

### Examples

- `n = 3`, generic `v`: `T_3(w₀) = v⁰ φ₃`, `T_3(w₁) = −v^(−1)φ₂`, `T_3(w₂) = v^0 φ₁`, `T_3(w₃) = −v^3 φ₀`.

### Dependencies

Layers 0–7; SchubertGeometry S4, S7.

## Downstream consumers

- KacMoody, Part II consumes Layers 1–4: the generic algebra, its Hopf structure, the normalized
  root operators `eᵢ, fᵢ`, the braid automorphisms and the integral lattices, for quantum
  integrable modules, crystal bases and the comparison with the path crystal.
- HabiroNahmSeries consumes the signed Laurent Gaussians and the quantum Lucas theorem of Layer 0
  §0.3.
- QuantumGroups consumes the rank-one comparison of Layer 1 §1.1.

## References

- Lusztig1993: George Lusztig, *Introduction to Quantum Groups*, Progress in Mathematics 110,
  Birkhäuser, 1993 (reprinted 2010). Cited by chapter: Chapter 34 (Gaussian binomials at roots of
  unity), Chapter 35 (quantum Frobenius), Chapters 37 and 39 (braid automorphisms and relations),
  Chapter 41 (PBW bases), §23.2 and §31.1.3 (modified form and its presentation).
- McGerty2006: Kevin McGerty, *Hall algebras and quantum Frobenius*, arXiv math/0601150 (v4):
  §2, Definition 2.4 (line 176), Theorem 2.6 (line 208), Lemma 2.2 (line 161), Lemma 2.7
  (line 215), Theorem 2.9 (line 288), Lemma 2.11 (line 307), and Lusztig's conditions (lines
  332–339).
- Lentner2014: Simon D. Lentner, *A Frobenius homomorphism for Lusztig's quantum groups over
  arbitrary roots of unity*, arXiv 1406.0865 (v4): Definitions 2.3, 3.2, 3.4, 3.6, Theorems 3.3,
  3.5, 3.8, 5.4 and 6.1.
- GrosKaneda2013: Michel Gros and Masaharu Kaneda, *Un scindage du morphisme de Frobenius
  quantique*, arXiv 1302.2437 (v2): §1.3 (lines 57–84) and Lemma 6.8 (line 1845).
