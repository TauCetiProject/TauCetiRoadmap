# Roadmap: mean field and belief propagation

**Summary.** This roadmap proves the exact theorems behind naive mean field and belief
propagation with its Bethe free entropy. Variables are indexed by a finite set `V` and take
values in finite sets; a law is a nonnegative function `p` of the configuration, not necessarily
normalised, and `Z = Σ_x p(x)`.

The headline theorems are these.

- *Coordinate ascent for naive mean field.* Let `p(x) > 0` for every `x` and let
  `q = ⊗_v q_v` be a product law. Replacing the factor `q_v` by the law proportional to
  `exp E[log p(a, X_{−v})]`, the expectation taken over the other factors, raises the evidence
  lower bound by exactly the relative entropy of `q_v` from the new factor, and the new factor is
  the only best one. Along sweeps through a list containing every vertex the bound never
  decreases and stays at most `log Z`, and every limit point of the iterates is fixed by every
  coordinate update; such a fixed point need not be a local maximum.
- *Mean field for Ising models.* For the law `exp(−H)` of an Ising energy with couplings `J` and
  fields `h`, the product laws fixed by every coordinate update are those whose spin means solve
  `m_i = −tanh(h_i + Σ_{j ≠ i} (J_ij + J_ji) m_j)`. For the Curie–Weiss model on `N` spins the
  best bound over product laws, divided by `N`, tends to the pressure, for all real `β` and `h`.
- *Belief propagation on trees.* For a pairwise model with nonnegative potentials on a finite
  tree of diameter `D`, from any nonnegative initial messages and after any `t ≥ D` parallel
  sum-product steps with unnormalised messages, the belief at every vertex and on every edge is
  the corresponding margin of the law, and the messages along edges no longer change. A law of
  total mass one that is globally Markov for a forest satisfies the tree factorisation in a form
  without division, which stays true where margins vanish.
- *The Bethe free entropy.* On a finite tree every locally consistent family of vertex and edge
  tables is the family of margins of a probability law, and with positive potentials the Bethe
  free entropy on this local polytope is at most `log Z`, with equality exactly at the normalised
  margins of the law. On every finite graph with positive potentials and variables that take at
  least one value, the normalised beliefs of the fixed points of belief propagation (messages
  fixed up to positive factors) are exactly the interior stationary points of the Bethe free
  entropy on the local polytope.

It builds on GraphicalModelsAndConditionalIndependence (margins and the global Markov
property), EvidenceLowerBound (the evidence lower bound) and CurieWeissModel (the pressure and
the limit of the free energy).

Layer 1 treats naive mean field, Layer 2 the tree factorisation and belief propagation on trees,
and Layer 3, which uses Layer 2, the Bethe free entropy.

## Conventions

- **Carrier.** `V` is a finite type with decidable equality; the variable at `v` takes values in
  a finite type `X v`; configurations are `x : ∀ v, X v`. A law is `p : (∀ v, X v) → ℝ≥0`, and
  `margin p A x` is the total mass of the configurations that agree with `x` on `A`
  (GraphicalModelsAndConditionalIndependence 1.1, copied). Margins are unnormalised: their total
  is `Z`.
- **Measures.** For Layer 1 every `X v` carries a σ-algebra with measurable singletons (so every
  set of configurations is measurable). `lawMeasure p = Σ_x p(x) δ_x`, and for a family `q` of
  probability vectors, `productLaw q` gives `x` the mass `Π_v q v (x v)`. The evidence lower bound
  is `elbo P Q = ∫ log (dP/dQ) dQ` with the importance weight `isWeight` (EvidenceLowerBound 1.3 and
  ImportanceSamplingAndVarianceReduction 1.1, both copied). The product of the probability
  simplices is `productSimplex`, the set of families `q` with `q v a ≥ 0` and `Σ_a q v a = 1`.
- **Junk values.** Mathlib's `Real.log 0 = 0`. Every statement of Layer 1 assumes `p(x) > 0` for
  every `x`, and every statement of Layer 3 that involves `log` of a potential assumes the
  potentials positive; Checks of 1.1, 3.2 and 3.3 show what fails otherwise. Entropies use
  `Real.negMulLog`, which is `0` at `0`.
- **Graphs.** `G : SimpleGraph V` with decidable adjacency; `G.neighborFinset v`, `G.degree v`,
  `G.edgeFinset` and, for an edge `e`, its two-element vertex set `e.toFinset`. A forest is
  `G.IsAcyclic`; a tree is `G.IsTree` (connected and acyclic, so `V` is nonempty), and
  `G.diam` is then the largest distance between two vertices (`0` for one vertex).
- **Pairwise models.** Vertex potentials `ψ v : X v → ℝ≥0` and, for every ordered pair `(u, v)`,
  a factor `φ u v : X u → X v → ℝ≥0`. The potential of the edge `uv` is
  `edgePot φ u v a b = φ u v a b · φ v u b a`, symmetric under exchanging `(u, a)` and `(v, b)`,
  and `pairwiseLaw G ψ φ x = Π_v ψ v (x v) · Π_{G.Adj u v} φ u v (x u) (x v)`, the product over
  ordered adjacent pairs, which is `Π_v ψ_v · Π_{uv ∈ E} edgePot`. Every symmetric family of edge
  potentials arises, by putting it on one orientation of each edge and `1` on the other.
- **Messages.** `m u v : X v → ℝ≥0` is the message from `u` to `v`. Messages are unnormalised: a
  normalising constant can be `0` when potentials vanish, and the sources' normalised messages
  are then undefined. The update also produces messages between non-adjacent vertices; no
  statement reads them.
- **Spins.** For Ising models the variables are `Bool`; `spin x i` is `−1` when `x i` is true and
  `1` otherwise, and `ising J h x = Σ_{i,j} J i j · spin x i · spin x j + Σ_i h i · spin x i`, the
  couplings summed over ordered pairs, the diagonal included (QuantumOptimization 1.1, copied).

## Layer 1: naive mean field

### 1.1 The coordinate update and its exact gain

Define `productSimplex`, `lawMeasure` and `productLaw` (Conventions), and

    expectedLog p q v a = Σ_y (Π_w (Function.update q v (Pi.single a 1)) w (y w)) · log p(y),

the expectation of `log p` when the coordinates other than `v` are drawn from `q` and the
coordinate `v` is `a`;
`caviCoord p q v a = exp (expectedLog p q v a) / Σ_b exp (expectedLog p q v b)`, the
coordinate-ascent update of the factor at `v`; and `caviUpdate p q v`, the family `q` with its
factor at `v` replaced by `caviCoord p q v`.

Prove `elbo_caviUpdate_sub_elbo`: let `p(x) > 0` for every `x`, `q ∈ productSimplex` and `v ∈ V`,
and write `P = lawMeasure p`. Then, with `Q{x} = Π_w q w (x w)`,

    elbo P (productLaw q) = Σ_x Q{x} · log p(x) + Σ_x negMulLog (Q{x}),

and

    elbo P (productLaw (caviUpdate p q v)) − elbo P (productLaw q)
      = Σ_a q v a · log (q v a / caviCoord p q v a),

the relative entropy of `q v` from the update, and for every probability vector `r` on `X v`,
`elbo P (productLaw (update q v r)) ≤ elbo P (productLaw (caviUpdate p q v))` with equality
exactly when `r = caviCoord p q v` (Blei–Kucukelbir–McAuliffe, eq. (18), p. 9, and its derivation
eq. (19), p. 10, which give the gain up to an additive constant; Wainwright–Jordan, Example 5.2,
(5.17), p. 135, for the binary pairwise case). (Proved here: the formula at atoms and the exact
identity.)

Route:

- *The bound at atoms.* For `Q = productLaw q` with `q ∈ productSimplex`, `Q {x} > 0` forces
  `(dP/dQ)(x) = p(x) / Q {x}`: the Lebesgue decomposition `P = P_s + Q.withDensity (dP/dQ)`
  (Mathlib `Measure.haveLebesgueDecomposition_add`) evaluated on the measurable singleton `{x}`,
  with `P_s {x} = 0` because `P_s` is carried by a `Q`-null set
  (`Measure.mutuallySingular_singularPart`). By `MeasureTheory.integral_fintype`,
  `elbo P Q = Σ_x Q{x} log p(x) + Σ_x negMulLog (Q{x})`, the terms with `Q{x} = 0` being `0`:
  this is the first claim.
- *Separating the factor at `v`.* With `Q{x} = Π_w q w (x w)`, the first sum is
  `Σ_a q v a · expectedLog p q v a`, and by `Real.negMulLog_mul` the second is
  `Σ_w Σ_a negMulLog (q w a)`. Writing `c a = expectedLog p q v a`, `S = Σ_b exp (c b)` and
  `q* = caviCoord p q v`, so that `c a = log q* a + log S`, this gives
  `elbo P Q = log S − Σ_a q v a log (q v a / q* a) + R` with `R` independent of `q v`.
- `expectedLog p (update q v r) v = expectedLog p q v`, since the factor at `v` is overwritten
  (`Function.update_idem`). Applying the identity to `update q v r` and to `caviUpdate p q v`
  gives the gain. The relative entropy of a probability vector from `q* > 0` is `≥ 0`, and `0`
  only for `q*` (Mathlib `Real.log_le_sub_one_of_pos`, strictly by `Real.add_one_lt_exp`).

**Checks.**

- `V = {1, 2}`, `X v = {0, 1}`, `p = (1, 1, 1, 4)` on `(0,0), (0,1), (1,0), (1,1)`, `q` uniform:
  the expected log-laws at `v = 1` are `0` and `log 2`, so the update is `(1/3, 2/3)` and the
  gain is `½ log(3/2) + ½ log(3/4) = log 3 − (3/2) log 2`.
- The formula of the first claim: for `q` uniform and `p ≡ 1` on two binary variables,
  `elbo P Q = log 1 + 2 log 2 = 2 log 2`, the entropy of `Q`.
- Positivity is needed: for `p = (1, 1, 1, 0)` and `q 2` uniform, `log 0 = 0` makes both expected
  log-laws `0`, so the update is uniform; but with `q 1 = (r, 1 − r)` the bound is
  `r log(2/r) + ((1 − r)/2) log(2/(1 − r))`, whose derivative at `r = ½` is `log 2 − ½ > 0`, so the
  update is not the maximiser.
- Measurable singletons are needed: with the trivial σ-algebra on each `X v` every measure on
  configurations is determined by its total mass, `elbo P Q = log Z` for every `q`, and the gain
  of the first Check would be `0`, not `log 3 − (3/2) log 2`.

*Needs:* GraphicalModelsAndConditionalIndependence (carrier only); EvidenceLowerBound 1.3
`elbo`; ImportanceSamplingAndVarianceReduction 1.1 `isWeight`; Mathlib
`Measure.haveLebesgueDecomposition_add`, `Measure.mutuallySingular_singularPart`,
`MeasureTheory.integral_fintype`, `Real.negMulLog_mul`, `Function.update_idem`,
`Real.log_le_sub_one_of_pos`, `Real.add_one_lt_exp`.

### 1.2 Sweeps: monotonicity, fixed points and limit points

Define `caviSweep p l q`, the coordinate updates at the vertices of the list `l`, in order.

Prove `caviSweep_iterate`: let `p(x) > 0` for every `x`, let `l` contain every vertex (repetitions
allowed) and `q₀ ∈ productSimplex`, and let `q_k` be the `k`-th iterate of `caviSweep p l` from
`q₀`.
Then

- `k ↦ elbo P (productLaw q_k)` is nondecreasing and bounded by `log Z`;
- for `q ∈ productSimplex`, `caviSweep p l q = q` exactly when `caviCoord p q v = q v` for
  every `v`;
- the sequence `(q_k)` has a limit point, and every limit point `q` lies in `productSimplex` and
  satisfies `caviCoord p q v = q v` for every `v`.

(Wainwright–Jordan, Example 5.2, p. 136, citing known results on coordinate ascent, and
Blei–Kucukelbir–McAuliffe, p. 10, state that the iterates converge to a local optimum; that is
false in general, see the second Check.) (Proved here.)

Route:

- Monotonicity is 1.1 applied at each update. The bound by `log Z` is the evidence lower bound
  inequality for finite sets, proved inline: by the formula of 1.1,
  `elbo P Q − log Z = Σ_{Q{x} > 0} Q{x} log (p(x) / (Z Q{x})) ≤ Σ_{Q{x} > 0} (p(x)/Z − Q{x}) ≤ 0`
  (`Real.log_le_sub_one_of_pos`).
- Fixed points: if `caviSweep p l q = q`, the gains of the successive updates are nonnegative and
  sum to `0`, so each is `0`; by the equality case of 1.1 each update leaves the family unchanged,
  so every factor of a vertex of `l`, that is every factor, equals its update. The converse is
  immediate.
- Limit points: `productSimplex` is compact (`isCompact_univ_pi`) and contains every iterate, so a
  limit point exists (`IsCompact.exists_mapClusterPt`) and lies in it. The update `caviCoord` is
  continuous in `q` (polynomial expected log-laws, positive normaliser), hence so is
  `caviSweep p l`, and `q ↦ elbo P (productLaw q)` is continuous on `productSimplex` by the formula
  of 1.1 (`Real.continuous_negMulLog`). The values converge to their supremum `L`; along a
  subsequence `q_{k_j} → q` (`MapClusterPt.tendsto_subseq`), and
  `elbo P (productLaw (caviSweep p l q)) = lim elbo P (productLaw q_{k_j + 1})`, which is
  `L = elbo P (productLaw q)`.
  So the sweep from `q` gains nothing, and the fixed-point step applies.

**Checks.**

- `l` must contain every vertex: for `l` empty the sweep is the identity, so every family is
  fixed, while the uniform family of the first Check of 1.1 is not fixed by the update at `1`.
- A fixed point that is not a local maximum: two spins with `J 1 2 = J 2 1 = −1`, all other
  couplings and both fields `0`, and `p = exp(−ising J h) = exp(2 σ₁ σ₂)`. The uniform product law
  (spin means `0`) solves the equations of 1.3, so a sweep started there never moves. By the
  formula of 1.1, the product law with spin means `(m₁, m₂)` has bound
  `2 m₁ m₂ + s(m₁) + s(m₂)` with `s(m) = binEntropy ((1 + m)/2)`, and
  `s(m) = log 2 − m²/2 − O(m⁴)`. Along the means `(t, t)` the bound exceeds its value at `(0, 0)`
  by `t² − O(t⁴)`, and along `(t, −t)` it falls short by `3t² + O(t⁴)`: the fixed point is a
  saddle of the bound. At `t = ½` the two differences are `½ + 2 log 2 − (3/2) log 3`, positive
  because `16 e > 27`, and `½ − 2 log 2 + (3/2) log 3 > 0`.

*Needs:* 1.1; Mathlib `isCompact_univ_pi`, `IsCompact.exists_mapClusterPt`,
`MapClusterPt.tendsto_subseq`, `Real.continuous_negMulLog`, `Real.log_le_sub_one_of_pos`.

### 1.3 Ising models and the Curie–Weiss limit

Copy `spin` and `ising` (QuantumOptimization 1.1) and `cwEnergy`, `freeEnergy` and `pressure`
(CurieWeissModel 1.1 and 1.2): `cwEnergy N β h = ising J (fun _ ↦ −h)` with `J i j = −β/(2N)` for
all ordered pairs, `freeEnergy β m = −β m²/2 − binEntropy ((1 + m)/2)`, and
`pressure β h = sSup ((fun m ↦ h m − freeEnergy β m) '' [−1, 1])`. For `q : ι → Bool → ℝ` define
`spinMean q i = q i false − q i true`.

Prove:

- `caviCoord_ising_eq_iff`: for a finite type `ι`, `J : Matrix ι ι ℝ`, `h : ι → ℝ` and
  `q ∈ productSimplex` on `ι → Bool`, with `p = exp(−ising J h)`, every factor of `q` equals its
  update exactly when `spinMean q i = −tanh(h i + Σ_{j ≠ i} (J i j + J j i) · spinMean q j)` for
  every `i` (Wainwright–Jordan, Example 5.2, (5.16)–(5.17), p. 135, in `{0, 1}` variables);
- `tendsto_sSup_elbo_productLaw_cwEnergy_div`: for all real `β` and `h`, the supremum of
  `elbo (lawMeasure (exp(−cwEnergy N β h))) (productLaw q)` over `q ∈ productSimplex`, divided by
  `N`, tends to `pressure β h` (Wainwright–Jordan, p. 136, assert asymptotic exactness for the
  ferromagnetic complete graph, citing Baxter, without proof). (Proved here, for all real `β`
  and `h`.)

Route for the equations: `log p = −ising J h`. Fixing `x i = b` and averaging the other spins
under `q`, the only term of `−ising` that depends on `b` is
`−spin(b) · (h i + Σ_{j ≠ i} (J i j + J j i) m_j)` with `m_j = spinMean q j`, since
`spin(b)² = 1` makes the diagonal term constant. So `caviCoord p q i b` is proportional to
`exp(−spin(b) c_i)` with `c_i = h i + Σ_{j ≠ i} (J i j + J j i) m_j`, its spin mean is `−tanh c_i`
(`Real.tanh_eq`), and a probability vector on `Bool` is determined by its spin mean.

Route for the limit, with `g(m) = h m − freeEnergy β m`:

- Upper bound: `elbo ≤ log Z_N` for every product law (1.2 at `k = 0`, with `q₀` that product
  law and `l` a list of all vertices), where
  `Z_N = Σ_x exp(−cwEnergy N β h x)` is CurieWeissModel's `partitionFunction N β h`, and
  `(1/N) log Z_N → pressure β h` (CurieWeissModel 3.1, `tendsto_log_partitionFunction_div`).
- Lower bound: for the product law of `N` spins of mean `m ∈ [−1, 1]`, `E[M²] = N²m² + N(1 − m²)`
  with `M = Σ_i spin x i`, so the formula of 1.1 gives `elbo = N g(m) + β(1 − m²)/2` (the same
  value is computed, for the Gibbs functional `E_q[−H] + Ent(q)`, in a Check of CurieWeissModel
  3.1, which is not a target there; the computation is the two lines above). Taking
  `m` with `g(m) = pressure β h` (`g` is continuous by `Real.binEntropy_continuous`, so
  `IsCompact.exists_isMaxOn` applies and the supremum of the image is attained), the supremum
  over product laws is at least `N pressure β h − |β|/2`.
- The supremum is finite by the upper bound (`le_csSup`, `csSup_le`), and the two bounds squeeze
  (`tendsto_of_tendsto_of_tendsto_of_le_of_le'`).

**Checks.**

- Curie–Weiss: `J i j + J j i = −β/N` and the field is `−h`, so the equations read
  `m_i = tanh((β/N) Σ_{j ≠ i} m_j + h)`; on spin means all equal to `m` this is
  `m = tanh(β (N − 1) m / N + h)`, not CurieWeissModel's `tanh(β m + h)`: the diagonal of the
  ordered-pair sum is constant and drops out.
- At `J = 0`, `p` is proportional to `exp(2 Σ_i h i · x_i)` in the `{0, 1}` variables
  `x_i = (1 − spin_i)/2`, and both the equation here and Wainwright–Jordan's
  `μ_i = σ(θ_i + Σ_j θ_ij μ_j)` with `θ_i = 2 h i` say that `q i true = σ(2 h i)`, that is, `q i`
  is proportional to `(e^{−h i}, e^{h i})` on `(false, true)`.
- At `β = 0` the bound is attained exactly: the Curie–Weiss law is the product law of spin mean
  `tanh h`, and `elbo = N log(2 cosh h) = log Z_N = N pressure 0 h`.

*Needs:* 1.1, 1.2 (the bound at `k = 0`); QuantumOptimization 1.1 `spin`, `ising`;
CurieWeissModel 1.1 `cwEnergy`, `partitionFunction`, 1.2 `freeEnergy`, `pressure`, 3.1
`TauCetiRoadmap.CurieWeissModel.tendsto_log_partitionFunction_div`; Mathlib `Real.tanh_eq`,
`Real.binEntropy`, `Real.binEntropy_continuous`, `IsCompact.exists_isMaxOn`, `le_csSup`,
`csSup_le`, `tendsto_of_tendsto_of_tendsto_of_le_of_le'`.

### Examples

- The two-spin model of the second Check of 1.2 (`p = exp(2 σ₁ σ₂)`, a ferromagnetic coupling)
  has three solutions of the equations of 1.3 on the diagonal `m₁ = m₂ = m`, namely `m = 0` and
  `m = ±m*` with `m* = tanh(2 m*)`. In the spin means the bound has Hessian with diagonal entries
  `−1/(1 − m²)` and off-diagonal entries `2`; at `±m*` it is negative definite because
  `m* > √3/2` (as `tanh √3 > √3/2`), so `1 − m*² < 1/4 < 1/2`: the two outer solutions are local
  maxima of the bound, and the middle one is the saddle.

### Dependencies

1.1 uses EvidenceLowerBound 1.3 and ImportanceSamplingAndVarianceReduction 1.1 (definitions);
1.2 uses 1.1; 1.3 uses 1.1, 1.2, QuantumOptimization 1.1 and CurieWeissModel 1.1, 1.2 and 3.1.

## Layer 2: trees

### 2.1 The tree factorisation of a Markov law

Copy `CondIndep`, `Separates` and `IsGlobalMarkov` (GraphicalModelsAndConditionalIndependence
1.1, 2.1, 2.2). Prove `margin_mul_prod_pow_eq_prod`: let `G` be a forest, `p` a law with
`Σ_x p x = 1` that is globally Markov for `G`, and write `p_v = margin p {v}`,
`p_e = margin p e.toFinset`. Then for every configuration `x`,

    p(x) · Π_v p_v(x)^(deg v − 1) = Π_{e ∈ E} p_e(x) · Π_{v : deg v = 0} p_v(x),

with natural-number exponents (`deg v − 1` is `0` at isolated vertices, which appear on the right
instead) (Mézard–Montanari, Theorem 14.2, p. 298, proof by induction on the factors, for tree
factor graphs; Wainwright–Jordan, (4.8), p. 79, with the convention `0/0 = 0`). (Proved here:
the division-free form for globally Markov laws on forests.) By
GraphicalModelsAndConditionalIndependence 2.3 (`Factorizes.isGlobalMarkov`) it applies to every
law that factorizes according to `G`, in particular to every pairwise law of 2.2 normalised to
mass `1`.

Route (leaf stripping inside a component): call a set `W` of vertices a subtree if `G` restricted
to `W` is connected. For a subtree `W` and a vertex `v ∈ W` with exactly one neighbour `u` in
`W`, every walk from `v` to a vertex of `W \ {u, v}` visits `u`: the unique path of the forest
between them lies in `W` (Mathlib `SimpleGraph.IsAcyclic.subsingleton_path`) and is contained in
the support of every walk (`SimpleGraph.Walk.bypass`,
`SimpleGraph.Walk.support_bypass_subset_support`). So `{u}` separates `{v}` from `W \ {u, v}`,
and the global Markov property gives
`p_u(x) · margin p W x = p_uv(x) · margin p (W \ {v}) x`. Prove by induction on `|W|` that
`margin p W x · Π_{w ∈ W} p_w(x)^(deg_W w − 1)` equals the product of `p_e(x)` over the edges inside
`W` when `|W| ≥ 2`, and `p_w(x)` when `W = {w}`: multiplying the identity for `W \ {v}` by
`p_uv(x)` gives `p_u(x) · (left − right) = 0` for `W`, both when `u` has other neighbours in `W`
and when it has none; and if `p_u(x) = 0` then `margin p W x ≤ p_u(x)` and `p_uv(x) ≤ p_u(x)`
vanish, so both sides are `0`. For a component `W`, `deg_W = deg`. Finally, `∅` separates two
different components, so the global Markov property and `margin p ∅ x = Σ_y p y = 1` make the
components independent, and the identities of the components multiply.

**Checks.**

- With zeros: on the path `1 − 2 − 3` with binary variables, let `p` give mass `¼` to each of the
  four configurations with `x₂ = 0`. Where `x₂ = 1`, `p_2 = p_12 = p_23 = 0` and both sides are
  `0`, while the divided form `p_12 p_23 / p_2` is `0/0`; at `x = (0, 0, 0)` the left side is
  `¼ · 1` and the right side `½ · ½`.
- Normalisation is needed: on two isolated binary vertices, `p ≡ 1` is globally Markov (the
  conditional independence given `∅` reads `4 · 1 = 2 · 2`), but the identity reads `1 = 2 · 2`.
- Acyclicity is needed: on the triangle every law is globally Markov (no two nonempty disjoint
  sets are separated), and for the law proportional to `1 + [x₁ ≠ x₂] + 2 [x₂ ≠ x₃] x₁` on
  `{0, 1}³` the two sides, the right one a product over the three edges, differ at some
  configuration.
- One vertex: the identity is `p(x) = p_v(x)`.

*Needs:* GraphicalModelsAndConditionalIndependence 1.1 `margin`, `CondIndep`, 2.1 `Separates`,
2.2 `IsGlobalMarkov` (definitions), 2.3 `Factorizes.isGlobalMarkov` (remark only); Mathlib
`SimpleGraph.IsAcyclic`, `SimpleGraph.IsAcyclic.subsingleton_path`, `SimpleGraph.Walk.bypass`,
`SimpleGraph.Walk.support_bypass_subset_support`, `SimpleGraph.degree`, `SimpleGraph.edgeFinset`,
`Sym2.toFinset`.

### 2.2 Belief propagation is exact on trees

Define `edgePot` and `pairwiseLaw` (Conventions);

    bpStep G ψ φ m u v b = Σ_a ψ u a · edgePot φ u v a b · Π_{w ∈ N(u), w ≠ v} m w u a,

one parallel step of the sum-product update; `belief G ψ m v a = ψ v a · Π_{u ∈ N(v)} m u v a`;
and `edgeBelief G ψ φ m u v a b`, the product of `ψ u a`, `ψ v b`, `edgePot φ u v a b` and the
messages into `u` from its neighbours other than `v` at `a` and into `v` from its neighbours
other than `u` at `b`.

Prove `belief_bpStep_iterate_eq_margin`: let `G` be a tree, `ψ`, `φ` nonnegative potentials, `m₀`
any nonnegative messages, and `t ≥ G.diam`. With `m_t` the `t`-th iterate of `bpStep` from `m₀`
and `p = pairwiseLaw G ψ φ`:

- `belief G ψ m_t v (x v) = margin p {v} x` for every `v` and `x`;
- `edgeBelief G ψ φ m_t u v (x u) (x v) = margin p {u, v} x` for adjacent `u`, `v` and every `x`;
- for adjacent `u`, `v`, every `s ≥ G.diam` and every initial `m₁`, the message `u → v` after `s`
  steps from `m₁` is the message after `t` steps from `m₀`.

(Mézard–Montanari, Theorem 14.1, p. 295, for tree factor graphs with normalised messages and
`t` larger than the factor-graph diameter, proof sketched pp. 295–296; Wainwright–Jordan, §2.5.1,
(2.8)–(2.9), pp. 27–28, without proof.) (Proved here: the pairwise form, unnormalised messages
and the count `t ≥ G.diam`.)

Route: for adjacent `u`, `v` let `T(u → v)` be the vertex set of the component of `u` after the
edge `uv` is removed, and `h(u → v) = 1 + max_{w ∈ T(u → v)} dist(u, w)`. By induction on
`h(u → v)`: for every `t ≥ h(u → v)` the message `u → v` at `b` is the sum, over the configurations
of `T(u → v)`, of the product of the vertex potentials and edge potentials inside `T(u → v)`
times `edgePot φ u v (x u) b`, whatever the initial messages; the messages into `u` from
`w ∈ N(u) \ {v}` have `h(w → u) ≤ h(u → v) − 1`. A vertex at distance `k` from `u` in `T(u → v)`
is at distance `k + 1` from `v` (the unique path passes through `u`), so `h(u → v) ≤ G.diam`
(Mathlib `SimpleGraph.dist_le_diam`, with `G.ediam ≠ ⊤` from
`SimpleGraph.connected_iff_ediam_ne_top`). The sets `T(u → v)` for `u ∈ N(v)` partition
`V \ {v}`, so for `t ≥ G.diam` the belief at `v` is the sum of `p` over the configurations that
agree with `x` at `v`; for the edge `uv` the sets `T(w → u)`, `w ∈ N(u) \ {v}`, and `T(w → v)`,
`w ∈ N(v) \ {u}`, partition `V \ {u, v}`. The third claim is the independence of the formula
from `t` and `m₀`.

**Checks.**

- The count is sharp: on the path `0 − 1 − 2` (diameter `2`) with binary variables,
  `ψ v = (1, 2)` at every vertex, `φ 0 1 = φ 1 2` equal to `2` on equal values and `1` otherwise,
  `φ 1 0 = φ 2 1 = 1`, and all initial messages `1`: `Z = 66` and the margin at `0` is `(18, 48)`;
  after one step the belief at `0` is `(4, 10)`, not proportional to it, and after two steps it
  is `(18, 48)`. The middle vertex, at distance `1` from both ends, is exact after one step:
  `(16, 50)`.
- One vertex (diameter `0`): there are no messages, the belief is `ψ v`, and the margin of
  `p = ψ v` at `v` is `ψ v`.
- Zeros are allowed: with `φ 0 1 ≡ 0` in the path example the law is `0`, and after two steps
  every message into or through the edge `01` and every belief is `0`, the margins of the zero
  law; the normalised update of the sources would divide the message from `0` by its total `0`.
- A chain is a tree, and on a chain the messages towards one end are the forward variables of a
  hidden Markov model; that specialisation is not restated (Scope and ownership).

*Needs:* 2.1 (`margin`); Mathlib `SimpleGraph.IsTree`, `SimpleGraph.neighborFinset`,
`SimpleGraph.diam`, `SimpleGraph.dist_le_diam`, `SimpleGraph.connected_iff_ediam_ne_top`,
`SimpleGraph.IsAcyclic.subsingleton_path`.

### Examples

- The path example of 2.2: the messages are `(4, 5)` from each end to the middle vertex and
  `(18, 24)` from the middle vertex to each end, and the edge belief on `01` sums to `66`.

### Dependencies

2.1 uses GraphicalModelsAndConditionalIndependence 1.1, 2.1, 2.2 (definitions) and 2.3 for the
remark; 2.2 uses the margins of 2.1.

## Layer 3: the Bethe free entropy

### 3.1 The local polytope of a tree

Define `IsLocallyConsistent G τ σ` for `τ : ∀ v, X v → ℝ` and `σ : (u v : V) → X u → X v → ℝ`:
every `τ v` is a probability vector, and for adjacent `u`, `v` the table `σ u v` is nonnegative,
`σ v u b a = σ u v a b`, and `Σ_b σ u v a b = τ u a` (so also `Σ_a σ u v a b = τ v b`). This is
the local polytope `L(G)` of Wainwright–Jordan, (4.5)–(4.7), p. 78.

Prove `exists_margin_eq_of_isLocallyConsistent`: on a tree `G`, for every locally consistent
`(τ, σ)` there is a law `p` with `Σ_x p x = 1`, `margin p {v} x = τ v (x v)` and, for adjacent `u`,
`v`, `margin p {u, v} x = σ u v (x u) (x v)` (Wainwright–Jordan, Proposition 4.1, pp. 78–79, proof
by the factorisation (4.8) with `0/0 = 0`, its leaf-stripping step sketched). (Proved here.)

Route: for one vertex take `p = τ v`. Otherwise every vertex has degree at least `1`, and put
`p(x) = Π_{uv ∈ E} σ u v (x u) (x v) / Π_v τ v (x v)^(deg v − 1)` when every `τ v (x v) > 0`, and
`p(x) = 0` otherwise. Strip a leaf `v` with neighbour `u`: where `τ u (x u) > 0`,
`Σ_{x v} σ u v (x u) (x v) / τ u (x u) = 1`, and where `τ u (x u) = 0` every `σ u v (x u) b`
vanishes
(nonnegative entries summing to `0`), so summing out `x v` gives the same construction on the tree
without `v`. By induction the total mass is `1`, and the margins on a vertex or an edge follow by
stripping every other leaf until only that vertex or edge remains.

**Checks.**

- A cycle is not enough (Wainwright–Jordan, Example 4.1, pp. 79–81): on the triangle with binary
  variables, `τ v` uniform and `σ e = [[β_e, ½ − β_e], [½ − β_e, β_e]]` with `β₁₂ = β₂₃ = 9/20` and
  `β₁₃ = 1/20` is locally consistent, but no law has these margins: it would give
  `P(x₁ ≠ x₂) = P(x₂ ≠ x₃) = 1/10`, hence `P(x₁ ≠ x₃) ≤ 1/5`, while `σ₁₃` gives `9/10`.
- Zeros are allowed: on the edge `12` with `τ 1 = (1, 0)`, `τ 2 = (½, ½)` and
  `σ 1 2 = [[½, ½], [0, 0]]`, the law is `σ 1 2` itself.

*Needs:* 2.1 (`margin`); Mathlib `SimpleGraph.IsTree`,
`SimpleGraph.IsTree.exists_ne_and_degree_eq_one`.

### 3.2 The Bethe variational principle on trees

Define the Bethe free entropy

    betheFreeEntropy G ψ φ τ σ
      = ½ Σ_u Σ_{v ∈ N(u)} Σ_{a, b} (negMulLog (σ u v a b) + σ u v a b · log (edgePot φ u v a b))
        + Σ_v Σ_a (−(deg v − 1) · negMulLog (τ v a) + τ v a · log (ψ v a)),

that is, `Σ_{uv ∈ E} [H(σ_uv) + E_σ log ψ_uv] − Σ_v [(deg v − 1) H(τ_v) − E_τ log ψ_v]`
(Wainwright–Jordan, (4.14)–(4.16), pp. 82–83, in the form (4.15) and with the energy written out;
Mézard–Montanari, (14.53), p. 309). On locally consistent tables, `H(σ_uv) − H(τ_u) − H(τ_v)` is
minus the mutual information of `σ_uv`, so this is WJ's `H_s − I_st` form plus the energy.

Prove `betheFreeEntropy_le_log_and_eq_iff`: let `G` be a tree, `ψ v a > 0` for all `v`, `a`, and
`φ u v a b > 0` for adjacent `u`, `v`, and let `(τ, σ)` be locally consistent. With
`p = pairwiseLaw G ψ φ` and `Z = Σ_x p x`, `betheFreeEntropy G ψ φ τ σ ≤ log Z`, with equality
exactly when `τ v (x v) = margin p {v} x / Z` for every `v`, `x` and
`σ u v (x u) (x v) = margin p {u, v} x / Z` for adjacent `u`, `v` and every `x` (Wainwright–Jordan,
Theorem 4.2(b), p. 84, proof in Appendix B.4, pp. 273–274, through conjugate duality;
Mézard–Montanari, Theorem 14.3, p. 299, for the value at the true margins). (Proved here, by the
route below.)

Route: let `p_τ` be the law given by the explicit formula in the route of 3.1 (`τ_v` itself on
one vertex). The statement of 3.1 only gives some law with margins `τ` and `σ`, which need not
have this form, so the leaf-stripping computation of that route is repeated here for `p_τ`: it has
mass `1` and margins `τ` and `σ`. Where `p_τ(x) > 0` every `τ_v(x_v)` and `σ_uv(x_u, x_v)` is
positive, and by the formula
`log p_τ(x) = Σ_{uv ∈ E} log σ_uv(x) − Σ_v (deg v − 1) log τ_v(x)`.
Taking expectations under `p_τ`, `H(p_τ) = Σ_{uv ∈ E} H(σ_uv) − Σ_v (deg v − 1) H(τ_v)`, and,
`log p` being a sum of logarithms of potentials, `E_{p_τ} log p` is the energy part. So
`betheFreeEntropy = E_{p_τ} log p + H(p_τ) = log Z − Σ_x p_τ(x) log (p_τ(x) Z / p(x))`, and the last
sum is a relative entropy of probability vectors (`p > 0`), `≥ 0` with equality only at
`p_τ = p/Z` (`Real.log_le_sub_one_of_pos`, `Real.add_one_lt_exp`). Equality therefore gives the
margins of `p/Z`. Conversely, at the normalised margins of `p` apply the same computation to the
law `p/Z` itself: it is positive, it factorizes according to `G` and so is globally Markov
(GraphicalModelsAndConditionalIndependence 2.3, `Factorizes.isGlobalMarkov`), and 2.1 gives
`log (p(x)/Z) = Σ_{uv ∈ E} log (p_uv(x)/Z) − Σ_v (deg v − 1) log (p_v(x)/Z)` with
`p_v = margin p {v}` and `p_uv = margin p {u, v}`; so the Bethe free entropy at its margins is
`E_{p/Z} log p + H(p/Z) = log Z`.

**Checks.**

- One vertex: the statement is the Gibbs variational principle
  `H(τ) + Σ_a τ a log ψ a ≤ log Σ_a ψ a`, with equality exactly at `τ = ψ / Σ ψ`.
- The tree is needed: on the triangle with binary variables, `ψ ≡ 1` and edge potentials `1/8` on
  equal and `1` on unequal values, `Z = 2/512 + 6/8 = 193/256 < 1`; the locally consistent
  `τ v` uniform, `σ e = [[0, ½], [½, 0]]` has Bethe free entropy `3 log 2 − 3 log 2 = 0 > log Z`.
- Positivity is needed: on one binary vertex with `ψ = (1, 0)`, `Z = 1`, and `τ = (0, 1)` gives
  `negMulLog 1 + 1 · log 0 = 0 = log Z` (Mathlib's `log 0 = 0`), although `τ` is not the margin
  `(1, 0)`.
- The path example of 2.2: at the normalised margins the Bethe free entropy is `log 66`.

*Needs:* 2.1, 2.2 (`pairwiseLaw`, `edgePot`), 3.1; GraphicalModelsAndConditionalIndependence 2.3
`Factorizes.isGlobalMarkov`; Mathlib `Real.negMulLog`, `Real.log_le_sub_one_of_pos`,
`Real.add_one_lt_exp`.

### 3.3 Fixed points of belief propagation and stationary points

Define:

- `IsBPFixedPoint G ψ φ m`: for adjacent `u`, `v`, the message `m u v` is positive and
  `bpStep G ψ φ m u v = c • m u v` for some `c > 0` (a fixed point up to positive factors);
- `normBelief G ψ m v a`, the belief at `v` divided by its total, and
  `normEdgeBelief G ψ φ m u v a b`, the edge belief divided by its total;
- `IsBetheStationary G ψ φ τ σ`: `(τ, σ)` is locally consistent, `τ v a > 0` and, for adjacent `u`,
  `v`, `σ u v a b > 0`, and for every direction `(δτ, δσ)` tangent to the affine hull of the local
  polytope (`Σ_a δτ v a = 0` for every `v`; for adjacent `u`, `v`, `δσ v u b a = δσ u v a b` and
  `Σ_b δσ u v a b = δτ u a`) the function `s ↦ betheFreeEntropy G ψ φ (τ + s δτ) (σ + s δσ)` has
  derivative `0` at `s = 0`.

Prove `isBetheStationary_iff_exists_isBPFixedPoint`: on every finite graph `G` with every `X v`
nonempty, with `ψ v a > 0` and `φ u v a b > 0` for adjacent `u`, `v`,

- for every fixed point `m`, `(normBelief G ψ m, normEdgeBelief G ψ φ m)` is an interior stationary
  point;
- every interior stationary point `(τ, σ)` is of this form: there is a fixed point `m` with
  `normBelief G ψ m = τ` and `normEdgeBelief G ψ φ m u v = σ u v` for adjacent `u`, `v`.

(Yedidia–Freeman–Weiss, Theorem 2, §VI.B, page 13 of the report's PDF, for factor graphs,
omitting the variables of degree one; Mézard–Montanari, Proposition 14.6, p. 309, proof
pp. 309–310, which divides by `|∂i| − 1`; Wainwright–Jordan, Theorem 4.2(a), p. 84, proof
pp. 85–86, the first direction.) (Proved here: the pairwise form at every degree, isolated
vertices and vertices of degree one included.)

Route, first direction: the beliefs are positive, and so are their totals because every `X v`
is nonempty, so the normalised beliefs are positive and sum to `1`. Writing `b_uv` for the edge
belief, `Σ_b b_uv(a, b) = ψ u a Π_{w ∈ N(u) \ {v}} m w u a · bpStep m v u a = c_vu b_u(a)`, and the
total of `b_uv` is `c_vu` times the total of `b_u`, so the normalised tables are locally
consistent; the symmetry follows from that of `edgePot`. Differentiating
(`Real.hasDerivAt_negMulLog` at positive entries, `HasDerivAt.sum`) gives the derivative in a
tangent direction as
`½ Σ_{(u,v)} Σ_{a,b} δσ u v a b (log edgePot − log σ u v a b − 1)` plus
`Σ_v Σ_a δτ v a ((deg v − 1)(log τ v a + 1) + log ψ v a)`.
Insert `log σ_uv(a, b) = const + A_{u,v}(a) + A_{v,u}(b) + log edgePot(a, b)` with
`A_{u,v}(a) = log ψ u a + Σ_{w ∈ N(u) \ {v}} log m w u a`, and
`log τ_v(a) = const + log ψ v a + Σ_{w ∈ N(v)} log m w v a`. The tangent conditions turn the first
sum into `−Σ_v Σ_a δτ v a Σ_{u ∈ N(v)} A_{v,u}(a)` and kill the constants, and
`Σ_{u ∈ N(v)} A_{v,u}(a) = deg v · log ψ v a + (deg v − 1) Σ_{w ∈ N(v)} log m w v a`, which is
exactly the bracket of the second sum: the derivative is `0`.

Route, second direction: the tangent directions are the kernel of the linear map recording
`Σ_a δτ v a`, the antisymmetric parts `δσ v u b a − δσ u v a b` and the defects
`Σ_b δσ u v a b − δτ u a`. The derivative is a linear functional vanishing on that kernel, so it
factors through the map (Mathlib `LinearMap.range_dualMap_eq_dualAnnihilator_ker`): there are
multipliers `λ_v` and `λ_uv(a)` (Wainwright–Jordan, (4.17)–(4.21)). Stationarity in `σ_uv` gives
`σ_uv(a, b) ∝ edgePot(a, b) exp(−λ_vu(a) − λ_uv(b))`, and in `τ_v`,
`(deg v − 1) log τ_v(b) = const − log ψ_v(b) − Σ_{u ∈ N(v)} λ_uv(b)`. Define the messages `m u v`
into `v` by solving, for each `v` and `b`, the linear system
`Σ_{w ∈ N(v) \ {u}} log m w v b = −λ_uv(b) − log ψ_v(b)` for `u ∈ N(v)`: for `deg v ≥ 2` it has the
unique solution with `Σ_w log m w v b = (deg v − 1)⁻¹ Σ_u (−λ_uv(b) − log ψ_v(b))`; for `deg v = 1`
the equation says only that `λ_uv + log ψ_v` is constant, which is the stationarity in `τ_v`, and
the message into `v` is defined as `bpStep m u v`. Then `σ_uv` and `τ_v` are the normalised beliefs
of `m`, and the marginalisation constraint `Σ_a σ_uv(a, b) = τ_v(b)`, divided by the positive
common factor, says `bpStep m u v ∝ m u v`. Isolated vertices have no messages and `τ_v ∝ ψ_v`.

**Checks.**

- Scaling is needed in the fixed-point condition: on the triangle with binary variables and all
  potentials `1`, an exact fixed point would have constant messages `c_uv` with
  `c_uv = 2 c_wu` for the third vertex `w`, so `c_uv = 8 c_uv`, and no positive messages are
  fixed; the all-one messages are fixed up to the factor `2`, and their normalised beliefs, the
  uniform tables, are an interior stationary point.
- Positivity of `ψ` is needed for the first direction: on one binary vertex with `ψ = (1, 0)`
  every `m` is a fixed point (there are no edges), and the normalised belief `(1, 0)` is not
  interior.
- A graph with no edges: the stationary points are `τ v = ψ v / Σ ψ v`, the beliefs of the empty
  family of messages.
- Nonempty state spaces are needed for the first direction: for one vertex with `X v` empty and
  no edges, every `m` is a fixed point (there are no edges) and the potentials are vacuously
  positive, but no `τ` is locally consistent, since `Σ_a τ v a` is the empty sum `0`, not `1`.
- On a tree the only interior stationary point is the normalised margins: by the second
  direction it comes from a fixed point `m`, the iterates of `m` are positive multiples of `m`
  along edges, and by 2.2 their normalised beliefs are the normalised margins.

*Needs:* 2.2 (`bpStep`, `belief`, `edgeBelief`, `edgePot`), 3.1 (`IsLocallyConsistent`), 3.2
(`betheFreeEntropy`); Mathlib `HasDerivAt`, `HasDerivAt.sum`, `Real.hasDerivAt_negMulLog`,
`LinearMap.range_dualMap_eq_dualAnnihilator_ker`.

### Examples

- The triangle Check of 3.2 shows that on a graph with a cycle the Bethe free entropy can exceed
  `log Z` on the local polytope, so the bound of 3.2 is special to trees.

### Dependencies

3.1 uses the margins of 2.1; 3.2 uses 2.1, 2.2 and 3.1 and GraphicalModelsAndConditionalIndependence
2.3; 3.3 uses the definitions of 2.2, 3.1 and 3.2.

## Scope and ownership

This roadmap owns the exact gain identity of the coordinate update of naive mean field, the
monotonicity, fixed points and limit points of coordinate-ascent sweeps, the mean-field equations
of Ising models and the asymptotic exactness of naive mean field for the Curie–Weiss model, the
division-free tree factorisation of laws globally Markov for a forest, the exactness of belief
propagation on trees after diameter-many steps, the equality of the local polytope and the
marginal polytope on trees, the Bethe variational principle on trees, and the correspondence
between fixed points of belief propagation and interior stationary points of the Bethe free
entropy on finite graphs.

Already in the libraries or stated by other roadmaps, and used above or left alone:

- The evidence lower bound identity `elbo p r = log p(Z) − KL(r ‖ posterior)` and its equality
  case are recalled in EvidenceLowerBound 1.3 from Mathlib's `integral_llr_tilted_right`; they are
  not targets there or here. The bound `elbo ≤ log Z` used in 1.2 and 1.3 is proved inline for
  finite sets. The Gibbs variational principle on a finite set is Tau Ceti's
  `TauCeti.klDiv_tilted_neg_add_ofReal_neg_log`; the one-vertex Check of 3.2 is its finite case,
  and the routes use the finite Gibbs inequality directly.
- GraphicalModelsAndConditionalIndependence treats margins, conditional independence, the Markov
  properties, factorisation and the Hammersley–Clifford theorem; its definitions are copied in
  2.1 and its 2.3 is used in 2.1 and 3.2. It places junction trees and message passing outside its
  scope; this roadmap treats message passing on trees and the tree factorisation, not junction
  trees of general graphs.
- CurieWeissModel treats the Curie–Weiss law, its pressure, the mean-field equation `tanh(β m) = m`
  and the limit of the free energy; 1.3 uses its 3.1 and restates none of its theorems.
- HiddenMarkovModels treats the forward and backward recursions of a hidden Markov model; on a
  chain belief propagation specialises to them, and that specialisation is not stated here.
- GlauberDynamicsOfTheIsingModel and RestrictedBoltzmannMachines treat the Glauber dynamics of
  finite Ising models and restricted Boltzmann machines; nothing of them is used or restated.
- The roadmap Gibbs Measures and the Ising Model by another contributor treats infinite-volume
  Gibbs measures of lattice spin systems and the Ising model on `ℤ^d`, and lists the variational
  principle and translation-invariant Gibbs measures as equilibrium states in its section
  "Beyond this roadmap"; this roadmap is about finite graphs only, and treats neither belief
  propagation on infinite trees nor infinite-volume mean field.
- StatisticalLearningTheory, a roadmap by another contributor on the distribution-free theory of
  learning (empirical risk, Rademacher complexity, VC dimension, stability, kernel methods), names
  in its section "Beyond this roadmap", under graphical models and variational inference, belief
  propagation and the Bethe free energy, exact inference on trees and junction trees, and the
  variational representation of the cumulant function as topics for a roadmap on graphical models
  (pull request [#2515](https://github.com/TauCetiProject/TauCetiRoadmap/pull/2515)). This
  roadmap treats naive mean field, belief propagation on trees and the Bethe free entropy on
  finite graphs; junction trees of general graphs and the conjugate duality of the cumulant
  function are not treated here. Nothing of that roadmap is used or restated, and this roadmap
  does not depend on it.

Not treated here: junction trees, chordal graphs and exact inference on graphs with cycles;
the conjugate duality of the cumulant function and its marginal polytope on general graphs;
convergence and uniqueness of loopy belief propagation (Dobrushin-type and contraction
conditions), the existence of fixed points, max-product and its exactness on trees; structured
mean field, Kikuchi and region-based approximations, expectation propagation, tree-reweighted
bounds; Gaussian and continuous models; and every algorithm, schedule and running time.

## Exact supplier contracts

### From Mathlib

- `Measure.haveLebesgueDecomposition_add` (`μ = μ.singularPart ν + ν.withDensity (μ.rnDeriv ν)`
  under `HaveLebesgueDecomposition`, which holds for finite measures) and
  `Measure.mutuallySingular_singularPart`
  (`Mathlib/MeasureTheory/Measure/Decomposition/Lebesgue.lean`); `MeasureTheory.integral_fintype`
  (on a finite type with measurable singletons, an integrable function integrates to
  `Σ_x μ.real {x} • f x`) (`Mathlib/MeasureTheory/Integral/Bochner/SumMeasure.lean`);
  `MeasureTheory.Measure.dirac`, `Measure.rnDeriv`.
- `Real.negMulLog`, `Real.negMulLog_mul` (`negMulLog (x y) = y negMulLog x + x negMulLog y`),
  `Real.continuous_negMulLog`, `Real.hasDerivAt_negMulLog` (derivative `−log x − 1` at `x ≠ 0`)
  (`Mathlib/Analysis/SpecialFunctions/Log/NegMulLog.lean`); `Real.log_le_sub_one_of_pos`,
  `Real.add_one_lt_exp` (`x + 1 < exp x` for `x ≠ 0`), `Real.tanh_eq`, `Real.binEntropy`,
  `Real.binEntropy_continuous`.
- `isCompact_univ_pi`, `IsCompact.exists_mapClusterPt`, `MapClusterPt.tendsto_subseq`
  (`Mathlib/Topology/Bases.lean`, first-countable spaces), `IsCompact.exists_isMaxOn`, `le_csSup`,
  `csSup_le`, `tendsto_of_tendsto_of_tendsto_of_le_of_le'`, `Function.update_idem`.
- `SimpleGraph.IsTree` (connected and acyclic), `SimpleGraph.IsAcyclic`,
  `SimpleGraph.IsAcyclic.subsingleton_path` (`Mathlib/Combinatorics/SimpleGraph/Acyclic.lean`),
  `SimpleGraph.IsTree.exists_ne_and_degree_eq_one` (a tree on at least two vertices has two
  leaves); `SimpleGraph.Walk.bypass`, `SimpleGraph.Walk.support_bypass_subset_support`;
  `SimpleGraph.diam`, `SimpleGraph.dist_le_diam` (for `G.ediam ≠ ⊤`) and
  `SimpleGraph.connected_iff_ediam_ne_top` (finite nonempty vertex type)
  (`Mathlib/Combinatorics/SimpleGraph/Diam.lean`); `SimpleGraph.neighborFinset`,
  `SimpleGraph.degree`, `SimpleGraph.edgeFinset`, `Sym2.toFinset`.
- `HasDerivAt`, `HasDerivAt.sum`; `LinearMap.range_dualMap_eq_dualAnnihilator_ker` (over a field,
  the range of the dual map is the annihilator of the kernel)
  (`Mathlib/LinearAlgebra/Dual/Lemmas.lean`).

### From TauCetiRoadmap.GraphicalModelsAndConditionalIndependence

- 1.1 `margin`, `CondIndep`; 2.1 `Separates`; 2.2 `IsGlobalMarkov` (copied verbatim, with its
  carrier `{V} [Fintype V] [DecidableEq V] {X : V → Type*}` with `[∀ v, Fintype (X v)]` and
  `[∀ v, DecidableEq (X v)]`).
- 2.3 `TauCetiRoadmap.GraphicalModelsAndConditionalIndependence.Factorizes.isGlobalMarkov`: a law
  that factorizes according to `G` (a product over the complete sets of functions of their
  coordinates) is globally Markov for `G`, for every law (no positivity). Used in 3.2 and in the
  remark of 2.1.

### From TauCetiRoadmap.ImportanceSamplingAndVarianceReduction

- 1.1 `isWeight p q x = (p.rnDeriv q x).toReal` (copied verbatim), inside `elbo`.

### From TauCetiRoadmap.EvidenceLowerBound

- 1.3 `elbo p r = ∫ z, Real.log (isWeight p r z) ∂r` (copied verbatim). The identity with the
  relative entropy from the posterior, which that roadmap recalls without stating it as a target,
  is not used.

### From TauCetiRoadmap.QuantumOptimization

- 1.1 `spin` (`−1` on `true`, `1` on `false`) and `ising` (couplings summed over ordered pairs,
  plus fields) (copied verbatim).

### From TauCetiRoadmap.CurieWeissModel

- 1.1 `cwEnergy` (copied verbatim) and `partitionFunction N β h = Σ_x exp(−cwEnergy N β h x)`;
  1.2 `freeEnergy`, `pressure` (copied verbatim).
- 3.1 `TauCetiRoadmap.CurieWeissModel.tendsto_log_partitionFunction_div`: for all real `β`, `h`,
  `log (partitionFunction N β h) / N → pressure β h`. Used in 1.3.

## References

- D. M. Blei, A. Kucukelbir and J. D. McAuliffe, *Variational inference: a review for
  statisticians*, arXiv:1601.00670v9 (2018). Used: Section 2.4, eqs. (17)–(19), Algorithm 1,
  pp. 9–10.
- M. J. Wainwright and M. I. Jordan, *Graphical models, exponential families, and variational
  inference*, Foundations and Trends in Machine Learning 1 (2008); the copy on M. I. Jordan's page
  at people.eecs.berkeley.edu/~jordan/papers/wainwright-jordan-fnt.pdf. Used: §2.5.1, (2.4)–(2.9),
  pp. 26–28; (4.5)–(4.8), Proposition 4.1, Example 4.1, pp. 78–81; (4.11)–(4.25), Theorem 4.2 and
  its proof, pp. 82–86; Example 5.2, (5.14)–(5.17), pp. 134–136; Appendix B.4, pp. 273–274.
- M. Mézard and A. Montanari, *Information, physics, and computation*, Oxford University Press,
  2009; the draft of November 9, 2007 of Part D on A. Montanari's page at
  web.stanford.edu/~montanar/RESEARCH/book.html (chapter 14). Used: Theorem 14.1 with its proof
  sketch, pp. 295–296; Theorem 14.2 with its proof, p. 298; (14.26)–(14.28) and Theorem 14.3,
  p. 299; (14.50)–(14.53) and Proposition 14.6 with its proof, pp. 308–310. Page and equation
  numbers are those of that draft.
- J. S. Yedidia, W. T. Freeman and Y. Weiss, *Constructing free energy approximations and
  generalized belief propagation algorithms*, Mitsubishi Electric Research Laboratories technical
  report TR2004-040 (2004), at merl.com, a revised version of the paper in IEEE Transactions on
  Information Theory. Used: Section VI and Theorem 2, on page 13 of the report's PDF (the
  report has no printed page numbers).
- Attributions in prose without a locator: J. Pearl (belief propagation on trees, 1988);
  R. J. Baxter (exactly solved models, cited by Wainwright–Jordan for the exactness of mean field
  on the complete graph).
