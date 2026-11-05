# Roadmap: higher local class field theory

An `n`-dimensional local field is a complete discretely valued field whose residue field is an
`(n − 1)`-dimensional local field, the chain ending in a finite field: `𝔽_q((t₁))((t₂))` and
`ℚ_p{{t}}` are two-dimensional. Their abelian extensions are classified by the **topological
Milnor K-group** `K_n^top(F)` in the degree equal to the dimension, as those of a classical local
field are classified by `Fˣ = K_1(F)`. The reciprocity map `Ψ_F : K_n^top(F) → G_F^ab` is due to
Parshin in characteristic `p` [Parshin 1984] and to Kato in general [Kato 1979–1982]; the
existence theorem in its topological form, and the construction followed here, are Fesenko's
[Fesenko 1991a, 1991b, 2000]. This roadmap builds:

- **higher local fields**: the definition as a chain of complete discretely valued fields, local
  parameters, the fields `K{{t}}`, the classification of [Zhukov 2000], finite extensions, and
  the unramified extensions coming from the last residue field;
- the **higher topology** on `F` and the topology on `Fˣ`;
- **topological Milnor K-groups** `K_n^top(F) = K_n(F)/Λ_n(F)`, Fesenko's identification
  `Λ_n(F) = ⋂_{l ≥ 1} l K_n(F)`, their generators, degree map, norms and topology;
- the **class field axiom**: norm indices of cyclic extensions of prime degree and Hilbert 90
  for the unramified extensions;
- **reciprocity**: the Neukirch–Fesenko map, the isomorphisms
  `K_n^top(F)/N_{L/F}K_n^top(L) ≅ Gal(L/F)` for finite abelian `L/F`, the absolute map `Ψ_F`,
  its normalization and functoriality, and its agreement with the local Artin map in dimension
  one;
- the **existence theorem** and injectivity of `Ψ_F`, through the tame pairing away from `p`, the
  Artin–Schreier–Witt pairing and its explicit formula in characteristic `p`, and the Hilbert
  pairing with Vostokov's explicit formula in mixed characteristic.

Suggested home: `TauCeti/NumberTheory/HigherLocalField/`.

## Scope

This roadmap owns:

- the predicate `IsHigherLocalField n F`, local parameters, the fields `K{{t}}`, the
  classification of higher local fields, finite extensions of higher local fields, and the
  unramified extensions `F_d = F(μ_{q^d − 1})`;
- the higher topology on `F`, the topology on `Fˣ`, and their basic properties;
- `K_n^top(F)`, Fesenko's sequential topology `λ`, the identification of `Λ_n(F)`, the degree
  map, norms on `K_n^top`, and the generation of `K_n^top(F)` by symbols of local parameters;
- the class field axiom, the Neukirch–Fesenko reciprocity map, the existence theorem, the three
  pairings (tame, Artin–Schreier–Witt, Hilbert) on `K_n^top(F)` and their explicit formulas.

It does not own:

- **Milnor K-theory** of a field, the residue maps `∂_v` of a discrete valuation, the rigidity
  isomorphism modulo integers prime to the residue characteristic, Kato's norm
  `N_{E/F} : K_n(E) → K_n(F)` and the norm–residue square: the K₂ symbols and Brauer groups
  roadmap (TauCetiProject/TauCetiRoadmap#1302), §§5.4, 9.11, 9.17, 10.24 and 10.26, consumed
  below.
- **Artin–Schreier–Witt theory** of fields of characteristic `p` and the Schmid–Witt symbol of a
  one-dimensional local field: the function field arithmetic roadmap
  (TauCetiProject/TauCetiRoadmap#1474), §§3.1 and 4.3, consumed below.
- **Local class field theory** of one-dimensional local fields: the
  [class field theory roadmap](../ClassFieldTheory/README.md). Here it enters only through the
  comparison of `Ψ_F` with `TauCeti.ClassFieldTheory.artinMap` in dimension one (Layer 4).
- **One-variable residues and derivatives** of Laurent series: the
  [formal Laurent fields roadmap](../FormalLaurentPuiseux/README.md), L2–L3.
- **Kato's cohomological construction**, the duality `H^{n+1}(F, ℚ/ℤ(n)) ≅ ℚ/ℤ` and its
  comparison with `Ψ_F`; **nonabelian** higher reciprocity; **ramification theory** of higher
  local fields. None of these is an input here, and none is in this roadmap.

## Standing conventions

- **Universe.** Fields are `F : Type`, as in `TauCeti.ClassFieldTheory.artinMap`, which
  Layer 4 compares with.
- **Higher local fields.** `IsHigherLocalField n F`, for `[Field F] [ValuativeRel F]`, is defined by
  recursion on `n`: `IsHigherLocalField 0 F` is `Finite F`, and `IsHigherLocalField (n + 1) F`
  says that the valuation is discrete (`ValuativeRel.IsDiscrete`), nontrivial and of rank one,
  that `F` is complete for the uniformity of `Valued.mk' (valuation F)`, and that `𝓀[F]` is an
  `n`-dimensional local field for some valuative relation. That relation is unique (Layer 0), so
  the chain `F = K_n, K_{n−1} = 𝓀[F], …, K_0` is determined by `F`. Write `q = |K_0|` and
  `p = char K_0`. Dimension one is `IsNonarchimedeanLocalField` (Layer 0).
- **No valuation uniformity instance.** `F` never carries `Valued F _` as an instance, and
  `Valued.mk' (valuation F)` is installed locally only to state completeness. In dimension at
  least two the topology of `F` is `higherTopology`, which is strictly coarser than the
  valuation topology; Mathlib's `LaurentSeries.valued` instance on `K⸨X⸩` must not be used as the
  topology of a higher local field of dimension at least two. `higherTopology`, `unitsTopology`,
  `lambdaTopology` and `topologicalMilnorKTopology` are definitions, installed with `letI`.
- **Local parameters.** `t_1, …, t_n ∈ F` are local parameters when `t_n` is a uniformizer of
  `K_n = F` and, for `i < n`, `t_i` is a unit of `K_n, …, K_{i+1}` whose successive residues
  ending in `K_i` are a uniformizer of `K_i`. The **last** parameter is the uniformizer of `F`.
  For `ℚ_p{{t}}`, `t_1 = t` and `t_2 = p`; for `𝔽_q((t₁))((t₂))`, `t_i = t_i`.
- **Milnor K-groups** are those of TauCetiProject/TauCetiRoadmap#1302 §5.4, with integral
  coefficients, `K_n(F)` its degree-`n` part `MilnorK.degree F n`, and `{a_1, …, a_n}` a symbol.
  **Residues put the uniformizer last**: `∂{u_1, …, u_{m−1}, π} = {ū_1, …, ū_{m−1}}`
  (#1302 §§9.11 and 9.16). The **iterated residue** is
  `∂^{(n)} = ∂_{K_1} ∘ ⋯ ∘ ∂_{K_n} : K_{m}(F) → K_{m−n}(K_0)`.
- **Topological Milnor K-groups.** The carrier is the algebraic quotient
  `TopologicalMilnorK F n = K_n(F)/⋂_{l ≥ 1} l K_n(F)`. Fesenko's definition, the quotient by the
  intersection `Λ_n(F)` of the neighbourhoods of `0` for `lambdaTopology`, is the theorem
  `sequentialKernel_eq` (Layer 2). The topology of `K_n^top(F)` is the quotient topology of `λ`.
  `K_n^top` is used in the degree `n = dim F` only.
- **The degree map** `v_F = ord_{K_1} ∘ ∂^{(n−1)} : K_n(F) → ℤ`, `ord_{K_1}` the normalized
  valuation on `K_1(K_1) = K_1ˣ`. So `v_F{t_1, …, t_n} = 1`, and `v_F` is the valuation for
  `n = 1`.
- **Unramified extensions.** `F_d = F(μ_{q^d − 1})` inside `AlgebraicClosure F`, and
  `F^ur = ⋃_d F_d`. `Frob_F ∈ Gal(F^ur/F)` is `ζ ↦ ζ^q` on roots of unity of order prime to `p`.
  These are the extensions of the last residue field; extensions that are unramified at the top
  but not over `K_0` (for example `𝔽_q((t₁))(t₁^{1/ℓ})((t₂))`) are not called unramified.
- **Arithmetic Frobenius.** `Ψ_F({t_1, …, t_n})` acts on `F^ur` as `Frob_F`, matching §2.6 of the
  class field theory roadmap. Every explicit formula below is normalized by this.
- **Pairings put the Kummer or Artin–Schreier–Witt entry first.** For `μ_m ⊂ F`,
  `(a, α)_m = Ψ_F(α)(a^{1/m})/a^{1/m}`; in characteristic `p`,
  `[w, α)_r = Ψ_F(α)(y) − y` for `℘y = w`, `y ∈ W_r`. In dimension one these are the Hilbert
  symbol of [Serre, *Local Fields*, XIV] and the Schmid–Witt symbol of #1474 §4.3.

## What this roadmap consumes

### From the K₂ symbols and Brauer groups roadmap (TauCetiProject/TauCetiRoadmap#1302)

- **§5.4** `MilnorK F`, `MilnorK.symbol`, `MilnorK.degree F n`, functoriality, degree one is `Fˣ`.
- **§9.11** the residue `∂_v : K_m(F) → K_{m−1}(k)` and specialization of a discretely valued
  field, with the uniformizer-last normalization of **§9.16**.
- **§9.17** rigidity: for `F` complete and `l` prime to `char k`,
  `K_m(F)/l ≅ K_m(k)/l ⊕ K_{m−1}(k)/l`.
- **§10.24** Kato's norm `N_{E/F}` for every finite `E/F`, transitive, the field norm in degree
  one; **§10.26** the norm–residue square `∂_F ∘ N_{E/F} = N_{l/k} ∘ ∂_E` for `F` complete.

### From the function field arithmetic roadmap (TauCetiProject/TauCetiRoadmap#1474)

- **§3.1** the Artin–Schreier–Witt operator `℘`, `aswQuotient p F r = W_r(F)/℘W_r(F)`, Witt
  additive Hilbert 90 and `artinSchreierWitt_galois`: the perfect pairing
  `Gal(F^ab/F)/p^r × W_r(F)/℘W_r(F) → ℤ/p^r` for every field of characteristic `p`.
- **§4.3** the Schmid–Witt symbol and its residue formula, the dimension-one case of Layer 5.2.

### From the class field theory roadmap and Tau Ceti

- `TauCeti.ClassFieldTheory.artinMap`, `denseRange_artinMap`, `continuous_artinMap`,
  `exists_artinMap_mem_iff` with `localNormSubgroup`, and
  `isArithFrobeniusLift_of_mk_eq_artinMap_uniformizer` (`ClassFieldTheory/Local/`).
- `TauCeti.kummerMap` (`FieldTheory/GaloisCohomology/Kummer.lean`), Kummer theory over any field.

### From the formal Laurent fields roadmap

- L2–L3: `LaurentSeries.derivative`, the residue `Res(f dt) = coeff_{−1} f` and its invariance
  under change of uniformizer, in every characteristic.

### From Mathlib

- `ValuativeRel` with `valuation`, `IsDiscrete`, `IsNontrivial`, `IsRankLeOne`, `𝒪[F]`, `𝓀[F]`,
  `Valued.mk'`; `IsNonarchimedeanLocalField`; `LaurentSeries` with `LaurentSeries.valued` and
  `instLaurentSeriesComplete`; `WittVector`; `GaloisField`; `SeqContinuous`.
- `Field.absoluteGaloisGroup`, `Field.absoluteGaloisGroupAbelianization`, `AlgEquiv.restrictNormal`,
  `IntermediateField`, `IsGalois`.

## What is missing (build here)

Nothing in Mathlib or Tau Ceti defines higher local fields, the fields `K{{t}}`, the higher
topology, topological Milnor K-groups or their sequential topology, the degree map, or any
reciprocity map out of a Milnor K-group of degree at least two.

---

## The build, in layers

### Layer 0: higher local fields

- **0.1 Definition.** `IsHigherLocalField n F` as in the conventions. The valuative relation of
  `𝓀[F]` is unique (`existsUnique_residue_valuativeRel`): a field that is henselian for two
  independent rank-one valuations is separably closed (F. K. Schmidt), and a higher local field
  is not, having the extensions `F_d`. Dimension one: `IsHigherLocalField 1 F` is
  `IsNonarchimedeanLocalField F` for the valuative topology (`isHigherLocalField_one_iff`), a
  complete discretely valued field with finite residue field being locally compact. The
  residue characteristics: either `char F = p`, or there is a unique `m ∈ [1, n]` with
  `char K_m = 0` and `char K_{m−1} = p`; `F` is of **mixed characteristic** when `m = n`.
- **0.2 The field `K{{t}}`.** For a complete discretely valued field `K`, the series
  `∑_{i ∈ ℤ} a_i t^i`, `a_i ∈ K`, with `inf v(a_i) > −∞` and `v(a_i) → ∞` as `i → −∞`, with
  `v(∑ a_i t^i) = min v(a_i)`. It is a complete discretely valued field with uniformizer that of
  `K` and residue field `𝓀[K]⸨X⸩`. If `K` is `m`-dimensional, `K{{t}}` is `(m+1)`-dimensional,
  and so is `K⸨X⸩` with its `X`-adic valuative relation.
- **0.3 Local parameters.** Existence of local parameters; the rank-`n` valuation
  `𝐯 = (v_1, …, v_n) : Fˣ → ℤⁿ` (lexicographic, `v_n` the valuation of `F`), with
  `𝐯(t_i)` the `i`-th basis vector; the decomposition
  `Fˣ = t_n^ℤ × ⋯ × t_1^ℤ × μ_{q−1} × V_F`, `V_F` the principal units `1 + 𝓂_{𝐯}`, with
  `μ_{q−1} ⊂ F` the lift of `K_0ˣ` by Hensel's lemma along the chain.
- **0.4 Classification** [Zhukov 2000, §1]. In characteristic `p`,
  `F ≅ 𝔽_q⸨X⸩⸨X⸩⋯` (`n` times), the isomorphism sending local parameters to the variables. If
  `char K_m = 0` and `char K_{m−1} = p`, then `F ≅ K_m⸨X⸩⋯` (`n − m` times) and `K_m` is a
  finite extension of the standard field `K{{t_1}}⋯{{t_{m−1}}}` for `K` the fraction field of
  `W(𝔽_q)`. These are the standard fields; `higherTopology` is defined through them.
- **0.5 Finite extensions.** A finite extension `L` of an `n`-dimensional local field is one: the
  valuation extends uniquely, `L` is complete, and `𝓀[L]` is a finite extension of `𝓀[F]`, so
  induction applies. Write `f_0(L/F) = [K_0(L) : K_0(F)]`.
- **0.6 Unramified extensions.** `F_d/F` is Galois, cyclic of degree `d`, generated by `Frob_F`;
  local parameters of `F` are local parameters of `F_d`, `K_0(F_d) = 𝔽_{q^d}`, and every finite
  extension `L/F` contains a largest `F_d`, with `d = f_0(L/F)`. `Gal(F^ur/F) ≅ Ẑ`,
  `Frob_F ↦ 1` (`TauCeti.zHat`).

### Layer 1: topologies

- **1.1 The higher topology** (`higherTopology`) [Parshin 1984; Zhukov 2000, §1]. On a standard
  field `K⸨X⸩` with `K` topologized, the basic neighbourhoods of `0` are `∑_i V_i X^i` with
  `V_i` open in `K` and `V_i = K` for `i ≫ 0`; on `K{{t}}` the same with the conditions of 0.2;
  on a finite extension of a standard field, the product topology through a basis. In dimension
  one it is the valuation topology (`higherTopology_one`). Theorems: independence of the standard
  presentation and the basis; `F` is a Hausdorff topological additive group;
  multiplication is sequentially continuous (`seqContinuous_mul`) but, for `n ≥ 2`, not
  continuous; every element of `F` is the limit of a sequence of finite sums of monomials in
  local parameters with coefficients in `μ_{q−1} ∪ {0}`.
- **1.2 The topology on `Fˣ`** (`unitsTopology`). The product of the discrete topology on
  `t_n^ℤ × ⋯ × t_1^ℤ × μ_{q−1}` and the subspace topology on `V_F`, through 0.3. Theorems: it
  does not depend on the parameters, and multiplication and inversion on `Fˣ` are sequentially
  continuous.
- **1.3 Continuity of norms.** For finite `L/F`, `N_{L/F} : Lˣ → Fˣ` and the trace are
  sequentially continuous.

### Layer 2: topological Milnor K-groups

- **2.1 Definition.** `divisibleKernel F n = ⋂_{l ≥ 1} l K_n(F)` and
  `TopologicalMilnorK F n = K_n(F)/divisibleKernel F n`. Fesenko's sequential topology
  `lambdaTopology` on `K_n(F)` is the finest topology for which subtraction and the symbol map
  `(Fˣ)ⁿ → K_n(F)` are sequentially continuous; `sequentialKernel` is the intersection of the
  `λ`-neighbourhoods of `0`.
- **2.2 Fesenko's theorem** [Fesenko 2001] (`sequentialKernel_eq`). `Λ_n(F) = ⋂_{l ≥ 1} l K_n(F)`,
  and it is a divisible group. So `K_n^top(F)` has no nonzero infinitely divisible elements. For
  `n = 1`, `Λ_1(F) = 1` and `K_1^top(F) = Fˣ` with its topology 1.2.
- **2.3 Degree map.** `degreeMap` kills `divisibleKernel` (`divisibleKernel_le_ker_degreeMap`)
  and is onto; `v_F{t_1, …, t_n} = 1`; it is continuous for the discrete topology on `ℤ`.
- **2.4 Generators** [Fesenko 2000a]. `K_n^top(F)` is topologically generated by the
  symbols `{t'_1, …, t'_n}` of systems of local parameters, and
  `K_n^top(F) = ℤ·{t_1, …, t_n} ⊕ ker v_F`. Modulo `ℓ^r` for a prime `ℓ ≠ p`, iterating rigidity
  (#1302 §9.17) down the chain gives `K_n^top(F)/ℓ^r ≅ ℤ/ℓ^r ⊕ (K_0ˣ/ℓ^r)^{⊕ n}`, generated by
  `{t_1, …, t_n}` and the `n` symbols obtained by replacing one `t_i` by a generator `ζ` of
  `μ_{q−1}`; `K_m(K_0) = 0` for `m ≥ 2` kills every other summand.
- **2.5 Norms.** For finite `L/F`, Kato's norm descends to
  `N_{L/F} : K_n^top(L) → K_n^top(F)`, since it is additive; it is continuous, transitive, and
  `v_F ∘ N_{L/F} = f_0(L/F) · v_L` (#1302 §10.26 along the chain). `normSubgroup F n L` is its
  image, and for finite separable `L` it is open of finite index. `G_F` acts on `K_n^top` of its
  finite Galois subextensions, compatibly with norms.

### Layer 3: the class field axiom

- **3.1 Unramified extensions** [Fesenko 2000b, §5]. For `F_d/F`:
  `N_{F_d/F}K_n^top(F_d) = {α : d ∣ v_F(α)}`, and the kernel of `N_{F_d/F}` on `K_n^top(F_d)` is
  `(1 − Frob_F)K_n^top(F_d)` (Hilbert 90).
- **3.2 Cyclic extensions of prime degree** [Fesenko 1991a, 1991b]. For `L/F` separable cyclic
  of prime degree `ℓ`, `|K_n^top(F) : N_{L/F}K_n^top(L)| = ℓ`. For `ℓ ≠ p` the index is computed
  in the basis of 2.4; for `ℓ = p` through the unit filtration
  `U^{(i)}K_n^top(F) = ⟨{1 + 𝓂_F^i, Fˣ, …, Fˣ}⟩`, `𝓂_F` the maximal ideal of `𝒪[F]`, and the
  behaviour of `N_{L/F}` on it, the
  `n`-dimensional form of [Serre, *Local Fields*, V §3].

### Layer 4: reciprocity

- **4.1 The Neukirch–Fesenko map** [Fesenko 2000b, §5]. For `L/F` finite Galois and
  `σ ∈ Gal(L/F)`, choose `σ̃ ∈ Gal(LF^ur/F)` with `σ̃|_L = σ` and `σ̃|_{F^ur} = Frob_F^k`, `k ≥ 1`;
  let `Σ` be its fixed field, a finite extension of `F`, and put
  `Υ_{L/F}(σ) = N_{Σ/F}{t_1(Σ), …, t_n(Σ)} mod N_{L/F}K_n^top(L)`. It does not depend on `σ̃` or on
  the parameters of `Σ` (3.1), and is a homomorphism `Gal(L/F)^ab → K_n^top(F)/N_{L/F}K_n^top(L)`.
- **4.2 Reciprocity at finite level.** `Υ_{L/F}` is an isomorphism for every finite Galois `L/F`:
  for cyclic `L/F` of prime degree it is onto, by 2.4, and 3.2 counts both sides; the general case
  follows by Neukirch's induction through Sylow subgroups and towers [Neukirch, IV §6]. **Norm
  limitation**: `N_{L/F}K_n^top(L) = N_{L'/F}K_n^top(L')` for `L'` the largest abelian
  subextension of `L/F`. For abelian `L/F`, the inverse of `Υ_{L/F}` composed with
  `K_n^top(F) → K_n^top(F)/N_{L/F}K_n^top(L)` defines `Ψ_{L/F}`, and these are compatible for
  `L ⊆ L'`.
- **4.3 The absolute map** (`reciprocityMap`). `Ψ_F : K_n^top(F) → G_F^ab`, the limit of the
  `Ψ_{L/F}`: for a lift `σ` of `Ψ_F(α)`, `α ∈ N_{L/F}K_n^top(L)` exactly when `σ` is trivial on
  `L` (`reciprocityMap_mem_normSubgroup_iff`), and every element of `Gal(L/F)` is a restriction
  (`exists_reciprocityMap_restrictNormal_eq`). `Ψ_F` is continuous with dense image.
- **4.4 Normalization and functoriality.** `Ψ_F(α)|_{F^ur} = Frob_F^{v_F(α)}`; for finite separable
  `L/F`, `Ψ_F ∘ N_{L/F}` is `Ψ_L` followed by the map `G_L^ab → G_F^ab`; for `τ ∈ G_F`,
  `Ψ_{τL}(τα) = τ Ψ_L(α) τ⁻¹`.
- **4.5 Dimension one** (`reciprocityMap_unitClass`). For `n = 1`, `Ψ_F({x}) = artinMap F x`. Both
  are homomorphisms `r : Fˣ → G_F^ab` such that `r(π)` lifts arithmetic Frobenius for every
  uniformizer `π` (`isArithFrobeniusLift_of_mk_eq_artinMap_uniformizer`) and, for every finite
  abelian `L`, `r(x)` is trivial on `L` exactly when `x ∈ N_{L/F}Lˣ` (`exists_artinMap_mem_iff`).
  Two such maps agree: uniformizers generate `Fˣ`, and for `L` finite abelian and `d` large, let
  `M` be the fixed field of `r(π)` in `LF_d`. Then `MF_d = LF_d`, `π ∈ N_{M/F}Mˣ`, so `r'(π)` is
  trivial on `M` and is `Frob_F` on `F_d`, hence agrees with `r(π)` on `LF_d`.

### Layer 5: pairings, existence and injectivity

- **5.1 Away from `p`.** For `ℓ^r ∣ q − 1` and `a ∈ Fˣ`,
  `(a, α)_{ℓ^r} = (∂^{(n)}{a, α})^{(q−1)/ℓ^r}` [Fesenko 1991a, 1991b], where
  `∂^{(n)}{a, α} ∈ K_1(K_0) = K_0ˣ`, and `μ_{ℓ^r}(K_0) ≅ μ_{ℓ^r}(F)` by 0.3. The pairing `Fˣ/ℓ^r × K_n^top(F)/ℓ^r → μ_{ℓ^r}` is perfect,
  both sides being finite of order `ℓ^{r(n+1)}` (2.4).
- **5.2 Characteristic `p`** [Parshin 1984; Fesenko 2000b, §5]. `[w, α)_r` for
  `w ∈ W_r(F)/℘W_r(F)` (#1474 §3.1). **Parshin's formula** at length one: under an isomorphism
  `F ≅ 𝔽_q⸨X⸩⋯` of 0.4 with variables `t_1, …, t_n`,
  `[a, {b_1, …, b_n})_1 = Tr_{𝔽_q/𝔽_p} res(a · det(∂b_i/∂t_j)/(b_1 ⋯ b_n))`, where `∂/∂t_j` is
  `LaurentSeries.derivative` in the `j`-th variable and `res` is the coefficient of
  `t_1^{−1} ⋯ t_n^{−1}`; for `n = 1` this is the residue formula of #1474 §4.3. The pairing
  `W_r(F)/℘ × K_n^top(F)/p^r → ℤ/p^r` is nondegenerate on both sides, and the annihilators of
  finite subgroups of `W_r(F)/℘` are exactly the open subgroups of `K_n^top(F)` containing
  `p^r K_n^top(F)`.
- **5.3 Mixed characteristic** [Vostokov 1985; Fesenko 1991a]. For `μ_{p^r} ⊂ F`, the Hilbert
  pairing `(a, α)_{p^r}` is given by Vostokov's explicit formula, and is nondegenerate in the
  sense of 5.2, with `Fˣ/p^r` in place of `W_r(F)/℘`.
- **5.4 Injectivity** (`injective_reciprocityMap`) [Fesenko 1991a, 1991b]. By 2.2, a nonzero
  `α ∈ K_n^top(F)` lies outside `ℓ^r K_n^top(F)` for some prime power `ℓ^r`. When
  `μ_{ℓ^r} ⊂ F` or `ℓ = p = char F`, 5.1–5.3 give a cyclic `L` with
  `α ∉ N_{L/F}K_n^top(L)`; otherwise pass to `F(μ_{ℓ^r})` with 2.5 and 4.4.
- **5.5 The existence theorem** (`isOpen_and_finiteIndex_iff_exists_normSubgroup`,
  `normSubgroup_le_normSubgroup_iff`). `L ↦ N_{L/F}K_n^top(L)` is an inclusion-reversing
  bijection from finite abelian extensions of `F` in `AlgebraicClosure F` to open subgroups of
  finite index of `K_n^top(F)`. An open subgroup `N` of finite index `m` contains `mK_n^top(F)`.
  Over `F' = F(μ_m)`, the preimage of `N` under `N_{F'/F}` is open of finite index (2.5); its
  `ℓ`-primary components are annihilators of finite subgroups of `F'ˣ/ℓ^r` or of
  `W_r(F')/℘` by 5.1–5.3, hence norm groups of abelian extensions, by Kummer theory
  (`TauCeti.kummerMap`) or #1474 §3.1 and 4.3. So `N` contains `N_{M/F}K_n^top(M)` for a finite
  Galois `M/F`, hence, by norm limitation, the norm group of an abelian extension, and is itself
  one by 4.2.

## Worked examples (acceptance criteria)

- **Dimension one.** For `F` a finite extension of `ℚ_p` or of `𝔽_p⸨X⸩`, `K_1^top(F) = Fˣ`,
  `v_F` is the valuation, and `Ψ_F = artinMap F` (4.5).
- **Frobenius.** `Ψ_F({t_1, …, t_n})` acts on `F^ur` as `Frob_F`, and `Ψ_F({t_2, t_1})` on `F^ur`
  as `Frob_F⁻¹` for `n = 2`.
- **Constants pair through the trace.** For `a ∈ 𝔽_q` and `α ∈ K_n^top(F)` in characteristic `p`,
  `[a, α)_1 = v_F(α) · Tr_{𝔽_q/𝔽_p}(a)`, from Parshin's formula and from `Frob_F(y) − y` for
  `y^p − y = a`.
- **An Artin–Schreier extension of `𝔽_p⸨X⸩⸨X⸩`.** With `t_1, t_2` the variables,
  `[t_1^{−1}, {1 − t_1, t_2})_1 = −1`, so `{1 − t_1, t_2} ∉ pK_2^top(F)` and `Ψ_F({1 − t_1, t_2})`
  sends a root `y` of `y^p − y = t_1^{−1}` to `y − 1`. This is the two-dimensional reading of the
  Schmid–Witt value `[t^{−1}, 1 − t) = −1` on `𝔽_p⸨X⸩`, through `∂{1 − t_1, t_2} = 1 − t_1`. By
  contrast `[t_1^{−1}t_2^{−1}, {t_1, t_2})_1 = 0`: that extension is fixed by `Ψ_F({t_1, t_2})`.
- **A tame symbol on `ℚ_p{{t}}`.** With `t_1 = t`, `t_2 = p` and `ℓ ∣ p − 1`:
  `(u, {t, p})_ℓ = u^{(p−1)/ℓ}` for `u ∈ μ_{p−1}`, and `(t, {t, p})_ℓ = (−1)^{(p−1)/ℓ}`, since
  `∂_F{t, t, p} = {t̄, t̄} = {t̄, −1}` and `∂{t̄, −1} = −1` in `𝔽_pˣ`. Reversing the residue
  normalization would invert the first value.
- **Degree and norms.** `v_F ∘ N_{F_d/F} = d · v_{F_d}`, so `{t_1, …, t_n}` is not a norm from
  `F_d` for `d ≥ 2`, matching `Ψ_F({t_1, …, t_n})|_{F_d} = Frob_F ≠ 1`.
- **The higher topology is not the valuation topology.** On `𝔽_p⸨X⸩⸨X⸩`, `t_1^k → 0` for
  `higherTopology` but `v(t_1^k) = 0` for every `k`, so it does not tend to `0` for the
  `t_2`-adic topology. Every `higherTopology`-neighbourhood of `0` contains some `t_2^i𝒪[F]`, so the
  valuation topology is strictly finer.

## Ordering

Layer 0, then Layer 1 and the definitions of Layer 2; 2.2 needs Layer 1. Layer 3 needs Layer 2
and #1302 §§9.17, 10.24, 10.26. Layer 4 needs Layer 3. Layer 5 needs Layer 4, with #1474 §3.1
for 5.2. 4.5 needs only 4.1–4.3 and the class field theory roadmap.

## References

- A. N. Parshin, *Local class field theory*, Trudy Mat. Inst. Steklov **165** (1984), 143–170.
- K. Kato, *A generalization of local class field theory by using K-groups* I, II, III, J. Fac.
  Sci. Univ. Tokyo **26** (1979), **27** (1980), **29** (1982).
- S. V. Vostokov, *Explicit construction of class field theory for a multidimensional local
  field*, Izv. Akad. Nauk SSSR Ser. Mat. **49** (1985), 283–308.
- I. B. Fesenko [1991a], *Class field theory of multidimensional local fields of characteristic
  0 with residue field of positive characteristic*, Algebra i Analiz **3** (1991), no. 3,
  165–196.
- I. B. Fesenko [1991b], *On class field theory of multidimensional local fields of positive
  characteristic*, Adv. Soviet Math. **4** (1991), 103–127.
- I. B. Fesenko and M. Kurihara (eds.), *Invitation to higher local fields*, Geom. Topol. Monogr.
  **3** (2000): I. Zhukov, *Higher dimensional local fields* (Part I, §1) [Zhukov 2000];
  I. Fesenko, *Topological Milnor K-groups of higher local fields* (Part I, §4) [Fesenko 2000a];
  I. Fesenko, *Explicit higher local class field theory* (Part I, §5) [Fesenko 2000b].
- I. B. Fesenko, *Sequential topologies and quotients of Milnor K-groups of higher local
  fields*, Algebra i Analiz **13** (2001), no. 3, 198–221 [Fesenko 2001].
- J. Neukirch, *Algebraic Number Theory*, Grundlehren 322 — IV §§4–6 (abstract class field
  theory through Frobenius lifts).
- J.-P. Serre, *Local Fields*, GTM 67 — V §3, XIV.
