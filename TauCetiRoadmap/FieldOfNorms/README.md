# Roadmap: the field of norms of an arithmetically profinite extension

Let `K` be a nonarchimedean local field with residue characteristic `p`, and `L/K` an infinite
separable algebraic extension that is **arithmetically profinite** (APF): for every `u ≥ −1` the
subgroup `G_K(u)·G_L` of the absolute Galois group is open. Fontaine and Wintenberger
[Wintenberger 1983] attach to `L/K` its **field of norms** `X_K(L)`. Its multiplicative group is the
inverse limit `lim E^×` of the multiplicative groups of the finite subextensions `E` of `L/K` under
the norm maps, and its addition is a limit of norms. `X_K(L)` is a local field of characteristic
`p`, with the residue field of `L`. The construction is functorial, and `M ↦ X_{L/K}(M)` is an
equivalence between separable algebraic extensions of `L` and of `X_K(L)`. So

`G_L ≅ G_{X_K(L)}`,

compatibly with the ramification filtrations through the Herbrand function `ψ_{L/K}`. When `K`
has characteristic `0`, this is how a statement about Galois groups in characteristic `p` passes to
characteristic `0`. The anabelian theorem of [Abrashkin 2010, §7] is proved this way. The completed
perfection of `X_K(L)` is the tilt of the completion of `L`, which ties the construction to the
Fontaine–Wintenberger theorem for perfectoid fields.

This roadmap builds:

- **APF extensions**: their Herbrand functions `ψ_{L/K}` and `φ_{L/K}`, their stability properties,
  the strictly APF extensions with the invariants `i(L/K)` and `c(L/K)`, the tower of elementary
  extensions, and the main families of examples;
- **the field of norms** `X_K(L)`: the norm estimates, the ring `A_K(L)`, the field structure, the
  valuation and the residue field;
- **functoriality and Galois groups**: `X_K(τ)` for finite embeddings, the equivalence of
  categories, `G_L ≅ G_{X_K(L)}`, and the faithful action of `Gal(L/K)` for `L/K` Galois;
- **ramification**: the upper filtration of `Gal(L/K)` and of `Gal(M/L)` read on the field of
  norms through `ψ_{L/K}`, and transitivity `X_K(M) ≅ X_{X_K(L)}(X_{L/K}(M))`;
- **full faithfulness** of the field-of-norms functor on Galois extensions [Wintenberger 1980], in
  the form [Abrashkin 2010, §7.1] uses it;
- **comparison with tilting**: the embedding `X_K(L) → R(L̂)` into the tilt for strictly APF `L/K`,
  the identification of the completed perfection of `X_{L/K}(M)` with `R(M̂)`, perfectoidness of
  `L̂` in characteristic `0`, and agreement of `G_L ≅ G_{X_K(L)}` with the Fontaine–Wintenberger
  isomorphism of the perfectoid spaces roadmap.

Suggested home: `TauCeti/NumberTheory/LocalField/FieldOfNorms/`.

## Scope

This roadmap owns:

- APF and strictly APF extensions of nonarchimedean local fields, their Herbrand functions, the
  invariants `i(L/K)` and `c(L/K)`, elementary extensions and the tower of elementary extensions,
  the stability properties, and the APF property of finite separable extensions, of abelian
  extensions with finite residue extension, and of the worked examples;
- the field of norms `X_K(L)` of an infinite APF extension and `X_{L/K}(M)` of a separable
  algebraic extension of it, with the ring `A_K(L)`, the field structure, the valuation, the
  residue field and the local-field structure;
- the functor `X_K`, the equivalence of categories, the Galois-group isomorphisms, the faithful
  and closed action of `Gal(L/K)`, the reading of the ramification filtrations, and transitivity;
- Wintenberger's categories of Galois extensions and of local fields with groups of automorphisms,
  and the full faithfulness of the field-of-norms functor between them;
- Wintenberger's field `R(E)`, compared with the tilt and not rebuilt, the embedding `Λ_{L/K}`,
  the identification of the completed perfection with `R(M̂)`, and the comparison of
  `G_L ≅ G_{X_K(L)}` with the Fontaine–Wintenberger isomorphism.

It does not own:

- **Filtered profinite groups**: filtrations indexed by `ℝ`, quotient filtrations, the Herbrand
  function `ψ_H` of a subgroup, and the upper filtration on `G_K`, on `Gal(F/K)` for Galois
  `F/K` and on `G_K^m`: the filtered local Galois groups roadmap
  (TauCetiProject/TauCetiRoadmap#1795), Layers 1 and 2, consumed below.
- **The absolute upper filtration** `G_K^u`, the functions `ψ_{E/K}` of finite separable
  extensions and the open-subgroup identity: the ramification of complete discretely valued
  fields roadmap (TauCetiProject/TauCetiRoadmap#1410), §§4a.1–4a.2.
- **Finite-level ramification of local fields**: lower and upper ramification groups, Herbrand
  functions and Hasse–Arf for finite Galois extensions, Teichmüller representatives: the
  [local fields and ramification roadmap](../../Completed/LocalFieldsRamification/README.md),
  implemented in Tau Ceti.
- **Tilts and perfectoid fields**: the tilt of a perfectoid field and its sharp map, Fontaine's
  `θ` and its kernel, and the Fontaine–Wintenberger theorem `G_K ≅ G_{K♭}` for a perfectoid field
  `K`: Mathlib's `Tilt` and `PreTilt`, and the [perfectoid spaces roadmap](../PerfectoidSpaces/README.md),
  P1 and P3.8. This roadmap compares its own construction with them.
- **Sen's theorem** that a Galois extension with finite residue extension and `p`-adic Lie Galois
  group is strictly APF [Sen 1972]. Statements below about `p`-adic Lie extensions carry strict
  APF as a hypothesis.
- **Complete discretely valued fields with infinite perfect residue field**, the generality of
  [Wintenberger 1983]. Every base field here is a nonarchimedean local field.
- **Applications**: the anabelian theorems of [Abrashkin 2000, 2010] and their higher-dimensional
  analogues consume this roadmap; `(φ, Γ)`-modules are not here.

## Standing conventions

- **Base fields.** `K` carries
  `[Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]`. Its residue
  field is finite of characteristic `p`. `K` may have characteristic `0` or `p`. Valuations are
  normalized, `v_E(E^×) = ℤ` for each local field `E`, and extended to algebraic extensions.
- **Extensions.** `G_K` is `Field.absoluteGaloisGroup K`, the automorphism group of
  `AlgebraicClosure K` with the Krull topology. An extension of `K` is an
  `L : IntermediateField K (AlgebraicClosure K)` with `Algebra.IsSeparable K L`, and
  `G_L = L.fixingSubgroup`, a closed subgroup. `𝓔_{L/K}` is the set of finite subextensions of
  `L/K`, directed by inclusion. A finite subextension `E` is a local field through Tau Ceti's
  `finiteIntermediateFieldValuativeRel`, `finiteIntermediateFieldTopology` and
  `finiteIntermediateField_isNonarchimedeanLocalField`, installed locally as in the filtered local
  Galois groups roadmap. As there, statements avoid the Galois group of an infinite subextension
  unless that subextension is Galois over `K`, because `AlgebraicClosure K` is not Galois over `K`
  in characteristic `p`.
- **Open subgroups above `G_L`.** For `L` separable over `K`, the open subgroups of `G_K` that
  contain `G_L` are exactly the `E.fixingSubgroup` for `E ∈ 𝓔_{L/K}`. The fixed field of an open
  `U ⊇ G_L` lies in the purely inseparable closure of `L` in `AlgebraicClosure K`. Its separable
  part `E`, the elements separable over `K`, is finite over `K` of degree `[G_K : U]`, and lies in
  `L` because an element separable over `K` and purely inseparable over `L` is in `L`. Then
  `U = E.fixingSubgroup`, because an automorphism fixing `E` fixes its purely inseparable closure.
  This is the first target of Layer 0.
- **The upper filtration** is `F_K`, written `G_K(u)`, of the filtered local Galois groups roadmap:
  `G_K(u) = G_K^u` of TauCetiProject/TauCetiRoadmap#1410 for `u ≥ −1`, and `G_K` for `u < −1`. For
  `L/K` Galois, `Gal(L/K)` carries the quotient filtration `Gal(L/K)^u`, the image of `G_K(u)`.
- **Herbrand functions** are the filtered local Galois groups roadmap's
  `GroupFiltration.herbrandPsi F_K G_L`:
  `ψ_{L/K}(u) = (1/f) ∫_0^u [G_K : G_K(t)·G_L] dt` for `u ≥ 0`, with `f = [G_K : G_K(0)·G_L]`, and
  `ψ_{L/K}(u) = u` for `u ≤ 0`. This is Wintenberger's
  `∫_0^u (G_K^0 : G_L^0 G_K^t) dt` with `G_L^0 = G_L ∩ G_K^0`. Indeed
  `[G_K : G_K(t)G_L] = f · [G_K(0)G_L : G_K(t)G_L] = f · [G_K(0) : G_K(t)(G_L ∩ G_K(0))]`, by the
  modular law, `G_K(t)` lying in `G_K(0)`. `φ_{L/K}` is the inverse of `ψ_{L/K}`.
- **Lower indices.** For a continuous automorphism `σ` of a local field `X`, the lower index is
  Tau Ceti's `TauCeti.IsLocalRing.lowerIndex`, `min_x v_X(σx − x)` over `x ∈ 𝒪_X`. That is
  Serre's `i_G(σ)`, and one more than Wintenberger's `i_X(σ)`. The lower filtration of a group `G`
  of such automorphisms is `G_x = {σ : lowerIndex σ ≥ x + 1}`, `x ≥ −1`, which on a finite Galois
  group is `TauCeti.LocalFieldsRamification.lowerRamificationGroupReal`. Wintenberger's
  `G_u = {σ : i_X(σ) ≥ u}` is the same group.
- **The field of norms** is the set of norm-compatible families `(α_E)_{E ∈ 𝓔_{L/K}}`,
  `α_E ∈ E`, `N_{E'/E}(α_{E'}) = α_E` for `E ⊆ E'` (`fieldOfNorms`), with termwise
  multiplication and the addition of Layer 1.5. It is a type with its own `Field`, `ValuativeRel`,
  `TopologicalSpace` and `IsNonarchimedeanLocalField` instances. For `E` and `E'` in `𝓔_{L/K}`,
  `E'` is an extension of `E` through `IntermediateField.extendScalars`.
- **Completions.** For `L` separable algebraic over `K`, `L̂` is `UniformSpace.Completion L` for
  the uniform structure of the unique norm on `L` extending the normalized absolute value of `K`
  (the spectral norm), with the extended norm. It is a `NontriviallyNormedField` with
  `IsUltrametricDist` and `CompleteSpace`. The same applies to `M̂` for `M/L` separable algebraic.
- **Tilts.** For a complete valued field `E` of residue characteristic `p`, Wintenberger's `R(E)`
  is the set of sequences `(x_n)_{n ≥ 0}` in `E` with `x_{n+1}^p = x_n`, with termwise
  multiplication and the addition `(x + y)_n = lim_m (x_{n+m} + y_{n+m})^{p^m}`. Here `R(E)` always
  means Mathlib's `Tilt E v v.integer _ p` with `v = NormedField.valuation` and `O = v.integer`, as
  in the perfectoid spaces roadmap's `Perfectoid.fontaineWintenberger_nonempty`. So 5.3 and 5.4
  apply P1.11 and P3.8 verbatim. The sequence description is the target 5.0, through Mathlib's
  `PreTilt.untilt`, which gives `x_0 = x^♯`.

## What this roadmap consumes

### From the filtered local Galois groups roadmap (TauCetiProject/TauCetiRoadmap#1795)

- **Layer 1**: `GroupFiltration`, the quotient filtration `GroupFiltration.quotient`,
  `GroupFiltration.herbrandPsi` and its properties for open subgroups, and filtered isomorphisms.
- **Layer 2**: the upper filtration `F_K` on `G_K` for a nonarchimedean local field, the quotient
  filtration on `Gal(F/K)` for Galois `F/K` equal to its upper filtration (2.1), the agreement
  `ψ_H = ψ_{E/K}` for `H = E.fixingSubgroup`, `E/K` finite separable (2.2). Its open-subgroup
  model 2.0 is for finite `E`; the model for infinite `L` is 0.0 below.

### From the ramification of complete discretely valued fields roadmap (TauCetiProject/TauCetiRoadmap#1410)

- **§4a.1**: `G_K^u`, closed normal antitone, mapping onto `Gal(M/K)^u` for each finite Galois `M`,
  with `G_K^0` inertia.
- **§4a.2**: for finite separable `E/K`, `ψ_{E/K}` with the tower law, the open-subgroup identity
  `G_K^u ∩ G_E = G_E^{ψ_{E/K}(u)}`, and the integral formula.

### From the local fields and ramification roadmap, implemented in Tau Ceti

- `TauCeti.LocalFieldsRamification.lowerRamificationGroup`, `lowerRamificationGroupReal`,
  `upperRamificationGroup`, `herbrand` and `inverseHerbrand` for finite Galois extensions, and
  Herbrand's theorem on quotients `map_restrictNormalHom_upperRamificationGroup`.
- **Hasse–Arf**, `TauCeti.LocalFieldsRamification.hasseArf` on `UpperJump`
  (`Herbrand/HasseArf/Abelian.lean`): the upper jumps of a finite abelian extension are integers.
- **The graded embeddings** `θ_i : G_i/G_{i+1} ↪ 𝓀[L]⁺` for `i ≥ 1`,
  `TauCeti.ramificationGroupGradedToResidueField` (`LocalField/UnitFiltration/RamificationGroup.lean`),
  and the tame character `TauCeti.tameCharacter` on `G_0/G_1`.
- Norms: `normalizedValuation_norm` (`v_E(N_{E'/E} x) = f(E'/E) v_{E'}(x)`) and the norm of
  `𝒪_{E'}` over `𝒪_E` (`LocalField/Norm/`), `TauCeti.IsTotallyRamified`, the Teichmüller
  representatives (`LocalField/Teichmuller.lean`) and the unramified extensions
  (`LocalField/Unramified/`).
- The finite-intermediate-field adapters of the conventions.

### From the perfectoid spaces roadmap and Mathlib

- Mathlib's `PreTilt`, `Tilt`, `PreTilt.untilt` (`Mathlib/RingTheory/Perfection.lean`,
  `Mathlib/RingTheory/Perfectoid/Untilt.lean`) and `WittVector.fontaineTheta`.
- P1: perfectoid fields and their tilts compared with Mathlib's `Tilt`, and P1.11's criterion for a
  complete field to be perfectoid.
- P3.8: `Perfectoid.fontaineWintenberger`, the continuous isomorphism
  `Gal(K̄/K) ≅ Gal(K♭^sep/K♭)` for a perfectoid field `K`, marked by the coordinatewise action on
  the tilt of the completed algebraic closure. Also the insensitivity of finite étale algebras to
  completed perfection, *finite-etale-under-completed-perfection*, and the henselian completion
  comparison AdicEtaleGeometry A1.0.5, as P3.8 uses them.

## What is missing (build here)

Neither Mathlib nor Tau Ceti defines arithmetically profinite extensions, norm-compatible systems,
the field of norms, or Wintenberger's embedding into the tilt. Nothing compares the absolute Galois
group of an infinite extension of a local field with that of a field of characteristic `p`, other
than the perfectoid spaces roadmap's Fontaine–Wintenberger theorem for perfectoid fields.

---

## The build, in layers

### Layer 0: arithmetically profinite extensions

Let `L/K` be separable algebraic, `H = G_L`.

- **0.0 The fixing-subgroup model.** `Field.absoluteGaloisGroup L ≃ₜ* L.fixingSubgroup` for every
  separable algebraic `L` (`absoluteGaloisGroupEquivFixingSubgroupOfSeparable`). It is the
  composite of `absoluteGaloisGroupRestrictEquiv L`, Tau Ceti's
  `absoluteGaloisGroupEquivFixingSubgroup K L σ` (`AbsoluteGaloisGroup/Extension.lean`, no
  finiteness hypothesis) for the inclusion `σ` of `L` into
  `SeparableClosure K = separableClosure K (AlgebraicClosure K)`, and
  `absoluteGaloisGroupRestrictEquiv K`, which carries `L.fixingSubgroup` onto
  `σ.fieldRange.fixingSubgroup`. For finite `L` it is 2.0 of the filtered local Galois groups
  roadmap, and its composite with the inclusion into `G_K` is `absoluteGaloisGroupExtend K L σ`.
- **0.1 Definition.** `L/K` is **APF** if `G_K(u)·H` is open in `G_K` for every `u ≥ −1`
  [Wintenberger 1983, 1.2.1]. `G_K(u)·H` is a subgroup because `G_K(u)` is normal. It is open
  exactly when it has finite index. By the conventions it is then `E_u.fixingSubgroup` for a unique
  `E_u ∈ 𝓔_{L/K}`, the fixed field of `G_K(u)·H` in `L`. `u ↦ E_u` is monotone and
  `⋃_u E_u = L`. Finite separable extensions are APF, because `H` is open. An APF extension has finite
  residue extension: `E_0 = L ∩ K^ur` is the maximal unramified subextension. The maximal unramified
  extension `K^ur` is not APF, because `G_K(0)·G_{K^ur} = G_{K^ur}` has infinite index.
- **0.2 Herbrand functions.** For `L/K` APF, `ψ_{L/K}` and `φ_{L/K}` as in the conventions. The
  integrand is finite and monotone. `ψ_{L/K}` is continuous, strictly increasing, piecewise
  linear, the identity on `(−∞, 0]`, and a bijection of `ℝ` onto itself. This extends the filtered
  local Galois groups roadmap's `strictMono_herbrandPsi` and `surjective_herbrandPsi` from open `H`
  to closed `H` with every `G(t)·H` open. On `(−∞, u]`, `ψ_{L/K} = ψ_{E/K}` for every
  `E ∈ 𝓔_{L/K}` containing `E_u`: for `t ≤ u`, `G_K(t)·H = G_K(t)·E.fixingSubgroup`. **Transitivity**
  [Wintenberger 1983, 1.2.1]: for `E ∈ 𝓔_{L/K}` with `L/E` APF (equivalently `L/K` APF, by 0.3),
  `ψ_{L/K} = ψ_{L/E} ∘ ψ_{E/K}`. Here `ψ_{L/E}` is computed in `G_E` with the filtration `F_E`, which
  is the restriction of `F_K` to `G_E` by TauCetiProject/TauCetiRoadmap#1795 2.2.
- **0.3 Stability** [Wintenberger 1983, Prop. 1.2.3]. For `K ⊆ M ⊆ N`:
  - if `M/K` is finite, `N/K` is APF iff `N/M` is;
  - if `N/M` is finite, `N/K` is APF iff `M/K` is;
  - if `N/K` is APF, so is `M/K`;
  - the same three statements for strictly APF, and the inequalities between the invariants below.

  The APF part is the index identity
  `(G_K : G_K(u)G_N) = (G_K : G_K(u)G_M)·(G_M : (G_M ∩ G_K(u))G_N)`. The strict part uses the
  monotonicity of `v ↦ (G_K^0 : (G_K^0 ∩ G_M)G_K(v))`, as in [Wintenberger 1983, 1.2.4].
- **0.4 Strictly APF, `i(L/K)` and `c(L/K)`** [Wintenberger 1983, 1.2.1].
  - `i(L/K) = sup {u ≥ −1 : G_K(u)·H = G_K}`.
  - `L/K` is **strictly APF** if `liminf_{u → ∞} ψ_{L/K}(u) / (G_K^0 : G_L^0 G_K(u)) > 0`.
  - When `i(L/K) > 0`, which happens exactly when `L/K` is a totally ramified `p`-extension,
    `c(L/K) = inf_{u > i(L/K)} ψ_{L/K}(u) / (G_K^0 : G_L^0 G_K(u))`. `L/K` is strictly APF iff
    `c(L/K) > 0`.
  - Both invariants are unchanged when `AlgebraicClosure K` is replaced by another algebraic
    closure.
  - Every finite separable extension is strictly APF.
- **0.5 Elementary extensions and the elementary tower** [Wintenberger 1983, 1.3–1.4].
  - A finite `L/K` is **elementary of level `i > 0`** if `G_K(i)·H = G_K` and
    `G_K(i + ε)·H = H` for every `ε > 0`. Equivalently, every `K`-embedding `σ ≠ id` of `L` into
    `AlgebraicClosure K` has Wintenberger lower index `i`. Such an extension is totally ramified of
    `p`-power degree, and elementary abelian when Galois.
  - **The elementary tower** of an APF `L/K`. Put `K_0 = E_0 = L ∩ K^ur`, and let `K_1` be the
    fixed field in `L` of `G_K(0+)·H`, `G_K(0+) = closure ⋃_{w > 0} G_K(w)`. Let
    `b_1 < b_2 < …` be the jumps of `u ↦ G_K(u)·H` in `(0, ∞)`, which are finite in each bounded
    interval and infinitely many when `L/K` is infinite, and put `K_n = E_{b_n}` for `n ≥ 1`. `E_u`
    is constant on `(0, b_1]`, so this gives the same `K_1`. With `i_n = ψ_{L/K}(b_n)`:
    - `K_0 = L ∩ K^ur`;
    - `K_1/K_0` is totally ramified of degree prime to `p`, so `K_1` is the maximal tame
      subextension;
    - `K_{n+1}/K_n` is elementary of level `i_n = i(L/K_n)` for `n ≥ 1`;
    - `⋃ K_n = L`, and `i_n → ∞` when `L/K` is infinite.

    These properties characterize the tower.
  - **Criterion.** `L/K` is strictly APF iff `i_n / [K_{n+1} : K]` is bounded below by a positive
    constant. When `K = K_1`, `i(L/K) = i_1` and `c(L/K) = inf_n i_n / [K_{n+1} : K]`.
  - **The converse construction** [Wintenberger 1983, 1.4.2]. An increasing sequence `K_n` with
    `K_0/K` unramified, `K_1/K_0` totally ramified of degree prime to `p`, and `K_{n+1}/K_n`
    elementary of strictly increasing level `i_n` (tending to `∞` if the sequence is infinite) has
    APF union. Its Herbrand function is computed from the `i_n`.
- **0.6 Galois and abelian extensions.**
  - For `L/K` Galois, `L/K` is APF iff every `Gal(L/K)^u` is open in `Gal(L/K)`. Equivalently, the
    quotient filtration has finitely many jumps in each bounded interval and `Gal(L/K)^0` is open.
  - **An abelian `L/K` with finite residue extension is strictly APF.** Write `G = Gal(L/K)` and
    `q_L = #k_L`.
    - By Hasse–Arf at every finite level, the upper jumps of `G` are integers, so `G^u = G^{⌈u⌉}`.
    - For `n ≥ 1` and every finite level `M`, `Gal(M/K)^n / Gal(M/K)^{n+1}` is
      `G_j/G_{j+1}` for the lower index `j = ψ_{M/K}(n)`, which embeds in `k_M ⊆ k_L`
      (`ramificationGroupGradedToResidueField`). So `[G^n : G^{n+1}] ≤ q_L`.
    - `G^0` is open because the residue extension is finite, and `G^0/G^{0+}` embeds in `k_L^×`.
      So every `G^u` is open, and `L/K` is APF.
    - For `u ∈ (n, n+1]` with `n ≥ 1`, the index `(G^0 : G^u)` is `I_{n+1} = (G^0 : G^{n+1})`, while
      `ψ_{L/K}(u) ≥ ψ_{L/K}(n) ≥ I_n`. The ratio of 0.4 is therefore at least
      `I_n / I_{n+1} ≥ 1/q_L`.

    This covers the cyclotomic tower and every `ℤ_p`-extension with finite residue extension, in
    both characteristics.

### Layer 1: the field of norms

Let `L/K` be an infinite APF extension. `K_0` and `K_1` are its maximal unramified and maximal
tame subextensions, both finite (0.5).

- **1.1 The carrier** [Wintenberger 1983, 2.1.1]. `fieldOfNorms K L` is the submonoid of
  `∏_{E ∈ 𝓔_{L/K}} E` of norm-compatible families. A family with one zero coordinate is zero
  (`eq_zero_or_forall_ne_zero`), so `X_K(L) = X_K(L)^× ∪ {0}`, with `X_K(L)^× = lim E^×` as groups.
  Only the cofinal subsystems matter: for `𝓔' ⊆ 𝓔_{L/K}` cofinal, restriction is a bijection onto
  the norm-compatible families on `𝓔'`.
- **1.2 Valuation and residue field** [Wintenberger 1983, 2.1.2].
  - `v(α) = v_E(α_E)` for any `E ⊇ K_0`. It is independent of `E` by `normalizedValuation_norm`,
    because `f(E'/E) = 1` for `K_0 ⊆ E ⊆ E'` in `L`.
  - For `x` in the residue field `k_L = k_{K_0}`, `f_{L/K}(x) = (x_E)`, where `x_E` is the
    `[E : K_1]`-th root of the Teichmüller representative `[x]` for `E ⊇ K_1`. This is defined
    because `[E : K_1]` is a power of `p`. `f_{L/K}` is a multiplicative embedding of `k_L`.
- **1.3 The norm estimates** [Wintenberger 1983, Prop. 2.2.1, Lems. 2.2.2.1, 2.2.2.3]. Let `E'/E`
  be finite separable, nontrivial, totally ramified, of `p`-power degree, and `i = i(E'/E)`. Then:
  - (i) `v_E(N(α + β) − N(α) − N(β)) ≥ (p − 1) i / p` for `α, β ∈ 𝒪_{E'}`
    (`norm_add_sub_norm_sub_norm_mem` in the Galois case);
  - (ii) every `a ∈ 𝒪_E` satisfies `v_E(N(α) − a) ≥ (p − 1) i / p` for some `α ∈ 𝒪_{E'}`
    (`exists_norm_sub_mem`).

  The estimate is transitive in towers (Lem. 2.2.2.1), and the cyclic case of degree `p` is
  Lem. 2.2.2.3, where Tau Ceti's `exists_norm_one_add_eq_of_mem_maximalIdeal_pow` expands the
  norm.
  For non-Galois `E'/E`, `i(E'/E)` is read through `ψ_{E'/E}` of TauCetiProject/TauCetiRoadmap#1410
  §4a.2.
- **1.4 The ring `A_K(L)`** [Wintenberger 1983, 2.2.3–2.2.4].
  - For `E ∈ 𝓔_{L/K}`, let `r(E)` be the least integer `≥ (p − 1) i(L/E) / p`. The family
    `r(E)` is increasing and tends to `∞` (Lem. 2.2.3.1, from `i(L/K_n) = i(K_{n+1}/K_n) → ∞`
    along the elementary tower).
  - Fix an increasing integer family `0 < s(E) ≤ r(E)` with `s(E) → ∞`, and put
    `Ā_E = 𝒪_E / 𝔪_E^{s(E)}` for `E ⊇ K_1`. By 1.3(i), with 1.3(ii) for surjectivity, the norms
    induce surjective ring homomorphisms `Ā_{E'} → Ā_E`. `A_K(L) = lim Ā_E`.
  - `A_K(L)` is a ring of characteristic `p` (Prop. 2.2.4). For `a ≠ 0`, `w(a) = v_{E'}(â_{E'})` for
    any lifts `â_{E'}` and all `E'` containing some `E` with `a_E ≠ 0`. `w` is a surjective valuation
    onto `ℕ ∪ {∞}`, and `A_K(L)` is separated and complete for it. `f_{L/K}` induces an
    isomorphism of `k_L` onto its residue field.
  - The result does not depend on the choice of `s`.
- **1.5 The field structure** [Wintenberger 1983, Thm. 2.1.3, Prop. 2.3.1].
  - `ξ : 𝒪_{X_K(L)} → A_K(L)`, `α ↦ (ᾱ_E)`, is a bijection on the families with `v ≥ 0`. Its
    inverse is `η(a)_E = lim_{E'} N_{E'/E}(â_{E'})` for any lifts `â_{E'}`. The key estimate is
    Lem. 2.3.2.1: `v_{E'}(α − β) ≥ t` implies `v_E(N α − N β) ≥ φ_{E'/E}(t)`.
  - For `α, β ∈ X_K(L)` and `E ∈ 𝓔_{L/K}`, `N_{E'/E}(α_{E'} + β_{E'})` converges along `𝓔_{L/E}`
    to some `γ_E`, and `α + β = (γ_E)` is norm-compatible.
  - With this addition, `X_K(L)` is a field of characteristic `p`, complete for `v`, with
    `v(X_K(L)^×) = ℤ` and residue field `k_L` through `f_{L/K}`. `k_L` is finite, so `X_K(L)` is a
    nonarchimedean local field: `X_K(L)` carries `Field`, `ValuativeRel`, `TopologicalSpace` and
    `IsNonarchimedeanLocalField` instances.
  - A uniformizer is any `α` with `v(α) = 1`, and `X_K(L) ≅ k_L((α))`.
- **1.6 Change of base** [Wintenberger 1983, 2.1.4]. For `K' ∈ 𝓔_{L/K}`, `𝓔_{L/K'}` is cofinal in
  `𝓔_{L/K}`, and restriction identifies `X_K(L)` with `X_{K'}(L)` as valued fields. The residue
  embeddings differ by a Frobenius power: `f_{L/K'} = f_{L/K} ∘ σ^r`, where `p^r` is the largest
  power of `p` dividing `e(K'/K)` and `σ` is the absolute Frobenius of `k_L`.

### Layer 2: functoriality and Galois groups

Let `L, L'` be infinite APF extensions of `K`.

- **2.1 Finite embeddings** [Wintenberger 1983, 3.1.1–3.1.2]. Let `τ : L → L'` be a
  `K`-embedding with `L'/τL` finite separable, and `𝓔_τ` the set of `E' ∈ 𝓔_{L'/K}` with
  `τL ⊗_{τL ∩ E'} E' ≅ L'`, a cofinal subset. Then:
  - `X_K(τ)(α)_{E'} = τ(α_{τ^{-1}(τL ∩ E')})` for `E' ∈ 𝓔_τ` defines a continuous embedding
    `X_K(L) → X_K(L')`;
  - `X_K(L')` is finite separable over its image, of degree `[L' : τL]`;
  - `X_K` is a functor;
  - for `L'/τL` Galois, `σ ↦ X_K(σ)` identifies `Gal(L'/τL)` with the Galois group of
    `X_K(L')` over the image of `X_K(L)`.

  The faithfulness of the action (Lem. 3.1.3.1) comes from the residue field and a uniformizer.
- **2.2 The equivalence of categories** [Wintenberger 1983, 3.2.1–3.2.3].
  - For `M/L` separable algebraic, `X_{L/K}(M) = colim X_K(L')` over the finite subextensions `L'`
    of `M/L`. For finite `M/L`, `X_{L/K}(M) = X_K(M)`.
  - `X_{L/K}` is an equivalence from separable algebraic extensions of `L`, with
    `L`-embeddings, to separable algebraic extensions of `X_K(L)`, with `X_K(L)`-embeddings.
    Essential surjectivity is proved through discriminants [Wintenberger 1983, 3.2.5].
  - **Corollary.** `X̄ = X_{L/K}(K^sep)` is a separable closure of `X_K(L)`, and
    `Gal(K^sep/L) ≅ Gal(X̄/X_K(L))`. As topological groups, through 0.0 and Tau Ceti's
    `absoluteGaloisGroupRestrictEquiv`, which compares the separable and algebraic closure
    models:
    `Field.absoluteGaloisGroup L ≃ₜ* Field.absoluteGaloisGroup (X_K(L))`. This is the
    **field-of-norms isomorphism**, written `ι_{L/K}`.
- **2.3 Galois `L/K`** [Wintenberger 1983, 3.2.4, Cor. 3.3.4].
  - `Gal(L/K)` acts faithfully on `X_K(L)` by continuous automorphisms.
  - Its image is closed in `Aut(X_K(L))`, topologized by the lower filtration, and the two
    topologies on `Gal(L/K)` agree.
  - `G_K` is identified with the group of automorphisms of `X̄` that stabilize `X_K(L)` and
    induce on it an element of the image of `Gal(L/K)`.

### Layer 3: ramification

- **3.1 Lower indices on the field of norms** [Wintenberger 1983, Prop. 3.3.2]. For `L/K` APF and
  `σ` a `K`-automorphism of `L`, there is `E ∈ 𝓔_{L/K}` such that, for every `E' ⊇ E` in
  `𝓔_{L/K}` stable under `σ`, the lower index of `σ|_{E'}` equals that of `X_K(σ)` on `X_K(L)`.
- **3.2 The upper filtration of `Gal(L/K)`** [Wintenberger 1983, Cor. 3.3.4]. For `L/K` Galois
  APF and `u ≥ −1`:
  `Gal(L/K)^u = Gal(L/K)_{ψ_{L/K}(u)}`. The left side is the quotient filtration of
  TauCetiProject/TauCetiRoadmap#1795 Layer 2.1. The right side is the lower filtration of
  `Gal(L/K)` acting on `X_K(L)`.
- **3.3 The upper filtration above `L`** [Wintenberger 1983, Cor. 3.3.6]. For `M/K` Galois with
  `L ⊆ M`, `G = Gal(M/K)` and `H = Gal(M/L) ≅ Gal(X_{L/K}(M)/X_K(L))` (2.2), with `H` carrying the
  upper filtration of the extension `X_{L/K}(M)/X_K(L)` of a local field:
  `H^{ψ_{L/K}(u)} = G^u ∩ H` for every `u ≥ −1`. For `M/L` infinite, the upper filtration of `H` is
  the quotient filtration of `F_{X_K(L)}` (the filtered local Galois groups roadmap's Layer 2.1
  applied to the local field `X_K(L)`).
  **Absolute form.** `ι_{L/K}` carries `G_K(u) ∩ G_L` onto `G_{X_K(L)}(ψ_{L/K}(u))` for every
  `u ≥ −1`, with `G_L = L.fixingSubgroup` through 0.0. This is the case
  `M = separableClosure K (AlgebraicClosure K)`, which is Galois over `K` in every characteristic,
  read through `absoluteGaloisGroupRestrictEquiv K`.
- **3.4 Transitivity** [Wintenberger 1983, Prop. 3.4.1]. For `M/L` separable algebraic, `M/K` is
  APF iff `X_{L/K}(M)/X_K(L)` is. Then `X_K(M) ≅ X_{X_K(L)}(X_{L/K}(M))`, compatibly with the
  embeddings of 2.1 and with `ι`.

### Layer 4: full faithfulness

Following [Abrashkin 2010, §7.1], after [Wintenberger 1980]:

- **4.1 The category `Ψ`.**
  - Objects: pairs `L/K` with `K/ℚ_p` finite and `L ⊆ K(p)` an infinite Galois extension, where
    `K(p)` is the maximal `p`-extension of `K` in `AlgebraicClosure K`. `Gal(L/K)` is a `p`-adic
    Lie group, and `L/K` is strictly APF.
  - Morphisms `L/K → L'/K'`: continuous field embeddings `f : L → L'` with `[L' : f(L)] < ∞` and
    `f|_K : K ≅ K'`.
  - A `p`-adic Lie group is a topological group admitting a charted-space structure modelled on
    `ℚ_p^d`, for some `d`, with Mathlib's `LieGroup 𝓘(ℚ_p, ℚ_p^d) ω`. Strict APF is an explicit
    condition because Sen's theorem is not owned here (*Scope*).
- **4.2 The category `Ψ̃`.**
  - Objects: pairs `(𝒳, G)` with `𝒳` a nonarchimedean local field of characteristic `p`, and `G` a
    closed subgroup of the group of continuous automorphisms of `𝒳` (topology of 2.3), compact
    and a `p`-adic Lie group.
  - Morphisms `(𝒳, G) → (𝒳', G')`: closed field embeddings `g : 𝒳 → 𝒳'` such that `𝒳'` is finite
    separable over `g(𝒳)`, `g(𝒳)` is `G'`-stable, and restriction `G' → G` is surjective.
- **4.3 The functor `Φ`.**
  - On objects, `Φ(L/K) = (X_K(L), {X_K(τ) : τ ∈ Gal(L/K)})`, which is an object of `Ψ̃` by 2.3.
  - On morphisms, `Φ(f)` is the transport `X_K(L) ≅ X_{K'}(f(L))` along `f`, followed by
    `X_{K'}` of the inclusion `f(L) ⊆ L'` (2.1). It lies in `Ψ̃` by 2.1 and 2.3.
- **4.4 Full faithfulness** [Wintenberger 1980]. For objects `L/K` and `L'/K'` of `Ψ`,
  `f ↦ Φ(f)` is a bijection from the morphisms `L/K → L'/K'` to the morphisms
  `Φ(L/K) → Φ(L'/K')`.

### Layer 5: comparison with tilting

Let `L/K` be an infinite strictly APF extension, `L̂` the completion of `L`, and `M/L` separable
algebraic with completion `M̂`.

- **5.0 Tilts as sequences.** For a complete valued field `E` of residue characteristic `p` with
  `𝒪_E` `p`-adically complete, `x ↦ ((x^{1/p^n})^♯)_n` is a multiplicative bijection from
  Mathlib's `Tilt` of `E` onto the sequences `(x_n)` in `E` with `x_{n+1}^p = x_n`. It is built from
  `PreTilt.untilt` and carries the field operations to the termwise product and the limit sum of
  the conventions. For a perfectoid `E` it agrees with the perfectoid spaces roadmap's P1 sharp
  map.
- **5.1 The embedding into the tilt** [Wintenberger 1983, Prop. 4.2.1, Lem. 4.2.2.1].
  - For `E'/E` a totally ramified `p`-extension, `v_E(N_{E'/E}(α)/α^{[E' : E]} − 1) ≥ c(E'/E)`
    for every `α ∈ E'^×`.
  - Hence, for `α ∈ X_K(L)` and `n ≥ 0`, `α_E^{[E : K_1]/p^n}` converges along the `E ∈ 𝓔_{L/K}`
    with `p^n ∣ [E : K_1]` to some `x_n ∈ L̂`.
  - `Λ_{L/K}(α) = (x_n)_n` lies in `R(L̂)`, and `Λ_{L/K} : X_K(L) → R(L̂)` is a continuous field
    embedding.
- **5.2 The completed perfection** [Wintenberger 1983, Thm. 4.3.2, Cor. 4.3.4].
  - `Λ` extends to `Λ_{M/L/K}` on the completed perfection `X_{L/K}(M)^{perf,∧}`.
  - In characteristic `0`, the composite `𝒪_{X^{perf,∧}} → 𝒪_{R(M̂)} → 𝒪_{M̂}/p`, the second map
    `x ↦ x_0 mod p`, is surjective [Wintenberger 1983, Thm. 4.3.2].
  - `Λ_{M/L/K}` is an isomorphism `X_{L/K}(M)^{perf,∧} ≅ R(M̂)` [Wintenberger 1983, Cor. 4.3.4]:
    `𝒪_{R(M̂)} = lim 𝒪_{M̂}/p` along Frobenius, and the surjectivity above holds at every stage.
  - **Characteristic `p`** [Wintenberger 1983, Cor. 4.3.4, from 4.3.3]. `M̂` is perfect, and
    `x ↦ x_0` is an isomorphism `R(M̂) ≅ M̂`. For `L'` finite over `L` and `γ` as in 4.3.3.1, every
    `t ∈ 𝒪_{L'}` is congruent modulo `{v ≥ γ}` to `Λ(a)_0` for some `a ∈ 𝒪_{X^{perf,∧}}` (4.3.3.1).
    Iterating with an element `β` of small positive valuation (4.3.3.2) gives `a_r` with
    `v(t − Λ(a_r)_0) ≥ γ + r·v(β)` and `a_{r+1} − a_r → 0`. In characteristic `p` there is no
    bound `v(p)` to stop at, so `a = lim a_r` exists in the complete `𝒪_{X^{perf,∧}}` and
    `t = Λ(a)_0`. Passing to `M = ⋃ L'` and completing, `x ↦ x_0` maps `R(M̂)` onto `M̂`. By
    [Wintenberger 1983, Rem. 4.1.3.3] this map identifies `R(E)` with the largest perfect subfield
    of a complete `E` of characteristic `p`, so that subfield is `M̂`.
  - In characteristic `0`, `W(𝒪_{R(M̂)}) → 𝒪_{M̂}` is surjective. Its kernel is principal, by
    the perfectoid spaces roadmap's P1 (the kernel of `θ`) [Wintenberger 1983, Prop. 4.3.7].
- **5.3 Perfectoidness.** In characteristic `0`, `L̂` is a perfectoid field by P1.11's criterion,
  the hypotheses of `Perfectoid.fontaineWintenberger_nonempty` for `L̂` with the norm of the
  conventions.
  - Frobenius is surjective on `𝒪_{L̂}/p`, by the characteristic-`0` surjectivity in 5.2 with
    `M = L`.
  - The value group is not discrete, because `e(E/K)` is unbounded on `𝓔_{L/K}`.
  - So `X_K(L)^{perf,∧} ≅ L̂♭`.
- **5.4 Agreement with Fontaine–Wintenberger.** In characteristic `0`, the following composite is
  `Perfectoid.fontaineWintenberger` for `L̂`, preceded by the restriction isomorphism `G_L ≅ G_{L̂}`
  and followed by the identification of `G_{L̂♭}` with `G_{X_K(L)}` along 5.3:
  - `ι_{L/K}`;
  - then the isomorphism `G_{X_K(L)} ≅ G_{X_K(L)^{perf,∧}}`, given by the insensitivity of finite
    separable extensions to completed perfection;
  - then 5.3.

  Both sides are determined by their action on `R(M̂)` for finite `M/L`. That action is
  coordinatewise for `Perfectoid.fontaineWintenberger`, and through `Λ_{M/L/K}` and 2.1 for the
  composite.

## Worked examples (acceptance criteria)

- **Finite extensions.** For `L/K` finite, `𝓔_{L/K}` has greatest element `L` and
  `fieldOfNorms K L ≅ L` multiplicatively. Layer 1 needs `L/K` infinite. `ψ_{L/K}` is the
  `ψ_{L/K}` of TauCetiProject/TauCetiRoadmap#1410 §4a.2, and `i(L/K)` for `L/K` Galois is the least upper jump.
- **The maximal unramified extension is not APF** (0.1). `G_K(0)·G_{K^ur} = G_{K^ur}` has infinite
  index, matching its infinite residue extension.
- **Cyclotomic tower.** `K = ℚ_p`, `L = ℚ_p(μ_{p^∞})`.
  - `L/K` is abelian with finite residue extension, so strictly APF (0.6).
  - By the filtered local Galois groups roadmap's worked example, `Gal(L/K)^u = 1 + p^n ℤ_p` for
    `n − 1 < u ≤ n`, `n ≥ 1`, and `Gal(L/K)` for `u ≤ 0`. So `(G_K^0 : G_L^0 G_K(u)) = (p − 1)p^{n−1}`
    on `(n − 1, n]`, and `ψ_{L/K}(n) = p^n − 1`.
  - `π = (1 − ζ_{p^n})_n`, on the cofinal tower `ℚ_p(μ_{p^n})`, `n ≥ 1`, is norm-compatible
    (`norm_one_sub_of_minpoly_eq` with minimal polynomial `X^p − ζ_{p^n}`).
  - `v(π) = v_{ℚ_p(μ_p)}(1 − ζ_p) = 1`, which for `p = 2` reads `v_{ℚ_2}(2) = 1`. So
    `X_{ℚ_p}(L) ≅ 𝔽_p((π))`.
  - By 3.2, for `γ` with `χ_cyc(γ) ∈ (1 + p^n ℤ_p) ∖ (1 + p^{n+1} ℤ_p)`, `n ≥ 1`, the lower index
    of `X_K(γ)` is `ψ_{L/K}(n) + 1 = p^n`. Equivalently, `v(γπ − π) = p^n`.
- **Kummer tower.** `K = ℚ_p`, `p` odd, `L = ℚ_p(p^{1/p^∞})`. The elementary tower is
  `K_0 = K_1 = ℚ_p` and `K_n = ℚ_p(p^{1/p^{n−1}})` for `n ≥ 1`.
  - `K_{n+1}/K_n` is elementary of level `i_n = v_{K_{n+1}}(ζ_p − 1) = p^n/(p − 1)`, because every
    nontrivial embedding sends `p^{1/p^n}` to `ζ p^{1/p^n}` with `ζ ∈ μ_p`.
  - The levels increase strictly, so by 0.5 this is the elementary tower.
  - `[K_{n+1} : K] = p^n`, so `c(L/K) = inf_n (p^n/(p − 1)) / p^n = 1/(p − 1) > 0`, and `L/K` is
    strictly APF. It is not Galois.
  - `t = (p^{1/p^n})_n` is norm-compatible, since the minimal polynomial `X^p − p^{1/p^n}` has
    constant term `−p^{1/p^n}` and `p` is odd. `v(t) = 1` and `X_{ℚ_p}(L) ≅ 𝔽_p((t))`.
  - `Λ_{L/K}(t) = (p, p^{1/p}, p^{1/p²}, …)`, the element `t` with `t^♯ = p` of the perfectoid
    spaces roadmap's check `fontaine_wintenberger_test_kummer_tower`. Through 5.4, that check's
    `G_{ℚ_p(p^{1/p^∞})} ≅ G_{𝔽_p((t))}` is `ι_{L/K}`.
- **Change of base.** For the cyclotomic tower and `K' = ℚ_p(μ_p)`, `p` odd,
  `X_{ℚ_p}(L) = X_{K'}(L)` (1.6). `e(K'/ℚ_p) = p − 1` is prime to `p`, so `f_{L/K'} = f_{L/K}`.

## Ordering

Layer 0 needs the filtered local Galois groups roadmap's Layers 1–2 and
TauCetiProject/TauCetiRoadmap#1410 §§4a.1–4a.2. Layer 1 needs Layer 0. Layers 2 and 3 need Layer 1, and
Layer 3 also needs 2.1–2.2. Layer 4 needs Layers 2 and 3. Layer 5 needs Layer 2, the strictly APF
part of Layer 0, and the perfectoid spaces roadmap's P1 and P3.8. Layers 4 and 5 are independent.
The anabelian roadmaps consume 2.2, 3.3 and Layer 4.

## References

- J.-P. Wintenberger, *Le corps des normes de certaines extensions infinies de corps locaux;
  applications*, Ann. Sci. ÉNS (4) **16** (1983), 59–89 — §1 (APF extensions, 1.2.1–1.4.2), §2
  (Thm. 2.1.3, Props. 2.2.1, 2.2.4, 2.3.1), §3 (Thms. 3.1.2, 3.2.2, Cors. 3.2.3, 3.3.4, 3.3.6,
  Prop. 3.4.1), §4 (Props. 4.2.1, 4.3.7, Thm. 4.3.2, Cor. 4.3.4).
- J.-P. Wintenberger, *Extensions abéliennes et groupes d'automorphismes de corps locaux*, C. R.
  Acad. Sci. Paris Sér. A **290** (1980), 201–203 — full faithfulness of the field-of-norms
  functor.
- J.-M. Fontaine and J.-P. Wintenberger, *Le "corps des normes" de certaines extensions
  algébriques de corps locaux* and *Extensions algébriques et corps des normes des extensions APF
  des corps locaux*, C. R. Acad. Sci. Paris Sér. A **288** (1979), 367–370 and 441–444.
- V. Abrashkin, *Modified proof of a local analogue of the Grothendieck conjecture*, J. Théor.
  Nombres Bordeaux **22** (2010), 1–50 — §7.1 (the categories `Ψ`, `Ψ̃` and the functor `Φ`).
- S. Sen, *Ramification in p-adic Lie extensions*, Invent. Math. **17** (1972), 44–50 — the
  strictly APF property of `p`-adic Lie extensions, not owned here.
- J.-P. Serre, *Local Fields*, GTM 67 — IV (Herbrand functions), V §3 (norms in cyclic
  extensions of degree `p`).
- P. Scholze, *Perfectoid spaces*, Publ. Math. IHÉS **116** (2012) — §3 (Thm. 3.7), the
  perfectoid form of the Fontaine–Wintenberger theorem, compared in 5.4.
